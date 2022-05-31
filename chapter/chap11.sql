--뷰 생성 : create view 뷰 이름(컬럼1, 컬럼2) as select 컬럼1, 컬럼2 from 테이블 이름;(※뷰 컬럼명 생략 가능)
create view v_emp_job(사원번호, 사원이름, 부서번호, 담당업무) as select eno, ename, dno, job from emp_second where job = 'SALESMAN';

--뷰 조회(단순 뷰 : 하나의 테이블을 조회, 복합 뷰 : 두 개 이상의 테이블(조인)을 조회)
select * from v_emp_job;

--복합 뷰 생성(함수를 사용할 경우 가상의 컬럼이기 때문에 반드시 별칭을 지정해야 한다. / 입력, 수정은 불가능하다.)
create view v_emp_salary as select dno, sum(salary) 급여합계, avg(salary) 급여평균 from emp_second group by dno;

--OR REPLACE : 뷰 자체 내용 수정(없다면 생성하고, 있다면 수정하라의 방식으로 보편적으로 사용하는 방법)
create or REPLACE view v_emp_job(사번, 이름, 부서, 업무) as select eno, ename, dno, job from emp_second where job = 'SALESMAN';

--FORCE : 테이블이 없어도 강제로 뷰를 생성할 수 있다.(NOFORCE : 테이블이 반드시 존재해야 한다.)
create or REPLACE force view v_emp_job(사번, 이름, 부서, 업무) as select eno, ename, dno, job from emp_second where job = 'SALESMAN';

--생성된 모든 뷰 조회(text : SQL)
select view_name, text from user_views;

--WITH CHECK OPTION : 해당 뷰를 통해서 볼 수 있는 범위 내에서만 수정이 가능하게 만든다.
create view v_emp_job(사원번호, 사원이름, 부서번호, 담당업무) as select eno, ename, dno, job from emp_second where job = 'SALESMAN' WITH CHECK OPTION;

--WITH READ ONLY : 읽기 전용 뷰를 만들고, 수정이 불가능 하다.
create view v_emp_job(사원번호, 사원이름, 부서번호, 담당업무) as select eno, ename, dno, job from emp_second where job = 'SALESMAN' WITH READ ONLY;

--뷰에 데이터 입력
insert into v_emp_job values(9000, 'Bill', 30, 'SALESMAN');

--뷰에 입력된 데이터 수정
update v_emp_job set 사원이름 = 'billy' where 사원번호 = 9000;

--뷰에 입력된 데이터 삭제
delete from v_emp_job where 사원번호 = 9000;

--뷰 삭제
drop view v_emp_job;