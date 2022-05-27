--���ʴ�� �ƽ�Ű��, �ƽ�Ű���� �ش��ϴ� ����, �����ڵ� ���ڸ� �����ڵ� ��, �����ڵ� ���� �ش� �����ڵ� ���ڷ� ��ȯ
select ASCII('T'), CHR(84), ASCIISTR('õ'), UNISTR('\CC9C') from dual;

--���ʴ�� ���ڿ��� ����, ���ڿ��� ����Ʈ ��, �����ڵ� ���ڿ��� ���̸� ��ȯ
select lengthc('����Ŭ'), lengthb('����Ŭ'), length('����Ŭ') from dual;

--�� ���� ���ڿ��� ����, �� �� �̻��� ���ڿ��� �����ϴ� �Լ�
select concat('���ʱ��','Ȱ��'), '����'||'���'||'Ȱ��' from dual;

--INSTR(���ع��ڿ�, ã�¹��ڿ�, ã����ġ) : 10���ķ� ������ '����'�� ã�� ��ġ�� ǥ��
select instr('�ڹٿ��� ���ڴ� String �̰� �ڹٽ�ũ��Ʈ���� ���ڴ� let�̴�.','����',10) from dual;

--INSTRB(���ع��ڿ�, ã�¹��ڿ�, ã����ġ) : 10���ķ� ������ '����'�� ã�� ��ġ�� ����Ʈ ������ ǥ��
select INSTRB('�ڹٿ��� ���ڴ� String �̰� �ڹٽ�ũ��Ʈ���� ���ڴ� let�̴�.','����',10) from dual;

--lower : ��� ���ڸ� �ҹ��ڷ� ǥ��, UPPER : ��� ���ڸ� �빮�ڷ� ǥ��, INITCAP : �ܾ��� ù���ڸ� �빮�ڷ� ǥ���ϰ�, �ٸ� ���ڵ��� ��� �ҹ��ڷ� ǥ��
select lower('Student Name') from dual;
select UPPER('Student Name') from dual;
select INITCAP('student name') from dual;

--REPLACE(���ڿ�, �������ڿ�, �ٲܹ��ڿ�) : '�ڹ�'�� ã�� 'Java'�� �ٲ� ����϶�
select replace('�ڹٿ��� ���ڴ� String �̰� �ڹٽ�ũ��Ʈ���� ���ڴ� let�̴�.','�ڹ�','Java') from dual;

--TRANSLATE(���ڿ�, �������ڿ�, �ٲܹ��ڿ�) : REPLACE�ʹ� �ٸ��� �� ���ھ��� ã�Ƽ� ��ȯ
select TRANSLATE('�ڹٿ��� ���ڴ� String �̰� �ڹٽ�ũ��Ʈ���� ���ڴ� let�̴�.','�ڹ�','Java') from dual;

--SUBSTR(���ڿ�, ������ġ, ����) : ���� ��ġ���� ���̸�ŭ ���ڿ� ��ȯ(3��° ���ڿ��� ������ 2���ڷ� �ڸ���)
select substr('����sw���ʱ��Ȱ��', 3, 2) from dual;

--REVERSE(���ڿ�) : ����Ʈ ������ �Ųٷ� ������ ���
select reverse('Phython') from dual;

--LPAD(���ڿ�, ����, �������� ä�� ����) : Java ���ڸ� �����Ͽ� 9����Ʈ�� ä���, �������� -���
select lpad('Java',9,'-') from dual;

--RPAD(���ڿ�, ����, ���������� ä�� ����) : Java ���ڸ� �����Ͽ� 9����Ʈ�� ä���, �������� -���
select Rpad('Java',9,'-') from dual;

--LTRIM(���ڿ�, ������ ����) : ������ $�� �����ϰ� �������� ���
select ltrim('$$$$$�ڹ�','$') from dual;

--RTRIM(���ڿ�, ������ ����) : �������� $�� �����ϰ� �������� ���
select Rtrim('�ڹ�$$$$$','$') from dual;

--TRIM(�����ҹ��� �����ҹ���, FROM ���ڿ�) : ���ڿ��� ����, �������� ������ ���ڿ��� ����, ���� ������ ���� ���, ������ ���ڿ��� ������ ������ ����) / ���� : LEADING(����), TRAILING(������), BOTH(����)
select trim(leading '$' from '$$$$$�ڹ�') from dual;

--REGEXP_COUNT(���ڿ�, ����) : ���ڿ����� ������ ������ ���
select REGEXP_COUNT('�ڹٽ�ũ��Ʈ', '�ڹ�') from dual;

--����, ���� �Լ� : ���ʴ�� �ø�, ����, �ݿø�
select ceil(3.14), floor(3.14), round(3.14) from dual;

--TRUNC(�Ǽ�, ����) : �Ǽ��� ���� �ڸ����� �����ϰ� ���
select trunc(1234.1234, 2) from dual;

--ADD_MONTHS(��¥, ����) : ��¥�� ���ڸ�ŭ�� ���� ���� ���Ѵ�.(���� ����)
select add_months('2022/05/24',5) from dual;

--LAST_DAY(��¥) : ���� ��¥ ���� ������ �ϼ��� ���
select last_day('2022/05/24') from dual;

--NEXT_DAY(��¥, '����') : ���� ��¥�� ������ ������ ù��° ������ �ϼ� ���
select next_day('2022/05/24','�����') from dual;

--ROUND(��¥, ����) : ���信 ���� �ݿø� / CC : ������ �� ���ڸ��� ����, Q : �б��� �б�, MM : �� ����, D : �� ����, HH : �� ����, MI :  �� ���� �ݿø�
select ROUND(to_date('2022/08/24'),'Q') from dual;


--NVL(�÷���(ǥ����), ��ü������) : �ش� �÷��� �����Ͱ� NULL�̸� ��ü �����ͷ� ��ȯ�ؼ� ���
select ename, salary, commission, NVL(commission, 0), salary*12+NVL(commission, 0) from employee;

--NVL2(�÷���, ������1, ������2) : �ش� �÷��� �����Ͱ� NULL�̸� ������2��ȯ, �ƴϸ� ������1 ��ȯ
select ename, NVL2(commission, salary*12+commission, salary*12) AS "����" from employee;

--DECODE(ǥ����, ����1, ���1, ����2, ���2, �⺻ ���); : ǥ������ ���� ����1�� ��ġ�ϸ� ���1, ��� 2�� ��ġ�ϸ� ��� 2, ��ġ���� ������ �⺻ ��� ��ȯ
select ename, dno, decode(dno, 10, '������',
                               20, '�Ѻι�',
                               30, '������',
                               40, '������',
                               '�뵿��') AS "�μ���"
                               from employee;
             
--CASE WHEN ����1 THEN ��� WHEN ����2 THEN ��� ELSE �⺻ ��� END : IF��, ELSE���� ����
select ename, dno, case when dno=10 then '������'
                        when dno=20 then '�ѹ���'
                        when dno=30 then '������'
                        when dno=40 then '������'
                        else '�뵿��' end as "�μ���"
                        from employee;