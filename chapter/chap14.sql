--SET SERVEROUTPUT ON : 출력하기 위한 환경변수(워크시트당 한 번만 실행됨)
SET SERVEROUTPUT ON;

--선언부, 실행부, 예외처리부의 구조를 가진다. 

--DECLARE : 선언부
DECLARE
    name_01 varchar2(10):= '유명선'; --선언방식 : 이름 타입 := 데이터; / 타입 : 1. 스칼라(기존의 SQL에서 사용하던 데이터 타입)
    name_02 employee.ename%type := '유명선'; --2. 레퍼런스(이미 다른 테이블의 컬럼에서 사용하는 타입을 참조한 타입)
    eno_01 CONSTANT employee.eno%type; --상수는 변수명 뒤에 CONSTANT을 붙인다.
    eno_02 employee.eno%type NOT NULL := 0; --초기값을 반드시 지정해야 한다면 타입명 뒤에 NOT NULL을 붙인다.
    
--BEGIN : 실행부
BEGIN
    dbms_output.put_line('Hello world'); --기본 출력문
    eno := 7788;
    name_02 := 'SCOTT';
    dbms_output.put_line('사원번호 : '||eno||' / 사원이름 : '||name_02);
END;

--select문을 사용하여 변수값을 할당하는 방법
DECLARE
    v_eno employee.eno%type;
    v_ename employee.ename%type;
BEGIN
    select eno, ename into v_eno, v_ename from employee where eno=7788; --into로 바인딩
    dbms_output.put_line('사원번호 : '||v_eno||' / 사원이름 : '||v_ename);
END;

--조건문(SCOTT사원의 연봉을 계산하라)
DECLARE
    v_salary employee.salary%type;
    v_commission employee.commission%type;
    v_y_sal number := 0;
BEGIN
    select salary, commission into v_salary, v_commission from employee where ename='SCOTT';
    
    if v_commission is null then --커미션이 없다면
        v_y_sal := v_salary * 12;
    elsif v_commission is not null then --커미션이 있다면
        v_y_sal := (v_salary * 12) + v_commission;
    end if;    
    
    dbms_output.put_line('SCOTT 사원의 연봉 : '||v_y_sal);
END;

--반복문(기본 루프문 : 구구단 5단 출력)
DECLARE
    dan NUMBER := 5;
    i NUMBER := 1;
BEGIN
    dbms_output.put_line('구구단 5단');
    LOOP
        dbms_output.put_line(dan||' x '||i||' = '||(dan*i));
        i := i+1;
        if i  > 9 then --if문으로 조건을 만들어 탈출한다.
            exit;
        end if;    
    END LOOP;
END;

--반복문(for 루프문 : 구구단 3단 출력)
DECLARE
    dan NUMBER := 3;
    i NUMBER := 1;
BEGIN
    dbms_output.put_line('구구단 3단');
    for i in 1..9 loop
        dbms_output.put_line(dan||' x '||i||' = '||(dan*i));
    END LOOP;
END;

--반복문(while 루프문 : 구구단 9단 출력)
DECLARE
    dan NUMBER := 9;
    i NUMBER := 1;
BEGIN
    dbms_output.put_line('구구단 9단');
    while i < 10 loop
        dbms_output.put_line(dan||' x '||i||' = '||(dan*i));
        i := i+1;
    END LOOP;
END;

--CURSOR : 커서(조회 결과가 여러 레코드일 경우 사용 / 전체 사원번호, 사원이름, 급여, 부서번호를 출력)
DECLARE
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_salary employee.salary%type;
    v_dno employee.dno%type;
    cursor c_emp is select eno, ename, salary, dno from employee;
BEGIN
    dbms_output.put_line('사원번호 / 이름 / 급여 / 부서번호');
    dbms_output.put_line('------------------------------');
    open c_emp;
        loop
            fetch c_emp into v_eno, v_ename, v_salary, v_dno;
            dbms_output.put_line(v_eno||' / '||v_ename||' / '||v_salary||' / '||v_dno);
            if c_emp%notfound then
                exit;
            end if;
        end loop;  
    close c_emp;
END;

--ROWTYPE 사용법 / 전체 사원번호, 사원이름, 급여, 부서번호를 출력)
DECLARE
    v_emp employee%rowtype;
    cursor c_emp is select eno, ename, salary, dno from employee;
BEGIN
    dbms_output.put_line('사원번호 / 이름 / 급여 / 부서번호');
    dbms_output.put_line('------------------------------');
    open c_emp;
        loop
            fetch c_emp into v_emp.eno, v_emp.ename, v_emp.salary, v_emp.dno;
            if c_emp%notfound then
                exit;
            end if;
            dbms_output.put_line(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary||' / '||v_emp.dno);
        end loop;  
    close c_emp;
END;

--for 반복문과 ROWTYPE 이용한 cursor 처리
DECLARE
    v_emp employee%rowtype;
    cursor c_emp is select eno, ename, salary, dno from employee;
BEGIN
    dbms_output.put_line('사원번호 / 이름 / 급여 / 부서번호');
    dbms_output.put_line('------------------------------');
    for v_emp in c_emp loop
        dbms_output.put_line(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary||' / '||v_emp.dno);
    end loop;
END;