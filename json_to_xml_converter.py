#!/usr/bin/env python
# coding: utf-8

# In[12]:


from flask import Flask, request, Response
import dicttoxml

app = Flask(__name__)


@app.route("/convert", methods=["POST"])
def convert_json_to_xml():
    data = request.json
    xml = dicttoxml.dicttoxml(data)
    return Response(xml, mimetype="application/xml")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)


# In[ ]:
