--1. Equl����������Ͽ�SCOTT ����Ǻμ���ȣ�ͺμ��̸�������ϼ���.
select e.dno, ename, dname from employee e, department d where e.dno = d.dno and ename = 'SCOTT';

--2. Inner ���ΰ�on�����ڸ�����Ͽ�����̸����Բ��׻���̼ҼӵȺμ��̸���������������ϼ���.
select ename, dname, loc from employee e inner join department d on e.dno = d.dno;

--3. INNER ����Using �����ڸ�����Ͽ�10���μ������ϴ¸��������ǰ���������μ����������������Ͽ�����ϼ���.
select dno, job, dname from employee e inner join department d Using(dno) where dno = 10;

--4. Natural����������Ͽ�Ŀ�̼����޴¸�������̸�, �μ��̸�, ������������ϼ���
select ename, dname, loc from employee e NATURAL JOIN department d where commission is not null and commission != 0;

--5. Equal ���ΰ�Wildī�带����ؼ��̸���A�����Եȸ�������̸����μ���������ϼ���,
select ename, dname from  employee e, department d where e.dno = d.dno and ename like '%A%';

--6. Natural ����������Ͽ�NEW York���ٹ��ϴ¸�������̸�, �����μ���ȣ�׺μ���������ϼ���.
select ename, job, e.dno, dname from employee e, department d where e.dno = d.dno and LOC = 'NEW YORK';

--7. Self Join������Ͽ�������̸��׻����ȣ���������̸��װ����ڹ�ȣ���Բ�����ϼ���. �����Ǻ�Ī������̸�(Employee) �����ȣ(emp#) �������̸�(Manager) �����ڹ�ȣ(Mgr#)
select e.ename AS "Employee", e.eno AS "emp#", me.ename as "Manager", me.eno AS "Mgr#" from employee e, employee me where e.manager = me.eno;

--8. Outter����self ����������Ͽ������ڰ����»���������Ͽ������ȣ���������γ������������Ͽ�Ŭ���ϼ��䰢���Ǻ�Ī������̸�(Employee)�����ȣ(emp#)�������̸�(Manager)�����ڹ�ȣ(Mgr#)
select e.ename as "Employee", e.eno as "emp#", me.ename as "Manager", me.eno as "Mgr#" from employee e left outer join employee me on e.manager = me.eno order by e.eno desc;

--9. Self����������Ͽ������ѻ��(SCOTT)���̸�, �μ���ȣ, �����ѻ���������Ѻμ������ٹ��ϴ»��������ϼ��䰢���Ǻ�Ī���̸�, �μ���ȣ, ����������ϼ���
select e.ename as "�̸�", e.dno as "�μ���ȣ", d.ename as "����" from employee e, employee d where e.ename = 'SCOTT' and d.dno = e.dno and d.ename != 'SCOTT';

--10. Self ����������Ͽ�WARD ������ٴʰ��Ի��ѻ�����̸����Ի���������ϼ���.
select o.ename, o.hiredate from employee w, employee o where w.ename = 'WARD' and w.hiredate < o.hiredate;

--11. Self����������Ͽ������ں��ٸ����Ի��Ѹ�������̸����Ի��������������̸����Ի��԰��Բ�����ϼ���. �����Ǻ�Ī������̸�(Ename) ����Ի���(HIERDATE) �������̸�(Ename) �������Ի���(HIERDATE)������ϼ���.
select e.ename as "Ename", e.hiredate as "HIERDATE", m.ename as "Ename", m.hiredate as "HIERDATE" from employee e, employee m where e.manager = m.eno and e.hiredate < m.hiredate;