--1. Employee테이블의구조만복사하여EMP_INSERT란빈테이블을만드세요.
create table EMP_INSERT as select * from employee WHERE 0=1;

--2. 본인을EMP_INSERT테이블에추가하되SYSDATE를이용해서입사일을오늘로입력하세요
insert into EMP_INSERT values(9000, 'Mr.Yoo', 'Designer', 7698, sysdate, 3600, 200, 30);

--3. EMP_INSERT 테이블에옆사람을추가하되TO_DATE함수를사용해서입사일을어제로입력하세요
insert into EMP_INSERT values(9001, 'Mr.Choi', 'SALESMAN', 7698, TO_DATE('2022/05/25'), 3800, 500, 30);

--4. Employee테이블의구조와내용을복사하여EMP_COPY란이름의테이블을만드세요.
create table EMP_COPY as select * from employee;

--5. 사원번호가7788인사원의부서번호를10으로수정하세요.
update emp_copy SET dno = 10 where eno = 7788;

--6. 사원번호가7788의담당업무및급여를사원번호7499의담당업무및급여와일치하도록갱신하세요.
update emp_copy SET job = (select job from emp_copy where eno = 7499), salary = (select salary from emp_copy where eno = 7499) where eno = 7788;

--7. 사원번호7369와업무가동일한모든사원의부서번호를사원7369의현재부서번호로갱신하세요.
update emp_copy set dno = (select dno from emp_copy where eno = 7369) where job = (select job from emp_copy where eno = 7369);

--8. Department테이블의구조와내용을복사하여DEPT_COPY란이름의테이블을만드세요
create table DEPT_COPY as select * from Department;

--9. DEPT_COPY테이블에서부서명이RESEARCH인부서를제거하세요.
delete from DEPT_COPY where dname = 'RESEARCH';

--10. DEPT_COPY테이블에서부서번호가10이거나40인부서를제거하세요.
delete from DEPT_COPY where dno = 10 or dno = 40;