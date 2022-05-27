--insert : 데이터 삽입
--insert into 테이블명 (컬럼명1, 컬럼명2..) values (데이터1, 데이터2..);
insert into employee(eno, ename, job, manager, hiredate, salary, commission, dno)
VALUES(8121, 'ALICE', 'CLERK', 7788, sysdate, 1200, 100, 10);

--※컬럼명은 생략 가능
insert into employee VALUES(8231, 'KATHERINE', 'SALESMAN', 7698, sysdate, 1750, 800, 30);

--나머지는 null값으로 채우고 특정 컬럼만 생성
insert into employee(eno) values(8500);

--나머지는 null값으로 채우고 특정 컬럼만 생성2
insert into employee(eno, ename) values(8600, null);
insert into emp3(eno, ename, job) select eno, ename, job from employee;



--데이터 복사
--새로운 테이블을 생성하면서 복사
CREATE TABLE emp2 as select * from employee;

--새로운 테이블을 생성하면서 컬럼만 복사후 내용 삽입
CREATE TABLE emp3 as select * from employee WHERE 0=1;
INSERT INTO emp3 select * from employee;



--UPDATE : 데이터 변경
--UPDATE 테이블명 SET 컬럼명 = 값 WHERE ~(조건)
CREATE TABLE emp4 as select * from employee;

--사원번호 8500의 사원 이름을 MARS 로 변경하고 담당 업무는 매니저로 변경하라
UPDATE emp4 SET ename = 'MARS', job = 'MANAGER' where eno=8500;
--모든 사원의 커미션을 500으로 변경하라
UPDATE emp4 set commission = 500;
--서브쿼리 활용법
UPDATE emp4 set salary = (select losal from salgrade where grade = 1) where dno is null;



--DELETE : 데이터 삭제
--DELETE FROM 테이블명 WHERE ~(조건)
CREATE TABLE emp5 as select * from employee;

--ALICE 사원을 삭제
DELETE from emp5 where ename = 'ALICE';
--모든 내용을 삭제
delete from emp5;
--부서명이 RESEARCH 소속 사원을 전원 삭제
delete from emp5 where dno = (select dno from department where dname = 'RESEARCH');


--트랜젝션 : commit, rollback
--커밋 후에는 롤백 불가능 
rollback;

--트랜젝션 정상적 종료(필수)
commit