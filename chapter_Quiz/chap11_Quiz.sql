--0.�Ʒ�ǥ������ؼ����̺������弼��. ���̺��(emp01)(��������)
create table emp01(empno number(4),
                   ename varchar2(10),
                   hiredate date);

--1.������̺��ǻ����ȣ���ڵ����λ����ǵ��Ͻ������������Ͻÿ�.(���۰�: 1, ������:1 �ִ밪:100000)
create sequence seq_empno start with 1 increment by 1 maxvalue 100000;
    
--2. �����ȣ���������κ��͹߱޹޾Ƽ����������̺������͸��Է��ϼ���.
--1)����̸�: Julia, �Ի���: sysdate)
insert into emp01 values(seq_empno.nextval, 'Julia', sysdate);

--2)����̸�: Alice�Ի���: 2020/12/31
insert into emp01 values(seq_empno.nextval, 'Alice', to_date('20201231', 'YYYYMMDD'));

--3. EMP01���̺����̸�Į�����ε����μ����ϵ��ε����̸���IDX_EMP01_EName�������ϼ���.\
create index IDX_EMP01_EName on EMP01(ename);