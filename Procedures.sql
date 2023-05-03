/*
write 2 stored procedures.... 
1-calculate total salary from salary breakdown table
2-calculate budget remaining using data provided
3-provide tax on amount in salary_breakdown table by deducting deductions and adding allowances based on the tax bracket table
4-encrypt values and return the encrypted form for storing ssn itin
*/
#salary calculator procedure
DROP PROCEDURE IF EXISTS get_salary;
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
    SELECT * FROM salary_breakdown_t sbt 
    where sbt.salary_id=(select salary_id from salary_t s 
						where s.employee_id=employee_id 
                        and month(s.salary_month)=month(salary_date) 
                        and year(s.salary_month)=year(salary_date));
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
    select (basicpay + hourlypay + overtimepay + allowance1 + allowance2 + allowance3 - deduction1 - deduction2 - deduction3
			-insurance) into salary_total;
END~
delimiter ;

#tax calculator procedure
DROP PROCEDURE IF EXISTS get_tax;
delimiter ~
CREATE PROCEDURE get_tax (IN employee_id int, IN salary_date date, OUT tax_total decimal(13,2))
BEGIN
    DECLARE percentstate decimal(13,2);
	DECLARE percentfederal decimal(13,2);
    DECLARE salary_total decimal(13,2);
    DECLARE income_tax_percentage decimal(13,2);
    select salary_amount into salary_total from salary_t s where s.employee_id=employee_id and month(s.salary_month)=month(salary_date) and year(s.salary_month)=year(salary_date);
    select income_tax_percentage into percentstate from tax_bracket_t where salary_date between (start_year, end_year) and salary_total between (income_range_start, income_range_end) and tax_type="STATE";
	select income_tax_percentage into percentfederal from tax_bracket_t where salary_date between (start_year, end_year) and salary_total between (income_range_start, income_range_end) and tax_type="FEDERAL";
    select (@salary_total*percentstate+salary_total*percentfederal) into tax_total;
END~
delimiter ;