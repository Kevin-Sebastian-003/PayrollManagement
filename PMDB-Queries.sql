
INSERT INTO members_t VALUES (NULL, 'John', 'Doe', 1, 'USA', 'Texas', '1990-01-01', 'Male', CURRENT_TIMESTAMP, NULL, NULL);
INSERT INTO members_t VALUES (NULL, 'Jane', 'Smith', 2, 'USA', 'Texas', '1985-05-10', 'Female', CURRENT_TIMESTAMP, NULL, NULL);
INSERT INTO members_t VALUES (NULL, 'Michael', 'Johnson', 3, 'USA', 'Texas', '1995-12-25', 'Male', CURRENT_TIMESTAMP, NULL, NULL);
INSERT INTO members_t VALUES (NULL, 'Emily', 'Davis', 1, 'USA', 'Texas', '1988-09-15', 'Female', CURRENT_TIMESTAMP, NULL, NULL);
INSERT INTO members_t VALUES (NULL, 'Robert', 'Lee', 2, 'USA', 'Texas', '1975-03-20', 'Male', CURRENT_TIMESTAMP, '2022-01-01', NULL);
INSERT INTO members_t VALUES (NULL, 'Sarah', 'Johnson', 3, 'USA', 'Texas', '1982-11-30', 'Female', CURRENT_TIMESTAMP, '2022-03-15', NULL);
INSERT INTO members_t VALUES (NULL, 'William', 'Clark', 1, 'USA', 'Texas', '1998-07-18', 'Male', CURRENT_TIMESTAMP, NULL, NULL);
INSERT INTO members_t VALUES (NULL, 'Amanda', 'Wilson', 2, 'USA', 'Texas', '1992-04-05', 'Female', CURRENT_TIMESTAMP, NULL, NULL);

INSERT INTO member_address_t VALUES (NULL, 1, '100 Pkwy', 'apt 330', 'Austin', '76300', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (NULL, 2, '4354 Helen Dr', NULL, 'Houston', '71300', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (NULL, 3, '828 Chesnut Dr', NULL, 'Miami', '41320', 'Florida', 'USA');

INSERT INTO contact_t VALUES (NULL, 1, 1, 'John_Doe@yahoo.com', NULL, '4793009222', NULL,'linkedin.com/John_Doe', NULL);
INSERT INTO contact_t VALUES (NULL, 2, 2, 'Jane_Smith@gmail.com', NULL, '4528998888', NULL,'linkedin.com/Jane_Smith', NULL);
INSERT INTO contact_t VALUES (NULL, 3, 3, 'Michael_Johnson@hotmail.com', NULL, '9823333400', NULL,'linkedin.com/Michael_Johnson', NULL);

INSERT INTO departments_t VALUES (NULL, 'Accounting Dept', 1, 'Senior Accountant');
INSERT INTO departments_t VALUES (NULL, 'School of Management', 2, 'Assistant Professor');

INSERT INTO employees_t VALUES (1, '2013-2-23', NULL, 5989.65, 1, 1, 2, 43566345, 1);
INSERT INTO employees_t VALUES (2, '2017-6-1', NULL, 4200.00, 0, 0, 0, 79806789, 6);

INSERT INTO role_t VALUES (NULL, 'Faculty', 'Professor', 1, 1);
INSERT INTO role_t VALUES (NULL, 'administation', 'Campus maintenance', 1, 1);

INSERT INTO employee_bank_t VALUES (1, 25, 'Bank of America', 40668902, '11000800');
INSERT INTO employee_bank_t VALUES (2, 3682, 'Wells Fargo', 563678458, '38294884');

INSERT INTO salary_t VALUES (1, '2023-3-1', 5200.00, 450.00, 300.00, 200.00, 162.00, 6150.00, 6088.00);

INSERT INTO budget_allocation_t VALUES (NULL, '2023-3-2', 22, 589700.00, 432000.00, 382300.00, 15);

INSERT INTO deductions_t VALUES (NULL, 'sick leave deduction', 'deduction for taking a sick leave', 100.00);

INSERT INTO allowances_t VALUES (NULL, 'summer class allowance', 'allowance for participating summer semester classes', 500.00);

INSERT INTO attendance_t VALUES (NULL, 22, 24, 26, '2023-1-10');

INSERT INTO ssn_itin_t VALUES (1, '34678009009', '54289882388');

INSERT INTO tax_bracket_t VALUES ('State', '2021-1-1', '2022-1-1', 4000.00, 4600.00, 0.092);

INSERT INTO contribution401k_t VALUES (1, '2021-1-1', 3600, 1, 4600.00);

INSERT INTO insurance_t VALUES (1240, 'Healthcare', 260, 188, 0.3, 'insurance for health care');