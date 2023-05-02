drop table if exists members_t;
drop table if exists member_address_t;
drop table if exists contact_t;
drop table if exists departments_t;
drop table if exists employees_t;
drop table if exists role_t;
drop table if exists employee_bank_t;
drop table if exists salary_t;
drop table if exists budget_allocation_t;
drop table if exists deductions_t;
drop table if exists allowances_t;
drop table if exists attendance_t;
drop table if exists ssn_itin_t;
drop table if exists tax_bracket_t;
DROP TABLE IF EXISTS `contribution401k_t`;
DROP TABLE IF EXISTS `insurance_t`;

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


SET FOREIGN_KEY_CHECKS=0;
# for insert allowances add a default allowance value of 0
INSERT INTO members_t VALUES (DEFAULT, 'John', 'Doe', 1, 'USA', 'Texas', '1990-01-01', 'Male', '2020-01-01', NULL, 1);
INSERT INTO members_t VALUES (DEFAULT, 'Jane', 'Doe', 2, 'USA', 'Texas', '1995-02-14', 'Female', '2021-03-15', NULL, 2);
INSERT INTO members_t VALUES (DEFAULT, 'Mike', 'Smith', 3, 'USA', 'Texas', '1988-11-20', 'Male', '2019-05-02', '2022-01-01', 3);
INSERT INTO members_t VALUES (DEFAULT, 'Susan', 'Johnson', 1, 'USA', 'Texas', '1993-06-30', 'Female', '2018-08-15', '2022-03-01', 4);
INSERT INTO members_t VALUES (DEFAULT, 'David', 'Brown', 4, 'USA', 'Texas', '1991-03-05', 'Male', '2017-10-01', '2022-05-01', 5);
INSERT INTO members_t VALUES (DEFAULT, 'Emily', 'Garcia', 2, 'USA', 'Texas', '1996-07-12', 'Female', '2020-02-14', NULL, 6);
INSERT INTO members_t VALUES (DEFAULT, 'Daniel', 'Wilson', 3, 'USA', 'Texas', '1992-09-17', 'Male', '2016-11-30', '2023-02-01', 7);
INSERT INTO members_t VALUES (DEFAULT, 'Megan', 'Taylor', 1, 'USA', 'Texas', '1989-05-21', 'Female', '2015-07-01', '2022-08-01', 8);
INSERT INTO members_t VALUES (DEFAULT, 'Brandon', 'Davis', 4, 'USA', 'Texas', '1994-12-10', 'Male', '2021-04-23', NULL, 9);
INSERT INTO members_t VALUES (DEFAULT, 'Rachel', 'Martinez', 2, 'USA', 'Texas', '1997-08-25', 'Female', '2022-01-15', NULL, 10);
INSERT INTO members_t VALUES (DEFAULT, 'Joshua', 'Clark', 3, 'USA', 'Texas', '1991-01-11', 'Male', '2020-03-01', '2023-04-01', 11);
INSERT INTO members_t VALUES (DEFAULT, 'Olivia', 'Hernandez', 1, 'USA', 'Texas', '1996-04-20', 'Female', '2019-06-15', '2022-09-01', 12);
INSERT INTO members_t VALUES (DEFAULT, 'Christopher', 'Nelson', 4, 'USA', 'Texas', '1993-03-17', 'Male', '2018-12-01', '2023-01-01', 13);
INSERT INTO members_t VALUES (DEFAULT, 'Jessica', 'Gonzalez', 2, 'USA', 'Texas', '1990-11-05', 'Female', '2017-02-14', '2022-06-01', 14);
INSERT INTO members_t VALUES (DEFAULT, 'Nicholas', 'Lee', 3, 'USA', 'Texas', '1989-07-28', 'Male', '2016-09-01', '2023-03-01', 15);
INSERT INTO members_t VALUES (DEFAULT, 'Amanda', 'Allen', 1, 'USA', 'Texas', '1995-10-15', 'Female', '2020-05-01', NULL, 16);
INSERT INTO members_t VALUES (DEFAULT, 'Kevin', 'Comet', 4, 'USA', 'Texas', '1992-02-19', 'Male', '2015-04-01', '2022-04-01', 17);
INSERT INTO members_t VALUES (DEFAULT, 'Samantha', 'Scott', 2, 'USA', 'Texas', '1997-01-30', 'Female', '2022-03-01', NULL, 18);
INSERT INTO members_t VALUES (DEFAULT, 'Andrew', 'Wright', 3, 'USA', 'Texas', '1993-09-02', 'Male', '2019-12-01', '2022-11-01', 19);
INSERT INTO members_t VALUES (DEFAULT, 'Stephanie', 'Baker', 1, 'USA', 'Texas', '1996-06-08', 'Female', '2018-04-15', '2022-07-01', 20);
INSERT INTO members_t VALUES (DEFAULT, 'Ryan', 'Gomez', 4, 'USA', 'Texas', '1994-05-07', 'Male', '2021-02-14', NULL, 21);
INSERT INTO members_t VALUES (DEFAULT, 'Nicole', 'Parker', 2, 'USA', 'Texas', '1990-12-19', 'Female', '2016-06-01', '2023-05-01', 22);
INSERT INTO members_t VALUES (DEFAULT, 'Jacob', 'Evans', 3, 'USA', 'Texas', '1992-04-03', 'Male', '2020-05-01', '2023-01-01', 23);
INSERT INTO members_t VALUES (DEFAULT, 'Lauren', 'Edwards', 1, 'USA', 'Texas', '1997-02-28', 'Female', '2021-06-15', NULL, 24);
INSERT INTO members_t VALUES (DEFAULT, 'Tyler', 'Collins', 4, 'USA', 'Texas', '1991-08-12', 'Male', '2017-11-01', '2022-02-01', 25);
INSERT INTO members_t VALUES (DEFAULT, 'Brittany', 'Stewart', 2, 'USA', 'Texas', '1996-10-20', 'Female', '2019-03-01', '2022-12-01', 26);
INSERT INTO members_t VALUES (DEFAULT, 'Justin', 'Sanchez', 3, 'USA', 'Texas', '1993-12-06', 'Male', '2018-05-01', '2022-10-01', 27);
INSERT INTO members_t VALUES (DEFAULT, 'Emily', 'Rivera', 1, 'USA', 'Texas', '1995-11-17', 'Female', '2020-04-01', NULL, 28);
INSERT INTO members_t VALUES (DEFAULT, 'Connor', 'Reed', 4, 'USA', 'Texas', '1992-07-25', 'Male', '2016-10-01', '2022-09-01', 29);
INSERT INTO members_t VALUES (DEFAULT, 'Megan', 'Perez', 2, 'USA', 'Texas', '1998-03-14', 'Female', '2022-01-01', NULL, 30);
INSERT INTO members_t VALUES (DEFAULT, 'Austin', 'Cook', 3, 'USA', 'Texas', '1994-09-28', 'Male', '2019-02-01', '2023-04-01', 31);
INSERT INTO members_t VALUES (DEFAULT, 'Haley', 'Bailey', 1, 'USA', 'Texas', '1997-05-02', 'Female', '2021-07-01', NULL, 32);
INSERT INTO members_t VALUES (DEFAULT, 'Cameron', 'Sanders', 4, 'USA', 'Texas', '1991-11-11', 'Male', '2017-03-01', '2022-08-01', 33);
INSERT INTO members_t VALUES (DEFAULT, 'Madison', 'Morgan', 2, 'USA', 'Texas', '1996-12-25', 'Female', '2020-07-01', '2023-02-01', 34);
INSERT INTO members_t VALUES (DEFAULT, 'Joshua', 'Gutierrez', 3, 'USA', 'Texas', '1993-01-01', 'Male', '2018-06-01', '2022-12-01', 35);
INSERT INTO members_t VALUES (DEFAULT, 'Olivia', 'Chavez', 1, 'USA', 'Texas', '1997-03-15', 'Female', '2021-05-01', NULL, 36);
INSERT INTO members_t VALUES (DEFAULT, 'Brandon', 'Snyder', 4, 'USA', 'Texas', '1991-09-08', 'Male', '2016-11-01', '2022-10-01', 37);
INSERT INTO members_t VALUES (DEFAULT, 'Jasmine', 'Romero', 2, 'USA', 'Texas', '1995-11-20', 'Female', '2019-04-01', '2023-03-01', 38);
INSERT INTO members_t VALUES (DEFAULT, 'Nathan', 'Hunter', 3, 'USA', 'Texas', '1992-05-05', 'Male', '2020-03-01', '2023-01-01', 39);
INSERT INTO members_t VALUES (DEFAULT, 'Isabella', 'Black', 1, 'USA', 'Texas', '1998-04-22', 'Female', '2022-08-01', NULL, 40);
INSERT INTO members_t VALUES (DEFAULT, 'Matthew', 'Garcia', 4, 'USA', 'Texas', '1991-12-02', 'Male', '2017-05-01', '2022-09-01', 41);
INSERT INTO members_t VALUES (DEFAULT, 'Hailey', 'Taylor', 2, 'USA', 'Texas', '1996-02-14', 'Female', '2020-08-01', '2023-02-01', 42);
INSERT INTO members_t VALUES (DEFAULT, 'Kevin', 'Clark', 3, 'USA', 'Texas', '1993-06-09', 'Male', '2018-09-01', '2022-12-01', 43);
INSERT INTO members_t VALUES (DEFAULT, 'Avery', 'Rose', 1, 'USA', 'Texas', '1997-08-18', 'Female', '2021-09-01', NULL, 44);
INSERT INTO members_t VALUES (DEFAULT, 'Eric', 'Sims', 4, 'USA', 'Texas', '1992-01-05', 'Male', '2016-12-01', '2022-11-01', 45);
INSERT INTO members_t VALUES (DEFAULT, 'Grace', 'Ford', 2, 'USA', 'Texas', '1996-04-12', 'Female', '2020-09-01', '2023-03-01', 46);
INSERT INTO members_t VALUES (DEFAULT, 'Jacob', 'Dunn', 3, 'USA', 'Texas', '1994-03-19', 'Male', '2019-06-01', '2023-01-01', 47);
INSERT INTO members_t VALUES (DEFAULT, 'Sophia', 'Baker', 1, 'USA', 'Texas', '1998-06-08', 'Female', '2022-09-01', NULL, 48);
INSERT INTO members_t VALUES (DEFAULT, 'William', 'Rose', 4, 'USA', 'Texas', '1991-10-21', 'Male', '2017-08-01', '2022-10-01', 49);
INSERT INTO members_t VALUES (DEFAULT, 'Victoria', 'Lee', 2, 'USA', 'Texas', '1995-01-28', 'Female', '2020-10-01', '2023-04-01', 50);


