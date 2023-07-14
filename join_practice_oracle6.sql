Nama : Alifia Ayu Masita

Kelas : TI 3B

NIM : 2007411034

Basis Data 2



6.1

—1

SELECT last_name, first_name, department_name

FROM employees CROSS JOIN departments;



—2

SELECT department_id,department_name, location_id, city

FROM departments NATURAL JOIN locations;



—3

SELECT department_id,department_name, location_id, city

FROM departments NATURAL JOIN locations

WHERE department_id in (20, 50);



6.2

—1

SELECT department_id,department_name, location_id, city

FROM departments JOIN locations USING (location_id)

WHERE location_id = 1400;



—2

SELECT song_id, cd_number, title, comments FROM d_cds JOIN d_track_listings USING (cd_number)  JOIN d_play_list_items USING (song_id);



—3

SELECT city, department_name, location_id, department_id

FROM departments JOIN locations USING (location_id)

WHERE department_id in (10, 20 , 30) AND city = 'Seattle';



—4

SELECT country_name, region_id, region_name

FROM countries  JOIN regions USING(region_id)

WHERE region_name = 'Americas';



—5

SELECT  first_name, last_name, hire_date, job_id, job_title, max_salary

FROM employees  JOIN jobs USING (job_id)

WHERE max_salary > 12000;



—6

SELECT  job_title,  first_name,  last_name, LOWER(email) || 'somecomname.sometld' as email

FROM employees JOIN jobs USING(job_id)

WHERE  job_title = 'Stock Clerk' ;



—7

SELECT emp.employee_id AS "employee ID", emp.first_name AS "first name", emp.last_name "last name", emp.manager_id "manager ID", mgr.first_name "manager first name", mgr.last_name "manager last name"

FROM  employees emp LEFT JOIN employees mgr ON  emp.manager_id = mgr.employee_id;



—8

SELECT dp.location_id, loc.city, dp.department_name

FROM departments dp INNER JOIN locations  loc ON dp.location_id = loc.location_id  INNER JOIN  countries ct ON loc.country_id = ct.country_id

WHERE ct.country_name = 'Canada';



—9

SELECT emp.manager_id "Employee's Manager ID", emp.department_id "Department ID", dpt.department_name  "Department Name", emp.first_name "First Name", emp.last_name "Last Name"

FROM  employees emp INNER JOIN departments dpt ON emp.department_id = dpt.department_id

WHERE emp.department_id in (80, 90, 110, 190);



10.

SELECT emp.Employee_id "Employee ID", emp.last_name "Last Name" , emp.department_id "Department ID", dpt.department_name  "Department Name", emp.hire_date "Hire Date"

FROM  employees emp LEFT JOIN departments dpt ON emp.department_id = dpt.department_id WHERE emp.hire_date = TO_DATE('June 7, 1994', 'fmMonth DD, YYYY');



6.3



—1

SELECT  emp.first_name "First Name", emp.last_name "Last Name" , dpt.department_name  "Department Name"

FROM  employees emp LEFT OUTER JOIN departments dpt ON emp.department_id = dpt.department_id;



—2

SELECT  emp.first_name "First Name", emp.last_name "Last Name" , dpt.department_name  "Department Name"

FROM  employees emp RIGHT OUTER JOIN departments dpt ON emp.department_id = dpt.department_id;



—3

SELECT  emp.first_name "First Name", emp.last_name "Last Name" , dpt.department_name  "Department Name"

FROM  employees emp FULL OUTER JOIN departments dpt ON emp.department_id = dpt.department_id;



—4

SELECT ct.first_name, ct.last_name, ev.event_date, ev.description

FROM  d_clients ct LEFT OUTER JOIN d_events ev ON ct.client_number = ev.client_number;



—5

SELECT f_shifts.description "shift description", f_shift_assignments.shift_assign_date AS "shift assignment date" FROM  f_shifts LEFT OUTER JOIN f_shift_assignments ON f_shifts.code = f_shift_assignments.code;



6.4

—1

SELECT emp.last_name "Employee", emp.employee_id "Emp#", mgr.last_name "Manager", mgr.employee_Id  "Mgr#"

FROM  employees emp INNER JOIN  employees  mgr  ON emp.manager_id  = mgr.employee_Id;



—2 

SELECT emp.last_name "Employee", emp.employee_id "Emp#", mgr.last_name "Manager", mgr.employee_Id  "Mgr#"

FROM  employees emp LEFT OUTER JOIN  employees  mgr  ON emp.manager_id  = mgr.employee_Id

ORDER BY  "Employee";



—3

SELECT emp.last_name "Employee",  emp.hire_date "Emp Hired",   mgr.last_name "Manager", mgr.hire_date "Mgr Hired"

FROM  employees emp LEFT OUTER JOIN  employees  mgr  ON emp.manager_id  = mgr.employee_Id

WHERE emp.hire_date < NVL( mgr.hire_date, TO_DATE('31.12.9999 23:59:59', 'dd.mm.yyyy hh24:mi:ss'))

ORDER BY  "Employee";



—4

SELECT last_name, salary, department_id

FROM employees

START WITH first_name = 'Lex'  AND last_name = 'De Haan'

CONNECT BY PRIOR employee_id = manager_id;



—5





—6

SELECT LPAD(last_name, LENGTH(last_name) + (LEVEL-1)*2, '-') "organization chart "

FROM employees

