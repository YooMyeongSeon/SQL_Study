--���̺��� ���� ��ȸ�ϱ�
DESC employee;

--������ ���̺�
DESC dual;

--������ ���̺� : ���� ��¥�� ���
select sysdate from dual;

--���̺��� ��� ���� ��ȸ�ϱ�(�⺻)
SELECT * FROM employee;

--Ư�� �÷��� ��ȸ
SELECT ename FROM employee;

--���� �÷��� ��ȸ�� �� �� �÷��� ����
SELECT eno, ename FROM employee;

--������ �÷��� ��� ������� ����
SELECT eno, ename, salary*12 FROM employee;

--�������� Null �����͸� ó���ϴ� �Լ��� NVL(��Ī����)
SELECT eno, ename, salary*12+NVL(commission, 0) ���� FROM employee;
SELECT eno, ename, salary*12+NVL(commission, 0) as "����" FROM employee;

--�ߺ� ���Ž� distinct �� �Է�
SELECT distinct dno FROM employee;

--������ �ʿ��ϸ� WHERE�� ���
SELECT * FROM employee WHERE ename = 'SMITH';

--���ڳ� ��¥�� ���� ���� ����ǥ ���
SELECT * FROM employee WHERE hiredate > '1981/05/31';

--������ �������� ����(AND, OR, NOT)
SELECT * FROM employee WHERE hiredate > '1981/05/31' and salary > 1500;

--BETWEEN A AND B : A�� B������ ��
SELECT * FROM employee WHERE salary BETWEEN 1000 AND 1500;

--���� : �޿��� 1000 �̸��̰ų� 1500�ʰ��� ����� ��ȸ
SELECT * FROM employee WHERE salary<1000 OR salary>1500;
SELECT * FROM employee WHERE NOT(salary>=1000 AND salary<=1500);
SELECT * FROM employee WHERE  salary NOT BETWEEN 1000 AND 1500;

--���� : 1982�⵵�� �Ի��� ����� ������ ��ȸ
SELECT * FROM employee WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31';

--IN : �ҿ������� ���� ��ȸ�ϱ� ���� ����
SELECT * FROM employee WHERE commission IN (300,500,1400);

--���ڿ� �Ϻ� ��ġ LIKE(%�� ���� ������ �𸦶�, _�� ���� ������ �˶�)
SELECT * FROM employee WHERE ename LIKE 'A%'; --A�� �����ϴ� ��� ��ȸ
SELECT * FROM employee WHERE ename LIKE '%A%'; --A�� �����ϴ� ��� ��ȸ
SELECT * FROM employee WHERE ename LIKE '%A'; --A�� ������ ��� ��ȸ
SELECT * FROM employee WHERE ename LIKE '_A%'; --�̸��� �ι�° ���ڰ� A�� ��� ��ȸ 
SELECT * FROM employee WHERE ename LIKE '__A%'; --�̸��� ����° ���ڰ� A�� ��� ��ȸ 

--NULL ����
SELECT * FROM employee WHERE commission IS NULL;
SELECT * FROM employee WHERE commission IS NOT NULL;

--�����ϱ� 
SELECT * FROM employee ORDER BY salary; --�⺻�� ��������
SELECT * FROM employee ORDER BY salary ASC;
SELECT * FROM employee ORDER BY salary DESC;