DELETE FROM member_address_t;
INSERT INTO member_address_t VALUES (DEFAULT, 1, '7600 OSBUN ST', NULL, 'FORT WORTH', '76116', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 2, '2001 COLLINS AVE', NULL, 'ABILENE', '79603', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 3, '9600 COUNTY ROAD 179', NULL, 'BEDIAS', '77831', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 5, '600 COUNTY ROAD', NULL, 'CROCKETT', '75835', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 6, '424 W FORK DR', NULL, 'ARLINGTON', '76012', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 7, '611 W 22ND ST', NULL, 'HOUSTON', '77008', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 8, '10300 KELBURN DR', NULL, 'HOUSTON', '77016', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 9, '14902 PRESTON RD', NULL, 'DALLAS', '75254', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 10, '1100 E FANNIN ST', NULL, 'BEEVILLE', '78102', 'Texas', 'USA');

DELETE FROM contact_t;
INSERT INTO contact_t VALUES (DEFAULT, 1, 1, 'John_Doe@yahoo.com', NULL, '4793009222', NULL,'linkedin.com/John_Doe', NULL);
INSERT INTO contact_t VALUES (DEFAULT, 2, 2, 'Jane_Doe@gmail.com', NULL, '4528998888', NULL,'linkedin.com/Jane_Doe', NULL);
INSERT INTO contact_t VALUES (DEFAULT, 3, 3, 'Mike_Smith@hotmail.com', NULL, '9823333400', NULL,'linkedin.com/Mike_Smith', NULL);
INSERT INTO contact_t VALUES (DEFAULT, 4, 4, 'Susan_Johnson@yahoo.com', NULL, '4438233400', NULL,'linkedin.com/Susan_Johnson', NULL);
INSERT INTO contact_t VALUES (DEFAULT, 5, 5, 'David_Brown@gmail.com', NULL, '6795673400', NULL,'linkedin.com/David_Brown', NULL);
INSERT INTO contact_t VALUES (DEFAULT, 6, 6, 'Emily_Garcia@outlook.com', NULL, '7896843400', NULL,'linkedin.com/Emily_Garcia', NULL);
INSERT INTO contact_t VALUES (DEFAULT, 7, 7, 'Daniel_Wilson@hotmail.com', NULL, '4236733400', NULL,'linkedin.com/Daniel_Wilson', NULL);
INSERT INTO contact_t VALUES (DEFAULT, 8, 8, 'Megan_Taylor@gmail.com', NULL, '9704333400', NULL,'linkedin.com/Megan_Taylor', NULL);
INSERT INTO contact_t VALUES (DEFAULT, 9, 9, 'Brandon_Davis@hotmail.com', NULL, '9726333400', NULL,'linkedin.com/Brandon_Davis', NULL);
INSERT INTO contact_t VALUES (DEFAULT, 10, 10, 'Rachel_Martinez@gmail.com', NULL, '97223590400', NULL,'linkedin.com/Rachel_Martinez', NULL);

