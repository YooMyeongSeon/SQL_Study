--1. ������Ǳ޿��ְ��, ������, �Ѿ׹���ձ޿�������ϼ���. Į���Ǹ�Ī���ְ��(Maximun) ������(Minimun), �Ѿ�(Sum), ��ձ޿�(Average)�������ϰ���տ����ؼ��������ιݿø��ϼ���.
select max(salary) as "Maximun", min(salary) as "Minimun", Sum(salary) as "Sum", round(avg(salary)) as "Average" from employee;

--2. ���������������α޿��ְ��, ������, �Ѿ׹���վ�������ϼ���. Į���Ǹ�Ī���ְ��(Maximun) ������(Minimun), �Ѿ�(Sum), ��ձ޿�(Average)�������ϰ���տ����ؼ��������ιݿø��ϼ���.
select job as "JOB", max(salary) as "Maximun", min(salary) as "Minimun", Sum(salary) as "Sum", round(avg(salary)) as "Average" from employee group by job;

--3. Count(*)�Լ����̿��ؼ��������������ѻ���Ǽ�������ϼ���
select job, count(*) from employee group by job;

--4. �������Ǽ��������ϼ���. Į���Ǻ�Ī��COUNT(MANAGER)������ϼ���.
select count(distinct(MANAGER)) as "COUNT(MANAGER)" from employee;

--5. �޿��ְ��, �޿�������������������ϼ���. Į���Ǻ�ĪDIFFERENCE�������ϼ���
select max(salary)-min(salary) as "DIFFERENCE" from employee;

--6. ���޺�����������޿�������ϼ���. �����ڸ��˼����»���������޿���2000�̸��α׷������ܽ�Ű��޿������ѳ����������������Ͽ�����ϼ���.
select job, min(salary) from employee where manager is not null group by job having min(salary) > 2000 order by min(salary) desc;

--7. ���μ������غμ���ȣ, �����, �μ����Ǹ��������ձ޿�������Ͻÿ�, Į���Ǻ�Ī���μ���ȣ(DNO), �����(Numberof PeoPle), ��ձ޿�(Salary)�������ϰ���ձ޿��¼Ҽ���2°�ڸ������ݿø��ϼ���.
select dno, count(*) as "Numberof PeoPle", ROUND(avg(salary),2) as "Salary" from employee group by dno;

--8. ���μ������غμ���ȣ�̸�, ������, �����, �μ����Ǹ��������ձ޿�������Ͻÿ�. Į���Ǻ�Ī���μ���ȣ�̸�(DName), ������(Location), �����(Numberof PeoPle), ��ձ޿�(Salary)�������ϰ���ձ޿��������ιݿø��ϼ���.
select dno, decode(dno, 10, 'ACCOUNTING',
                        20, 'RESEARCH',
                        30, 'SALES',
                        40, 'OPERATIONS') as "DName",
            decode(dno, 10, 'NEW YORK',
                        20, 'DALLAS',
                        30, 'CHICAGO',
                        40, 'BOSTON') as "Location",
count(*) as "Number of PeoPle",
round(avg(salary)) as "Salary"
from employee group by dno;

--9. ������ǥ���Ѵ����ش���������غμ���ȣ���޿��׺μ�10,20,30�Ǳ޿��Ѿ�����������Ͻÿ�. ��Į���Ǻ�Ī������job, �μ�10,�μ�20, �μ�30, �Ѿ����������ϼ���.
select dno, job, NVL(sum(decode(dno, 10, salary)), 0) as "�μ�10",  NVL(sum(decode(dno, 20, salary)), 0) as "�μ�20", NVL( sum(decode(dno, 30, salary)), 0) as "�μ�30", sum(salary) from employee group by dno, rollup(job);