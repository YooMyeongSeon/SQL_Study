--차례대로 아스키값, 아스키값에 해당하는 문자, 유니코드 문자를 유니코드 값, 유니코드 값을 해당 유니코드 문자로 반환
select ASCII('T'), CHR(84), ASCIISTR('천'), UNISTR('\CC9C') from dual;

--차례대로 문자열의 길이, 문자열의 바이트 수, 유니코드 문자열의 길이를 반환
select lengthc('오라클'), lengthb('오라클'), length('오라클') from dual;

--두 개의 문자열을 결합, 두 개 이상의 문자열을 결합하는 함수
select concat('기초기술','활용'), '기초'||'기술'||'활용' from dual;

--INSTR(기준문자열, 찾는문자열, 찾는위치) : 10이후로 나오는 '문자'를 찾아 위치를 표시
select instr('자바에서 문자는 String 이고 자바스크립트에서 문자는 let이다.','문자',10) from dual;

--INSTRB(기준문자열, 찾는문자열, 찾는위치) : 10이후로 나오는 '문자'를 찾아 위치를 바이트 단위로 표시
select INSTRB('자바에서 문자는 String 이고 자바스크립트에서 문자는 let이다.','문자',10) from dual;

--lower : 모든 문자를 소문자로 표시, UPPER : 모든 문자를 대문자로 표시, INITCAP : 단어의 첫글자만 대문자로 표시하고, 다른 문자들은 모두 소문자로 표시
select lower('Student Name') from dual;
select UPPER('Student Name') from dual;
select INITCAP('student name') from dual;

--REPLACE(문자열, 기존문자열, 바꿀문자열) : '자바'를 찾아 'Java'로 바꿔 출력하라
select replace('자바에서 문자는 String 이고 자바스크립트에서 문자는 let이다.','자바','Java') from dual;

--TRANSLATE(문자열, 기존문자열, 바꿀문자열) : REPLACE와는 다르게 한 글자씩만 찾아서 변환
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