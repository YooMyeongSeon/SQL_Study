--������(����) ����(�⺻Ű�� ������ ���� �������� ��ü������ �ߺ��� ���� ���� �����ؼ� ������ �ּ�ȭ�� �� �ִ� ���)
create sequence seq_sample start with 1 increment by 1; --1�� �����Ͽ� 1�� �����ϴ� ������

--�������� �ּ�, �ִ밪, �ٽ� �ݺ� ���� ������ ���� ����(MINVALUE, MAXVALUE, CYCLE)
create sequence seq_sample start with 1 MINVALUE 1 MAXVALUE 9999 cycle;

--�������� ��ȸ
select sequence_name, min_value, max_value, increment_by, cycle_flag from user_sequences;

--���� ������ ���� ��ȸ(�������������� ��� �Ұ���, ó������ �ƹ��� ���� ����.) ��SELECT��, INSERT���� SELECT��,INSERT���� VALUE, UPDATE���� SET���� ��� ����
select seq_sample.currval from dual;

--���� ������ ���� ��ȸ
select seq_sample.nextval from dual;

--������ ���(�÷��� �߰��ϸ� ���� �������� �Է�)
insert into test_table values(seq_sample.nextval, '�����Ͱ�', '�����Ͱ�');

--������ �ɼ��� ����(start with �� ���� �Ұ���)
alter sequence seq_sample increment by 2;

--������ ����
drop sequence seq_sample;

--cache, nocache ���� ��ɾ ����

--�ǹ��� ���� ���Ǵ� ������ ������
create sequence test_sequence nocache;



--�ε���(�ر⺻Ű�� ����ũŰ�� �ڵ����� �ε����� �����ȴ�.)

--������ �ε��� ��ȸ
select index_name, table_name, column_name from user_ind_columns where table_name in('EMPLOYEE', 'DEPARTMENT');

--�ε��� ����
create index idx_employee_ename on employee(ename);

--�ε��� ����
drop index idx_employee_ename; 

--���� �����ּ� ���(���ʴ�� 6�ڸ� ������ ��ü��ȣ, 3�ڸ� ���Ϲ�ȣ, 6�ڸ� ��Ϲ�ȣ, 3�ڸ� ���ȣ)
select ROWID, eno, ename from employee;