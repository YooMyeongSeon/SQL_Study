--테이블의 구조 조회하기
DESC employee;

--가상의 테이블
DESC dual;

--가상의 테이블 : 오늘 날짜를 출력
select sysdate from dual;

--테이블의 모든 정보 조회하기(기본)
SELECT * FROM employee;

--특정 컬럼만 조회
SELECT ename FROM employee;

--여러 컬럼을 조회할 땐 각 컬럼을 구분
SELECT eno, ename FROM employee;

--숫자형 컬럼의 경우 산술연산 가능
SELECT eno, ename, salary*12 FROM employee;

--산술연산시 Null 데이터를 처리하는 함수는 NVL(별칭적용)
SELECT eno, ename, salary*12+NVL(commission, 0) 연봉 FROM employee;
SELECT eno, ename, salary*12+NVL(commission, 0) as "연봉" FROM employee;

--중복 제거시 distinct 를 입력
SELECT distinct dno FROM employee;

--조건이 필요하면 WHERE를 사용
SELECT * FROM employee WHERE ename = 'SMITH';

--문자나 날짜를 비교할 때는 따옴표 사용
SELECT * FROM employee WHERE hiredate > '1981/05/31';

--조건은 논리연산이 가능(AND, OR, NOT)
SELECT * FROM employee WHERE hiredate > '1981/05/31' and salary > 1500;

--BETWEEN A AND B : A와 B사이의 값
SELECT * FROM employee WHERE salary BETWEEN 1000 AND 1500;

--예제 : 급여가 1000 미만이거나 1500초과인 사원을 조회
SELECT * FROM employee WHERE salary<1000 OR salary>1500;
SELECT * FROM employee WHERE NOT(salary>=1000 AND salary<=1500);
SELECT * FROM employee WHERE  salary NOT BETWEEN 1000 AND 1500;

--예제 : 1982년도에 입사한 사원의 정보를 조회
SELECT * FROM employee WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31';

--IN : 불연속적인 값을 조회하기 위한 연산
SELECT * FROM employee WHERE commission IN (300,500,1400);

--문자열 일부 일치 LIKE(%는 글자 개수도 모를때, _는 글자 개수는 알때)
SELECT * FROM employee WHERE ename LIKE 'A%'; --A로 시작하는 사원 조회
SELECT * FROM employee WHERE ename LIKE '%A%'; --A를 포함하는 사원 조회
SELECT * FROM employee WHERE ename LIKE '%A'; --A로 끝나는 사원 조회
SELECT * FROM employee WHERE ename LIKE '_A%'; --이름의 두번째 글자가 A인 사원 조회 
SELECT * FROM employee WHERE ename LIKE '__A%'; --이름의 세번째 글자가 A인 사원 조회 

--NULL 연산
SELECT * FROM employee WHERE commission IS NULL;
SELECT * FROM employee WHERE commission IS NOT NULL;

--정렬하기 
SELECT * FROM employee ORDER BY salary; --기본은 오름차순
SELECT * FROM employee ORDER BY salary ASC;
SELECT * FROM employee ORDER BY salary DESC;