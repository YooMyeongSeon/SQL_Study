SET SERVEROUTPUT ON;

--1. ������̺���Ŀ�̼���NULL�̾ƴѻ����ǻ����ȣ���̸�, �޿����������ο������������Ѱ������Ÿ�����������ν����������ϼ���.
create or replace procedure emp_commissoin is
    v_emp employee%rowtype;
    cursor c_emp is select eno, ename, salary from employee where commission is not null and commission != 0 order by salary;
BEGIN
    dbms_output.put_line('�����ȣ / �̸� / �޿�');
    dbms_output.put_line('--------------------');
    for v_emp in c_emp loop
        dbms_output.put_line(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary);
    end loop;
END;

EXECUTE emp_commissoin;

--2. �������ν����������Ͽ�Ŀ�̼��÷����ϳ�������ϰ��̸������طγ����������������ϼ���,.
create or replace procedure emp_commissoin is
    v_emp employee%rowtype;
    cursor c_emp is select eno, ename, salary, commission from employee where commission is not null and commission != 0 order by ename desc;
BEGIN
    dbms_output.put_line('�����ȣ / �̸� / �޿� / Ŀ�̼�');
    dbms_output.put_line('--------------------');
    for v_emp in c_emp loop
        dbms_output.put_line(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary||' / '||v_emp.commission);
    end loop;
END;

EXECUTE emp_commissoin;

--3. �������������ν����������ϼ���.
drop PROCEDURE emp_commissoin;
