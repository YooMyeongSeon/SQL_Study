DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;
DROP TABLE SALGRADE;

CREATE TABLE DEPARTMENT
        (DNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
         DNAME VARCHAR2(14),
	 LOC   VARCHAR2(13) ) ;
CREATE TABLE EMPLOYEE 
        (ENO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	 ENAME VARCHAR2(10),
 	 JOB   VARCHAR2(9),
	 MANAGER  NUMBER(4),
	 HIREDATE DATE,
	 SALARY NUMBER(7,2),
	 COMMISSION NUMBER(7,2),
	 DNO NUMBER(2) CONSTRAINT FK_DNO REFERENCES DEPARTMENT);
CREATE TABLE SALGRADE
        (GRADE NUMBER,
	 LOSAL NUMBER,
	 HISAL NUMBER );

INSERT INTO DEPARTMENT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPARTMENT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPARTMENT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPARTMENT VALUES (40,'OPERATIONS','BOSTON');

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','CLERK',    7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7499,'ALLEN','SALESMAN', 7698,to_date('20-2-1981', 'dd-mm-yyyy'),1600,300,30);
INSERT INTO EMPLOYEE VALUES
(7521,'WARD','SALESMAN',  7698,to_date('22-2-1981', 'dd-mm-yyyy'),1250,500,30);
INSERT INTO EMPLOYEE VALUES
(7566,'JONES','MANAGER',  7839,to_date('2-4-1981',  'dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981', 'dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMPLOYEE VALUES
(7698,'BLAKE','MANAGER',  7839,to_date('1-5-1981',  'dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7782,'CLARK','MANAGER',  7839,to_date('9-6-1981',  'dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7788,'SCOTT','ANALYST',  7566,to_date('13-07-1987', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7839,'KING','PRESIDENT', NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981',  'dd-mm-yyyy'),1500,0,30);
INSERT INTO EMPLOYEE VALUES
(7876,'ADAMS','CLERK',    7788,to_date('13-07-1987', 'dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7900,'JAMES','CLERK',    7698,to_date('3-12-1981', 'dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7902,'FORD','ANALYST',   7566,to_date('3-12-1981', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7934,'MILLER','CLERK',   7782,to_date('23-1-1982', 'dd-mm-yyyy'),1300,NULL,10);

INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

COMMIT;


-----------------------------------------------------------------------
DESC EMPLOYEE;

SELECT sysdate FROM dual;

SELECT * FROM employee;

SELECT eno, ename, job, manager, hiredate, salary, commission, dno FROM green.employee;

SELECT ename, salary, salary*12 FROM employee;

SELECT ename, salary, salary*12+commission FROM employee;

SELECT ename, salary, salary*12+NVL(commission,0) AS "�� ��" FROM employee;

SELECT DNO FROM employee;

SELECT DISTINCT DNO FROM employee;
   
   SELECT ename,salary FROM employee WHERE ename='SMITH';
-- �˰�ʹ�, �̸��� �޿���    ������̺� �ִ�  �̸��� ���̽��� ���

SELECT * FROM employee WHERE salary <= 1500;

SELECT * 
FROM employee 
WHERE ename!='SMITH';

SELECT * FROM employee WHERE  NOT hiredate <= '1981/05/31' OR salary >= 1200;

-- �޿��� 1000���� 1500 ������ ����� ��ȸ  (BETWEEN A AND B : A�� B������ ��)
SELECT * FROM employee WHERE salary>=1000 AND salary<=1500;

SELECT * FROM employee WHERE salary BETWEEN 1000 AND 1500;

-- �޿��� 1000 �̸��̰ų� 1500�ʰ��� ����� ��ȸ
SELECT * FROM employee WHERE salary<1000 OR salary>1500;
SELECT * FROM employee WHERE NOT(salary>=1000 AND salary<=1500);

SELECT * FROM employee WHERE  salary NOT BETWEEN 1000 AND 1500;

-- 1981�⵵�� �Ի��� ����� ������ ��ȸ  => SQL
SELECT * FROM employee WHERE hiredate BETWEEN '1981/01/01' AND '1981/12/31';

-- Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ����� ��ȸ  (IN �����߿� ��ġ�ϴ� ��)
SELECT * FROM employee WHERE commission=300 OR commission=500 OR commission=1400;
SELECT * FROM employee WHERE commission IN (300,500,1400);

--  (IS NULL  ���� null�� ��)
SELECT * FROM employee WHERE commission IS NULL;

SELECT * FROM employee WHERE commission IS NOT NULL;

-- ���ڿ� �Ϻ� ��ġ  LIKE
SELECT * FROM employee WHERE ename LIKE '%A%';
 -- %�� ���� ������ �𸦶�
 --  _�� ���� ������ �˶�
SELECT * FROM employee WHERE ename LIKE '__A%';
 
SELECT * FROM employee 
WHERE salary>=1200
ORDER BY job DESC, salary ASC;

--------------------------------------------------------------------------------
select ename, hiredate, to_char(hiredate, 'YY-MM'), to_char(hiredate, 'YYYY/MM/DD DAY') from employee;
select ename, hiredate from employee where hiredate = to_date(19811117, 'YYYYMMDD');

select ascii('T'), asciistr('��'), chr(84), unistr('\BC1D') from dual;
select lengthc('����Ŭ'), lengthb('����Ŭ'), length('����Ŭ') from dual;

select concat('���ʱ��','Ȱ��'), '����'||'���'||'Ȱ��' from dual;

select ename||':'||job from employee;

--10���ķ� ������ '����'�� ã�� ��ġ�� ǥ���϶�
select instr('�ڹٿ��� ���ڴ� String �̰� �ڹٽ�ũ��Ʈ���� ���ڴ� let�̴�.','����',10) from dual;

select lower('Student Name') from dual;
select UPPER('Student Name') from dual;

--'�ڹ�'�� ã�� 'Java'�� �ٲ� ����϶�
select replace('�ڹٿ��� ���ڴ� String �̰� �ڹٽ�ũ��Ʈ���� ���ڴ� let�̴�.','�ڹ�','Java') from dual;

--'�ڹ�'�� ã�� 'Java'�� �ٲ� ����϶�
select TRANSLATE('�ڹٿ��� ���ڴ� String �̰� �ڹٽ�ũ��Ʈ���� ���ڴ� let�̴�.','�ڹ�','Java') from dual;

select eno, ename, dno from employee where ename = 'scott';
select eno, ename, dno from employee where ename = upper('scott');
select eno, ename, dno from employee where INITCAP(ename) = 'Scott';

--3��° ���ڿ��� ������ 2���ڸ� �ڸ���
select substr('����sw���ʱ��Ȱ��',3,2) from dual;

--����Ʈ ������ �Ųٷ� ������ ���
select reverse('Phython') from dual;

--Java ���ڸ� �����Ͽ� 9����Ʈ�� ä���, �������� �տ� -���
select lpad('Java',9,'-') from dual;

--������ $�� �����ϰ� �������� ���
select ltrim('$$$$$�ڹ�','$') from dual;
select trim(leading '$' from '$$$$$�ڹ�') from dual;

--�������� $�� �����ϰ� �������� ���
select rtrim('�ڹ�$$$$$','$') from dual;
select trim(trailing '$' from '�ڹ�$$$$$') from dual;

--������ $�� �����ϰ� �������� ���
select trim(both '$' from '$$$$$�ڹ�$$$$$') from dual;

--������ ���ڰ� N�� ����� ã�Ƽ� ���
select * from employee where substr(ename, -1, 1) = 'N';

--�ø�, ����, �ݿø�
select ceil(3.14), floor(3.14), round(3.14) from dual;

--�Ҽ��� 2��° �ڸ����� �����ϰ� ���
select trunc(1234.1234,2) from dual;

--���� ��¥�� ���� 5���� ���Ͽ� ���
select add_months('2022/05/24',5) from dual;

--���� ��¥�� ���� 7���� ���� ���
select add_months('2022/05/24',-7) from dual;

--���� ��¥�� ���� +5�� ���Ͽ� ���
select to_date('2022/05/24')+5 from dual;

--���� ��¥ ���� ������ �ϼ��� ���
select last_day('2022/05/24') from dual;

--���� ��¥�� ������ ������ ù��° ����� ���
select next_day('2022/05/24','�����') from dual;

--�б� ������ �ݿø�
select ROUND(to_date('2022/08/24'),'Q') from dual;

select ename, salary, commission, NVL(commission, 0), salary*12+NVL(commission, 0) from employee;

--commission�� ���� null�� �ƴ϶�� ���� ����, �ƴ϶�� ���� ���� ��ȯ
select ename, NVL2(commission, salary*12+commission, salary*12) AS "����" from employee;

--���ǹ� dno�� 10�̸�~ 20�̸�~ 30�̸�~
select ename, dno, decode(dno, 10, '������',
                               20, '�Ѻι�',
                               30, '������',
                               40, '������',
                               '�뵿��') AS "�μ���"
                               from employee;
                               
select ename, dno, case when dno=10 then '������'
                        when dno=20 then '�ѹ���'
                        when dno=30 then '������'
                        when dno=40 then '������'
                        else '�뵿��' end as "�μ���"
                        from employee;