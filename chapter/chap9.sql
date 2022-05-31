--DDL(데이터 정의어) : 테이블 제어

--테이블 생성 : CREATE(3개의 컬럼과 타입을 정의하고 생성)
create table dept2(
    dno NUMBER(2),
    dname VARCHAR2(14),
    LOC VARCHAR2(13));
    
--기존 테이블의 정보를 가져와 새로운 테이블을 생성(수식이 들어간 컬럼은 별칭을 반드시 지정)
create table dept3 as select eno, ename, salary*12 연봉 from employee where dno = 20;

--테이블 변경 : ALTER, MODIFY, DROP

--테이블 컬럼 추가 : alter table 테이블명 add(컬럼명, 타입(크기));
alter table dept3 add(birth, date);

--복수의 컬럼 추가
alter table dept3 add(addr VARCHAR2(100), phone VARCHAR2(13));

--테이블 컬럼 변경 : alter table 테이블명 modify(컬럼명, 타입(크기));
alter table dept3 MODIFY addr VARCHAR2(500);

--복수의 컬럼 변경
alter table dept3 MODIFY(addr VARCHAR2(500), phone VARCHAR2(14));

--컬럼의 이름 변경
alter table dept3 rename column addr to ADDRESS;

--테이블의 이름 변경
rename dept3 to dept30;

--테이블 컬럼 제거 : alter table 테이블명 DROP COLUMN 컬럼명;
alter table dept30 drop column phone;

--테이블 컬럼 비활성화 : 사용자가 사용중인 경우 일시적으로 빠르게 업무처리를 하기위해 사용한다.
alter table dept30 set unused(address);

--비활성화 테이블 완전 삭제 : 사용자가 사용을 하지 않을 때 비활성화된 컬럼을 삭제한다.
alter table dept30 drop unused COLUMNS;

--테이블 삭제
drop table dept30;

--테이블의 모든 레코드(데이터, 내용)만 삭제하고 컬럼은 유지(내용을 먼저 삭제하고 테이블을 삭제하는 것이 효율적이다.)
truncate table dept30;

--데이터 사전 : 시스템 계정으로 접속하여 조회
select table_name from user_tables; --사용자가 소유한 테이블의 정보 조회
--SEQUENCES, INDEXES, VIEWS : 사용자가 소유한 시퀀스, 인덱스, 뷰 정보

select ownnr, table_name from all_tables; --모든 테이블의 정보 조회
--조회중인 객체의 소유권 확인 가능    
    
select ownnr, table_name from dna_tables; --시스템 관리와 관련된 뷰
--시스템 관리자만 접근 가능