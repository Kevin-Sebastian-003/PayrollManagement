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
	member_id int(8) auto_increment,
	first_name varchar(25) not null,
	last_name varchar(25),
	department_id	int,
	country_origin varchar(25) default 'USA',
	state_origin varchar(25) default 'Texas',
	date_birth	date not null,
	gender varchar(12),
	date_joining date default null,
	date_leaving date default null,
    contact_id int(8),
	primary key (member_id),
	foreign key (department_id) references departments_t(department_id),
    foreign key (contact_id) references contact_t(contact_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



/*create trigger that updates the contact_t with the new address_id*/
drop table if exists member_address_t;
create table member_address_t (
	address_id int(8) auto_increment,
	member_id int(8),
	address_line_1 varchar(100),
	address_line_2 varchar(100) default null,
	city varchar(25),
	zipcode	int(5),
	state varchar(25),
	country	varchar(25),
    primary key (address_id),
    foreign key (member_id) references members_t(member_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*1-1 relationshipn with  members_t*/
drop table if exists contact_t;
create table contact_t (
	contact_id int(8) auto_increment,
	member_id int(8),
	current_address_id int(8),
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
	department_id int(8) auto_increment,
	department_name varchar(50),
	manager_id int(8),
	description varchar(100),
	primary key (department_id),
	foreign key (manager_id) references members_t(member_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


drop table if exists employees_t;
create table employees_t (
	employee_id int(8),
    start_date date,
    end_date datetime,
	current_salary decimal(13,2),
    marital_status boolean,
    joint_tax_filing boolean,
    no_dependents int(2),
    insurance_id int(8),
    role_id	varchar(8),
	primary key (employee_id),
	foreign key (employee_id) references members_t(member_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

drop table if exists role_t;
create table role_t (
	role_id	int(8) auto_increment,
    role_name varchar(25),
    role_description varchar(25),
    role_is_employee Boolean default false,
	role_is_paid Boolean default false,
    primary key (role_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


drop table if exists employee_bank_t;
create table employee_bank_t (
	account_id int(8),
	employee_id int(8),
    bank_name varchar(100),
    acct_no	varchar(25),
    routing_no varchar(25),
	primary key (account_id),
	foreign key (employee_id) references employees_t(employee_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



drop table if exists salary_t;
create table salary_t (
	member_id int(8),
	salary_month date,
    base_salary	decimal(13,2),
    insurance decimal(13,2),
    overtime_pay decimal(13,2),
	allowance decimal(13,2),
    personal_tax decimal(13,2),
    before_tax_pay decimal(13,2),
    after_tax_pay decimal(13,2),
	primary key (member_id,salary_month)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*update count in employee insertion function*/
drop table if exists budget_allocation_t;
create table budget_allocation_t (
	budget_id int(8) auto_increment,
    month_year date,
    department_id int(8),
    allocated_budget decimal(13,2),
    used_budget	decimal(10,4),
	total_salary_paid decimal(14,2),
    no_employees int(8),
	primary key (budget_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



drop table if exists deductions_t;
create table deductions_t (
	deduction_id	int (8) auto_increment,
    deduction_name	varchar(25),
    deduction_description	varchar(200),
    deduction_amount	decimal(13,2),
	primary key (deduction_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


drop table if exists allowances_t;
create table allowances_t (
	allowance_id	int (8) auto_increment,
    allowance_name	varchar(25),
    allowance_description	varchar(200),
    allowance_amount	decimal(13,2),
	primary key (allowance_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


drop table if exists attendance_t;
create table attendance_t (
	attendance_id int(25)auto_increment,
	employee_id	int(8),
	daysattended int(8),
	totaldays int(8),
	attendance_month date,
    primary key (attendance_id),
    foreign key (employee_id) references employees_t(employee_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


/*This table contains the SSN and ITIN
create a trigger to encrypt and a function to decrypt - the ssn and itin when adding a record and reading a record*/
drop table if exists ssn_itin_t;
create table ssn_itin_t (
	employee_id	int(8),
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
  member_id int(8) NOT NULL,
  financialyear varchar(25) DEFAULT NULL,
  contribution_amount decimal(13,2) DEFAULT NULL,
  deduction_id int (8) DEFAULT NULL,
  currentBalance decimal(13,2) DEFAULT NULL,
  FOREIGN KEY (member_id) REFERENCES members_t(member_id),
  FOREIGN KEY (deduction_id) REFERENCES deductions_t(deduction_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS insurance_t;
CREATE TABLE insurance_t (
  insurance_id int(8) NOT NULL,
  insurance_name varchar(25) DEFAULT NULL,
  insured_amount decimal(13,2) DEFAULT NULL,
  principal_amount decimal(13,2) DEFAULT NULL,
  copay_percentage decimal(13,2) DEFAULT NULL,
  insurance_description varchar(100) DEFAULT NULL,
  PRIMARY KEY (insurance_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;