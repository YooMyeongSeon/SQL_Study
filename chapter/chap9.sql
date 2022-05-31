--DDL(������ ���Ǿ�) : ���̺� ����

--���̺� ���� : CREATE(3���� �÷��� Ÿ���� �����ϰ� ����)
create table dept2(
    dno NUMBER(2),
    dname VARCHAR2(14),
    LOC VARCHAR2(13));
    
--���� ���̺��� ������ ������ ���ο� ���̺��� ����(������ �� �÷��� ��Ī�� �ݵ�� ����)
create table dept3 as select eno, ename, salary*12 ���� from employee where dno = 20;

--���̺� ���� : ALTER, MODIFY, DROP

--���̺� �÷� �߰� : alter table ���̺�� add(�÷���, Ÿ��(ũ��));
alter table dept3 add(birth, date);

--������ �÷� �߰�
alter table dept3 add(addr VARCHAR2(100), phone VARCHAR2(13));

--���̺� �÷� ���� : alter table ���̺�� modify(�÷���, Ÿ��(ũ��));
alter table dept3 MODIFY addr VARCHAR2(500);

--������ �÷� ����
alter table dept3 MODIFY(addr VARCHAR2(500), phone VARCHAR2(14));

--�÷��� �̸� ����
alter table dept3 rename column addr to ADDRESS;

--���̺��� �̸� ����
rename dept3 to dept30;

--���̺� �÷� ���� : alter table ���̺�� DROP COLUMN �÷���;
alter table dept30 drop column phone;

--���̺� �÷� ��Ȱ��ȭ : ����ڰ� ������� ��� �Ͻ������� ������ ����ó���� �ϱ����� ����Ѵ�.
alter table dept30 set unused(address);

--��Ȱ��ȭ ���̺� ���� ���� : ����ڰ� ����� ���� ���� �� ��Ȱ��ȭ�� �÷��� �����Ѵ�.
alter table dept30 drop unused COLUMNS;

--���̺� ����
drop table dept30;

--���̺��� ��� ���ڵ�(������, ����)�� �����ϰ� �÷��� ����(������ ���� �����ϰ� ���̺��� �����ϴ� ���� ȿ�����̴�.)
truncate table dept30;

--������ ���� : �ý��� �������� �����Ͽ� ��ȸ
select table_name from user_tables; --����ڰ� ������ ���̺��� ���� ��ȸ
--SEQUENCES, INDEXES, VIEWS : ����ڰ� ������ ������, �ε���, �� ����

select ownnr, table_name from all_tables; --��� ���̺��� ���� ��ȸ
--��ȸ���� ��ü�� ������ Ȯ�� ����    
    
select ownnr, table_name from dna_tables; --�ý��� ������ ���õ� ��
--�ý��� �����ڸ� ���� ����