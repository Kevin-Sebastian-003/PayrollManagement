drop database if exists payrollmgmt_db;
create database payrollmgmt_db;
use payrollmgmt_db;
/*rules - 
# all id will be int 8 
*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*members are people who are affiliated to the university through some role (like a student)*/
drop table if exists members_t;
create table members_t (
	member_id int auto_increment,
	first_name varchar(25) not null,
	last_name varchar(25),
	department_id	int,
	country_origin varchar(25) default 'USA',
	state_origin varchar(25) default 'Texas',
	date_birth	date not null,
	gender varchar(12),
	date_joining date default null,
	date_leaving date default null,
    contact_id int,
    role_id	int,
	primary key (member_id),
	foreign key (department_id) references departments_t(department_id),
    foreign key (contact_id) references contact_t(contact_id),
    foreign key (role_id) references role_t(role_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



/*create trigger that updates the contact_t with the new address_id*/
drop table if exists member_address_t;
create table member_address_t (
	address_id int auto_increment,
	member_id int,
	address_line_1 varchar(100),
	address_line_2 varchar(100) default null,
	city varchar(25),
	zipcode	int,
	state varchar(25),
	country	varchar(25),
    primary key (address_id),
    foreign key (member_id) references members_t(member_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*1-1 relationshipn with  members_t*/
drop table if exists contact_t;
create table contact_t (
	contact_id int auto_increment,
	member_id int,
	current_address_id int,
	email_1 varchar(100) not null,
    email_2 varchar(100) default null,
    phone_no_1 varchar(25) not null,
    phone_no_2 varchar(25) default null,
    linkedin_address varchar(100) default null,
    additional_contact varchar(100) default null,
    primary key (contact_id),
    foreign key (member_id) references members_t(member_id),
    foreign key (current_address_id) references member_address_t(address_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


drop table if exists departments_t;
create table departments_t (
	department_id int auto_increment,
	department_name varchar(50),
	manager_id int,
	description varchar(100),
	primary key (department_id),
	foreign key (manager_id) references members_t(member_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


drop table if exists employees_t;
create table employees_t (
	employee_id int,
    start_date date,
    end_date datetime,
	current_salary decimal(13,2),
    marital_status boolean,
    joint_tax_filing boolean,
    no_dependents int,
    insurance_id int,
	primary key (employee_id),
	foreign key (employee_id) references members_t(member_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

drop table if exists role_t;
create table role_t (
	role_id	int auto_increment,
    role_name varchar(25),
    role_description varchar(25),
    role_is_employee Boolean default false,
	role_is_paid Boolean default false,
    primary key (role_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


drop table if exists employee_bank_t;
create table employee_bank_t (
	account_id int,
	employee_id int,
    bank_name varchar(100),
    acct_no	varchar(25),
    routing_no varchar(25),
	primary key (account_id),
	foreign key (employee_id) references employees_t(employee_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



drop table if exists salary_t;
create table salary_t (
	salary_id int,
	employee_id int,
	salary_month date,
    salary_amount decimal(13,2),
	primary key (salary_id),
    foreign key (employee_id) references employees_t(employee_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


drop table if exists salary_breakdown_t;
create table salary_breakdown_t (
	salary_id int,
    attendance_id int,
    basic_pay decimal(13,2),
    hourle_pay_total decimal(13,2),
    overtime_pay_total decimal(13,2),
    hourly_rate decimal(5,2),
    overtime_rate decimal(13,2),
    insurance_id int,
	allowance_1_id int,
    allowance_2_id int,
    allowance_3_id int,
    deduction_1_id int,
    deduction_2_id int,
    deduction_3_id int,
    tax_percentage decimal(13,2),
    tax_on_amount decimal(13,2),
	primary key (salary_id),
    foreign key (salary_id) references salary_t(salary_id),
    foreign key (attendance_id) references attendance_t(attendance_id),
    foreign key (insurance_id) references insurance_t(insurance_id),
    foreign key (allowance_1_id) references allowances_t(allowance_id),
	foreign key (allowance_2_id) references allowances_t(allowance_id),
    foreign key (allowance_3_id) references allowances_t(allowance_id),
    foreign key (deduction_1_id) references deductions_t(deduction_id),
    foreign key (deduction_2_id) references deductions_t(deduction_id),
    foreign key (deduction_3_id) references deductions_t(deduction_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*update count in employee insertion function*/
drop table if exists budget_allocation_t;
create table budget_allocation_t (
	budget_id int auto_increment,
    month_year date,
    department_id int,
    allocated_budget decimal(13,2),
    used_budget	decimal(10,4),
	total_salary_paid decimal(14,2),
    no_employees int,
	primary key (budget_id),
    foreign key (department_id) references departments_t(department_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



drop table if exists deductions_t;
create table deductions_t (
	deduction_id int auto_increment,
    deduction_name varchar(25),
    deduction_description varchar(200),
    deduction_amount decimal(13,2),
	primary key (deduction_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


drop table if exists allowances_t;
create table allowances_t (
	allowance_id int auto_increment,
    allowance_name	varchar(25),
    allowance_description varchar(200),
    allowance_amount decimal(13,2),
	primary key (allowance_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


drop table if exists attendance_t;
create table attendance_t (
	attendance_id int auto_increment,
	employee_id	int,
	days_attended int,
    overtime_hours int,
	total_days int,
	attendance_month date,
    primary key (attendance_id),
    foreign key (employee_id) references employees_t(employee_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


/*This table contains the SSN and ITIN
create a trigger to encrypt and a function to decrypt - the ssn and itin when adding a record and reading a record*/
drop table if exists ssn_itin_t;
create table ssn_itin_t (
	employee_id	int,
    SSN	varchar(25) unique,
	ITIN varchar(25) unique,
    primary key (employee_id),
    foreign key (employee_id) references employees_t(employee_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*
tax_type_values allow only federal or state tax
year_values checks if the tax bracket year is within a year i.e. for a financial year 2022 to 2023 
*/
drop table if exists tax_bracket_t;
create table tax_bracket_t (
	tax_type varchar(8),
	start_year date,
	end_year date ,
	income_range_start decimal(13,2),
	income_range_end decimal(13,2),
	income_tax_percentage decimal(5,4),
	constraint tax_type_values check (tax_type='State' or tax_type='Federal'),
    constraint year_values check (DATE_ADD(start_year, INTERVAL 1 year)>=end_year)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


/*Table for storing the 401k contribution of each employee for every year
deduction amount in deduction table is the minimum contribution towards 401k
The contribution_amount field in this table contains the actual contribution made by employee for that year*/
DROP TABLE IF EXISTS contribution401k_t;
CREATE TABLE contribution401k_t (
  member_id int NOT NULL,
  financialyear varchar(25) DEFAULT NULL,
  contribution_amount decimal(13,2) DEFAULT NULL,
  deduction_id int DEFAULT NULL,
  currentBalance decimal(13,2) DEFAULT NULL,
  FOREIGN KEY (member_id) REFERENCES members_t(member_id),
  FOREIGN KEY (deduction_id) REFERENCES deductions_t(deduction_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS insurance_t;
CREATE TABLE insurance_t (
  insurance_id int NOT NULL,
  insurance_name varchar(25) DEFAULT NULL,
  insured_amount decimal(13,2) DEFAULT NULL,
  principal_amount decimal(13,2) DEFAULT NULL,
  copay_percentage decimal(13,2) DEFAULT NULL,
  insurance_description varchar(100) DEFAULT NULL,
  PRIMARY KEY (insurance_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

drop table if exists employees_audit_t;
create table employees_audit_t (
	employee_id int,
    start_date date,
    end_date datetime,
	current_salary decimal(13,2),
    marital_status boolean,
    joint_tax_filing boolean,
    no_dependents int,
    insurance_id int,
	activity varchar(10),
    activity_time datetime
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#update current address in contacts table when a member adds  new address
delimiter ~
CREATE TRIGGER update_current_address AFTER INSERT ON member_address_t
FOR EACH ROW
BEGIN
  UPDATE contact_t SET current_address_id=NEW.address_id WHERE member_id=NEW.member_id;
END~
delimiter ;
/*
delimiter ~
CREATE TRIGGER update_employee_count AFTER INSERT ON employees_t
FOR EACH ROW
BEGIN
  UPDATE budget_allocation_t SET no_employees=employee_count+1 WHERE department_id=NEW.department_id;
END;
delimiter ;
*/
#update employee termination date when the member leaves the institution
delimiter ~
CREATE TRIGGER update_employee_end_date AFTER UPDATE ON members_t
FOR EACH ROW
BEGIN
  UPDATE employees_t e SET e.end_date=NEW.leaving_date WHERE e.employee_id=NEW.member_id;
END~
delimiter ;
#add delete activity to employee_audit table fro audit
delimiter ~
CREATE TRIGGER audit_employee_delete BEFORE DELETE ON employees_t
FOR EACH ROW
BEGIN
  INSERT INTO employees_audit_t values (
	OLD.employee_id,
    OLD.start_date,
    OLD.end_date,
	OLD.current_salary,
    OLD.marital_status,
    OLD.joint_tax_filing,
    OLD.no_dependents,
    OLD.insurance_id,
	"DELETE",
    now())
  ;
END~
delimiter ;
#add update activity to employee_audit table fro audit
delimiter ~
CREATE TRIGGER audit_employee_update BEFORE UPDATE ON employees_t
FOR EACH ROW
BEGIN
  INSERT INTO employees_audit_t values (
	OLD.employee_id,
    OLD.start_date,
    OLD.end_date,
	OLD.current_salary,
    OLD.marital_status,
    OLD.joint_tax_filing,
    OLD.no_dependents,
    OLD.insurance_id,
	"UPDATE",
    now())
  ;
END~
delimiter ;

#salary calculator procedure
delimiter ~
CREATE PROCEDURE get_salary (IN employee_id int, IN salary_date date, OUT salary_total decimal(13,2))
BEGIN
    DECLARE allowance1 decimal(13,2);
    DECLARE allowance2 decimal(13,2);
    DECLARE allowance3 decimal(13,2);
    DECLARE deduction1 decimal(13,2);
    DECLARE deduction2 decimal(13,2);
    DECLARE deduction3 decimal(13,2);
    DECLARE insurance decimal(13,2);
    DECLARE basicpay decimal(13,2);
    DECLARE hourlypay decimal(13,2);
    DECLARE overtimepay decimal(13,2);
	DROP TEMPORARY TABLE IF EXISTS my_temp_table;
    CREATE TEMPORARY TABLE my_temp_table 
    SELECT * FROM salary_breakdown_t sbt where sbt.salary_id=(select salary_id from salary_t s where s.employee_id=employee_id and month(s.salary_month)=month(salary_date) and year(s.salary_month)=year(salary_date));
    SELECT allowance_amount into allowance1 from allowances_t where allowance_id=(select allowance_1_id from my_temp_table);
	SELECT allowance_amount into allowance2 from allowances_t where allowance_id=(select allowance_2_id from my_temp_table);
    SELECT allowance_amount into allowance3 from allowances_t where allowance_id=(select allowance_3_id from my_temp_table);
    SELECT deduction_amount into deduction1 from deductions_t where deduction_id=(select deduction_1_id from my_temp_table);
    SELECT deduction_amount into deduction2 from deductions_t where deduction_id=(select deduction_2_id from my_temp_table);
    SELECT deduction_amount into deduction3 from deductions_t where deduction_id=(select deduction_3_id from my_temp_table);
    SELECT principal_amount into insurance from insurance_t where insurance_id=(select insurance_id from my_temp_table);
    select basic_pay into basicpay from my_temp_table;
    select hourly_pay_total into hourlypay from my_temp_table;
    select overtime_pay_total into overtimepay from my_temp_table;
    select (basicpay+hourlypay+overtimepay+allowance1+allowance2+allowance3-deduction1-deduction2-deduction3-insurance) into salary_total;
END~
delimiter ;

#tax calculator procedure
delimiter ~
CREATE PROCEDURE get_tax (IN employee_id int, IN salary_date date, OUT tax_total decimal(13,2))
BEGIN
    DECLARE percentstate decimal(13,2);
	DECLARE percentfederal decimal(13,2);
    CALL getsalary(employee_id,salary_date,salary_total);
    select income_tax_percentage into percentstate where salary_date between (start_year, end_year) and salary_total between (income_range_start, income_range_end) and tax_type="STATE";
	select income_tax_percentage into percentfederal where salary_date between (start_year, end_year) and salary_total between (income_range_start, income_range_end) and tax_type="FEDERAL";
    select (salary_total*percentstate+salary_total*percentfederal) into tax_total;
END~
delimiter ;

/*
write 3 triggers
1-update current address in contact table when the address is added into address table
2-increase employee count in budget_allocation_t when employee is added into employees_t
3-check if every salary record added is for a paid employee - after update
4-check if every paid employee with termination date null, has monthly salary record for current month
5-before delete add record to audit table
add insert and delete

write 2 stored procedures.... 
1-calculate total salary from salary breakdown table
2-calculate budget remaining using data provided
3-provide tax on amount in salary_breakdown table by deducting deductions and adding allowances based on the tax bracket table
4-encrypt values and return the encrypted form for storing ssn itin
*/