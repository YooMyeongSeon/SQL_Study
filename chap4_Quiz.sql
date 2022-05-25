--1. SUBSTR �Լ�������Ͽ���������Ի��ѳ⵵���Ի��Ѵ޸�����ϼ���.
select substr(hiredate, 1, 7) from employee;

--2. SUBSTR �Լ�������Ͽ�4�����Ի��ѻ��������ϼ���
select * from employee WHERE substr(hiredate, 6, 2) = 04;

--3. MOD �Լ�������Ͽ������ȣ��¦���λ��������ϼ���
select * from employee where mod(eno,2)=0;

--4. �Ի�����������2�ڸ�(YY), ��������(MON)��ǥ���ϰ���������(DY)�������Ͽ�����ϼ���.
select to_char(hiredate,'YY MON DY') from employee;

--5. ���ظ�ĥ��������������ϼ���. ���糯¥��������1��1���������������ϰ�TO_DATE �Լ�������Ͽ�������������ġ��Ű�ÿ�.
select (TO_DATE('2022/05/24') - TO_DATE('2022/01/01')) from dual;

--6. ������ǻ�����������ϵǻ���̾��»�������ؼ���NULL ��ſ�0������ϼ���.
select NVL(manager, 0) from employee;

--7. DECODE �Լ������޿�����޿����λ��ϵ����ϼ���. ������'ANAIYST'�λ����200, 'SALESMAN'�λ����180, 'MANAGER'�λ����150,'CLERK'�λ����100���λ��ϼ���.
select ename, job, salary, decode(job, 'ANALYST', salary+200,
                                       'SALESMAN', salary+180,
                                       'MANAGER', salary+150,
                                       'CLERK', salary+100,
                                       salary) as "�λ�� �޿�" from employee;