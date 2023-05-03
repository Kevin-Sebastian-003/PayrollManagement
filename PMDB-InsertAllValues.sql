SET FOREIGN_KEY_CHECKS=0;
# for insert allowances add a default allowance value of 0
INSERT INTO members_t VALUES (DEFAULT, 'John', 'Doe', 1, 'USA', 'Texas', '1990-01-01', 'Male', '2020-01-01', NULL, 1, 1);
INSERT INTO members_t VALUES (DEFAULT, 'Jane', 'Doe', 2, 'USA', 'Texas', '1995-02-14', 'Female', '2021-03-15', NULL, 2, 1);
INSERT INTO members_t VALUES (DEFAULT, 'Mike', 'Smith', 3, 'USA', 'Texas', '1988-11-20', 'Male', '2019-05-02', '2022-01-01', 3, 1);
INSERT INTO members_t VALUES (DEFAULT, 'Susan', 'Johnson', 1, 'Mexico', 'DA', '1993-06-30', 'Female', '2018-08-15', '2022-03-01', 4, 2);
INSERT INTO members_t VALUES (DEFAULT, 'David', 'Brown', 4, 'USA', 'Texas', '1991-03-05', 'Male', '2017-10-01', '2022-05-01', 5, 3);
INSERT INTO members_t VALUES (DEFAULT, 'Emily', 'Garcia', 2, 'USA', 'Texas', '1996-07-12', 'Female', '2020-02-14', NULL, 6 ,1);
INSERT INTO members_t VALUES (DEFAULT, 'Daniel', 'Wilson', 3, 'USA', 'Texas', '1992-09-17', 'Male', '2016-11-30', '2023-02-01', 7, 1);
INSERT INTO members_t VALUES (DEFAULT, 'Megan', 'Taylor', 1, 'USA', 'Texas', '1989-05-21', 'Female', '2015-07-01', '2022-08-01', 8, 1);
INSERT INTO members_t VALUES (DEFAULT, 'Brandon', 'Davis', 4, 'USA', 'Texas', '1994-12-10', 'Male', '2021-04-23', NULL, 9, 1);
INSERT INTO members_t VALUES (DEFAULT, 'Rachel', 'Martinez', 2, 'USA', 'Texas', '1997-08-25', 'Female', '2022-01-15', NULL, 10,1);
INSERT INTO members_t VALUES (DEFAULT, 'Joshua', 'Clark', 3, 'USA', 'Texas', '1991-01-11', 'Male', '2020-03-01', '2023-04-01', 11,1);
INSERT INTO members_t VALUES (DEFAULT, 'Olivia', 'Hernandez', 1, 'USA', 'Texas', '1996-04-20', 'Female', '2019-06-15', '2022-09-01', 12,1);
INSERT INTO members_t VALUES (DEFAULT, 'Christopher', 'Nelson', 4, 'USA', 'Texas', '1993-03-17', 'Male', '2018-12-01', '2023-01-01', 13,3);
INSERT INTO members_t VALUES (DEFAULT, 'Jessica', 'Gonzalez', 2, 'USA', 'Texas', '1990-11-05', 'Female', '2017-02-14', '2022-06-01', 14,4);
INSERT INTO members_t VALUES (DEFAULT, 'Nicholas', 'Lee', 3, 'USA', 'Texas', '1989-07-28', 'Male', '2016-09-01', '2023-03-01', 15,7);
INSERT INTO members_t VALUES (DEFAULT, 'Amanda', 'Allen', 1, 'USA', 'Texas', '1995-10-15', 'Female', '2020-05-01', NULL, 16,7);
INSERT INTO members_t VALUES (DEFAULT, 'Kevin', 'Comet', 4, 'USA', 'Texas', '1992-02-19', 'Male', '2015-04-01', '2022-04-01', 17,7);
INSERT INTO members_t VALUES (DEFAULT, 'Samantha', 'Scott', 2, 'USA', 'Texas', '1997-01-30', 'Female', '2022-03-01', NULL, 18,6);
INSERT INTO members_t VALUES (DEFAULT, 'Andrew', 'Wright', 3, 'USA', 'Texas', '1993-09-02', 'Male', '2019-12-01', '2022-11-01', 19,6);
INSERT INTO members_t VALUES (DEFAULT, 'Jack', 'Baker', 1, 'USA', 'Texas', '1996-06-08', 'Female', '2018-04-15', '2022-07-01', 20, 1);/*
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
*/


