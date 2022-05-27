--insert : ������ ����
--insert into ���̺�� (�÷���1, �÷���2..) values (������1, ������2..);
insert into employee(eno, ename, job, manager, hiredate, salary, commission, dno)
VALUES(8121, 'ALICE', 'CLERK', 7788, sysdate, 1200, 100, 10);

--���÷����� ���� ����
insert into employee VALUES(8231, 'KATHERINE', 'SALESMAN', 7698, sysdate, 1750, 800, 30);

--�������� null������ ä��� Ư�� �÷��� ����
insert into employee(eno) values(8500);

--�������� null������ ä��� Ư�� �÷��� ����2
insert into employee(eno, ename) values(8600, null);
insert into emp3(eno, ename, job) select eno, ename, job from employee;



--������ ����
--���ο� ���̺��� �����ϸ鼭 ����
CREATE TABLE emp2 as select * from employee;

--���ο� ���̺��� �����ϸ鼭 �÷��� ������ ���� ����
CREATE TABLE emp3 as select * from employee WHERE 0=1;
INSERT INTO emp3 select * from employee;



--UPDATE : ������ ����
--UPDATE ���̺�� SET �÷��� = �� WHERE ~(����)
CREATE TABLE emp4 as select * from employee;

--�����ȣ 8500�� ��� �̸��� MARS �� �����ϰ� ��� ������ �Ŵ����� �����϶�
UPDATE emp4 SET ename = 'MARS', job = 'MANAGER' where eno=8500;
--��� ����� Ŀ�̼��� 500���� �����϶�
UPDATE emp4 set commission = 500;
--�������� Ȱ���
UPDATE emp4 set salary = (select losal from salgrade where grade = 1) where dno is null;



--DELETE : ������ ����
--DELETE FROM ���̺�� WHERE ~(����)
CREATE TABLE emp5 as select * from employee;

--ALICE ����� ����
DELETE from emp5 where ename = 'ALICE';
--��� ������ ����
delete from emp5;
--�μ����� RESEARCH �Ҽ� ����� ���� ����
delete from emp5 where dno = (select dno from department where dname = 'RESEARCH');


--Ʈ������ : commit, rollback
--Ŀ�� �Ŀ��� �ѹ� �Ұ��� 
rollback;

--Ʈ������ ������ ����(�ʼ�)
commit