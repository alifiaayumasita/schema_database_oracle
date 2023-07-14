Nama : Alifia Ayu Masita
NIM : 2007411034
Kelas : TI 3B

8.1
—1
—avg,count
SELECT AVG(salary) || ' is Average Salary of ' || COUNT(salary) || ' employees. This table has 
primary key employee_id which won''t be null. So, ' || (COUNT(employee_id) - COUNT(salary)) || 
' rows are skipped in Average Salary calculation.' "Example"
FROM EMPLOYEES;
—max min
SELECT 'The maximum of ' || COUNT(salary) || ' salaries in employees table is ' || MAX(salary) ||'. 
The minimum of '|| COUNT(salary) || ' salaries in employees table is '|| MIN(salary) ||'.' "Example2"
FROM EMPLOYEES;
—stddev, variance
SELECT 'The standard deviation of ' || COUNT(salary) || ' salaries in employees table is ' || 
ROUND(STDDEV(salary), 4) ||'. The variance of '|| COUNT(salary) || ' salaries in employees table 
is '|| ROUND(VARIANCE(salary), 4) ||'.' "Example3"
FROM EMPLOYEES;
—SUM
SELECT 'The sum of ' || COUNT(salary) || ' salaries in employees table is ' || SUM(salary) ||'.' 
"Example"
FROM EMPLOYEES;
—2
SELECT ROUND(AVG(cost),2) as "Average Cost"
FROM d_events;
—3
SELECT TO_CHAR(ROUND(AVG(salary),2), '$999999.99') as "Average Salary"
FROM f_staffs
WHERE manager_id = 19;
—4
SELECT TO_CHAR(ROUND(SUM(salary),2), '$999999.99') as "Total Salary"
FROM f_staffs
WHERE id in (12, 9);
—5
SELECT MIN(salary) "lowest salary", MAX(hire_date) "most recent hire date", 
MIN(last_name) "top last name", MAX(last_name) "bottom last name"
FROM employees
WHERE department_id in (50, 60);
—6
satu baris
—7
SELECT AVG(NVL(salary, hourly_rate* hrs_worked_in_yr ))
This way the null fields beings ignored will also be counted in.
—8
Maret 30, 1969
—9
SELECT 'Average of ' || COUNT(order_number) || ' orders is : ' || AVG(NVL(order_total, 0)) as 
"Average"
FROM f_orders
WHERE order_date BETWEEN TO_DATE('January 1, 2002', 'fmMonth DD, YYYY') AND 
TO_DATE('December 21, 2002', 'fmMonth DD, YYYY');
—10
SELECT MAX(hire_date) as "the last"
FROM employees;
= 12-Januari-2000
-11
SUM akan sama dengan atau lebih besar dati AVG
—12
b & g
-8.2
—1
SELECT COUNT(DISTINCT title)
FROM d_songs; gives 6
—2
SELECT COUNT(DISTINCT loc_type)
FROM d_venues; (4)
SELECT COUNT(DISTINCT venue_id)
FROM d_events; (2)
—3
SELECT COUNT(song_id) AS "song with possible duplication", COUNT(distinct cd_number)
"cd no. distinct"
FROM d_track_listings; (5 & 4)
—4
SELECT COUNT(email) "count with email"
FROM d_clients;
—5
—6
ID type shoe_color
456 oxford brown
463 sandal tan
262 heel black
433 slipper tan
—7
SELECT TO_CHAR(ROUND(AVG(NVL(auth_expense_amt,100000)),2), '$999999.99')
FROM d_partners;
—8
b & c
—9
c
—9.1
—1
a
—2
a. SELECT manager_id,AVG(salary)
FROM employees
GROUP BY manager_id
HAVING AVG(salary) < 16000;
b. SELECT COUNT(*)
FROM d_cds
WHERE cd_number < 93;
c. SELECT type_code, MAX(TO_NUMBER(REPLACE(duration,' min',''))) || ' min' as "max 
duration"
FROM d_songs
WHERE duration IN('3 min', '6 min', '10 min') AND id < 50
GROUP BY type_code;
d. SELECT loc_type, AVG(
CASE
WHEN INSTR(rental_fee, '/hour') != 0 THEN TO_NUMBER(REPLACE(rental_fee,'/hour',''))*5
 WHEN INSTR(rental_fee, '/flat fee') != 0 THEN TO_NUMBER(REPLACE(rental_fee,'/flat 
fee',''))
 WHEN INSTR(rental_fee, '/per person') != 0 THEN TO_NUMBER(REPLACE(rental_fee,'/per 
person',''))*10 ELSE 0 END ) AS Fee FROM d_venues WHERE id <100 GROUP BY loc_type 
ORDER BY 2;
—3
SELECT track, MAX(song_id)
FROM d_track_listings
WHERE track IN ( 1, 2, 3)
GROUP BY track;
—4
a. true
b. false
c. false
—5
SELECT ROUND(MAX(AVG(salary)),2) as "Maximum Average of Departments", 
ROUND(MIN(AVG(salary)),2) "Minimum Average of Departments"
FROM employees
GROUP BY department_id;
—6
SELECT AVG(MAX(salary))
FROM employees
GROUP BY department_id;
—9.2
—1
SELECT manager_id, job_id, SUM(salary) "total salary", GROUPING(manager_id), 
GROUPING(job_id)
FROM employees
GROUP BY ROLLUP(manager_id, job_id);
—2
SELECT manager_id, job_id, SUM(salary) "total salary", GROUPING(manager_id), 
GROUPING(job_id)
FROM employees
GROUP BY CUBE(manager_id, job_id);
—3
SELECT department_id, manager_id, job_id, SUM(salary) "total salary",
GROUPING(department_id), GROUPING(manager_id), GROUPING(job_id)
FROM employees
GROUP BY GROUPING SETS((department_id, manager_id, job_id), (manager_id, job_id), 
(department_id, manager_id));
—9.3
—1
UNION
UNION ALL
MINUS
INTERSECT
—2
SELECT employee_id, job_id, hire_date, department_id
FROM employees
UNION
SELECT employee_id, job_id, start_date, department_id
FROM job_history
ORDER BY employee_id, hire_date;
—3
SELECT employee_id, job_id, hire_date, department_id
FROM employees
UNION ALL
SELECT employee_id, job_id, start_date, department_id
FROM job_history
ORDER BY employee_id, hire_date;
—4
SELECT DISTINCT employee_id
FROM employees
MINUS
SELECT DISTINCT employee_id
FROM job_history;
—5
SELECT DISTINCT employee_id
FROM employees
INTERSECT
SELECT DISTINCT employee_id
FROM job_history;
—6
SELECT employee_id, job_id, NVL(salary, 0)
FROM employees
UNION
SELECT employee_id, job_id, 0
FROM job_history
ORDER BY employee_id;
