--서브쿼리

--scott보다 급여를 많이 받는 사람의 이름과 급여를 출력하라
select ename, salary from employee where salary > (select salary from employee where ename = 'SCOTT');

--최소 급여를 받는 사원의 이름, 담당업무, 급여를 출력하라
select ename, job, salary from employee where salary = (select min(salary) from employee);

--각 부서별 최소 급여가 30번 부서의 최소급여보다 큰 부서의 부서번호와 최소급여를 출력하라
select dno, min(salary) from employee group by dno having min(salary) > (select min(salary) from employee where dno=30);

--직급이 salesman이 아니면서 급여가 salesman보다 낮은 사원을 출력하라
select ename, salary from employee where not job = 'SALESMAN' and salary < any(select salary from employee where job = 'SALESMAN');

--IN, =any, <any, >any, <all, >all
-- any : 그 중 하나라도 일치(or)
-- all : 전체에서 무조건 일치(and)