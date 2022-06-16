--CMD : SQLPLUS �����Ͽ� ����

--�ý��� ����
--���� ����(���� ������ ���������� ������ �α����� �� ����.)
create user user_test01 identified by 1234;

--���� �ο�(���ǰ� ���̺� ���� ���� ���� �ο�) : CREATE SESSION : �����ͺ��̽��� ������ �� �ִ� ���� / TABLE : ���̺��� ���� / SEQUENCE : �������� ���� / VIEW : �並 ������ �� �ִ� ����
grant create session, create table to user_test01;

--WITH GRANT OPTION : �������� ������ �ָ� ���� �ο�(������ ������ �ο����� ������ �����ڿ� ���� ������ �ο��� �� �ִ�.)
grant create session, create table to user_test01 WITH GRANT OPTION;

--���� �뷮 �ο�(100�ް�����Ʈ, �𺧷��� ������ �ڵ� �뷮�� �⺻���� �����Ѵ�. )
alter user user_test01 quota 100m on users;
alter user user_test01 default tablespace users;

--������ ��밡�� �� ���̺� �����̽��� Ȯ��(������)
select username, default_tablespace from dba_users where username = user_test01;

--���� ����
revoke create session from user_test01;

--���� ����(��й�ȣ�� �Է��Ѵ�.)
conn user_test01;

--���ӵ� ���� Ȯ��
show user;

--��й�ȣ ����
alter user user_test01 identified by 5678;



--��ü ����

--��ü�� ���� ���̺� ��ȸ ���� �ο�(grant select on ��������.�׺�� to �Ҵ����;)
grant select on test.employee to user_test01;

--PUBLIC : ���� �ο� ���� ����ڵ� �ش� ������ �� �ٸ� ����ڿ��� �Ѱ��� �� �ִ�.
grant create session, create table to PUBLIC;

--���� ����� ���Ѻο� : DBA(��� ����), CONNECT(�⺻), RESOURCE(��ü ����)
grant connect, resource to user_test01;

--�ڽſ��� �ο��� �� Ȯ��
select * from user_role_privs;

--�ѿ� �ο��� ���̺�� ���õ� ���� ������ �˷��ִ� ������ ����
select from role_tab_privs;

--�� ����(������)
create role test_Role;
grant create session, create table, create view to test_Role;
grant test_Role to user_test01;

--�� ����
DROP ROLE test_Role;