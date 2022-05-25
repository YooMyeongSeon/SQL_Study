--1. 사원번호가7788인사원과담당업무가같은사원을표시(사원이름과담당업무)하세요.
select ename, job from employee where job=(select job from employee where eno='7788');

--2. 사원번호가7499인사원보다급여가많은사원을표시(사원이름과담당업무)하세요
select ename, job from employee where salary > (select salary from employee where eno='7499');

--3. 최소급여를받는사원의이름, 담당업무및급여를표시하세요(그룹함수)
select ename, job, salary from employee where salary = (select min(salary) from employee);

--4. 평균급여가가장적은업무를찾아직급과평균급여를표시하세요
select job, avg(salary) from employee group by job having avg(salary) = (select min(avg(salary)) from employee group by job);

--5. 각부서의최소급여를받는사원이름,급여, 부서번호를표시하세요.
select ename, salary, dno from employee where salary in (select min(salary) from employee group by dno);

--6. 담당업무가분석가(ANALYST)인사원보다급여가적으면서업무가분석가(ANALYST)아닌사원(사원번호, 이름, 담당업무,급여)들을표시하세요.
select eno, ename, job, salary from employee where salary < all(select salary from employee where job='ANALYST') and not job = 'ANALYST';

--7. 매니저없는사원의이름을표시하세요.
select ename from employee where manager is null;

--8. 매니저있는사원의이름을표시하세요.
select ename from employee where manager is not null;

--9. BLAKE와동일한부서에속한사원의이름과입사일을표시하세요.(단BLAKE는제외)
select ename, hiredate from employee where dno = (select dno from employee where ename = 'BLAKE') and not ename = 'BLAKE';

--10. 급여가평균보다많은사원들의사원번호와이름을표시하되결과를급여에대한오름차순으로정렬하세요.,
select eno, ename from employee where salary > (select avg(salary) from employee) order by salary asc;

--11. 이름에K가포함된사원과같은부서에서일하는사원의사원번호와이름을표시하세요.
select eno, ename from employee where dno in (select dno from employee where ename LIKE '%K%');

--12. 부서위치가DALLAS인사원의이름과부서번호및담당업무를표시하세요.


--13. KING에게보고하는사원의이름과급여를표시하세요


--14. RESEARCH 부서의사원에대한부서번호, 사원번호및담당업무를출력하세요


--15. 평균급여보다많은급여를받고이름에서M이포함된사원과같은부서에서근무하는사원의사원번호, 이름, 급여를출력하세요.
select eno, ename, salary from employee where salary > (select avg(salary) from employee) and dno in (select dno from employee where ename LIKE '%M%');

--16. 평균급여가가능적은업무를찾으세요
select job from employee group by job having avg(salary) = (select min(avg(salary)) from employee group by job);

--17. 부하직원을가진사원의사원번호와이름을출력하세요
select eno, ename from employee where eno in (select manager from employee);