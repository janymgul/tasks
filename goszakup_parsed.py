#!/usr/bin/env python
# coding: utf-8

# In[110]:


import requests
from bs4 import BeautifulSoup
from time import sleep
import pandas as pd


# In[37]:


headers = headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'}


# In[152]:


def get_url():
    for page in range(1, 12):
        sleep(3)
        main_url = f'https://www.goszakup.gov.kz/ru/registry/rqc?count_record=50&page={page}'
        response = requests.get(main_url, headers=headers)
        soup = BeautifulSoup(response.text, 'lxml')
        data = soup.find('tbody').find_all('tr')
        
        for i in data:
            url = i.find('a').get('href')
            yield url


# In[159]:


info = []

for url in get_url():
    bin_v = name = fio = iin = address = None
    response = requests.get(url, headers=headers)
    soup = BeautifulSoup(response.text, 'lxml')
    rows = soup.find_all('tr')
    
    for row in rows:
        th = row.find('th')
        td = row.find('td')
        if not th or not td:
            continue
        
        field = th.text.strip()
        value = td.text.strip()
        if field == 'БИН участника':
            bin_v = value
        elif field == 'Наименование на рус. языке':
            name = value
        elif field == 'ИИН':
            iin = value
        elif field == 'ФИО':
            fio = value

    for row in rows:
        th = row.find_all('th')
        if len(th) <= 1:
            continue
    
        ths = [h.get_text(strip = True) for h in th]
        
        if 'Полный адрес(рус)' in ths:
            idx = ths.index('Полный адрес(рус)')

            curr_idx = rows.index(row)
            td_row = rows[curr_idx + 1]
            td = td_row.find_all('td')
            tds = [d.get_text(strip = True) for d in td]
            address = tds[idx]
            break

    info.append({
        'Наименование организации': name,
        'БИН организации': bin_v,
        'ФИО руководителя': fio,
        'ИИН руководителя': iin,
        'Полный адрес организации': address
    })


# In[160]:


df = pd.DataFrame(info).drop_duplicates()
df


# In[161]:


df.to_excel('goszakup_results.xlsx', index=False)


# In[ ]:




