select * from employee;

--1.�����������̿��Ͽ�����������Ͽ�$300�Ǳ޿��λ���������Ļ�����̸�,�޿�, �λ�ȱ޿�������ϼ���.
select ename, salary, salary+300 as "�λ�� �޿�" from employee;

--2. ������̸�, �޿�, �����Ѽ������Ѽ����̸����ͺ�����������������ϼ���. �����Ѽ��������޿�*12������$100�ǻ󿩱������ؼ�����ϼ���.
select ename, salary, (salary*12)+100 as"�����Ѽ���" from employee ORDER BY salary DESC;

--3. �޿���2000�̳Ѵ»�����̸����޿����޿��������ͺ�����������������ϼ���.
select ename, salary from employee WHERE salary > 2000 ORDER BY salary DESC;

--4. �����ȣ��7788�λ�����̸����μ���ȣ������ϼ���
select ename, eno from employee WHERE eno = 7788;

--5. �޿���2000����3000���̿����Ե����ʴ»�����̸����޿�������ϼ���
select ename, salary from employee WHERE salary not BETWEEN 2000 and 3000;

--6. 1981��2��20�Ϻ���1981��5��1�ϻ��̿��Ի��ѻ�����̸�, ������, �Ի���������ϼ���.
select ename, job, hiredate from employee WHERE hiredate BETWEEN '81/02/20' and '81/05/01';

--7. �μ���ȣ��20 ��30�����ϴ»�����̸����μ���ȣ������ϵ��̸��������������ο����ڼ���������ϼ���
select ename, dno from employee WHERE dno = 20 or dno = 30 ORDER BY ename ASC;

--8. ����޿���2000����3000���̿����Եǰ�μ���ȣ��20 �Ǵ�30�λ�����̸����޿��ͺμ���ȣ������ϵ��̸�������������������ϼ���
select ename, salary, dno from employee WHERE salary BETWEEN 2000 and 3000 and (dno = 20 or dno = 30) ORDER BY ename DESC;

--9.1981�⵵���Ի��ѻ�����̸����Ի���������ϼ���(LIke�����ڿͿ��ϵ�ī����)
select ename, hiredate from employee WHERE hiredate LIKE '1981%';

--10.�����ڰ����»�����̸���������������ϼ���
select ename, job from employee WHERE manager is null;

--11. Ŀ�̼����������ִ��ڰ��̵Ǵ»�����̸�, �޿�, Ŀ�̼�������ϵǱ޿���Ŀ�̼����������γ����������������Ͽ�����ϼ���
select ename, salary, commission from employee WHERE commission is not null and not commission = 0 ORDER BY salary+commission DESC;

--12.�̸��Ǽ���°���ڰ�R�λ��������ϼ���.
select ename from employee WHERE ename like '__R%';

--13. �̸���A��E����������ϴ»�����̸�������ϼ���.
select ename from employee where ename like '%A%E%';

--14. ���������繫��(CLERK) �Ǵ¿������(SALESMAN)�̸鼭�޿���$1600, $950 �Ǵ�$1300�̾ƴѻ�����̸�������, �޿�������ϼ���
select ename, job, salary from employee where (job = 'CLERK' or job = 'SALESMAN') and (not salary=1600 and not salary=950 and not salary=1300);

--15. Ŀ�̼���$500�̻��λ�����̸����޿���Ŀ�̼�������ϼ���.
select ename, salary, commission from employee where commission >= 500;