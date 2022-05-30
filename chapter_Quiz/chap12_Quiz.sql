--0.아래표를사용해서테이블을만드세요. 테이블명(emp01)(파일참조)
create table emp01(empno number(4),
                   ename varchar2(10),
                   hiredate date);

--1.사원테이블의사원번호가자동으로생성되도록시퀀스를생성하시오.(시작값: 1, 증가값:1 최대값:100000)
create sequence seq_empno start with 1 increment by 1 maxvalue 100000;
    
--2. 사원번호를시퀀스로부터발급받아서오른쪽테이블에데이터를입력하세요.
--1)사원이름: Julia, 입사일: sysdate)
insert into emp01 values(seq_empno.nextval, 'Julia', sysdate);

--2)사원이름: Alice입사입: 2020/12/31
insert into emp01 values(seq_empno.nextval, 'Alice', to_date('20201231', 'YYYYMMDD'));

--3. EMP01테이블의이름칼럼을인덱스로설정하되인덱스이름을IDX_EMP01_EName로지정하세요.\
create index IDX_EMP01_EName on EMP01(ename);