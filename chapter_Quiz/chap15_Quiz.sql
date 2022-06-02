SET SERVEROUTPUT ON;

--1. 사원테이블에서커미션이NULL이아닌상태의사원번호와이름, 급여를기준으로오름차순정렬한결과를나타내는저장프로시저를생성하세요.
create or replace procedure emp_commissoin is
    v_emp employee%rowtype;
    cursor c_emp is select eno, ename, salary from employee where commission is not null and commission != 0 order by salary;
BEGIN
    dbms_output.put_line('사원번호 / 이름 / 급여');
    dbms_output.put_line('--------------------');
    for v_emp in c_emp loop
        dbms_output.put_line(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary);
    end loop;
END;

EXECUTE emp_commissoin;

--2. 저장프로시저를수정하여커미션컬럼을하나더출력하고이름을기준로내리차순으로정렬하세요,.
create or replace procedure emp_commissoin is
    v_emp employee%rowtype;
    cursor c_emp is select eno, ename, salary, commission from employee where commission is not null and commission != 0 order by ename desc;
BEGIN
    dbms_output.put_line('사원번호 / 이름 / 급여 / 커미션');
    dbms_output.put_line('--------------------');
    for v_emp in c_emp loop
        dbms_output.put_line(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary||' / '||v_emp.commission);
    end loop;
END;

EXECUTE emp_commissoin;

--3. 생성된저장프로시저를제거하세요.
drop PROCEDURE emp_commissoin;
