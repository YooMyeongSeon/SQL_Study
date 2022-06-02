--1. 20번부서에소속된사원의사원번호와이름, 부서번화를출력하는SELECT문을하나의뷰(v_em_dno) 로정의하세요.
create or REPLACE view v_em_dno(사원번호, 이름, 부서번호) as select eno, ename, dno from employee where dno = 20;

--2. 이미생성된뷰(v_em_dno)에대해서급여와담당업무역시출력할수있도록수정하세요.
create or REPLACE view v_em_dno(사원번호, 이름, 부서번호, 급여, 담당업무) as select eno, ename, dno, salary, job from employee where dno = 20;

--3. 담당업무별로최대급여, 최소급여, 급여총액을보여주는뷰(EMP_group_job)를생성한다음조회해본다.
create or replace view EMP_group_job(담당업무, 최대급여, 최소급여, 급여총액) as select job, max(salary), min(salary), sum(salary) from employee group by job;
select * from EMP_group_job;

--4. 이미생성된뷰(v_em_dno)를통해서접근가능한데이터만입력가능하도록제약을걸어본다
create or REPLACE view v_em_dno(사원번호, 이름, 부서번호, 급여, 담당업무) as select eno, ename, dno, salary, job from employee where dno = 20 with check OPTION;

--5.다음데이터를뷰(v_em_dno)를통해서입력을한뒤뷰(EMP_group_job)를통해서조회해본다.(파일참조)
insert into v_em_dno values(5100, 'Belita', 10, 1500, 'CLERK');
insert into v_em_dno values(5200, 'Erica', 20, 2300, 'ANALYST');
insert into v_em_dno values(5300, 'Kali', 30, 1750, 'SALESMAN');
insert into v_em_dno values(5400, 'Mia', 20, 950, 'ANALYST');
insert into v_em_dno values(5500, 'Zinna', 10, 1050, 'CLERK');
commit;
select * from EMP_group_job;

--6.이미생성된뷰(v_em_dno)에대해서읽기전용속성을부여해보자
create or REPLACE view v_em_dno(사원번호, 이름, 부서번호, 급여, 담당업무) as select eno, ename, dno, salary, job from employee where dno = 20 WITH READ ONLY;

--7. 사번, 사원이름, 부서번호와부서이름을보여주는뷰를(emp_dept)생성하세요
create or REPLACE view emp_dept(사원번호, 사원이름, 부서번호, 부서이름) as select e.eno, e.ename, e.dno, d.dname from employee e, department d where e.dno = d.dno;

--8.생성된모든뷰를조회하세요.
select view_name, text from user_views;

--9. 생성된뷰(v_em_dno,emp_group_job,emp_dept)를제거하세요
drop view v_em_dno;
drop view emp_group_job;
drop view emp_dept;