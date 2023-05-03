/* simple queries*/
# query to show salary of current month for all employees
select  m.first_name, m.last_name, m.member_id, d.department_name, s.salary_month, s.salary_amount from members_t m
	inner join employees_t e on m.member_id=e.employee_id
    inner join departments_t d on d.department_id=m.department_id
    inner join salary_t s on s.employee_id=e.employee_id
    where month(s.salary_month)=month(curdate()) and year(s.salary_month)=year(curdate());

# query to show salary of current month for employees of x department
select  m.first_name, m.last_name, m.member_id, d.department_name, s.salary_month, s.salary_amount from members_t m
	inner join employees_t e on m.member_id=e.employee_id
    inner join departments_t d on d.department_id=m.department_id
    inner join salary_t s on s.employee_id=e.employee_id
    where month(s.salary_month)=month(curdate()) and year(s.salary_month)=year(curdate()) and d.department_name="School of Management";

# query to show employees of x department
select concat(first_name,' ', last_name) as FullName, d.department_name
from members_t m
inner join departments_t d
on m.member_id=d.manager_id
where d.department_name='School of Art';

# query to employees of x city
select concat(first_name,' ', last_name) as FullName, a.city
from members_t m
inner join member_address_t a
on m.member_id=a.member_id
where a.city='Houston';

# query to show employees who are married
select concat(first_name,' ', last_name) as FullName, e.marital_status
from members_t m
inner join employees_t e
on m.member_id=e.employee_id
where e.marital_status=1;

# query to get salary breakdown for an employee
select  m.first_name, m.last_name, m.member_id, s.salary_month, s.salary_amount, sb.* from members_t m
	inner join employees_t e on m.member_id=e.employee_id
    inner join salary_t s on s.employee_id=e.employee_id
    inner join salary_breakdown_t sb on s.salary_id=sb.salary_id 
    where month(s.salary_month)=month(curdate()) and year(s.salary_month)=year(curdate()) and m.first_name="John";


# query to get attendance of employee for current year
select  m.first_name, m.last_name, m.member_id, sum(a.overtime_hours) as Overtime_Hours, sum(a.total_days) WorkingDays from members_t m
	inner join employees_t e on m.member_id=e.employee_id
    inner join attendance_t a on e.employee_id=a.employee_id
    where year(a.attendance_month)=year(curdate()) and m.first_name="Mike" group by a.employee_id;


# query to find employees without social security number
select  m.first_name, m.last_name, m.member_id from members_t m
	inner join employees_t e on m.member_id=e.employee_id
    inner join ssn_itin_t s on e.employee_id=s.employee_id
    where s.ssn is null;


# query to find employees with origin outside US with a social security or ITIn
select  m.first_name, m.last_name, m.member_id, m.country_origin from members_t m
	inner join employees_t e on m.member_id=e.employee_id
    inner join ssn_itin_t s on e.employee_id=s.employee_id
    where s.ssn is not null and s.itin is not null and m.country_origin!="USA";


# query to find Faculty who are employed
select  m.first_name, m.last_name, m.member_id 
	from members_t m
	inner join employees_t e on m.member_id=e.employee_id
    inner join role_t r on m.role_id = r.role_id
    where r.role_name="Faculty"; 


# query to find students who worked overtime
select  m.first_name, m.last_name, m.member_id from members_t m
	inner join employees_t e on m.member_id=e.employee_id
    inner join role_t r on m.role_id = r.role_id
    inner join attendance_t a on e.employee_id=a.employee_id
    where r.role_name="Student" and a.overtime_hours>0 and month(a.attendance_month)=month(curdate()) and year(a.attendance_month)=year(curdate()); 
