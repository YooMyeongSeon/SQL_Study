--데이터 무결성(정확성, 일관성, 유효성)과 제약 조건
--1. 개체 무결성 : 모든 테이블은 기본키로 선택된 필드를 가져야한다.
--2. 참조 무결성 : 참조관계에 있는 두 테이블의 데이터는 항상 일관된 값을 가져야 한다.

--제약조건 : NOT NULL(null값이 들어올 수 없고, 값이 무조건 존재해야 한다.)
create table customer(
    id varchar2(20) not null,
    pwd varchar2(20) not null,
    name varchar2(20) not null);

--제약조건 : UNIQUE(해당 컬럼은 하나의 고유한 값을 가져야 한다.) ※null은 허용한다.
create table customer(
    id varchar2(20) UNIQUE not null, --2개를 같이 사용하는 경우가 많다, 기본키와 동일하다.
    pwd varchar2(20) not null,
    name varchar2(20) not null);

--제약조건의 이름을 지정할 수도 있다 : CONSTRAINT
create table customer(
    id varchar2(20) CONSTRAINT customer_id_uk UNIQUE not null,
    pwd varchar2(20) not null,
    name varchar2(20) not null);

--제약조건의 이름도 검색 가능
select table_name, CONSTRAINT_name from user_CONSTRAINTS where table_name in ('customer');     

--제약조건 : PRIMARY KEY(기본키, 테이블당 하나만 존재하며, 고유한 값을 가지고 중복될 수 없고 null값을 허용하지 않는다. 모든 테이블에 적용되는 필수 요소이다.)
create table customer(
    id varchar2(20) primary key, --실제 데이터에는 영향력을 주지 않는게 일반적이다.
    pwd varchar2(20) not null,
    name varchar2(20) not null);

--제약조건 : FOREIGN KEY(외래키, 참조 무결성을 위한 제약조건을 생성하며, 부모 테이블이 필요하다, 보통 테이블을 생성한 후 나중에 추가한다.)
create table Student( --부모 테이블
    stuno varchar2(20) CONSTRAINT student_id_pk primary key,
    name varchar2(20) CONSTRAINT student_name_nn not null,
    major varchar2(20));
    
create table registration( --자식테이블
    enrollid varchar2(20) CONSTRAINT registration_enrollid_pk primary key,
    stuno varchar2(20),
    subject varchar2(20) CONSTRAINT registration_subject_nn not null,
    CONSTRAINT registration_stuno_fk foreign key(stuno) references Student(stuno));

--제약조건 : CHECK(저장 가능한 데이터의 범위나 조건을 정의한다.)
create table customer(
    id varchar2(20) CONSTRAINT customer_id_uk primary key,
    pwd varchar2(20) CONSTRAINT customer_pwn_nn not null,
    name varchar2(20) CONSTRAINT customer_name_nn not null,
    jumsu number(3) CONSTRAINT customer_jumsu_range check(0 <= jumsu and jumsu <= 100)); --제약 조건 자체가 부모 테이블의 기본키가 되는것이다.

--문법을 다르게 하여 맨 뒤에 추가해서 쓸 수도 있다.
create table customer(
    id varchar2(20),
    pwd varchar2(20) CONSTRAINT customer_pwn_nn not null,
    name varchar2(20) CONSTRAINT customer_name_nn not null,
    jumsu number(3) CONSTRAINT customer_jumsu_range check(0 <= jumsu and jumsu <= 100),
    CONSTRAINT customer_id_uk primary key(id));
    
--제약조건 : DEFAULT(값을 입력하지 않으면 기본값을 입력되게 만든다, 주로 날짜를 입력할 때 사용된다.)
create table customer(
    id varchar2(20) CONSTRAINT customer_id_uk primary key,
    pwd varchar2(20) CONSTRAINT customer_name_nn not null,
    name varchar2(20) default '홍길동');
     
--제약조건 추가 : ADD
alter table reg_copy add CONSTRAINT reg_copy_stuno_fk foreign key(stuno) references Student(stuno);
alter table stu_copy add CONSTRAINT stu_copy_id_pk primary key(stuno);
alter table reg_copy add CONSTRAINT reg_copy_enrollid_pk primary key(enrollid);

--제약조건 수정 : MODIFY
alter table stu_copy MODIFY major CONSTRAINT stu_copy_major_nn not null;

--제약조건 제거 : DROP
alter table stu_copy DROP primary key;
alter table stu_copy DROP CONSTRAINT stu_copy_major_nn;

--외래키의 경우 부모 테이블의 기본키를 지우면 관계에 있는 자식 테이블의 키도 삭제할 수 있다.(cascade)
alter table stu_copy DROP primary key cascade;

--제약조건 비활성화
alter table reg_copy disable CONSTRAINT reg_copy_stuno_fk;

--제약조건 활성화
alter table reg_copy enable CONSTRAINT reg_copy_stuno_fk;

--활성화 하는 과정에서 오류가 날 경우 novalidate를 통해 오류를 무시하고 다음 값 부터 적용할 수도 있다.
alter table reg_copy enable novalidate CONSTRAINT reg_copy_stuno_fk;