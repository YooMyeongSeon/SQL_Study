--SUM() : 총 합계를 구함, AVG() : 평균값을 구함, MAX() : 최대값을 구함, MIN() : 최소값을 구함
select sum(salary) as "급여 총함", trunc(avg(salary)) as "평균 급여", max(salary) as "최대 급여", min(salary) as "최소 급여" from employee;

--COUNT() : 행의 갯수를 출력(COUNT(Distinct)로 중복을 제거하고 출력할 수 있다.)
select count(*) from employee;

--그룹 함수는 기본적으로 null값을 연산에 포함하지 않고 진행한다.
select sum(commission) from employee;

--GROUP BY 컬럼 : 컬럼을 기준으로 그룹을 형성한다.
select dno, job, trunc(avg(salary)) as "평균 급여" from employee group by dno, job order by dno;

--HAVING : 그룹 조건문, 그룹 선언 후에 사용한다.
select job, sum(salary) from employee group by job having avg(salary) >= 2000;

--ROLLUP() : 전체의 합을 구하는 것이 아닌 중간 합계가 필요할 때 사용
select job, sum(salary) from employee group by rollup(job);

--컬럼이 복수라면 컬럼 순서대로 그룹지어서 소연산을 진행
select dno, job, sum(salary) from employee group by rollup(dno, job);

--select, from, where, group, having, order 순으로 입력.