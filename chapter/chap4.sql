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

--SUBSTR(문자열, 시작위치, 길이) : 시작 위치에서 길이만큼 문자열 반환(3번째 글자에서 시작해 2글자로 자르기)
select substr('응용sw기초기술활용', 3, 2) from dual;

--REVERSE(문자열) : 바이트 단위로 거꾸로 뒤집어 출력
select reverse('Phython') from dual;

--LPAD(문자열, 길이, 왼쪽으로 채울 문자) : Java 글자를 포함하여 9바이트를 채우고, 나머지는 -출력
select lpad('Java',9,'-') from dual;

--RPAD(문자열, 길이, 오른쪽으로 채울 문자) : Java 글자를 포함하여 9바이트를 채우고, 나머지는 -출력
select Rpad('Java',9,'-') from dual;

--LTRIM(문자열, 제거할 문자) : 왼쪽의 $를 제거하고 나머지만 출력
select ltrim('$$$$$자바','$') from dual;

--RTRIM(문자열, 제거할 문자) : 오른쪽의 $를 제거하고 나머지만 출력
select Rtrim('자바$$$$$','$') from dual;

--TRIM(제거할방향 제거할문자, FROM 문자열) : 문자열의 왼쪽, 오른쪽의 제거할 문자열을 제거, 방향 생략시 양쪽 모두, 제거할 문자열이 없으면 공백을 제거) / 방향 : LEADING(왼쪽), TRAILING(오른쪽), BOTH(양쪽)
select trim(leading '$' from '$$$$$자바') from dual;

--REGEXP_COUNT(문자열, 문자) : 문자열에서 문자의 갯수를 출력
select REGEXP_COUNT('자바스크립트', '자바') from dual;

--수학, 숫자 함수 : 차례대로 올림, 내림, 반올림
select ceil(3.14), floor(3.14), round(3.14) from dual;

--TRUNC(실수, 정수) : 실수를 정수 자리까지 절삭하고 출력
select trunc(1234.1234, 2) from dual;

--ADD_MONTHS(날짜, 숫자) : 날짜에 숫자만큼의 개월 수를 더한다.(빼기 가능)
select add_months('2022/05/24',5) from dual;

--LAST_DAY(날짜) : 기준 날짜 달의 마지막 일수를 출력
select last_day('2022/05/24') from dual;

--NEXT_DAY(날짜, '요일') : 기준 날짜를 지나서 나오는 첫번째 요일의 일수 출력
select next_day('2022/05/24','목요일') from dual;

--ROUND(날짜, 포맷) : 포멧에 따라 반올림 / CC : 연도의 끝 두자리를 기준, Q : 분기한 분기, MM : 월 기준, D : 일 기준, HH : 시 기준, MI :  분 기준 반올림
select ROUND(to_date('2022/08/24'),'Q') from dual;


--NVL(컬럼명(표현식), 대체데이터) : 해당 컬럼의 데이터가 NULL이면 대체 데이터로 변환해서 사용
select ename, salary, commission, NVL(commission, 0), salary*12+NVL(commission, 0) from employee;

--NVL2(컬럼명, 데이터1, 데이터2) : 해당 컬럼의 데이터가 NULL이면 데이터2반환, 아니면 데이터1 반환
select ename, NVL2(commission, salary*12+commission, salary*12) AS "연봉" from employee;

--DECODE(표현식, 조건1, 결과1, 조건2, 결과2, 기본 결과); : 표현식의 값이 조건1과 일치하면 결과1, 결과 2와 일치하면 결과 2, 일치하지 않으면 기본 결과 반환
select ename, dno, decode(dno, 10, '교육부',
                               20, '총부무',
                               30, '재정부',
                               40, '복지부',
                               '노동부') AS "부서명"
                               from employee;
             
--CASE WHEN 조건1 THEN 결과 WHEN 조건2 THEN 결과 ELSE 기본 결과 END : IF문, ELSE문의 형태
select ename, dno, case when dno=10 then '교육부'
                        when dno=20 then '총무부'
                        when dno=30 then '재정부'
                        when dno=40 then '복지부'
                        else '노동부' end as "부서명"
                        from employee;