START WITH last_name = ( SELECT last_name from employees WHERE manager_id IS NULL)

CONNECT BY PRIOR employee_id = manager_id;



—7

SELECT LPAD(last_name, LENGTH(last_name) + (LEVEL-1)*2, '-') "organization chart "

FROM employees

START WITH last_name = ( SELECT last_name from employees WHERE manager_id IS NULL)

CONNECT BY PRIOR employee_id = manager_id AND last_name != 'De Haan';



7.1

—1

SELECT d_play_list_items.event_id "event id in playlist", d_play_list_items.song_id "song id in playlist", d_play_list_items.comments "comments in playlist", d_track_listings.song_id "song id in tracklist", d_track_listings.cd_number "cd number in tracklist",  d_track_listings.track "track in tracklist"

FROM  d_play_list_items, d_track_listings;



—2

SELECT d_play_list_items.event_id "event id in playlist", d_play_list_items.song_id "song id in playlist", d_play_list_items.comments "comments in playlist", d_track_listings.song_id "song id in tracklist", d_track_listings.cd_number "cd number in tracklist",  d_track_listings.track "track in tracklist"

FROM  d_play_list_items, d_track_listings

WHERE d_play_list_items.song_id = d_track_listings.song_id;



—3

SELECT  d_songs.title,  d_songs.type_code type, d_types.description

FROM d_songs, d_types

WHERE d_songs.type_code = d_types.code;



—4

SELECT  d_songs.title,  d_songs.type_code type, d_types.description

FROM d_songs, d_types

WHERE d_songs.type_code = d_types.code AND d_songs.id in (47, 48);



—5

SELECT d_clients.email AS "d_clients - email" , d_clients.phone AS "d_clients - phone" , d_clients.last_name AS "d_clients - last_name" , d_clients.first_name AS "d_clients - first_name"  , d_clients.client_number AS "d_clients - client_number"  , d_events.id AS "d_events - id", d_events.name AS "d_events - name", d_events.event_date AS "d_events - event_date", d_events.description AS "d_events - description", d_events.cost AS "d_events - cost", d_events.venue_id AS "d_events - venue_id", d_events.package_code AS "d_events - package_code", d_events.theme_code AS "d_events - theme_code", d_events.client_number AS "d_events - client_number", d_job_assignments.partner_id AS "d_job_assignments - partner_id", d_job_assignments.event_id AS "d_job_assignments - event_id", d_job_assignments.job_date AS "d_job_assignments - job_date", d_job_assignments.status AS "d_job_assignments - status"

FROM d_clients, d_events, d_job_assignments

WHERE d_clients.client_number = d_events.client_number AND d_events.id =  d_job_assignments.event_id;



—6

SELECT d_track_listings.song_id "song id in tracklist", d_cds.title "title in cds"

FROM d_track_listings, d_cds

WHERE d_track_listings.cd_number = d_cds.cd_number;



—7

a. F, karna join tidak bergantung pada isi table

b. T, karna primary key dijadikan acuan yang ditampilkan

c. T, bisa dijadikan sebagai pengganti syntax WHERE

d. F, join bisa dilakukan tanpa tabel aliases

e. T

f. F, table tidak bergantung pada panjang isi

g. T, karna sama-sama bisa mempersingkat table dengan isi yang sama



—8

dengan join table kita bisa mengambil data yang berhubungan antar table walau hanya data yang dibutuhkan saja yang ditampilkan.



7.2

—1

SELECT  d_events.name, d_packages.code

FROM d_events, d_packages

WHERE(d_events.cost BETWEEN d_packages.low_range AND d_packages.high_range);



—2

SELECT employees.last_name, employees.salary, job_grades.grade_level

FROM employees,job_grades

WHERE employees.salary BETWEEN job_grades.lowest_sal AND job_grades.highest_sal;



—3

ketika isi kedua table tidak sama persis tapi masih ada relasi antara keduanya



—4

WHERE  a.ranking >= g.lowest_rank AND a.ranking <= g. highest_rank



—5

kita harus menggunakan tabel alias apabila entitas hanya memiliki relasi pada satu entitas saja, alias juga bisa digunakan pada nama tabel yang panjang



—6

Nonequi join



—7

SELECT f_customers.first_name ||' '|| f_customers.last_name "Customer Name", f_orders.order_number, f_orders.order_total, f_orders.order_date

FROM f_customers, f_orders

WHERE  f_customers.id = f_orders.cust_id(+);



—8

SELECT employees.last_name, employees.department_id, departments.department_name

FROM employees, departments

WHERE employees.department_id = departments.department_id(+);



—9

SELECT employees.last_name, employees.department_id, departments.department_name

FROM employees, departments

WHERE employees.department_id(+) = departments.department_id;



—10

a. syntax tersebut tidak bisa menggunakan alias dan kita dapat memperbaikinya dengan menuliskan nama tabel langsung



b. cara menuliskan alias adalah dengan menuliskan disamping from (table) (alias)



—11

SELECT d_cds.title , d_track_listings.song_id

FROM  d_cds, d_track_listings

WHERE d_cds.cd_number = d_track_listings.cd_number(+) ;



—12

dreamjob saya sekarang adalah pekerjaan yang saya bisa lakukan tanpa target waktu dan bisa saya handle sendiri kapan saya bekerja dan tidak karna saya memiliki target lain yaitu menjadi seorang ibu
