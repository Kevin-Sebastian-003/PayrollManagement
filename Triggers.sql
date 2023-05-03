/*
write 3 triggers
1-update current address in contact table when the address is added into address table
2-increase employee count in budget_allocation_t when employee is added into employees_t
3-check if every salary record added is for a paid employee - after update
4-check if every paid employee with termination date null, has monthly salary record for current month
5-before delete add record to audit table
add insert and delete
*/
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
  UPDATE employees_t e SET e.end_date=NEW.date_leaving WHERE e.employee_id=NEW.member_id;
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
/*create trigger that updates the contact_t with the new address_id*/