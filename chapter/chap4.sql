--����ȯ �Լ� : ��¥�� ��ȯ('����', '����')�� ���������� ������ �����ϸ� �⺻(YY/MM/DD)���� �ν�
select ename, hiredate from employee where hiredate = to_date('19811117', 'YYYYMMDD');
select ename, hiredate from employee where hiredate = to_date('811117');

--���ڷ� ��ȯ('����', '����')
select to_number('100,000', '999,999') - to_number('50,000', '999,999') from dual;
select to_number('100000') - to_number('50000') from dual;

--���ڷ� ��ȯ('����', '����')
select ename, hiredate, to_char(hiredate, 'YY-MM'), to_char(hiredate, 'YYYY/MM/DD DAY') from employee;

--CAST(ǥ���� AS ������ ����) :  ǥ������ ������ �������� ��ȯ
select cast('10'+'20' as number) from dual; 