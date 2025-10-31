DROP TABLE IF EXISTS salaries
DROP TABLE IF EXISTS employees
DROP TABLE IF EXISTS departments_positions_levels
DROP TABLE IF EXISTS departments
DROP TABLE IF EXISTS positions
DROP TABLE IF EXISTS levels

CREATE TABLE departments
(
    dept_id serial PRIMARY KEY,
	dept_name varchar(128) NOT NULL
);

CREATE TABLE positions
(
    pos_id serial PRIMARY KEY,
	pos_name varchar(32) NOT NULL
);

CREATE TABLE levels
(
    lvl_id serial PRIMARY KEY,
	lvl_name varchar(32) NOT NULL,
	required_experience int NOT NULL
);

CREATE TABLE departments_positions_levels
(
    dpl_id serial PRIMARY KEY,
	fk_d_id int NOT NULL,
	fk_p_id int NOT NULL,
	fk_l_id int,
	CONSTRAINT fk_department_id FOREIGN KEY (fk_d_id) REFERENCES departments(dept_id),
	CONSTRAINT fk_position_id FOREIGN KEY (fk_p_id) REFERENCES positions(pos_id),
	CONSTRAINT fk_level_id FOREIGN KEY (fk_l_id) REFERENCES levels(lvl_id)
);

CREATE TABLE employees
(
    emp_id serial PRIMARY KEY,
	first_name varchar(128) NOT NULL,
	last_name varchar(128) NOT NULL,
	gender varchar(32),
	birth_date date NOT NULL,
	fk_dpl_id int NOT NULL,
	hire_date date NOT NULL,
	CONSTRAINT fk_department_position_level_id FOREIGN KEY (fk_dpl_id) REFERENCES departments_positions_levels(dpl_id)
);

