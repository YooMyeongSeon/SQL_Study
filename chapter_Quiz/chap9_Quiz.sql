--1. ����ǥ����õȴ��DEPT ���̺��������ϼ���(��������)
create table DEPT(
    dno NUMBER(2),
    dname VARCHAR2(14),
    LOC VARCHAR2(13));

--2. ����ǥ����õȴ��EMP ���̺��������ϼ���.(��������)
create table EMP(
    eno NUMBER(4),
    ename VARCHAR2(10),
    dno NUMBER(2));

--3. ���̸��������Ҽ��ֵ���EMP���̺��������ϼ���.(ENAMEĮ��)(��������)
alter table EMP modify ename varchar2(25);

--4. EMPLOYEE���̺��������ؼ�EMPLOYEE2���̸������̺��������ϵǻ����ȣ, �̸�, �޿�, �μ���ȣĮ���������ϰ���λ�����Į����������EMP_ID, NAME, SAL, DEPT_ID�������ϼ���,
create table EMPLOYEE2 as select eno EMP_ID, ename NAME, salary SAL, dno DEPT_ID from EMPLOYEE;
create table EMPLOYEE2(EMP_ID, NAME, SAL, DEPT_ID) as select eno, ename, salary, dno from EMPLOYEE;

--5. EMP ���̺��������ϼ���
drop table EMP;

--6. EMPLOYEE2���̺����̸���EMP�κ����ϼ���
rename EMPLOYEE2 to EMP;

--7. DEPT ���̺���DNAME Į���������ϼ���
alter table DEPT drop column DNAME;

--8. DEPT ���̺���LOCĮ����UNUSED��ǥ���ϼ���.
alter table DEPT set UNUSED(LOC);

--9. UNUSED Į������������ϼ���
alter table DEPT drop unused COLUMNS;