SET SERVEROUTPUT ON;

--1. IF문을사용하여KING사원의부서번호를얻어와서부서번호에따른부서명을출력하세요.
DECLARE
    v_dno employee.dno%type;
    v_dn0_check department.dno%type;
    v_dname department.dname%type;
BEGIN
    select dno into v_dno from employee where ename='KING';
    select dno, dname into v_dn0_check, v_dname from department where dno = v_dno;
    if v_dno = v_dn0_check then
        dbms_output.put_line('KING의 부서명 : '||v_dname);
    end if;    
END;

--2. BASICLOOP문으로1부터10사이의자연수의합을구하여출력하세요.
DECLARE
    i NUMBER := 1;
    j NUMBER := 0;
BEGIN
    LOOP
        j := j+i;
        i := i+1;
        if i  > 10 then
            exit;
        end if;    
    END LOOP;
    dbms_output.put_line('1부터 10사이의 자연수의 합'||j);
END;

--3. FORLOOP무으로1부터10사이의자연수의합을구하여출력하세요.
DECLARE
    i NUMBER := 1;
    j NUMBER := 0;
BEGIN
    for i in 1..10 loop
        j := j+i;
    END LOOP;
    dbms_output.put_line('1부터 10사이의 자연수의 합'||j);
END;

--4. WHILELOOP문으로1부터10사이의자연수의합을구하여출력하세요.
DECLARE
    i NUMBER := 1;
    j NUMBER := 0;
BEGIN
    while i < 11 loop
        j := j+i;
        i := i+1;
    END LOOP;
    dbms_output.put_line('1부터 10사이의 자연수의 합'||j);
END;

--5. 사원테이블에서커미션이NULL아닌상태의사원번호, 이름, 급여를이름기준으로오름차순으로정렬한결과를출력하세요.
DECLARE
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_salary employee.salary%type;
    cursor c_emp is select eno, ename, salary from employee where commission is not null and commission != 0 order by ename;
BEGIN
    dbms_output.put_line('사원번호 / 이름 / 급여');
    open c_emp;
        loop
            fetch c_emp into v_eno, v_ename, v_salary;
            if c_emp%notfound then
                exit;
            end if;
            dbms_output.put_line(v_eno||' / '||v_ename||' / '||v_salary);
        end loop;
    close c_emp;
END;

--6. 다음과같은테이블(Student)을만들고데이터를입력한다.(파일참조)
create table Student(
    sid number PRIMARY KEY,
    sname nvarchar2(5) Not null,
    kscore number(3) Check(0 <= kscore and kscore <= 100),
    escore number(3) Check(0 <= escore and escore <= 100),
    mscore number(3) Check(0 <= mscore and mscore <= 100));
    
--학번은시퀀스(seq_stu_id)로저장한다.
create SEQUENCE seq_stu_id start WITH 1 INCREMENT BY 1;
insert into student values(seq_stu_id.nextval, '고길동', 78, 64, 82);
insert INTO student values(seq_stu_id.nextval, '김길동', 85, 71, 64);
insert INTO student values(seq_stu_id.nextval, '이길동', 74, 69, 57);
insert INTO student values(seq_stu_id.nextval, '박길동', 74, 77, 95);
insert INTO student values(seq_stu_id.nextval, '홍길동', 68, 95, 84);
commit;

--학생별총점과평균을구하세요.
DECLARE
    v_sname student.sname%type;
    v_kscore student.kscore%type;
    v_escore student.escore%type;
    v_mscore student.mscore%type;
    cursor c_stu is select sname, kscore, escore, mscore from student;
BEGIN
    dbms_output.put_line('이름 / 국어 / 영어 / 수학 / 합계 / 평균');
    open c_stu;
        loop
            fetch c_stu into v_sname, v_kscore, v_escore, v_mscore;
            if c_stu%notfound then
                exit;
            end if;
            dbms_output.put_line(v_sname||' / '||v_kscore||' / '||v_escore||' / '||v_mscore||' / '||(v_kscore+v_escore+v_mscore)||' / '||((v_kscore+v_escore+v_mscore)/3));
        end loop;
    close c_stu;
END;

--과목별총점과평균을구하세요.
DECLARE
    v_kscore student.kscore%type;
    v_escore student.escore%type;
    v_mscore student.mscore%type;
BEGIN
    select sum(kscore), sum(escore), sum(mscore) into v_kscore, v_escore, v_mscore from student;
    dbms_output.put_line('과목 / 총점 / 평균');
    dbms_output.put_line('국어 / '||v_kscore||' / '||v_kscore/5);
    dbms_output.put_line('영어 / '||v_escore||' / '||v_escore/5);
    dbms_output.put_line('수학 / '||v_mscore||' / '||v_mscore/5);
END;