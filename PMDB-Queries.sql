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
select  m.first_name, m.last_name, m.member_id, s.salary_month, s.salary_amount, sb.* from members_t m
	inner join employees_t e on m.member_id=e.employee_id
    inner join salary_t s on s.employee_id=e.employee_id
    inner join salary_breakdown_t sb on s.salary_id=sb.salary_id 
    where month(s.salary_month)=month(curdate()) and year(s.salary_month)=year(curdate()) and m.first_name="Jack";


# query to get attendance of employee for current year
select  m.first_name, m.last_name, m.member_id, sum(a.days_attended)+sum(a.overtime_hours) as HoursLogged, sum(a.total_days) WorkingDays from members_t m
	inner join employees_t e on m.member_id=e.employee_id
    inner join attendance_t a on e.employee_id=a.employee_id
    where year(a.attendance_month)=year(curdate()) and m.first_name="Trevor" group by a.employee_id;


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


# query to find students who are employed
select  m.first_name, m.last_name, m.member_id from members_t m
	inner join employees_t e on m.member_id=e.employee_id
    inner join role_t r on m.role_id = r.role_id
    where r.role_name="Student"; 


# query to find students who worked overtime
select  m.first_name, m.last_name, m.member_id from members_t m
	inner join employees_t e on m.member_id=e.employee_id
    inner join role_t r on m.role_id = r.role_id
    inner join attendance_t a on e.employee_id=a.employee_id
    where r.role_name="Student" and a.overtime_hours>0 and month(a.attendance_month)=month(curdate()) and year(a.attendance_month)=year(curdate()); 


# 2 functions
#function to calculate the remaining budget for a department in a particular month and year
delimiter ~
CREATE FUNCTION get_remaining_budget(department_name_in varchar(50), daterequested date) returns decimal(13,2) 
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE remaining_budget varchar(50);
    select (allocated_budget-used_budget) into remaining_budget from budget_allocation_t 
    where month(month_year)=month(daterequested) and year(month_year)=year(daterequested) and 
    department_id=(select d.department_id from departments_t d where d.department_name=department_name_in);
    RETURN remaining_budget;
END~
delimiter ;

# combine address to a single unit
delimiter ~
CREATE FUNCTION get_address(address_id_in int) returns varchar(255) 
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE address varchar(255);
    select concat_ws("\n"address_line_1,address_line_1,city,zipcode,state,country) into address from member_address_t where address_id=address_id_in;
    RETURN address;
END~
delimiter ;