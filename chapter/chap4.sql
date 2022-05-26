--형변환 함수 : 날짜로 변환('문자', '포멧')의 형식이지만 형식을 생략하면 기본(YY/MM/DD)으로 인식
select ename, hiredate from employee where hiredate = to_date('19811117', 'YYYYMMDD');
select ename, hiredate from employee where hiredate = to_date('811117');

--숫자로 변환('문자', '포멧')
select to_number('100,000', '999,999') - to_number('50,000', '999,999') from dual;
select to_number('100000') - to_number('50000') from dual;

--문자로 변환('문자', '포멧')
select ename, hiredate, to_char(hiredate, 'YY-MM'), to_char(hiredate, 'YYYY/MM/DD DAY') from employee;

--CAST(표현식 AS 데이터 형식) :  표현식을 데이터 형식으로 변환
select cast('10'+'20' as number) from dual; 