INSERT INTO member_address_t VALUES (DEFAULT, 1, '7600 OSBUN ST', NULL, 'FORT WORTH', '76116', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 2, '2001 COLLINS AVE', NULL, 'ABILENE', '79603', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 3, '9600 COUNTY ROAD 179', NULL, 'BEDIAS', '77831', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 5, '600 COUNTY ROAD', NULL, 'CROCKETT', '75835', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 6, '424 W FORK DR', NULL, 'ARLINGTON', '76012', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 7, '611 W 22ND ST', NULL, 'HOUSTON', '77008', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 8, '10300 KELBURN DR', NULL, 'HOUSTON', '77016', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 9, '14902 PRESTON RD', NULL, 'DALLAS', '75254', 'Texas', 'USA');
INSERT INTO member_address_t VALUES (DEFAULT, 10, '1100 E FANNIN ST', NULL, 'BEEVILLE', '78102', 'Texas', 'USA');


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


INSERT INTO departments_t VALUES (1, 'Accounting Dept', 1, 'Senior Accountant');
INSERT INTO departments_t VALUES (2, 'School of Management', 2, 'Assistant Professor');
INSERT INTO departments_t VALUES (3, 'School of Engineering', 3, 'Clinical Professor');
INSERT INTO departments_t VALUES (4, 'School of Art', 4, 'Assistant Professor');
INSERT INTO departments_t VALUES (5, 'School of Social Science', 5, 'TA');
INSERT INTO departments_t VALUES (6, 'School of Management', 6, 'Clinical Professor');
INSERT INTO departments_t VALUES (7, 'School of Management', 7, 'Academic Advisor');
INSERT INTO departments_t VALUES (8, 'Career Center', 8, 'Associate Director');
INSERT INTO departments_t VALUES (9, 'School of Art', 9, 'Professor');
INSERT INTO departments_t VALUES (10, 'IT Center', 10, 'Director');


INSERT INTO employees_t VALUES (1, '2013-2-23', NULL, 5989.00, 1, 1, 2, 1);
INSERT INTO employees_t VALUES (2, '2017-6-1', NULL, 7200.00, 1, 0, 0, 2);
INSERT INTO employees_t VALUES (3, '2010-6-30', NULL, 7600.00, 1, 0, 1, 3);
INSERT INTO employees_t VALUES (4, '2005-4-15', NULL, 6200.00, 1, 0, 2, 4);
INSERT INTO employees_t VALUES (5, '1998-7-13', NULL, 6780.00, 1, 0, 3, 5);
INSERT INTO employees_t VALUES (6, '1999-8-31', NULL, 7200.00, 1, 0, 2, 6);
INSERT INTO employees_t VALUES (7, '2004-3-21', NULL, 6700.00, 1, 0, 1, 7);
INSERT INTO employees_t VALUES (8, '2008-10-17', NULL, 7800.00, 1, 0, 1, 8);
INSERT INTO employees_t VALUES (9, '2017-8-13', NULL, 10200.00, 1, 0, 0, 9);
INSERT INTO employees_t VALUES (10, '2018-6-16', NULL, 4450.00, 0, 0, 0, 10);


