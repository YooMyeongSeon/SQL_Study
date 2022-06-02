--1. 20���μ����ҼӵȻ���ǻ����ȣ���̸�, �μ���ȭ������ϴ�SELECT�����ϳ��Ǻ�(v_em_dno) �������ϼ���.
create or REPLACE view v_em_dno(�����ȣ, �̸�, �μ���ȣ) as select eno, ename, dno from employee where dno = 20;

--2. �̹̻����Ⱥ�(v_em_dno)�����ؼ��޿��ʹ�������������Ҽ��ֵ��ϼ����ϼ���.
create or REPLACE view v_em_dno(�����ȣ, �̸�, �μ���ȣ, �޿�, ������) as select eno, ename, dno, salary, job from employee where dno = 20;

--3. �����������ִ�޿�, �ּұ޿�, �޿��Ѿ��������ִº�(EMP_group_job)�������Ѵ�����ȸ�غ���.
create or replace view EMP_group_job(������, �ִ�޿�, �ּұ޿�, �޿��Ѿ�) as select job, max(salary), min(salary), sum(salary) from employee group by job;
select * from EMP_group_job;

--4. �̹̻����Ⱥ�(v_em_dno)�����ؼ����ٰ����ѵ����͸��Է°����ϵ����������ɾ��
create or REPLACE view v_em_dno(�����ȣ, �̸�, �μ���ȣ, �޿�, ������) as select eno, ename, dno, salary, job from employee where dno = 20 with check OPTION;

--5.���������͸���(v_em_dno)�����ؼ��Է����ѵں�(EMP_group_job)�����ؼ���ȸ�غ���.(��������)
insert into v_em_dno values(5100, 'Belita', 10, 1500, 'CLERK');
insert into v_em_dno values(5200, 'Erica', 20, 2300, 'ANALYST');
insert into v_em_dno values(5300, 'Kali', 30, 1750, 'SALESMAN');
insert into v_em_dno values(5400, 'Mia', 20, 950, 'ANALYST');
insert into v_em_dno values(5500, 'Zinna', 10, 1050, 'CLERK');
commit;
select * from EMP_group_job;

--6.�̹̻����Ⱥ�(v_em_dno)�����ؼ��б�����Ӽ����ο��غ���
create or REPLACE view v_em_dno(�����ȣ, �̸�, �μ���ȣ, �޿�, ������) as select eno, ename, dno, salary, job from employee where dno = 20 WITH READ ONLY;

--7. ���, ����̸�, �μ���ȣ�ͺμ��̸��������ִº並(emp_dept)�����ϼ���
create or REPLACE view emp_dept(�����ȣ, ����̸�, �μ���ȣ, �μ��̸�) as select e.eno, e.ename, e.dno, d.dname from employee e, department d where e.dno = d.dno;

--8.�����ȸ��並��ȸ�ϼ���.
select view_name, text from user_views;

--9. �����Ⱥ�(v_em_dno,emp_group_job,emp_dept)�������ϼ���
drop view v_em_dno;
drop view emp_group_job;
drop view emp_dept;