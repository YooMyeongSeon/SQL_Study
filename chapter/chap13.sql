--�� ���� : create view �� �̸�(�÷�1, �÷�2) as select �÷�1, �÷�2 from ���̺� �̸�;(�غ� �÷��� ���� ����)
create view v_emp_job(�����ȣ, ����̸�, �μ���ȣ, ������) as select eno, ename, dno, job from emp_second where job = 'SALESMAN';

--�� ��ȸ(�ܼ� �� : �ϳ��� ���̺��� ��ȸ, ���� �� : �� �� �̻��� ���̺�(����)�� ��ȸ)
select * from v_emp_job;

--���� �� ����(�Լ��� ����� ��� ������ �÷��̱� ������ �ݵ�� ��Ī�� �����ؾ� �Ѵ�. / �Է�, ������ �Ұ����ϴ�.)
create view v_emp_salary as select dno, sum(salary) �޿��հ�, avg(salary) �޿���� from emp_second group by dno;

--OR REPLACE : �� ��ü ���� ����(���ٸ� �����ϰ�, �ִٸ� �����϶��� ������� ���������� ����ϴ� ���)
create or REPLACE view v_emp_job(���, �̸�, �μ�, ����) as select eno, ename, dno, job from emp_second where job = 'SALESMAN';

--FORCE : ���̺��� ��� ������ �並 ������ �� �ִ�.(NOFORCE : ���̺��� �ݵ�� �����ؾ� �Ѵ�.)
create or REPLACE force view v_emp_job(���, �̸�, �μ�, ����) as select eno, ename, dno, job from emp_second where job = 'SALESMAN';

--������ ��� �� ��ȸ(text : SQL)
select view_name, text from user_views;

--WITH CHECK OPTION : �ش� �並 ���ؼ� �� �� �ִ� ���� �������� ������ �����ϰ� �����.
create view v_emp_job(�����ȣ, ����̸�, �μ���ȣ, ������) as select eno, ename, dno, job from emp_second where job = 'SALESMAN' WITH CHECK OPTION;

--WITH READ ONLY : �б� ���� �並 �����, ������ �Ұ��� �ϴ�.
create view v_emp_job(�����ȣ, ����̸�, �μ���ȣ, ������) as select eno, ename, dno, job from emp_second where job = 'SALESMAN' WITH READ ONLY;

--�信 ������ �Է�
insert into v_emp_job values(9000, 'Bill', 30, 'SALESMAN');

--�信 �Էµ� ������ ����
update v_emp_job set ����̸� = 'billy' where �����ȣ = 9000;

--�信 �Էµ� ������ ����
delete from v_emp_job where �����ȣ = 9000;

--�� ����
drop view v_emp_job;