INSERT INTO role_t VALUES (DEFAULT, 'administation', 'Senior Accountant', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Faculty', 'Assistant Professor', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Faculty', 'Clinical Professor', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Faculty', 'Assistant Professor', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Faculty', 'Associate Professor', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Student', 'TA', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Faculty', 'Academic Advisor', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'administation', 'Associate Director', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Faculty', 'Professor', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'administation', 'Director', 1, 1);
INSERT INTO role_t VALUES (DEFAULT, 'Student', 'TA', 0, 1);


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


INSERT INTO salary_t VALUES (1, 1, '2023-5-1', 5989.00);
INSERT INTO salary_t VALUES (2, 2, '2023-5-1', 7200.00);
INSERT INTO salary_t VALUES (3, 3, '2023-5-1', 7600.00);
INSERT INTO salary_t VALUES (4, 4, '2023-5-1', 6200.00);
INSERT INTO salary_t VALUES (5, 5, '2023-5-1', 6780.00);
INSERT INTO salary_t VALUES (6, 6, '2023-5-1', 7200.00);
INSERT INTO salary_t VALUES (7, 7, '2023-5-1', 6700.00);
INSERT INTO salary_t VALUES (8, 8, '2023-5-1', 7800.00);
INSERT INTO salary_t VALUES (9, 9, '2023-5-1', 10200.00);
INSERT INTO salary_t VALUES (10, 10, '2023-5-1', 4450.00);


INSERT INTO salary_breakdown_t VALUES (1, 1, 5989.00, 5500.00, 489.00, 0.00, 20.00, 1, 1, 2, 3, 1, 2, 3, 0.08, 479.12);
INSERT INTO salary_breakdown_t VALUES (2, 2, 6000.00, 5500.00, 500.00, 0.00, 20.00, 2, 4, 5, 6, 4, 5, 6, 0.08, 480.00);
INSERT INTO salary_breakdown_t VALUES (3, 3, 6000.00, 5500.00, 500.00, 0.00, 20.00, 3, 7, 8, 9, 7, 8, 9, 0.08, 480.00);
INSERT INTO salary_breakdown_t VALUES (4, 4, 6000.00, 5500.00, 500.00, 0.00, 20.00, 4, 10, 11, 12, 10, 11, 12, 0.08, 480.00);
INSERT INTO salary_breakdown_t VALUES (5, 5, 6000.00, 5500.00, 500.00, 0.00, 20.00, 5, 13, 14, 15, 13, 14, 15, 0.08, 480.00);


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


INSERT INTO deductions_t VALUES (1, 'sick leave deduction', 'deduction for taking a sick leave', 100.00);
INSERT INTO deductions_t VALUES (2, 'Parental Leave deduction', 'deduction for taking a Parental leave', 320.00);
INSERT INTO deductions_t VALUES (3, 'Paternity leave deduction', 'deduction for taking a Paternity leave', 100.00);
INSERT INTO deductions_t VALUES (4, 'Annual  leave deduction', 'deduction for taking a Annual leave', 140.00);


INSERT INTO allowances_t VALUES (1, 'summer class allowance', 'allowance for participating summer semester classes', 500.00);
INSERT INTO allowances_t VALUES (2, 'Transport allowance', 'allowance for monthly trasportation', 300.00);
INSERT INTO allowances_t VALUES (3, 'Travel allowance', 'allowance for traveling', 540.00);
INSERT INTO allowances_t VALUES (4, 'Housing allowance', 'allowance for house rent', 600.00);
INSERT INTO allowances_t VALUES (5, 'Medical allowance', 'allowance for the cost of medical care, private healthcare, and other related expenses', 500.00);

INSERT INTO attendance_t VALUES (DEFAULT, 1, 22, 1, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 2, 22, 1, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 3, 22, 5, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 4, 21, 2, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 5, 22, 1, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 6, 22, 1, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 7, 22, 6, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 8, 20, 7, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 9, 22, 8, 22, '2023-1-30');
INSERT INTO attendance_t VALUES (DEFAULT, 10, 22, 2, 22, '2023-1-30');

INSERT INTO ssn_itin_t VALUES (1, '449-467-2654', '958-78-3652');
INSERT INTO ssn_itin_t VALUES (2, '433-439-2634', '934-78-5654');
INSERT INTO ssn_itin_t VALUES (3, '449-467-3546', '958-76-4543');
INSERT INTO ssn_itin_t VALUES (4, '440-448-4867', '958-75-5462');
INSERT INTO ssn_itin_t VALUES (5, '449-467-6354', '958-75-4563');
INSERT INTO ssn_itin_t VALUES (6, '449-467-8452', '988-74-1245');
INSERT INTO ssn_itin_t VALUES (7, '521-524-5674', '968-78-7845');
INSERT INTO ssn_itin_t VALUES (8, '449-467-1254', '957-77-4528');
INSERT INTO ssn_itin_t VALUES (9, '449-467-6587', '958-79-3655');
INSERT INTO ssn_itin_t VALUES (10, NULL, NULL);/*
INSERT INTO ssn_itin_t VALUES (10, '531-539-9874', '957-72-4785');
INSERT INTO ssn_itin_t VALUES (11, NULL, NULL);*/

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

INSERT INTO contribution401k_t VALUES (1, '2021-1-1', 500, 1, 46000.00);
INSERT INTO contribution401k_t VALUES (2, '2021-1-1', 550, 2, 32000.00);
INSERT INTO contribution401k_t VALUES (3, '2021-1-1', 550, 3, 20000.00);
INSERT INTO contribution401k_t VALUES (4, '2021-1-1', 600, 4, 56000.00);


INSERT INTO insurance_t VALUES (1, 'Healthcare insurance', 600, 220, 0.3, 'insurance for health care');
INSERT INTO insurance_t VALUES (2, 'Life insurance', 300, 80, 0.2, 'insurance for accidental death');
INSERT INTO insurance_t VALUES (3, 'Disability insurance', 300, 95, 0.2, 'insurance replace your regular income under a covered illness/injury');
