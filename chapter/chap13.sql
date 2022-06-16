--CMD : SQLPLUS 접속하여 진행

--시스템 권한
--유저 생성(연결 권한을 설정해주지 않으면 로그인할 수 없다.)
create user user_test01 identified by 1234;

--권한 부여(세션과 테이블에 대한 생성 권한 부여) : CREATE SESSION : 데이터베이스에 연결할 수 있는 권한 / TABLE : 테이블을 생성 / SEQUENCE : 시퀀스를 생성 / VIEW : 뷰를 생성할 수 있는 권한
grant create session, create table to user_test01;

--WITH GRANT OPTION : 관리자의 권한을 주며 권한 부여(관리자 권한을 부여받은 계정은 관리자와 같은 권한을 부여할 수 있다.)
grant create session, create table to user_test01 WITH GRANT OPTION;

--저장 용량 부여(100메가바이트, 디벨로퍼 에서는 자동 용량을 기본으로 지정한다. )
alter user user_test01 quota 100m on users;
alter user user_test01 default tablespace users;

--계정이 사용가능 한 테이블 스페이스를 확인(관리자)
select username, default_tablespace from dba_users where username = user_test01;

--권한 제거
revoke create session from user_test01;

--유저 접속(비밀번호를 입력한다.)
conn user_test01;

--접속된 유저 확인
show user;

--비밀번호 변경
alter user user_test01 identified by 5678;



--객체 권한

--객체에 대한 테이블 조회 권한 부여(grant select on 소유계정.테블명 to 할당계정;)
grant select on test.employee to user_test01;

--PUBLIC : 권한 부여 받은 사용자도 해당 권한을 또 다른 사용자에게 넘겨줄 수 있다.
grant create session, create table to PUBLIC;

--롤을 사용한 권한부여 : DBA(모든 권한), CONNECT(기본), RESOURCE(객체 생성)
grant connect, resource to user_test01;

--자신에게 부여된 롤 확인
select * from user_role_privs;

--롤에 부여된 테이블과 관련된 권한 정보를 알려주는 데이터 사전
select from role_tab_privs;

--롤 생성(관리자)
create role test_Role;
grant create session, create table, create view to test_Role;
grant test_Role to user_test01;

--롤 삭제
DROP ROLE test_Role;