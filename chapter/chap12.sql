--시퀀스(숫자) 생성(기본키가 유일한 값을 가지도록 자체적으로 중복이 없는 값을 생성해서 오류를 최소화할 수 있는 기능)
create sequence seq_sample start with 1 increment by 1; --1로 시작하여 1씩 증가하는 시퀀스

--시퀀스의 최소, 최대값, 다시 반복 등을 지정할 수도 있음(MINVALUE, MAXVALUE, CYCLE)
create sequence seq_sample start with 1 MINVALUE 1 MAXVALUE 9999 cycle;

--시퀀스를 조회
select sequence_name, min_value, max_value, increment_by, cycle_flag from user_sequences;

--현재 시퀀스 값을 조회(서브쿼리에서는 사용 불가능, 처음에는 아무런 값이 없다.) ※SELECT문, INSERT문의 SELECT문,INSERT문의 VALUE, UPDATE문의 SET에서 사용 가능
select seq_sample.currval from dual;

--다음 시퀀스 값을 조회
select seq_sample.nextval from dual;

--시퀀스 사용(컬럼을 추가하며 값에 시퀀스를 입력)
insert into test_table values(seq_sample.nextval, '데이터값', '데이터값');

--시퀀스 옵션을 수정(start with 은 수정 불가능)
alter sequence seq_sample increment by 2;

--시퀀스 제거
drop sequence seq_sample;

--cache, nocache 등의 명령어도 존재

--실무에 자주 사용되는 시퀀스 생성법
create sequence test_sequence nocache;



--인덱스(※기본키와 유니크키는 자동으로 인덱스가 생성된다.)

--생성된 인덱스 조회
select index_name, table_name, column_name from user_ind_columns where table_name in('EMPLOYEE', 'DEPARTMENT');

--인덱스 생성
create index idx_employee_ename on employee(ename);

--인덱스 삭제
drop index idx_employee_ename; 

--실제 물리주소 출력(차례대로 6자리 데이터 객체번호, 3자리 파일번호, 6자리 블록번호, 3자리 행번호)
select ROWID, eno, ename from employee;