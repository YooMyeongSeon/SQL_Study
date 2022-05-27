--ī�׽þ� ��(���̺� 1�� ���� * ���̺� 2�� ����) / �Ϲ������� ������ ����
select * from employee, department;

--EQUL ����(INNER ����) : ������ Į���� ���� ���̺��� �����ϴ� ���(�μ���ȣ�� �������� ����)
select * from department, employee where department.dno = employee.dno;

--���̺� ��Ī ���� ���� : �����ȣ 7788 ����� �̸��� �޿�, �׸��� �μ����� ���
select ename, salary, dname from department d, employee e where d.dno = e.dno and eno=7788;

--EQUL ����(INNER ����) : NATURAL ����(�� ������ ���� �÷��� �ڵ����� ����)
select ename, salary, dname, dno from department d NATURAL JOIN employee e where eno=7788;

--NON-EQUL ����(INNER ����) : ������ �÷��� ������ �ƴ� ������ ����
select ename, salary, grade from employee, salgrade where salary between losal and hisal;

--INNER ����
--INNER ���� : JOIN USING ���(���� �÷����� �������� ����) 
select * from department join employee using(dno) where eno=7788;

--INNER ���� : JOIN ON ���(���� �÷����� �������� ����)
select * from department join employee on department.dno = employee.dno where eno=7788;

--INNER JOIN(�Ϲ������� ���� ����ϴ� ���)
select * from department INNER JOIN employee ON department.dno = employee.dno where eno=7788;

--3�� ���� : ������ �÷��� �������� �����ϸ鼭 ������ �����ϸ� 3�� ����
select * from employee e, department d, salgrade s where e.dno = d.dno and e.salary >= s.losal and e.salary <= s.hisal;

--SELF ���� : ���� ���̺��� ����� �̸���, ����� �̸��� ���� ���
select e.eno, e.ename, me.eno, me.ename from employee e, employee me where e.manager = me.eno;

--OUTER ����(LEFT OUTER ����) : ������ ������ �����̸�, ������� �ʴ� ������ ��� �����͸� �����Ѵ�.
select * from department d left outer join employee e on d.dno = e.dno;

--OUTER ����(RIGHT OUTER ����) : ������ �������� �����̸�, ������� �ʴ� �������� ��� �����͸� �����Ѵ�.
select * from department d RIGHT outer join employee e on d.dno = e.dno;

--OUTER ����(����Ŭ) : +�� ǥ�õ��� ���� ����(���̺�)�� ������ �ȴ�.
select * from department d, employee e where d.dno = e.dno(+);

--OUTER ����(FULL OUTER ����) : ��� �����͸� �����Ѵ�.
select * from department d FULL outer join employee e on d.dno = e.dno;

--���� : ����� �̸���, ����� �̸��� ���� ��� �ٸ� ��� ��ȣ�� ���� ��� null�� ����Ѵ�.(�⺻�� ���� ��İ� ����Ŭ�� ���� ���)
select e.eno, e.ename, me.eno, me.ename from employee e left outer join employee me on e.manager = me.eno;
select e.eno, e.ename, me.eno, me.ename from employee e, employee me where e.manager = me.eno(+);