Nama : Alifia Ayu Masita
Kelas : TI 3B
NIM : 2007411034
Basis Data 2

5.1
—1
SELECT last_name,TO_CHAR( birthdate, 'Month DD, YYYY') as birthdate
FROM f_staffs;
—2
SELECT TO_DATE('January 3, 04', 'Month DD YY') as converted
FROM dual;
—3
SELECT 'The promotion began on the ' || TO_CHAR(start_date, 'ddthsp "of" Month YYYY') as 
output
FROM f_promotional_menus
WHERE code = 110;
—4
SELECT 'Today is the ' || TO_CHAR(SYSDATE, 'fmDdthsp "of" Month, Year') as today
FROM dual;
—5
SELECT id, first_name ||' '||last_name as name, TO_CHAR( salary, '$999999.99') as salary
FROM f_staffs;
—6
SELECT first_name, last_name, TO_CHAR( salary, '$999999.99') as "Old Salary", 
TO_CHAR( salary + 2000 , '$9999999.99') as "New Salary"
FROM employees
WHERE first_name = 'Ellen' AND last_name = 'Abel' ;
—7
SELECT TO_CHAR(start_date, 'fmdd-Mon-YYYY (Day)') as startdate
FROM f_promotional_menus
WHERE code = 110;
—8
December 25th, 2004
SELECT TO_CHAR(TO_DATE('25-Dec-2004', 'dd-Mon-yyyy'), 'Month ddth, yyyy') as 
changeddate
FROM dual;
DECEMBER 25TH, 2004
SELECT TO_CHAR(TO_DATE('25-Dec-2004', 'dd-Mon-yyyy'), 'MONTH DDth, yyyy') as 
changeddate
FROM dual;
25th december, 2004
SELECT TO_CHAR(TO_DATE('25-Dec-2004', 'dd-Mon-yyyy'), 'fmddth month, yyyy') as 
changeddate
FROM dual;
—9
SELECT code, TO_CHAR(low_range,'$999999.99') as low_range, 
TO_CHAR(high_range,'$999999.99') as high_range
FROM d_packages ;
—10
SELECT TO_DATE('JUNE192004','fxfmMONTHddyyyy') as changeddate
FROM dual;
—11
—12
bisnis bisa bergerak di berbagai macam negara, tiap negara terkadang memiliki standar 
penampilan waktu yang berbeda, terkadang tampilan waktu yg tidak tepat akan menimbulkan 
kesalah pahaman, kesalah pahaman tanggal pada bisnis bisa menjadi hal yang serius, maka 
dari itu konversi data dapat menjadi salah satu solusinya
5.2
—1
SELECT name, start_date, end_date, NVL2(end_date, 'end in two weeks', 
TO_CHAR( SYSDATE, 'DD-Mon-YYYY')) as nvl2
FROM f_promotional_menus;
—2
SELECT last_name, NVL(overtime_rate,0) as "Overtime Status"
FROM f_staffs;
—3
SELECT last_name, TO_CHAR( NVL(overtime_rate,5), '$999.99') as "Overtime Status"
FROM f_staffs;
—4
SELECT last_name, NVL(manager_id,9999) as manager_id
FROM f_staffs;
—5
C. SELECT nullif(v_sal, 50) FROM emp;
—6
—7
a.
SELECT NVL(first_name,'FNU') , last_name, TO_CHAR(hire_date, 'Month') as "month of hire"
FROM employees;
b.
SELECT NVL(first_name,'FNU') , last_name, NULLIF( TO_CHAR(hire_date, 'Month'), 
'September') as "month of hire"
FROM employees;
—8
SELECT first_name, NVL(specialty, 'No Specialty') as specialty FROM d_partners;
5.3
—1
SELECT title, CASE WHEN TO_NUMBER(REPLACE(NVL(duration,'0 min'), ' min', '')) = 2 THEN 
'Shortest'
WHEN TO_NUMBER(REPLACE(NVL(duration,'0 min'), ' min', '')) = 10 THEN 'Longest'
ELSE NVL(duration,'0 min')
END
as "Play Times" FROM d_songs;
—2
SELECT NVL(TO_CHAR(department_id), 'none') department_id , last_name, NVL(salary,0) 
salary, CASE department_id WHEN 10 THEN 1.25*NVL(salary,0) WHEN 90 THEN 
1.5*NVL(salary,0) WHEN 130 THEN 1.75*NVL(salary,0) ELSE NVL(salary,0) END as "New 
Salary" FROM employees;
—3
SELECT first_name, last_name, manager_id, commission_pct, 
COALESCE(manager_id,commission_pct ,99999)
as "Review" FROM employees WHERE department_id in (80, 90);
