--��������

--scott���� �޿��� ���� �޴� ����� �̸��� �޿��� ����϶�
select ename, salary from employee where salary > (select salary from employee where ename = 'SCOTT');

--�ּ� �޿��� �޴� ����� �̸�, ������, �޿��� ����϶�
select ename, job, salary from employee where salary = (select min(salary) from employee);

--�� �μ��� �ּ� �޿��� 30�� �μ��� �ּұ޿����� ū �μ��� �μ���ȣ�� �ּұ޿��� ����϶�
select dno, min(salary) from employee group by dno having min(salary) > (select min(salary) from employee where dno=30);

--������ salesman�� �ƴϸ鼭 �޿��� salesman���� ���� ����� ����϶�
select ename, salary from employee where not job = 'SALESMAN' and salary < any(select salary from employee where job = 'SALESMAN');

--IN, =any, <any, >any, <all, >all
-- any : �� �� �ϳ��� ��ġ(or)
-- all : ��ü���� ������ ��ġ(and)