DELETE FROM departments_t;
INSERT INTO departments_t VALUES (1, 'Accounting Dept', 1, 'Senior Accountant');
INSERT INTO departments_t VALUES (2, 'School of Management', 2, 'Assistant Professor');
INSERT INTO departments_t VALUES (3, 'School of Engineering', 3, 'Clinical Professor');
INSERT INTO departments_t VALUES (4, 'School of Art', 4, 'Assistant Professor');
INSERT INTO departments_t VALUES (5, 'School of Social Science', 5, 'Associate Professor');
INSERT INTO departments_t VALUES (6, 'School of Management', 6, 'Clinical Professor');
INSERT INTO departments_t VALUES (7, 'School of Management', 7, 'Academic Advisor');
INSERT INTO departments_t VALUES (8, 'Career Center', 8, 'Associate Director');
INSERT INTO departments_t VALUES (9, 'School of Art', 9, 'Professor');
INSERT INTO departments_t VALUES (10, 'IT Center', 10, 'Director');

DELETE FROM employees_t;
INSERT INTO employees_t VALUES (1, '2013-2-23', NULL, 5989.00, 1, 1, 2, 43566345, 1);
INSERT INTO employees_t VALUES (2, '2017-6-1', NULL, 7200.00, 1, 0, 0, 44677789, 2);
INSERT INTO employees_t VALUES (3, '2010-6-30', NULL, 7600.00, 1, 0, 1, 23845789, 3);
INSERT INTO employees_t VALUES (4, '2005-4-15', NULL, 6200.00, 1, 0, 2, 69426789, 4);
INSERT INTO employees_t VALUES (5, '1998-7-13', NULL, 6780.00, 1, 0, 3, 46896764, 5);
INSERT INTO employees_t VALUES (6, '1999-8-31', NULL, 7200.00, 1, 0, 2, 64347976, 6);
INSERT INTO employees_t VALUES (7, '2004-3-21', NULL, 6700.00, 1, 0, 1, 34583696, 7);
INSERT INTO employees_t VALUES (8, '2008-10-17', NULL, 7800.00, 1, 0, 1, 86542654, 8);
INSERT INTO employees_t VALUES (9, '2017-8-13', NULL, 10200.00, 1, 0, 0, 34657427, 9);
INSERT INTO employees_t VALUES (10, '2018-6-16', NULL, 4450.00, 0, 0, 0, 86543474, 10);

