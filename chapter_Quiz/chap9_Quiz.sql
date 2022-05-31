--1. 다음표에명시된대로DEPT 테이블을생성하세요(파일참조)
create table DEPT(
    dno NUMBER(2),
    dname VARCHAR2(14),
    LOC VARCHAR2(13));

--2. 다음표에명시된대로EMP 테이블을생성하세요.(파일참조)
create table EMP(
    eno NUMBER(4),
    ename VARCHAR2(10),
    dno NUMBER(2));

--3. 긴이름을저장할수있도록EMP테이블을수정하세요.(ENAME칼럼)(파일참조)
alter table EMP modify ename varchar2(25);

--4. EMPLOYEE테이블을복사해서EMPLOYEE2란이름의테이블을생성하되사원번호, 이름, 급여, 부서번호칼럼만복사하고새로생성된칼럼명을각각EMP_ID, NAME, SAL, DEPT_ID로지정하세요,
create table EMPLOYEE2 as select eno EMP_ID, ename NAME, salary SAL, dno DEPT_ID from EMPLOYEE;
create table EMPLOYEE2(EMP_ID, NAME, SAL, DEPT_ID) as select eno, ename, salary, dno from EMPLOYEE;

--5. EMP 테이블을삭제하세요
drop table EMP;

--6. EMPLOYEE2테이블의이름을EMP로변경하세요
rename EMPLOYEE2 to EMP;

--7. DEPT 테이블에서DNAME 칼럼을제거하세요
alter table DEPT drop column DNAME;

--8. DEPT 테이블에서LOC칼럼을UNUSED로표시하세요.
alter table DEPT set UNUSED(LOC);

--9. UNUSED 칼럼을모두제거하세요
alter table DEPT drop unused COLUMNS;