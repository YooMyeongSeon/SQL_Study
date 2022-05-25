select * from employee;

--1.덧셈연산을이용하여모든사원에대하여$300의급여인산을계산한후사원의이름,급여, 인상된급여를출력하세요.
select ename, salary, salary+300 as "인상된 급여" from employee;

--2. 사원의이름, 급여, 연간총수입을총수입이많은것부터작은순으로출력하세요. 연간총수입은월급에*12를한후$100의상여금을더해서계산하세요.
select ename, salary, (salary*12)+100 as"연간총수입" from employee ORDER BY salary DESC;

--3. 급여가2000이넘는사원의이름과급여를급여가많은것부터작은순으로출력하세요.
select ename, salary from employee WHERE salary > 2000 ORDER BY salary DESC;

--4. 사원번호가7788인사원의이름과부서번호를출력하세요
select ename, eno from employee WHERE eno = 7788;

--5. 급여가2000에서3000사이에포함되지않는사원의이름과급여를출력하세요
select ename, salary from employee WHERE salary not BETWEEN 2000 and 3000;

--6. 1981년2월20일부터1981년5월1일사이에입사한사원의이름, 담당업무, 입사일을출력하세요.
select ename, job, hiredate from employee WHERE hiredate BETWEEN '81/02/20' and '81/05/01';

--7. 부서번호가20 및30에속하는사원의이름과부서번호를출력하되이름을내림차순으로영문자순으로출력하세요
select ename, dno from employee WHERE dno = 20 or dno = 30 ORDER BY ename ASC;

--8. 사원급여가2000에서3000사이에포함되고부서번호가20 또는30인사원의이름과급여와부서번호를출력하되이름을오름차순으로출력하세요
select ename, salary, dno from employee WHERE salary BETWEEN 2000 and 3000 and (dno = 20 or dno = 30) ORDER BY ename DESC;

--9.1981년도에입사한사원의이름과입사일을출력하세요(LIke연산자와와일드카드사용)
select ename, hiredate from employee WHERE hiredate LIKE '1981%';

--10.관리자가없는사원의이름과담당업무를출력하세요
select ename, job from employee WHERE manager is null;

--11. 커미션을받을수있는자격이되는사원의이름, 급여, 커미션을출력하되급여및커미션을기준으로내림차순으로정렬하여출력하세요
select ename, salary, commission from employee WHERE commission is not null and not commission = 0 ORDER BY salary+commission DESC;

--12.이름의세번째문자가R인사원을출력하세요.
select ename from employee WHERE ename like '__R%';

--13. 이름에A와E를모두포함하는사원이이름을출력하세요.
select ename from employee where ename like '%A%E%';

--14. 담당업무가사무원(CLERK) 또는영업사원(SALESMAN)이면서급여가$1600, $950 또는$1300이아닌사원의이름담당업무, 급여를출력하세요
select ename, job, salary from employee where (job = 'CLERK' or job = 'SALESMAN') and (not salary=1600 and not salary=950 and not salary=1300);

--15. 커미션이$500이상인사원의이름과급여및커미션을출력하세요.
select ename, salary, commission from employee where commission >= 500;