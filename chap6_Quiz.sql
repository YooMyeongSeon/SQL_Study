--1. �����ȣ��7788�λ���������������������ǥ��(����̸���������)�ϼ���.
select ename, job from employee where job=(select job from employee where eno='7788');

--2. �����ȣ��7499�λ�����ٱ޿������������ǥ��(����̸���������)�ϼ���
select ename, job from employee where salary > (select salary from employee where eno='7499');

--3. �ּұ޿����޴»�����̸�, �������ױ޿���ǥ���ϼ���(�׷��Լ�)
select ename, job, salary from employee where salary = (select min(salary) from employee);

--4. ��ձ޿�����������������ã�����ް���ձ޿���ǥ���ϼ���
select job, avg(salary) from employee group by job having avg(salary) = (select min(avg(salary)) from employee group by job);

--5. ���μ����ּұ޿����޴»���̸�,�޿�, �μ���ȣ��ǥ���ϼ���.
select ename, salary, dno from employee where salary in (select min(salary) from employee group by dno);

--6. ���������м���(ANALYST)�λ�����ٱ޿��������鼭�������м���(ANALYST)�ƴѻ��(�����ȣ, �̸�, ������,�޿�)����ǥ���ϼ���.
select eno, ename, job, salary from employee where salary < all(select salary from employee where job='ANALYST') and not job = 'ANALYST';

--7. �Ŵ������»�����̸���ǥ���ϼ���.
select ename from employee where manager is null;

--8. �Ŵ����ִ»�����̸���ǥ���ϼ���.
select ename from employee where manager is not null;

--9. BLAKE�͵����Ѻμ������ѻ�����̸����Ի�����ǥ���ϼ���.(��BLAKE������)
select ename, hiredate from employee where dno = (select dno from employee where ename = 'BLAKE') and not ename = 'BLAKE';

--10. �޿�����պ��ٸ���������ǻ����ȣ���̸���ǥ���ϵǰ�����޿������ѿ����������������ϼ���.,
select eno, ename from employee where salary > (select avg(salary) from employee) order by salary asc;

--11. �̸���K�����ԵȻ���������μ��������ϴ»���ǻ����ȣ���̸���ǥ���ϼ���.
select eno, ename from employee where dno in (select dno from employee where ename LIKE '%K%');

--12. �μ���ġ��DALLAS�λ�����̸����μ���ȣ�״�������ǥ���ϼ���.


--13. KING���Ժ����ϴ»�����̸����޿���ǥ���ϼ���


--14. RESEARCH �μ��ǻ�������Ѻμ���ȣ, �����ȣ�״�����������ϼ���


--15. ��ձ޿����ٸ����޿����ް��̸�����M�����ԵȻ���������μ������ٹ��ϴ»���ǻ����ȣ, �̸�, �޿�������ϼ���.
select eno, ename, salary from employee where salary > (select avg(salary) from employee) and dno in (select dno from employee where ename LIKE '%M%');

--16. ��ձ޿�����������������ã������
select job from employee group by job having avg(salary) = (select min(avg(salary)) from employee group by job);

--17. ������������������ǻ����ȣ���̸�������ϼ���
select eno, ename from employee where eno in (select manager from employee);