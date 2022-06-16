--���ν��� ����
create or REPLACE PROCEDURE emp_info is

--���ν��� ���� �ۼ�
    v_emp employee%rowtype;
    cursor c_emp is select eno, ename, salary, dno from employee;
BEGIN
    dbms_output.put_line('�����ȣ / �̸� / �޿� / �μ���ȣ');
    dbms_output.put_line('------------------------------');
    for v_emp in c_emp loop
        dbms_output.put_line(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary||' / '||v_emp.dno);
    end loop;
END;

--���ν��� ����
EXECUTE emp_info;

--���ν����� ������ �����(Ư�� ����� �̸����� �޿� ��ȸ)
create or REPLACE PROCEDURE emp_salary(v_ename in employee.ename%type) is --�ŰԺ����� in, out, inout�� ������ ������ �� �ִ�.
    v_emp employee%rowtype;
    BEGIN
        dbms_output.put_line('�����ȣ / �̸� / �޿� / �μ���ȣ');
        dbms_output.put_line('------------------------------');
        select eno, ename, salary, dno into v_emp.eno, v_emp.ename, v_emp.salary, v_emp.dno from employee where ename = v_ename;
        dbms_output.put_line(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary||' / '||v_emp.dno);
    END;
    
EXECUTE emp_salary('SCOTT');
EXECUTE emp_salary('SMITH');

--���� : ��� ������ �޾Ƽ� �޿� ���
create or replace procedure emp_sal_name(v_ename in employee.ename%type,
                                         v_salary out employee.salary%type) is
    begin
        select salary into v_salary from employee where ename = v_ename;
    end;
    
VARIABLE v_sal number; --��������(�� ������ ����)
execute emp_sal_name('SCOTT', :v_sal);
print v_sal; --���

--���ν��� ��ȸ
select * from user_source;

--���ν��� ����
drop PROCEDURE emp_info;

--------------------------------------------------------------------------------

--�Լ� : ��ȯ���� �����Ѵ�.
create or REPLACE function emp_sal_name_func(v_ename in employee.ename%type) return number is
    v_salary employee.salary%type;
BEGIN
    select salary into v_salary from employee where ename = v_ename;
    return v_salary;
END;

VARIABLE v_sal_02 number;
execute :v_sal_02 := emp_sal_name_func('SMITH');
print v_sal_02;

--�Լ� ��뿹��
select emp_sal_name_func('SMITH') ���̽��޿�  from dual;
select ename, emp_sal_name_func(ename) �޿� from employee;

--�Լ� ��ȸ
select * from user_source;

--���ν��� ����
drop function emp_sal_name_func;

--------------------------------------------------------------------------------

--Ʈ���� : ��� ���ǿ� ���Ͽ� �ڵ����� ���۵Ǵ� ���ν���

--Ʈ���� ����(������ ���̺� ������ ���Խ� �ڵ����� ī�� ���̺��� �����Ͱ� ���� �ǵ��� Ʈ���Ÿ� �����Ѵ�.
create or replace trigger tri_emp_insert
    after insert on emp_origin for each row --emp_origin ���̺� �μ�Ʈ�� �ߵ��� ����(after)�� Ʈ���Ÿ� �����Ű�� ����(for each row : ����࿡ ����)
begin
    if inserting then
        dbms_output.put_line('INSERT TRIGGER �߻�');
        insert into emp_copy values(:new.eno, :new.ename, :new.job, :new.manager, :new.hiredate, :new.salary, :new.commission, :new.dno);
    end if;
end;

--Ʈ���� �ߵ����� ����
insert into emp_origin values(3000, 'Kim', 'MANAGER', null, sysdate, 1500, 300, 10);

--��� ��ȸ
select * from emp_origin;
select * from emp_copy;

--������ ���̺��� ������ �����͸� ī�� ���̺�� �ű��.
create or replace trigger tri_emp_sample
    after update or delete on emp_origin for each row    
declare
    v_modtype NCHAR(2);
begin
    if updating then
        v_modtype := '����';
    elsif deleting then
        v_modtype := '����';
    end if;
    insert into emp_copy values(:old.eno, :old.ename, :old.job, :old.manager, :old.hiredate, :old.salary, :old.commission, :old.dno, v_modtype);
end;

--Ʈ���� �ߵ����� ����
update emp_origin set ename = 'hong', job = 'SALESMAN', salary = 2000, dno = 30 where eno = 3000;

--��� ��ȸ
select * from emp_origin;
select * from emp_copy;