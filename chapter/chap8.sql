--�ػ����ȣ 7788 ����� �μ����� ���(���������� ����Ѵ�.)
select dno, dname from department where dno=(select dno from employee where eno=7788);

--ī�׽þ� ��(���̺� 1�� ���� * ���̺� 2�� ����) / �Ϲ������� ������ ����
select * from employee, department;

--Join
--EQUL ���� : ������ Į���� ���� ���̺��� �����ϴ� ��� : �μ���ȣ�� ��ġ�ϴ� ���̺� ���
select * from department, employee where department.dno = employee.dno;

--�����ȣ 7788 ����� �̸��� �޿�, �׸��� �μ����� ���(���̺� ��Ī�� ������ �� ������ Ȱ��)
select ename, salary, dname from department d, employee e where d.dno = e.dno and eno=7788;

--EQUL ���� : NATURAL ����(���� �÷��� �ڵ����� ����)
select ename, salary, dname, dno from department d NATURAL JOIN employee e where eno=7788;

--NON-EQUL ����
select ename, salary, grade from employee, salgrade where salary between losal and hisal;

--INNER ����
--JOIN USING ���
select * from department join employee using(dno) where eno=7788;

--JOIN ON ���
select * from department join employee on department.dno = employee.dno where eno=7788;

--INNER JOIN (ǥ��)
select * from department INNER JOIN employee ON department.dno = employee.dno where eno=7788;

--3�� ����
--����� �̸�, �Ҽ� �μ� �̸�, �޿��� ����� ���
select * from employee e, department d, salgrade s where e.dno = d.dno and e.salary >= s.losal and e.salary <= s.hisal;

--SELF ����
--����� �̸���, ����� �̸��� ���� ���
select e.eno, e.ename, me.eno, me.ename from employee e, employee me where e.manager = me.eno;

--outer ����  
select * from department d left outer join employee e on d.dno = e.dno;

--outer ����(����Ŭ) : +�� ǥ�õ��� ���� ����(���̺�)�� ������ �ȴ�.
select * from department d, employee e where d.dno = e.dno(+);

--����� �̸���, ����� �̸��� ���� ��� �ٸ� ��� ��ȣ�� ���� ��� null�� ����Ѵ�.
select e.eno, e.ename, me.eno, me.ename from employee e left outer join employee me on e.manager = me.eno;
select e.eno, e.ename, me.eno, me.ename from employee e, employee me where e.manager = me.eno(+);