DELETE FROM role_t;
INSERT INTO role_t VALUES (DEFAULT, 'administation', 'Senior Accountant', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Faculty', 'Assistant Professor', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Faculty', 'Clinical Professor', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Faculty', 'Assistant Professor', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Faculty', 'Associate Professor', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Faculty', 'Clinical Professor', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Faculty', 'Academic Advisor', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'administation', 'Associate Director', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Faculty', 'Professor', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'administation', 'Director', 1, 1);

DELETE FROM employee_bank_t;
INSERT INTO employee_bank_t VALUES (1, 1, 'Bank of America', 40668902, '11000800');
INSERT INTO employee_bank_t VALUES (2, 2, 'Wells Fargo', 563678458, '21000025');
INSERT INTO employee_bank_t VALUES (3, 3, 'Chase', 65325412, '11200060');
INSERT INTO employee_bank_t VALUES (4, 4, 'Truist', 84563125, '38294884');
INSERT INTO employee_bank_t VALUES (5, 5, 'Wells Fargo', 84521239, '21000025');
INSERT INTO employee_bank_t VALUES (6, 6, 'Bank of America', 53316442, '11000800');
INSERT INTO employee_bank_t VALUES (7, 7, 'Chase', 854621214, '11200060');
INSERT INTO employee_bank_t VALUES (8, 8, 'Chase', 953123587, '11200060');
INSERT INTO employee_bank_t VALUES (9, 9, 'Wells Fargo', 78526541, '21000025');
INSERT INTO employee_bank_t VALUES (10, 10, 'Bank of America', 65845213, '11000800');

DELETE FROM salary_t;
INSERT INTO salary_t VALUES (1, '2023-3-1', 5989.00, 550.00, 300.00, 500.00, 479.12, 6789.00, 5759.88);
INSERT INTO salary_t VALUES (2, '2023-3-1', 7200.00, 450.00, 000.00, 300.00, 576.00, 7500.00, 6474.00);
INSERT INTO salary_t VALUES (3, '2023-3-1', 7600.00, 450.00, 000.00, 200.00, 608.00, 7800.00, 5030.00);
INSERT INTO salary_t VALUES (4, '2023-3-1', 6200.00, 450.00, 000.00, 300.00, 496.00, 6500.00, 5554.00);
INSERT INTO salary_t VALUES (5, '2023-3-1', 6780.00, 450.00, 000.00, 500.00, 542.40, 7280.00, 6287.60);
INSERT INTO salary_t VALUES (6, '2023-3-1', 7200.00, 450.00, 000.00, 200.00, 576.00, 7400.00, 6374.00);
INSERT INTO salary_t VALUES (7, '2023-3-1', 6700.00, 450.00, 000.00, 200.00, 536.00, 6900.00, 5914.00);
INSERT INTO salary_t VALUES (8, '2023-3-1', 7800.00, 520.00, 100.00, 500.00, 624.00, 8400.00, 7256.00);
INSERT INTO salary_t VALUES (9, '2023-3-1', 10200.00, 550.00, 250.00, 800.00, 816.00, 11250.00, 9884.00);
INSERT INTO salary_t VALUES (10, '2023-3-1', 4450.00, 450.00, 300.00, 200.00, 356.00, 4950.00, 4144.00);


DELETE FROM budget_allocation_t;
INSERT INTO budget_allocation_t VALUES (DEFAULT, '2023-3-1', 1, 589700.00, 432000.00, 372300.00, 62);
INSERT INTO budget_allocation_t VALUES (DEFAULT, '2023-3-1', 2, 458930.00, 362000.00, 284500.00, 55);
INSERT INTO budget_allocation_t VALUES (DEFAULT, '2023-3-1', 3, 652314.00, 523000.00, 305500.00, 75);
INSERT INTO budget_allocation_t VALUES (DEFAULT, '2023-3-1', 4, 458230.00, 450060.00, 395050.00, 50);
INSERT INTO budget_allocation_t VALUES (DEFAULT, '2023-3-1', 5, 693210.00, 605050.00, 597000.00, 35);
INSERT INTO budget_allocation_t VALUES (DEFAULT, '2023-3-1', 6, 854630.00, 705000.00, 680050.00, 40);
INSERT INTO budget_allocation_t VALUES (DEFAULT, '2023-3-1', 7, 752120.00, 685420.00, 320015.00, 50);
INSERT INTO budget_allocation_t VALUES (DEFAULT, '2023-2-1', 1, 652300.00, 354060.00, 320050.00, 62);
INSERT INTO budget_allocation_t VALUES (DEFAULT, '2023-2-1', 2, 320520.00, 320000.00, 310000.00, 55);
INSERT INTO budget_allocation_t VALUES (DEFAULT, '2023-2-1', 3, 420010.00, 405600.00, 382300.00, 75);

DELETE FROM deductions_t;
INSERT INTO deductions_t VALUES (1, 'sick leave deduction', 'deduction for taking a sick leave', 100.00);
INSERT INTO deductions_t VALUES (2, 'Parental Leave deduction', 'deduction for taking a Parental leave', 320.00);
INSERT INTO deductions_t VALUES (3, 'Paternity leave deduction', 'deduction for taking a Paternity leave', 100.00);
INSERT INTO deductions_t VALUES (4, 'Annual  leave deduction', 'deduction for taking a Annual leave', 140.00);

DELETE FROM allowances_t;
INSERT INTO allowances_t VALUES (1, 'summer class allowance', 'allowance for participating summer semester classes', 500.00);
INSERT INTO allowances_t VALUES (2, 'Transport allowance', 'allowance for monthly trasportation', 300.00);
INSERT INTO allowances_t VALUES (3, 'Travel allowance', 'allowance for traveling', 540.00);
INSERT INTO allowances_t VALUES (4, 'Housing allowance', 'allowance for house rent', 600.00);
INSERT INTO allowances_t VALUES (5, 'Medical allowance', 'allowance for the cost of medical care, private healthcare, and other related expenses', 500.00);

DELETE FROM attendance_t;
INSERT INTO attendance_t VALUES (DEFAULT, 1, 22, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 2, 22, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 3, 22, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 4, 21, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 5, 22, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 6, 22, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 7, 22, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 8, 20, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 9, 22, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 10, 22, 22, '2023-1-30');

DELETE FROM ssn_itin_t;
INSERT INTO ssn_itin_t VALUES (1, '449-467-2654', '958-78-3652');
INSERT INTO ssn_itin_t VALUES (2, '433-439-2634', '934-78-5654');
INSERT INTO ssn_itin_t VALUES (3, '449-467-3546', '958-76-4543');
INSERT INTO ssn_itin_t VALUES (4, '440-448-4867', '958-75-5462');
INSERT INTO ssn_itin_t VALUES (5, '449-467-6354', '958-75-4563');
INSERT INTO ssn_itin_t VALUES (6, '449-467-8452', '988-74-1245');
INSERT INTO ssn_itin_t VALUES (7, '521-524-5674', '968-78-7845');
INSERT INTO ssn_itin_t VALUES (8, '449-467-1254', '957-77-4528');
INSERT INTO ssn_itin_t VALUES (9, '449-467-6587', '958-79-3655');
INSERT INTO ssn_itin_t VALUES (10, '531-539-9874', '957-72-4785');

DELETE FROM tax_bracket_t;
INSERT INTO tax_bracket_t VALUES ('State', '2021-1-1', '2022-1-1', 3000.00, 4000.00, 0.06);
INSERT INTO tax_bracket_t VALUES ('State', '2021-1-1', '2022-1-1', 4100.00, 5000.00, 0.06);
INSERT INTO tax_bracket_t VALUES ('State', '2021-1-1', '2022-1-1', 5100.00, 6500.00, 0.08);
INSERT INTO tax_bracket_t VALUES ('State', '2021-1-1', '2022-1-1', 6600.00, 8000.00, 0.088);
INSERT INTO tax_bracket_t VALUES ('State', '2021-1-1', '2022-1-1', 8100.00, 11000.00, 0.095);
INSERT INTO tax_bracket_t VALUES ('State', '2021-1-1', '2022-1-1', 11000.00, 16000.00, 0.1);
INSERT INTO tax_bracket_t VALUES ('State', '2021-1-1', '2022-1-1', 16000.00, 22000.00, 0.13);
INSERT INTO tax_bracket_t VALUES ('Federal', '2021-1-1', '2022-1-1', 3000.00, 4000.00, 0.07);
INSERT INTO tax_bracket_t VALUES ('Federal', '2021-1-1', '2022-1-1', 4100.00, 5000.00, 0.075);
INSERT INTO tax_bracket_t VALUES ('Federal', '2021-1-1', '2022-1-1', 5100.00, 6500.00, 0.08);
INSERT INTO tax_bracket_t VALUES ('Federal', '2021-1-1', '2022-1-1', 6600.00, 8000.00, 0.085);
INSERT INTO tax_bracket_t VALUES ('Federal', '2021-1-1', '2022-1-1', 8100.00, 11000.00, 0.098);
INSERT INTO tax_bracket_t VALUES ('Federal', '2021-1-1', '2022-1-1', 11000.00, 16000.00, 0.12);
INSERT INTO tax_bracket_t VALUES ('Federal', '2021-1-1', '2022-1-1', 16000.00, 22000.00, 0.14);

DELETE FROM contribution401k_t;
INSERT INTO contribution401k_t VALUES (1, '2021-1-1', 500, 1, 46000.00);
INSERT INTO contribution401k_t VALUES (2, '2021-1-1', 550, 2, 32000.00);
INSERT INTO contribution401k_t VALUES (3, '2021-1-1', 550, 3, 20000.00);
INSERT INTO contribution401k_t VALUES (4, '2021-1-1', 600, 4, 56000.00);

DELETE FROM insurance_t;
INSERT INTO insurance_t VALUES (1, 'Healthcare insurance', 600, 220, 0.3, 'insurance for health care');
INSERT INTO insurance_t VALUES (2, 'Life insurance', 300, 80, 0.2, 'insurance for accidental death');
INSERT INTO insurance_t VALUES (3, 'Disability insurance', 300, 95, 0.2, 'insurance replace your regular income under a covered illness/injury');


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