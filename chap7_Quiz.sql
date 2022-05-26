--1. Equl조인을사용하여SCOTT 사원의부서번호와부서이름을출력하세요.
select e.dno, ename, dname from employee e, department d where e.dno = d.dno and ename = 'SCOTT';

--2. Inner 조인과on연산자를사용하여사원이름과함께그사원이소속된부서이름과지역명을출력하세요.
select ename, dname, loc from employee e inner join department d on e.dno = d.dno;

--3. INNER 조인Using 연산자를사용하여10번부서에속하는모든담당업무의고유목록을부서의지역명을포함하여출력하세요.
select dno, job, dname from employee e inner join department d Using(dno) where dno = 10;

--4. Natural조인을사용하여커미션을받는모든사원의이름, 부서이름, 지역명을출력하세요
select ename, dname, loc from employee e NATURAL JOIN department d where commission is not null and commission != 0;

--5. Equal 조인과Wild카드를사용해서이름에A가포함된모든사원의이름과부서명을출력하세요,
select ename, dname from  employee e, department d where e.dno = d.dno and ename like '%A%';

--6. Natural 조인을사용하여NEW York에근무하는모든사원의이름, 업무부서번호및부서명을출력하세요.
select ename, job, e.dno, dname from employee e, department d where e.dno = d.dno and LOC = 'NEW YORK';

--7. Self Join을사용하여사원의이름및사원번호를관리자이름및관리자번호와함께출력하세요. 각열의별칭은사원이름(Employee) 사원번호(emp#) 관리자이름(Manager) 관리자번호(Mgr#)
select e.ename AS "Employee", e.eno AS "emp#", me.ename as "Manager", me.eno AS "Mgr#" from employee e, employee me where e.manager = me.eno;

--8. Outter조인self 조인을사용하여관리자가없는사원을포함하여사원번호를기준으로내림차순정렬하여클릭하세요각열의별칭은사원이름(Employee)사원번호(emp#)관리자이름(Manager)관리자번호(Mgr#)
select e.ename as "Employee", e.eno as "emp#", me.ename as "Manager", me.eno as "Mgr#" from employee e left outer join employee me on e.manager = me.eno order by e.eno desc;

--9. Self조인을사용하여지정한사원(SCOTT)의이름, 부서번호, 지정한사원과동일한부서에서근무하는사원을출력하세요각열의별칭은이름, 부서번호, 동료로지정하세요
select e.ename as "이름", e.dno as "부서번호", d.ename as "동료" from employee e, employee d where e.ename = 'SCOTT' and d.dno = e.dno and d.ename != 'SCOTT';

--10. Self 조인을사용하여WARD 사원보다늦게입사한사원의이름과입사일을출력하세요.
select o.ename, o.hiredate from employee w, employee o where w.ename = 'WARD' and w.hiredate < o.hiredate;

--11. Self조인을사용하여관리자보다먼저입사한모든사원의이름및입사일을관리자의이름및입사입과함께출력하세요. 각열의별칭은사원이름(Ename) 사원입사일(HIERDATE) 관리자이름(Ename) 관리자입사입(HIERDATE)로출력하세요.
select e.ename as "Ename", e.hiredate as "HIERDATE", m.ename as "Ename", m.hiredate as "HIERDATE" from employee e, employee m where e.manager = m.eno and e.hiredate < m.hiredate;