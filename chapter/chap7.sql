--카테시안 곱(테이블 1의 갯수 * 테이블 2의 갯수) / 일반적으로 사용되지 않음
select * from employee, department;

--EQUL 조인(INNER 조인) : 공통의 칼럼을 가진 테이블을 조인하는 방법(부서번호를 기준으로 조인)
select * from department, employee where department.dno = employee.dno;

--테이블에 별칭 지정 가능 : 사원번호 7788 사원의 이름과 급여, 그리고 부서명을 출력
select ename, salary, dname from department d, employee e where d.dno = e.dno and eno=7788;

--EQUL 조인(INNER 조인) : NATURAL 조인(두 기준중 같은 컬럼을 자동으로 제거)
select ename, salary, dname, dno from department d NATURAL JOIN employee e where eno=7788;

--NON-EQUL 조인(INNER 조인) : 공통의 컬럼이 기준이 아닌 범위로 연결
select ename, salary, grade from employee, salgrade where salary between losal and hisal;

--INNER 조인
--INNER 조인 : JOIN USING 방식(공통 컬럼명을 기준으로 조인) 
select * from department join employee using(dno) where eno=7788;

--INNER 조인 : JOIN ON 방식(공통 컬럼명을 기준으로 조인)
select * from department join employee on department.dno = employee.dno where eno=7788;

--INNER JOIN(일반적으로 많이 사용하는 방법)
select * from department INNER JOIN employee ON department.dno = employee.dno where eno=7788;

--3중 조인 : 공통의 컬럼을 기준으로 조인하면서 범위를 지정하며 3중 조인
select * from employee e, department d, salgrade s where e.dno = d.dno and e.salary >= s.losal and e.salary <= s.hisal;

--SELF 조인 : 같은 테이블의 사원의 이름과, 상사의 이름을 같이 출력
select e.eno, e.ename, me.eno, me.ename from employee e, employee me where e.manager = me.eno;

--OUTER 조인(LEFT OUTER 조인) : 기준이 왼쪽인 조인이며, 공통되지 않는 왼쪽의 모든 데이터를 포함한다.
select * from department d left outer join employee e on d.dno = e.dno;

--OUTER 조인(RIGHT OUTER 조인) : 기준이 오른쪽인 조인이며, 공통되지 않는 오른쪽의 모든 데이터를 포함한다.
select * from department d RIGHT outer join employee e on d.dno = e.dno;

--OUTER 조인(오라클) : +가 표시되지 않은 조건(테이블)이 기준이 된다.
select * from department d, employee e where d.dno = e.dno(+);

--OUTER 조인(FULL OUTER 조인) : 모든 데이터를 포함한다.
select * from department d FULL outer join employee e on d.dno = e.dno;

--예제 : 사원의 이름과, 상사의 이름을 같이 출력 다만 상관 번호가 없는 경우 null을 출력한다.(기본의 조인 방식과 오라클의 조인 방식)
select e.eno, e.ename, me.eno, me.ename from employee e left outer join employee me on e.manager = me.eno;
select e.eno, e.ename, me.eno, me.ename from employee e, employee me where e.manager = me.eno(+);