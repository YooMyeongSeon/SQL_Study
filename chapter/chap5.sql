--
select ascii('T'), asciistr('��'), chr(84), unistr('\BC1D') from dual;
select lengthc('����Ŭ'), lengthb('����Ŭ'), length('����Ŭ') from dual;

select concat('���ʱ��','Ȱ��'), '����'||'���'||'Ȱ��' from dual;

select ename||':'||job from employee;

--10���ķ� ������ '����'�� ã�� ��ġ�� ǥ���϶�
select instr('�ڹٿ��� ���ڴ� String �̰� �ڹٽ�ũ��Ʈ���� ���ڴ� let�̴�.','����',10) from dual;

select lower('Student Name') from dual;
select UPPER('Student Name') from dual;

--'�ڹ�'�� ã�� 'Java'�� �ٲ� ����϶�
select replace('�ڹٿ��� ���ڴ� String �̰� �ڹٽ�ũ��Ʈ���� ���ڴ� let�̴�.','�ڹ�','Java') from dual;

--'�ڹ�'�� ã�� 'Java'�� �ٲ� ����϶�
select TRANSLATE('�ڹٿ��� ���ڴ� String �̰� �ڹٽ�ũ��Ʈ���� ���ڴ� let�̴�.','�ڹ�','Java') from dual;

select eno, ename, dno from employee where ename = 'scott';
select eno, ename, dno from employee where ename = upper('scott');
select eno, ename, dno from employee where INITCAP(ename) = 'Scott';

--3��° ���ڿ��� ������ 2���ڸ� �ڸ���
select substr('����sw���ʱ��Ȱ��',3,2) from dual;

--����Ʈ ������ �Ųٷ� ������ ���
select reverse('Phython') from dual;

--Java ���ڸ� �����Ͽ� 9����Ʈ�� ä���, �������� �տ� -���
select lpad('Java',9,'-') from dual;

--������ $�� �����ϰ� �������� ���
select ltrim('$$$$$�ڹ�','$') from dual;
select trim(leading '$' from '$$$$$�ڹ�') from dual;

--�������� $�� �����ϰ� �������� ���
select rtrim('�ڹ�$$$$$','$') from dual;
select trim(trailing '$' from '�ڹ�$$$$$') from dual;

--������ $�� �����ϰ� �������� ���
select trim(both '$' from '$$$$$�ڹ�$$$$$') from dual;

--������ ���ڰ� N�� ����� ã�Ƽ� ���
select * from employee where substr(ename, -1, 1) = 'N';

--�ø�, ����, �ݿø�
select ceil(3.14), floor(3.14), round(3.14) from dual;

--�Ҽ��� 2��° �ڸ����� �����ϰ� ���
select trunc(1234.1234,2) from dual;

--���� ��¥�� ���� 5���� ���Ͽ� ���
select add_months('2022/05/24',5) from dual;

--���� ��¥�� ���� 7���� ���� ���
select add_months('2022/05/24',-7) from dual;

--���� ��¥�� ���� +5�� ���Ͽ� ���
select to_date('2022/05/24')+5 from dual;

--���� ��¥ ���� ������ �ϼ��� ���
select last_day('2022/05/24') from dual;

--���� ��¥�� ������ ������ ù��° ����� ���
select next_day('2022/05/24','�����') from dual;

--�б� ������ �ݿø�
select ROUND(to_date('2022/08/24'),'Q') from dual;

select ename, salary, commission, NVL(commission, 0), salary*12+NVL(commission, 0) from employee;

--commission�� ���� null�� �ƴ϶�� ���� ����, �ƴ϶�� ���� ���� ��ȯ
select ename, NVL2(commission, salary*12+commission, salary*12) AS "����" from employee;

--���ǹ� dno�� 10�̸�~ 20�̸�~ 30�̸�~
select ename, dno, decode(dno, 10, '������',
                               20, '�Ѻι�',
                               30, '������',
                               40, '������',
                               '�뵿��') AS "�μ���"
                               from employee;
                               
select ename, dno, case when dno=10 then '������'
                        when dno=20 then '�ѹ���'
                        when dno=30 then '������'
                        when dno=40 then '������'
                        else '�뵿��' end as "�μ���"
                        from employee;