--1. Employee테이블의구조를복사하여EMP_SAMPLE란이름의테이블을만드세요 사원테이블의사원번호칼럼에테이블레벨로primarykey제약조건을지정하되제약조건이름은my_emp_pk로지정하세요.
create table EMP_SAMPLE as select * from Employee where 1=0;
alter table EMP_SAMPLE add CONSTRAINT my_emp_pk primary key(eno);

--2. department테이블의구조를복사하여dept_sample이란테이블을만드세요. dept_sample의부서번호칼럼에테이블레벨로primarykey제약조건을지정하되제약조건이름은my_dept_pk로지정하세요.
create table dept_sample as select * from department where 1=0;
alter table dept_sample add CONSTRAINT my_dept_pk primary key(dno);

--3.사원테이블의부서번호칼럼에존재하지않는부서의사원이배정되지않도록외래키제약조건을지정하되제약조건이름은my_emp_dept_fk로지정하세요.
alter table EMP_SAMPLE add CONSTRAINT my_emp_dept_fk FOREIGN key(dno) references dept_sample(dno);

--4. 사원테이블의커미션컬럼에0보다큰값만을입력할수있   도록제약조건을지정하세요
alter table EMP_SAMPLE modify commission check(0 < commission);