
call get_salary(1,'2023-05-1',@total);
select @total;
select * from employees_t;

select get_address(1);

select get_remaining_budget('Accounting Dept','2023-3-1');

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
delete from employees_t where employee_id=1;
select * from employees_audit_t;

select * from members_t;
select * from employees_t;
update members_t set date_leaving=curdate() where member_id=2;


select @tax_final;
call get_tax(1,'2023-05-01',@tax_final);
