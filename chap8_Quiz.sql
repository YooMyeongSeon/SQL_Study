--1. Employee���̺��Ǳ����������Ͽ�EMP_INSERT�������̺������弼��.
create table EMP_INSERT as select * from employee WHERE 0=1;

--2. ������EMP_INSERT���̺��߰��ϵ�SYSDATE���̿��ؼ��Ի��������÷��Է��ϼ���
insert into EMP_INSERT values(9000, 'Mr.Yoo', 'Designer', 7698, sysdate, 3600, 200, 30);

--3. EMP_INSERT ���̺���������߰��ϵ�TO_DATE�Լ�������ؼ��Ի������������Է��ϼ���
insert into EMP_INSERT values(9001, 'Mr.Choi', 'SALESMAN', 7698, TO_DATE('2022/05/25'), 3800, 500, 30);

--4. Employee���̺��Ǳ����ͳ����������Ͽ�EMP_COPY���̸������̺������弼��.
create table EMP_COPY as select * from employee;

--5. �����ȣ��7788�λ���Ǻμ���ȣ��10���μ����ϼ���.
update emp_copy SET dno = 10 where eno = 7788;

--6. �����ȣ��7788�Ǵ������ױ޿��������ȣ7499�Ǵ������ױ޿�����ġ�ϵ��ϰ����ϼ���.
update emp_copy SET job = (select job from emp_copy where eno = 7499), salary = (select salary from emp_copy where eno = 7499) where eno = 7788;

--7. �����ȣ7369�;����������Ѹ�����Ǻμ���ȣ�����7369������μ���ȣ�ΰ����ϼ���.
update emp_copy set dno = (select dno from emp_copy where eno = 7369) where job = (select job from emp_copy where eno = 7369);

--8. Department���̺��Ǳ����ͳ����������Ͽ�DEPT_COPY���̸������̺������弼��
create table DEPT_COPY as select * from Department;

--9. DEPT_COPY���̺����μ�����RESEARCH�κμ��������ϼ���.
delete from DEPT_COPY where dname = 'RESEARCH';

--10. DEPT_COPY���̺����μ���ȣ��10�̰ų�40�κμ��������ϼ���.
delete from DEPT_COPY where dno = 10 or dno = 40;