CREATE TABLE salaries
(
    slr_id serial PRIMARY KEY,
	emp_id int NOT NULL,
	amount int NOT NULL,
	CONSTRAINT fk_employee_id FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO departments
VALUES
(1, 'Снабжение'),
(2, 'Разработка'),
(3, 'Логистика'),
(4, 'Маркетинг'),
(5, 'Продажи'),
(6, 'HR'),
(7, 'Бухгалтерия');

INSERT INTO positions
VALUES
(1, 'Менеджер'),
(2, 'Дизайнер'),
(3, 'Разработчик'),
(4, 'Аналитик'),
(5, 'Бухгалтер'),
(6, 'HR-специалист'),
(7, 'Логист'),
(8, 'Координатор');

INSERT INTO levels
VALUES
(1, 'Intern', 0),
(2, 'Junior', 1),
(3, 'Middle', 2),
(4, 'Senior', 4);

INSERT INTO departments_positions_levels
VALUES
(1, 1, 1, NULL),
(2, 1, 7, 3),
(3, 1, 7, 4),
(4, 1, 8, NULL),
(5, 2, 1, NULL),
(6, 2, 2, 1),
(7, 2, 2, 2),
(8, 2, 2, 3),
(9, 2, 2, 4),
(10, 2, 3, 1),
(11, 2, 3, 2),
(12, 2, 3, 3),
(13, 2, 3, 4),
(14, 2, 4, 1),
(15, 2, 4, 2),
(16, 2, 4, 3),
(17, 2, 4, 4),
(18, 3, 1, NULL),
(19, 3, 4, 1),
(20, 3, 4, 2),
(21, 3, 4, 3),
(22, 3, 4, 4),
(23, 3, 7, 1),
(24, 3, 7, 2),
(25, 3, 7, 3),
(26, 3, 7, 4),
(27, 3, 8, NULL),
(28, 4, 1, NULL),
(29, 4, 4, 1),
(30, 4, 4, 2),
(31, 4, 4, 3),
(32, 4, 4, 4),
(33, 4, 8, NULL),
(34, 5, 1, NULL),
(35, 6, 1, NULL),
(36, 6, 6, 1),
(37, 6, 6, 2),
(38, 6, 6, 3),
(39, 6, 6, 4),
(40, 7, 5, 1),
(41, 7, 5, 2),
(42, 7, 5, 3),
(43, 7, 5, 4)

insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (1, 'Corena', 'Spellworth', 'Female', '1989-05-23', 14, '2020-05-04');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (2, 'Dara', 'Winspear', 'Female', '2003-09-09', 19, '2023-08-18');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (3, 'Ailina', 'Paylor', 'Female', '2003-09-25', 20, '2021-01-08');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (4, 'Frants', 'Errichiello', 'Male', '1974-07-25', 33, '2024-10-03');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (5, 'Jefferey', 'Frisdick', 'Male', '1963-06-06', 38, '2019-12-24');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (6, 'Maryann', 'Davidwitz', 'Female', '1998-06-26', 16, '2022-10-06');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (7, 'Carson', 'Kalinke', 'Male', '1971-01-31', 17, '2023-04-22');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (8, 'Patty', 'Attwill', 'Female', '1975-01-02', 34, '2020-10-17');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (9, 'Hadlee', 'Belshaw', 'Male', '1984-10-19', 5, '2020-12-17');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (10, 'Huey', 'Goreisr', 'Male', '1994-03-21', 10, '2021-11-12');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (11, 'Tedd', 'Braam', 'Male', '1979-07-02', 29, '2023-04-23');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (12, 'Sybila', 'Brinicombe', 'Female', '1969-09-24', 1, '2024-03-22');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (13, 'Marie-jeanne', 'Gifford', 'Female', '1982-03-04', 43, '2022-08-16');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (14, 'Veradis', 'Gerg', 'Female', '1971-06-23', 31, '2021-09-24');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (15, 'Emile', 'Tonn', 'Male', '1999-09-06', 13, '2024-03-29');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (16, 'Lissi', 'Prescot', 'Female', '1979-03-27', 22, '2025-06-12');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (17, 'Elsey', 'Morrison', 'Female', '1976-04-27', 39, '2020-09-06');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (18, 'Eileen', 'Felgat', 'Female', '1966-06-13', 11, '2022-06-01');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (19, 'Ilise', 'Giuroni', 'Female', '1996-04-13', 25, '2021-08-19');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (20, 'Arel', 'Trouncer', 'Male', '1980-04-19', 36, '2023-03-06');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (21, 'Sacha', 'Friday', 'Female', '1982-03-09', 15, '2022-07-15');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (22, 'Barbe', 'Westnage', 'Female', '2005-01-28', 11, '2023-09-10');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (23, 'Nicky', 'Lippiello', 'Female', '1969-02-27', 8, '2023-12-18');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (24, 'Monro', 'Beat', 'Male', '1977-11-02', 27, '2022-04-24');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (25, 'David', 'McGairl', 'Male', '1990-07-03', 4, '2022-02-24');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (26, 'Hastings', 'Mawtus', 'Male', '1989-08-18', 12, '2020-05-27');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (27, 'Nessy', 'Markushkin', 'Female', '1999-07-09', 7, '2020-06-12');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (28, 'Jenna', 'Dwane', 'Female', '1966-06-17', 9, '2022-11-19');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (29, 'Garreth', 'Carney', 'Male', '1962-11-02', 21, '2025-07-25');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (30, 'Lewie', 'Norton', 'Male', '1979-07-09', 42, '2025-08-19');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (31, 'Nessy', 'McEachern', 'Female', '1964-06-26', 18, '2022-08-14');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (32, 'Burt', 'Cush', 'Male', '1972-09-06', 28, '2024-01-22');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (33, 'Baldwin', 'Bedwell', 'Male', '1982-05-31', 40, '2021-12-03');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (34, 'Antonella', 'Foxall', 'Female', '1965-07-23', 30, '2025-04-20');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (35, 'James', 'Crank', 'Male', '1971-06-18', 37, '2022-07-24');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (36, 'Brade', 'Mariyushkin', 'Male', '1972-06-03', 6, '2024-06-10');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (37, 'Reid', 'Petrelli', 'Male', '2002-02-22', 12, '2025-01-12');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (38, 'Moises', 'Dolling', 'Male', '1989-03-17', 15, '2024-11-14');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (39, 'Chlo', 'McIsaac', 'Female', '1995-03-01', 16, '2023-01-25');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (40, 'Giulio', 'Broady', 'Male', '1976-03-19', 24, '2024-05-17');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (41, 'David', 'Carren', 'Male', '1966-06-07', 3, '2021-07-14');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (42, 'Sal', 'Hubbocks', 'Male', '2004-12-10', 8, '2020-05-10');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (43, 'Homere', 'Tierney', 'Male', '1992-09-04', 26, '2025-05-31');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (44, 'Agathe', 'Childs', 'Female', '1990-05-11', 7, '2023-05-19');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (45, 'Leonard', 'O''Rafferty', 'Male', '1992-04-08', 35, '2023-07-12');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (46, 'Aurel', 'Gedling', 'Female', '1986-01-15', 41, '2021-01-16');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (47, 'Arnuad', 'Matsell', 'Male', '1963-01-23', 34, '2020-01-28');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (48, 'Myrtice', 'Umfrey', 'Female', '2002-05-28', 2, '2024-07-19');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (49, 'Ansel', 'Brimblecomb', 'Male', '1974-10-28',32, '2025-09-17');
insert into employees (emp_id, first_name, last_name, gender, birth_date, fk_dpl_id, hire_date) values (50, 'Ancell', 'Geeves', 'Male', '2002-12-06', 23, '2025-04-18');

insert into salaries (slr_id, emp_id, amount) values (1, 1, 504751);
insert into salaries (slr_id, emp_id, amount) values (2, 2, 185759);
insert into salaries (slr_id, emp_id, amount) values (3, 3, 785134);
insert into salaries (slr_id, emp_id, amount) values (4, 4, 853933);
insert into salaries (slr_id, emp_id, amount) values (5, 5, 767549);
insert into salaries (slr_id, emp_id, amount) values (6, 6, 146580);
insert into salaries (slr_id, emp_id, amount) values (7, 7, 894864);
insert into salaries (slr_id, emp_id, amount) values (8, 8, 627015);
insert into salaries (slr_id, emp_id, amount) values (9, 9, 116049);
insert into salaries (slr_id, emp_id, amount) values (10, 10, 302033);
insert into salaries (slr_id, emp_id, amount) values (11, 11, 188800);
insert into salaries (slr_id, emp_id, amount) values (12, 12, 247248);
insert into salaries (slr_id, emp_id, amount) values (13, 13, 959745);
insert into salaries (slr_id, emp_id, amount) values (14, 14, 296173);
insert into salaries (slr_id, emp_id, amount) values (15, 15, 929616);
insert into salaries (slr_id, emp_id, amount) values (16, 16, 181750);
insert into salaries (slr_id, emp_id, amount) values (17, 17, 295615);
insert into salaries (slr_id, emp_id, amount) values (18, 18, 670033);
insert into salaries (slr_id, emp_id, amount) values (19, 19, 249460);
insert into salaries (slr_id, emp_id, amount) values (20, 20, 764204);
insert into salaries (slr_id, emp_id, amount) values (21, 21, 204760);
insert into salaries (slr_id, emp_id, amount) values (22, 22, 420935);
insert into salaries (slr_id, emp_id, amount) values (23, 23, 934108);
insert into salaries (slr_id, emp_id, amount) values (24, 24, 592453);
insert into salaries (slr_id, emp_id, amount) values (25, 25, 680783);
insert into salaries (slr_id, emp_id, amount) values (26, 26, 768729);
insert into salaries (slr_id, emp_id, amount) values (27, 27, 274355);
insert into salaries (slr_id, emp_id, amount) values (28, 28, 104174);
insert into salaries (slr_id, emp_id, amount) values (29, 29, 445562);
insert into salaries (slr_id, emp_id, amount) values (30, 30, 682467);
insert into salaries (slr_id, emp_id, amount) values (31, 31, 817740);
insert into salaries (slr_id, emp_id, amount) values (32, 32, 145039);
insert into salaries (slr_id, emp_id, amount) values (33, 33, 599350);
insert into salaries (slr_id, emp_id, amount) values (34, 34, 670715);
insert into salaries (slr_id, emp_id, amount) values (35, 35, 119399);
insert into salaries (slr_id, emp_id, amount) values (36, 36, 507757);
insert into salaries (slr_id, emp_id, amount) values (37, 37, 142502);
insert into salaries (slr_id, emp_id, amount) values (38, 38, 430054);
insert into salaries (slr_id, emp_id, amount) values (39, 39, 158510);
insert into salaries (slr_id, emp_id, amount) values (40, 40, 737133);
insert into salaries (slr_id, emp_id, amount) values (41, 41, 296580);
insert into salaries (slr_id, emp_id, amount) values (42, 42, 962267);
insert into salaries (slr_id, emp_id, amount) values (43, 43, 938090);
insert into salaries (slr_id, emp_id, amount) values (44, 44, 653070);
insert into salaries (slr_id, emp_id, amount) values (45, 45, 101592);
insert into salaries (slr_id, emp_id, amount) values (46, 46, 276621);
insert into salaries (slr_id, emp_id, amount) values (47, 47, 283307);
insert into salaries (slr_id, emp_id, amount) values (48, 48, 435873);
insert into salaries (slr_id, emp_id, amount) values (49, 49, 654833);
insert into salaries (slr_id, emp_id, amount) values (50, 50, 778432);

DROP VIEW IF EXISTS dpl
DROP VIEW IF EXISTS sedpl

CREATE OR REPLACE VIEW dpl AS
SELECT dpl.dpl_id, p.pos_name AS pos_name, d.dept_name AS dept_name, l.lvl_name AS lvl_name
FROM departments_positions_levels dpl
LEFT JOIN positions p ON dpl.fk_p_id = p.pos_id
LEFT JOIN departments d ON dpl.fk_d_id = d.dept_id
LEFT JOIN levels l ON dpl.fk_l_id = l.lvl_id

CREATE VIEW sedpl AS
SELECT e.first_name AS first_name, e.last_name AS last_name, e.hire_date AS hire_date, s.amount AS salary, dpl.pos_name AS pos_name, dpl.dept_name AS dept_name
FROM employees e
LEFT JOIN salaries s ON e.emp_id = s.emp_id
LEFT JOIN dpl ON e.fk_dpl_id = dpl.dpl_id

--Сделать выборку всех работников с именем “Давид” из отдела
--“Снабжение” с полями ФИО, заработная плата, должность
SELECT first_name, last_name, salary, pos_name
FROM sedpl
WHERE first_name = 'David' AND dept_name = 'Снабжение'

--Посчитать среднюю заработную плату работников по отделам
SELECT dept_name, AVG(salary) AS avg_salary_by_dept
FROM sedpl
GROUP BY dept_name

--Сделать выборку по должностям, в результате которой отобразятся
--данные, больше ли средняя ЗП по должности, чем средняя ЗП по всем работникам.
CREATE OR REPLACE FUNCTION get_avg_slr() RETURNS real AS $$
    SELECT AVG(salary)
	FROM sedpl
$$ LANGUAGE SQL

SELECT get_avg_slr();

DROP VIEW avg_slr_by_pos

CREATE VIEW avg_slr_by_pos AS
SELECT pos_name, AVG(salary) AS avg_slr
FROM sedpl
GROUP BY pos_name

SELECT pos_name, avg_slr,
    CASE WHEN avg_slr > get_avg_slr() THEN 'Yes'
	     ELSE 'No'
	END AS more_than_the_total_avg_slr
FROM avg_slr_by_pos

--2 вариант
CREATE OR REPLACE FUNCTION get_avg_slr_pos(OUT pos_name varchar, OUT avg_slr real)
RETURNS SETOF RECORD AS $$
    SELECT pos_name, AVG(salary) AS avg_slr
	FROM sedpl
	GROUP BY pos_name
$$ LANGUAGE SQL;

SELECT pos_name, avg_slr,
    CASE WHEN avg_slr > get_avg_slr() THEN 'Yes'
	     ELSE 'No'
	END AS more_than_the_total_avg_slr
FROM get_avg_slr_pos()

--Сделать представление, в котором собраны данные по должностям
--(Должность, в каких отделах встречается эта должность (в виде
--массива), список сотрудников, начавших работать в этом отделе не
--раньше 2021 года (Сгруппировать по отделам) (в формате JSON),
--средняя заработная плата по должности)
CREATE OR REPLACE VIEW pos_info AS
WITH emp_dept AS
(
    SELECT dept_name, ARRAY_AGG(CONCAT(first_name, ' ', last_name)) AS employees
    FROM sedpl
    WHERE hire_date > '2021-01-01'
    GROUP BY dept_name
)
SELECT pos_name, ARRAY_AGG(dept_name) AS depts, JSON_OBJECT_AGG(dept_name, employees) AS from_2021, AVG(salary) AS avg_salary_by_pos
FROM sedpl
LEFT JOIN emp_dept USING(dept_name)
GROUP BY pos_name

SELECT * FROM pos_info