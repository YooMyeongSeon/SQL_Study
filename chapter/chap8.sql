--※사원번호 7788 사원의 부서명을 출력(서브쿼리를 사용한다.)
select dno, dname from department where dno=(select dno from employee where eno=7788);

--카테시안 곱(테이블 1의 갯수 * 테이블 2의 갯수) / 일반적으로 사용되지 않음
select * from employee, department;

--Join
--EQUL 조인 : 공통의 칼럼을 가진 테이블을 조인하는 방법 : 부서번호가 일치하는 테이블만 출력
select * from department, employee where department.dno = employee.dno;

--사원번호 7788 사원의 이름과 급여, 그리고 부서명을 출력(테이블에 별칭을 지정할 수 있음을 활용)
select ename, salary, dname from department d, employee e where d.dno = e.dno and eno=7788;

--EQUL 조인 : NATURAL 조인(같은 컬럼을 자동으로 제거)
select ename, salary, dname, dno from department d NATURAL JOIN employee e where eno=7788;

--NON-EQUL 조인
select ename, salary, grade from employee, salgrade where salary between losal and hisal;

--INNER 조인
--JOIN USING 방식
select * from department join employee using(dno) where eno=7788;

--JOIN ON 방식
select * from department join employee on department.dno = employee.dno where eno=7788;

--INNER JOIN (표준)
select * from department INNER JOIN employee ON department.dno = employee.dno where eno=7788;

--3중 조인
--사원의 이름, 소속 부서 이름, 급여와 등급을 출력
select * from employee e, department d, salgrade s where e.dno = d.dno and e.salary >= s.losal and e.salary <= s.hisal;

--SELF 조인
--사원의 이름과, 상사의 이름을 같이 출력
select e.eno, e.ename, me.eno, me.ename from employee e, employee me where e.manager = me.eno;

--outer 조인  
select * from department d left outer join employee e on d.dno = e.dno;

--outer 조인(오라클) : +가 표시되지 않은 조건(테이블)이 기준이 된다.
select * from department d, employee e where d.dno = e.dno(+);

--사원의 이름과, 상사의 이름을 같이 출력 다만 상관 번호가 없는 경우 null을 출력한다.
select e.eno, e.ename, me.eno, me.ename from employee e left outer join employee me on e.manager = me.eno;
select e.eno, e.ename, me.eno, me.ename from employee e, employee me where e.manager = me.eno(+);