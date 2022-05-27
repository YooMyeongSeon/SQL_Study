--�������� �ε���

--������(����) ����(�⺻Ű�� ������ ���� �������� ��ü������ �ߺ��� ���� ���� �����ؼ� ������ �ּ�ȭ�� �� �ִ� ���)
create sequence seq_sample start with 1 increment by 1; --1�� �����Ͽ� 1�� �����ϴ� ������

--�������� �ּ�, �ִ밪, �ٽ� �ݺ� ���� ������ ���� ����(MINVALUE, MAXVALUE, cycle)
create sequence seq_sample start with 1 MINVALUE 1 MAXVALUE 9999 cycle;

--�������� ��ȸ
select sequence_name, min_value, max_value, increment_by, cycle_flag from user_sequences;

--���� ������ ���� ��ȸ(�������������� ��� �Ұ���)
select seq_sample.currval from dual;

--���� ������ ���� ��ȸ
select seq_sample.nextval from dual;

--������ ���(�÷��� �߰��ϸ� ���� �������� �Է�)
insert into test_table values(seq_sample.nextval, '�����Ͱ�', '�����Ͱ�');

--������ ���� ����(start with �� ���� �Ұ���)
alter sequence seq_sample increment by 2;

--������ ����
drop sequence seq_sample;

--�ǹ��� ���� ���Ǵ� ������ ������
create sequence test_sequence nocache;

--cache, nocache