--������ ���Ἲ(��Ȯ��, �ϰ���, ��ȿ��)�� ���� ����
--1. ��ü ���Ἲ : ��� ���̺��� �⺻Ű�� ���õ� �ʵ带 �������Ѵ�.
--2. ���� ���Ἲ : �������迡 �ִ� �� ���̺��� �����ʹ� �׻� �ϰ��� ���� ������ �Ѵ�.

--�������� : NOT NULL(null���� ���� �� ����, ���� ������ �����ؾ� �Ѵ�.)
create table customer(
    id varchar2(20) not null,
    pwd varchar2(20) not null,
    name varchar2(20) not null);

--�������� : UNIQUE(�ش� �÷��� �ϳ��� ������ ���� ������ �Ѵ�.) ��null�� ����Ѵ�.
create table customer(
    id varchar2(20) UNIQUE not null, --2���� ���� ����ϴ� ��찡 ����, �⺻Ű�� �����ϴ�.
    pwd varchar2(20) not null,
    name varchar2(20) not null);

--���������� �̸��� ������ ���� �ִ� : CONSTRAINT
create table customer(
    id varchar2(20) CONSTRAINT customer_id_uk UNIQUE not null,
    pwd varchar2(20) not null,
    name varchar2(20) not null);

--���������� �̸��� �˻� ����
select table_name, CONSTRAINT_name from user_CONSTRAINTS where table_name in ('customer');     

--�������� : PRIMARY KEY(�⺻Ű, ���̺�� �ϳ��� �����ϸ�, ������ ���� ������ �ߺ��� �� ���� null���� ������� �ʴ´�. ��� ���̺� ����Ǵ� �ʼ� ����̴�.)
create table customer(
    id varchar2(20) primary key, --���� �����Ϳ��� ������� ���� �ʴ°� �Ϲ����̴�.
    pwd varchar2(20) not null,
    name varchar2(20) not null);

--�������� : FOREIGN KEY(�ܷ�Ű, ���� ���Ἲ�� ���� ���������� �����ϸ�, �θ� ���̺��� �ʿ��ϴ�, ���� ���̺��� ������ �� ���߿� �߰��Ѵ�.)
create table Student( --�θ� ���̺�
    stuno varchar2(20) CONSTRAINT student_id_pk primary key,
    name varchar2(20) CONSTRAINT student_name_nn not null,
    major varchar2(20));
    
create table registration( --�ڽ����̺�
    enrollid varchar2(20) CONSTRAINT registration_enrollid_pk primary key,
    stuno varchar2(20),
    subject varchar2(20) CONSTRAINT registration_subject_nn not null,
    CONSTRAINT registration_stuno_fk foreign key(stuno) references Student(stuno));

--�������� : CHECK(���� ������ �������� ������ ������ �����Ѵ�.)
create table customer(
    id varchar2(20) CONSTRAINT customer_id_uk primary key,
    pwd varchar2(20) CONSTRAINT customer_pwn_nn not null,
    name varchar2(20) CONSTRAINT customer_name_nn not null,
    jumsu number(3) CONSTRAINT customer_jumsu_range check(0 <= jumsu and jumsu <= 100)); --���� ���� ��ü�� �θ� ���̺��� �⺻Ű�� �Ǵ°��̴�.

--������ �ٸ��� �Ͽ� �� �ڿ� �߰��ؼ� �� ���� �ִ�.
create table customer(
    id varchar2(20),
    pwd varchar2(20) CONSTRAINT customer_pwn_nn not null,
    name varchar2(20) CONSTRAINT customer_name_nn not null,
    jumsu number(3) CONSTRAINT customer_jumsu_range check(0 <= jumsu and jumsu <= 100),
    CONSTRAINT customer_id_uk primary key(id));
    
--�������� : DEFAULT(���� �Է����� ������ �⺻���� �Էµǰ� �����, �ַ� ��¥�� �Է��� �� ���ȴ�.)
create table customer(
    id varchar2(20) CONSTRAINT customer_id_uk primary key,
    pwd varchar2(20) CONSTRAINT customer_name_nn not null,
    name varchar2(20) default 'ȫ�浿');
     
--�������� �߰� : ADD
alter table reg_copy add CONSTRAINT reg_copy_stuno_fk foreign key(stuno) references Student(stuno);
alter table stu_copy add CONSTRAINT stu_copy_id_pk primary key(stuno);
alter table reg_copy add CONSTRAINT reg_copy_enrollid_pk primary key(enrollid);

--�������� ���� : MODIFY
alter table stu_copy MODIFY major CONSTRAINT stu_copy_major_nn not null;

--�������� ���� : DROP
alter table stu_copy DROP primary key;
alter table stu_copy DROP CONSTRAINT stu_copy_major_nn;

--�ܷ�Ű�� ��� �θ� ���̺��� �⺻Ű�� ����� ���迡 �ִ� �ڽ� ���̺��� Ű�� ������ �� �ִ�.(cascade)
alter table stu_copy DROP primary key cascade;

--�������� ��Ȱ��ȭ
alter table reg_copy disable CONSTRAINT reg_copy_stuno_fk;

--�������� Ȱ��ȭ
alter table reg_copy enable CONSTRAINT reg_copy_stuno_fk;

--Ȱ��ȭ �ϴ� �������� ������ �� ��� novalidate�� ���� ������ �����ϰ� ���� �� ���� ������ ���� �ִ�.
alter table reg_copy enable novalidate CONSTRAINT reg_copy_stuno_fk;