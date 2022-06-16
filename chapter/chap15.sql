--프로시저 생성
create or REPLACE PROCEDURE emp_info is

--프로시저 내용 작성
    v_emp employee%rowtype;
    cursor c_emp is select eno, ename, salary, dno from employee;
BEGIN
    dbms_output.put_line('사원번호 / 이름 / 급여 / 부서번호');
    dbms_output.put_line('------------------------------');
    for v_emp in c_emp loop
        dbms_output.put_line(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary||' / '||v_emp.dno);
    end loop;
END;

--프로시저 실행
EXECUTE emp_info;

--프로시저내 데이터 입출력(특정 사원의 이름으로 급여 조회)
create or REPLACE PROCEDURE emp_salary(v_ename in employee.ename%type) is --매게변수는 in, out, inout등 범위를 지정할 수 있다.
    v_emp employee%rowtype;
    BEGIN
        dbms_output.put_line('사원번호 / 이름 / 급여 / 부서번호');
        dbms_output.put_line('------------------------------');
        select eno, ename, salary, dno into v_emp.eno, v_emp.ename, v_emp.salary, v_emp.dno from employee where ename = v_ename;
        dbms_output.put_line(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary||' / '||v_emp.dno);
    END;
    
EXECUTE emp_salary('SCOTT');
EXECUTE emp_salary('SMITH');

--예제 : 사원 정보를 받아서 급여 출력
create or replace procedure emp_sal_name(v_ename in employee.ename%type,
                                         v_salary out employee.salary%type) is
    begin
        select salary into v_salary from employee where ename = v_ename;
    end;
    
VARIABLE v_sal number; --변수선언(잘 사용되지 않음)
execute emp_sal_name('SCOTT', :v_sal);
print v_sal; --출력

--프로시저 조회
select * from user_source;

--프로시저 삭제
drop PROCEDURE emp_info;

--------------------------------------------------------------------------------

--함수 : 반환값이 존재한다.
create or REPLACE function emp_sal_name_func(v_ename in employee.ename%type) return number is
    v_salary employee.salary%type;
BEGIN
    select salary into v_salary from employee where ename = v_ename;
    return v_salary;
END;

VARIABLE v_sal_02 number;
execute :v_sal_02 := emp_sal_name_func('SMITH');
print v_sal_02;

--함수 사용예제
select emp_sal_name_func('SMITH') 스미스급여  from dual;
select ename, emp_sal_name_func(ename) 급여 from employee;

--함수 조회
select * from user_source;

--프로시저 삭제
drop function emp_sal_name_func;

--------------------------------------------------------------------------------

--트리거 : 어떠한 조건에 의하여 자동으로 시작되는 프로시저

--트리거 생성(오리진 테이블에 데이터 삽입시 자동으로 카피 테이블에도 데이터가 삽입 되도록 트리거를 구성한다.
create or replace trigger tri_emp_insert
    after insert on emp_origin for each row --emp_origin 테이블에 인서트가 발동된 이후(after)에 트리거를 실행시키는 조건(for each row : 모든행에 적용)
begin
    if inserting then
        dbms_output.put_line('INSERT TRIGGER 발생');
        insert into emp_copy values(:new.eno, :new.ename, :new.job, :new.manager, :new.hiredate, :new.salary, :new.commission, :new.dno);
    end if;
end;

--트리거 발동조건 실행
insert into emp_origin values(3000, 'Kim', 'MANAGER', null, sysdate, 1500, 300, 10);

--결과 조회
select * from emp_origin;
select * from emp_copy;

--오리진 테이블에서 삭제된 데이터를 카피 테이블로 옮긴다.
create or replace trigger tri_emp_sample
    after update or delete on emp_origin for each row    
declare
    v_modtype NCHAR(2);
begin
    if updating then
        v_modtype := '수정';
    elsif deleting then
        v_modtype := '삭제';
    end if;
    insert into emp_copy values(:old.eno, :old.ename, :old.job, :old.manager, :old.hiredate, :old.salary, :old.commission, :old.dno, v_modtype);
end;

--트리거 발동조건 실행
update emp_origin set ename = 'hong', job = 'SALESMAN', salary = 2000, dno = 30 where eno = 3000;

--결과 조회
select * from emp_origin;
select * from emp_copy;