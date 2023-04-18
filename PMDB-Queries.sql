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
    where month(s.salary_month)=month(curdate()) and year(s.salary_month)=year(curdate()) and d.department_name="JSOM";
 
select * from `salary_t`
where after_tax_pay>8000;

select concat(first_name,' ', last_name) as FullName, s.after_tax_pay
from members_t m
inner join salary_t s
on m.member_id=s.member_id
where s.after_tax_pay>8000;

select concat(first_name,' ', last_name) as FullName, d.department_name
from members_t m
inner join departments_t d
on m.member_id=d.manager_id
where d.department_name='School of Art';

select concat(first_name,' ', last_name) as FullName, a.city
from members_t m
inner join member_address_t a
on m.member_id=a.member_id
where a.city='Houston';

select concat(first_name,' ', last_name) as FullName, e.marital_status
from members_t m
inner join employees_t e
on m.member_id=e.employee_id
where e.marital_status=1;
# query to get salary breakdown for an employee



# query to attendance of employee for current year



# query to find employees without social security number



# query to find employees with origin outside US with a social security or ITIn



# query to find students who are employed



# query to find students who worked overtime



# 2 functions



