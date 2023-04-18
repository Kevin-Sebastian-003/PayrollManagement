/* simple queries*/
# query to show salary of current month for all employees
select  m.first_name, m.last_name, m.member_id, d.department_name, s.salary_month, s.salary_amount from members_t m
	inner join employees_t e on m.member_id=e.employee_id
    inner join department_t d on d.department_id=m.department_id
    inner join salary_t s on s.employee_id=e.employee_id
    where month(s.salry_month)=month(curdate()) and year(s.salry_month)=year(curdate());

# query to show salary of current month for employees of x department