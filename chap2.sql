DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;
DROP TABLE SALGRADE;

CREATE TABLE DEPARTMENT
        (DNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
         DNAME VARCHAR2(14),
	 LOC   VARCHAR2(13) ) ;
CREATE TABLE EMPLOYEE 
        (ENO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	 ENAME VARCHAR2(10),
 	 JOB   VARCHAR2(9),
	 MANAGER  NUMBER(4),
	 HIREDATE DATE,
	 SALARY NUMBER(7,2),
	 COMMISSION NUMBER(7,2),
	 DNO NUMBER(2) CONSTRAINT FK_DNO REFERENCES DEPARTMENT);
CREATE TABLE SALGRADE
        (GRADE NUMBER,
	 LOSAL NUMBER,
	 HISAL NUMBER );

INSERT INTO DEPARTMENT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPARTMENT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPARTMENT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPARTMENT VALUES (40,'OPERATIONS','BOSTON');

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','CLERK',    7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7499,'ALLEN','SALESMAN', 7698,to_date('20-2-1981', 'dd-mm-yyyy'),1600,300,30);
INSERT INTO EMPLOYEE VALUES
(7521,'WARD','SALESMAN',  7698,to_date('22-2-1981', 'dd-mm-yyyy'),1250,500,30);
INSERT INTO EMPLOYEE VALUES
(7566,'JONES','MANAGER',  7839,to_date('2-4-1981',  'dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981', 'dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMPLOYEE VALUES
(7698,'BLAKE','MANAGER',  7839,to_date('1-5-1981',  'dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7782,'CLARK','MANAGER',  7839,to_date('9-6-1981',  'dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7788,'SCOTT','ANALYST',  7566,to_date('13-07-1987', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7839,'KING','PRESIDENT', NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981',  'dd-mm-yyyy'),1500,0,30);
INSERT INTO EMPLOYEE VALUES
(7876,'ADAMS','CLERK',    7788,to_date('13-07-1987', 'dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7900,'JAMES','CLERK',    7698,to_date('3-12-1981', 'dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7902,'FORD','ANALYST',   7566,to_date('3-12-1981', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7934,'MILLER','CLERK',   7782,to_date('23-1-1982', 'dd-mm-yyyy'),1300,NULL,10);

INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

COMMIT;


-----------------------------------------------------------------------
DESC EMPLOYEE;

SELECT sysdate FROM dual;

SELECT * FROM employee;

SELECT eno, ename, job, manager, hiredate, salary, commission, dno FROM green.employee;

SELECT ename, salary, salary*12 FROM employee;

SELECT ename, salary, salary*12+commission FROM employee;

SELECT ename, salary, salary*12+NVL(commission,0) AS "연 봉" FROM employee;

SELECT DNO FROM employee;

SELECT DISTINCT DNO FROM employee;
   
   SELECT ename,salary FROM employee WHERE ename='SMITH';
-- 알고싶다, 이름과 급여를    사원테이블에 있는  이름이 스미스인 사람

SELECT * FROM employee WHERE salary <= 1500;

SELECT * 
FROM employee 
WHERE ename!='SMITH';

SELECT * FROM employee WHERE  NOT hiredate <= '1981/05/31' OR salary >= 1200;

-- 급여가 1000에서 1500 사이인 사원을 조회  (BETWEEN A AND B : A와 B사이의 값)
SELECT * FROM employee WHERE salary>=1000 AND salary<=1500;

SELECT * FROM employee WHERE salary BETWEEN 1000 AND 1500;

-- 급여가 1000 미만이거나 1500초과인 사원을 조회
SELECT * FROM employee WHERE salary<1000 OR salary>1500;
SELECT * FROM employee WHERE NOT(salary>=1000 AND salary<=1500);

SELECT * FROM employee WHERE  salary NOT BETWEEN 1000 AND 1500;

-- 1981년도에 입사한 사원의 정보를 조회  => SQL
SELECT * FROM employee WHERE hiredate BETWEEN '1981/01/01' AND '1981/12/31';

-- 커미션이 300이거나 500이거나 1400인 사원을 조회  (IN 조건중에 일치하는 것)
SELECT * FROM employee WHERE commission=300 OR commission=500 OR commission=1400;
SELECT * FROM employee WHERE commission IN (300,500,1400);

--  (IS NULL  값이 null인 것)
SELECT * FROM employee WHERE commission IS NULL;

SELECT * FROM employee WHERE commission IS NOT NULL;

-- 문자열 일부 일치  LIKE
SELECT * FROM employee WHERE ename LIKE '%A%';
 -- %는 글자 개수도 모를때
 --  _는 글자 개수는 알때
SELECT * FROM employee WHERE ename LIKE '__A%';
 
SELECT * FROM employee 
WHERE salary>=1200
ORDER BY job DESC, salary ASC;

--------------------------------------------------------------------------------
select ename, hiredate, to_char(hiredate, 'YY-MM'), to_char(hiredate, 'YYYY/MM/DD DAY') from employee;
select ename, hiredate from employee where hiredate = to_date(19811117, 'YYYYMMDD');

select ascii('T'), asciistr('밝'), chr(84), unistr('\BC1D') from dual;
select lengthc('오라클'), lengthb('오라클'), length('오라클') from dual;

select concat('기초기술','활용'), '기초'||'기술'||'활용' from dual;

select ename||':'||job from employee;

--10이후로 나오는 '문자'를 찾아 위치를 표시하라
select instr('자바에서 문자는 String 이고 자바스크립트에서 문자는 let이다.','문자',10) from dual;

select lower('Student Name') from dual;
select UPPER('Student Name') from dual;

--'자바'를 찾아 'Java'로 바꿔 출력하라
select replace('자바에서 문자는 String 이고 자바스크립트에서 문자는 let이다.','자바','Java') from dual;

--'자바'를 찾아 'Java'로 바꿔 출력하라
select TRANSLATE('자바에서 문자는 String 이고 자바스크립트에서 문자는 let이다.','자바','Java') from dual;

select eno, ename, dno from employee where ename = 'scott';
select eno, ename, dno from employee where ename = upper('scott');
select eno, ename, dno from employee where INITCAP(ename) = 'Scott';

--3번째 글자에서 시작해 2글자를 자르기
select substr('응용sw기초기술활용',3,2) from dual;

--바이트 단위로 거꾸로 뒤집어 출력
select reverse('Phython') from dual;

--Java 글자를 포함하여 9바이트를 채우고, 나머지는 앞에 -출력
select lpad('Java',9,'-') from dual;

--왼쪽의 $를 제거하고 나머지만 출력
select ltrim('$$$$$자바','$') from dual;
select trim(leading '$' from '$$$$$자바') from dual;

--오른쪽의 $를 제거하고 나머지만 출력
select rtrim('자바$$$$$','$') from dual;
select trim(trailing '$' from '자바$$$$$') from dual;

--양쪽의 $를 제거하고 나머지만 출력
select trim(both '$' from '$$$$$자바$$$$$') from dual;

--마지막 글자가 N인 사람을 찾아서 출력
select * from employee where substr(ename, -1, 1) = 'N';

--올림, 내림, 반올림
select ceil(3.14), floor(3.14), round(3.14) from dual;

--소숫점 2번째 자리까지 절삭하고 출력
select trunc(1234.1234,2) from dual;

--기준 날짜로 부터 5개월 더하여 출력
select add_months('2022/05/24',5) from dual;

--기준 날짜로 부터 7개월 빼고 출력
select add_months('2022/05/24',-7) from dual;

--기준 날짜로 부터 +5일 더하여 출력
select to_date('2022/05/24')+5 from dual;

--기준 날짜 달의 마지막 일수를 출력
select last_day('2022/05/24') from dual;

--기준 날짜를 지나서 나오는 첫번째 목요일 출력
select next_day('2022/05/24','목요일') from dual;

--분기 단위로 반올림
select ROUND(to_date('2022/08/24'),'Q') from dual;

select ename, salary, commission, NVL(commission, 0), salary*12+NVL(commission, 0) from employee;

--commission의 값이 null이 아니라면 앞의 계산식, 아니라면 뒤의 계산식 반환
select ename, NVL2(commission, salary*12+commission, salary*12) AS "연봉" from employee;

--조건문 dno가 10이면~ 20이면~ 30이면~
select ename, dno, decode(dno, 10, '교육부',
                               20, '총부무',
                               30, '재정부',
                               40, '복지부',
                               '노동부') AS "부서명"
                               from employee;
                               
select ename, dno, case when dno=10 then '교육부'
                        when dno=20 then '총무부'
                        when dno=30 then '재정부'
                        when dno=40 then '복지부'
                        else '노동부' end as "부서명"
                        from employee;