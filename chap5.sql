--�׷��Լ�

--
select sum(salary) as "�޿� ����", trunc(avg(salary)) as "��� �޿�", max(salary) as "�ִ� �޿�", min(salary) as "�ּ� �޿�" from employee;

--�Էµ� ����� ��
select count(*) from employee;

--Ŀ�̼��� �޴� ����� ��
select count(commission) as "Ŀ�̼� �޴� ���" from employee;

--��� Ŀ�̼��� ���� ��
select sum(commission) from employee;

--�� ������ �ٸ� �÷��� ���� ��ȸ�ϸ� ������ ����.
--select ename, min(salary) from employee;

--�μ���, ��å���� ��� �޿��� ����ϰ� �μ� ��ȣ���� ��������, ���޺��� �������� ����
select dno, job, trunc(avg(salary)) as "��� �޿�" from employee group by dno, job order by dno asc, job desc;

--��� �޿��� 2000�̻��� �׷��� �޿��� ��� ���� ���� ���϶�
--where�� ����ϸ� ������ ����.(15����)
--select job, sum(salary) from employee WHERE avg(salary) >= 2000 group by job;
--having�� ����Ѵ�.(�׷��Լ��� ���϶��� having�� ���)
select job, sum(salary) from employee group by job having avg(salary) >= 2000;

--select, from, where, group, having, order ������ �Է��ؾ��Ѵ�.

--�μ��� �ְ� �޿��� 3000 �̻��� �μ��� �μ���ȣ�� �ش� �μ��� �ְ� �޿��� ���϶�
select dno, max(salary) from employee group by dno having max(salary) >= 3000;

--�Ŵ����� �����ϰ� �޿� �Ѿ��� 5000 �̻��� ��� ��å, �޿� �Ѿ�, �ش� �ο����� ���϶�
select job, sum(salary), count(*) from employee where job != 'MANAGER' group by job having sum(salary) >= 5000;

--�μ��� ��� �޿��� �ְ� ��� �޿��� ��ȸ�ϱ�
select trunc(max(avg(salary))) from employee group by dno;

--
select dno, job, sum(salary) from employee group by rollup(dno, job);