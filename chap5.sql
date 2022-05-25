--그룹함수

--
select sum(salary) as "급여 총함", trunc(avg(salary)) as "평균 급여", max(salary) as "최대 급여", min(salary) as "최소 급여" from employee;

--입력된 사원의 수
select count(*) from employee;

--커미션을 받는 사원의 수
select count(commission) as "커미션 받는 사원" from employee;

--모든 커미션을 더한 값
select sum(commission) from employee;

--행 갯수가 다른 컬럼을 같이 조회하면 오류가 난다.
--select ename, min(salary) from employee;

--부서별, 직책별로 평균 급여를 출력하고 부서 번호별로 오름차순, 직급별로 내림차순 정렬
select dno, job, trunc(avg(salary)) as "평균 급여" from employee group by dno, job order by dno asc, job desc;

--평균 급여가 2000이상인 그룹의 급여를 모두 더한 값을 구하라
--where를 사용하면 오류가 난다.(15번행)
--select job, sum(salary) from employee WHERE avg(salary) >= 2000 group by job;
--having을 사용한다.(그룹함수로 묶일때는 having을 사용)
select job, sum(salary) from employee group by job having avg(salary) >= 2000;

--select, from, where, group, having, order 순으로 입력해야한다.

--부서별 최고 급여가 3000 이상인 부서의 부서번호와 해당 부서의 최고 급여를 구하라
select dno, max(salary) from employee group by dno having max(salary) >= 3000;

--매니저를 제외하고 급여 총액이 5000 이상인 담당 직책, 급여 총액, 해당 인원수를 구하라
select job, sum(salary), count(*) from employee where job != 'MANAGER' group by job having sum(salary) >= 5000;

--부서별 평균 급여중 최고 평균 급여를 조회하기
select trunc(max(avg(salary))) from employee group by dno;

--
select dno, job, sum(salary) from employee group by rollup(dno, job);