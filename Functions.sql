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
    select concat_ws("\n",address_line_1,address_line_1,city,zipcode,state,country) into address from member_address_t where address_id=address_id_in;
    RETURN address;
END~
delimiter ;