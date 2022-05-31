--SUM() : �� �հ踦 ����, AVG() : ��հ��� ����, MAX() : �ִ밪�� ����, MIN() : �ּҰ��� ����
select sum(salary) as "�޿� ����", trunc(avg(salary)) as "��� �޿�", max(salary) as "�ִ� �޿�", min(salary) as "�ּ� �޿�" from employee;

--COUNT() : ���� ������ ���(COUNT(Distinct)�� �ߺ��� �����ϰ� ����� �� �ִ�.)
select count(*) from employee;

--�׷� �Լ��� �⺻������ null���� ���꿡 �������� �ʰ� �����Ѵ�.
select sum(commission) from employee;

--GROUP BY �÷� : �÷��� �������� �׷��� �����Ѵ�.
select dno, job, trunc(avg(salary)) as "��� �޿�" from employee group by dno, job order by dno;

--HAVING : �׷� ���ǹ�, �׷� ���� �Ŀ� ����Ѵ�.
select job, sum(salary) from employee group by job having avg(salary) >= 2000;

--ROLLUP() : ��ü�� ���� ���ϴ� ���� �ƴ� �߰� �հ谡 �ʿ��� �� ���
select job, sum(salary) from employee group by rollup(job);

--�÷��� ������� �÷� ������� �׷���� �ҿ����� ����
select dno, job, sum(salary) from employee group by rollup(dno, job);

--select, from, where, group, having, order ������ �Է�.