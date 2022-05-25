--1. SUBSTR 함수를사용하여사원들의입사한년도와입사한달만출력하세요.
select substr(hiredate, 1, 7) from employee;

--2. SUBSTR 함수를사용하여4월에입사한사원을출력하세요
select * from employee WHERE substr(hiredate, 6, 2) = 04;

--3. MOD 함수를사용하여사원번호가짝수인사람만출력하세요
select * from employee where mod(eno,2)=0;

--4. 입사일을연도는2자리(YY), 월은숫자(MON)로표시하고요일은약어(DY)로지정하여출력하세요.
select to_char(hiredate,'YY MON DY') from employee;

--5. 올해며칠이지났는지출력하세요. 현재날짜에서올해1월1일을뺀결과를출력하고TO_DATE 함수를사용하여데이터형을일치시키시오.
select (TO_DATE('2022/05/24') - TO_DATE('2022/01/01')) from dual;

--6. 사원들의상관사번을출력하되상관이없는사원에대해서는NULL 대신에0을출력하세요.
select NVL(manager, 0) from employee;

--7. DECODE 함수로직급에따라급여를인상하도록하세요. 직급이'ANAIYST'인사원은200, 'SALESMAN'인사원은180, 'MANAGER'인사원은150,'CLERK'인사원은100을인상하세요.
select ename, job, salary, decode(job, 'ANALYST', salary+200,
                                       'SALESMAN', salary+180,
                                       'MANAGER', salary+150,
                                       'CLERK', salary+100,
                                       salary) as "인상된 급여" from employee;