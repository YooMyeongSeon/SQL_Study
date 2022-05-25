--1. 모든사원의급여최고액, 최저액, 총액및평균급여를출력하세요. 칼럼의명칭은최고액(Maximun) 최저액(Minimun), 총액(Sum), 평균급여(Average)로지정하고평균에대해서는정수로반올림하세요.
select max(salary) as "Maximun", min(salary) as "Minimun", Sum(salary) as "Sum", trunc(avg(salary)) as "Average" from employee;

--2. 각담당업무유형별로급여최고액, 최저액, 총액및평균액을출력하세요. 칼럼의명칭은최고액(Maximun) 최저액(Minimun), 총액(Sum), 평균급여(Average)로지정하고평균에대해서는정수로반올림하세요.
select job, max(salary) as "Maximun", min(salary) as "Minimun", Sum(salary) as "Sum", trunc(avg(salary)) as "Average" from employee group by job;

--3. Count(*)함수를이용해서담당업무가동일한사원의수를출력하세요
select job, count(*) from employee group by job;

--4. 관리자의수를나열하세요. 칼럼의별칭은COUNT(MANAGER)로출력하세요.
select count(*) as "COUNT(MANAGER)" from employee where job = 'MANAGER';

--5. 급여최고액, 급여최저액의차액을출력하세요. 칼럼의별칭DIFFERENCE로지정하세요
select (max(salary)-min(salary)) as "DIFFERENCE" from employee;

--6. 직급별사원의최저급여를출력하세요. 관리자를알수없는사원및최저급여가2000미만인그룹은제외시키고급여에대한내림차순으로정렬하여출력하세요.
select job, min(salary) from employee where manager is not null group by job having min(salary) > 2000 order by min(salary) desc;

--7. 각부서에대해부서번호, 사원수, 부서내의모든사원의평균급여를출력하시오, 칼럼의별칭은부서번호(DNO), 사원수(Numberof PeoPle), 평균급여(Salary)로지정하고평균급여는소수점2째자리에서반올림하세요.
select dno, count(*) as "Numberof PeoPle", ROUND(avg(salary),1) as "Salary" from employee group by dno;

--8. 각부서에대해부서번호이름, 지역명, 사원수, 부서내의모든사원의평균급여를출력하시오. 칼럼의별칭은부서번호이름(DName), 지역명(Location), 사원수(Numberof PeoPle), 평균급여(Salary)로지정하고평균급여는정수로반올림하세요.


--9. 업무를표시한다음해당업무에대해부서번호별급여및부서10,20,30의급여총액을각각출력하시오. 각칼럼의별칭은각각job, 부서10,부서20, 부서30, 총액으로지정하세요.
select job, NVL(sum(decode(dno, 10, salary)), 0) as "부서10",  NVL(sum(decode(dno, 20, salary)), 0) as "부서20", NVL( sum(decode(dno, 30, salary)), 0) as "부서30", sum(salary) from employee group by job;
