--SET SERVEROUTPUT ON : ����ϱ� ���� ȯ�溯��(��ũ��Ʈ�� �� ���� �����)
SET SERVEROUTPUT ON;

--�����, �����, ����ó������ ������ ������. 

--DECLARE : �����
DECLARE
    name_01 varchar2(10):= '����'; --������ : �̸� Ÿ�� := ������; / Ÿ�� : 1. ��Į��(������ SQL���� ����ϴ� ������ Ÿ��)
    name_02 employee.ename%type := '����'; --2. ���۷���(�̹� �ٸ� ���̺��� �÷����� ����ϴ� Ÿ���� ������ Ÿ��)
    eno_01 CONSTANT employee.eno%type; --����� ������ �ڿ� CONSTANT�� ���δ�.
    eno_02 employee.eno%type NOT NULL := 0; --�ʱⰪ�� �ݵ�� �����ؾ� �Ѵٸ� Ÿ�Ը� �ڿ� NOT NULL�� ���δ�.
    
--BEGIN : �����
BEGIN
    dbms_output.put_line('Hello world'); --�⺻ ��¹�
    eno := 7788;
    name_02 := 'SCOTT';
    dbms_output.put_line('�����ȣ : '||eno||' / ����̸� : '||name_02);
END;

--select���� ����Ͽ� �������� �Ҵ��ϴ� ���
DECLARE
    v_eno employee.eno%type;
    v_ename employee.ename%type;
BEGIN
    select eno, ename into v_eno, v_ename from employee where eno=7788; --into�� ���ε�
    dbms_output.put_line('�����ȣ : '||v_eno||' / ����̸� : '||v_ename);
END;

--���ǹ�(SCOTT����� ������ ����϶�)
DECLARE
    v_salary employee.salary%type;
    v_commission employee.commission%type;
    v_y_sal number := 0;
BEGIN
    select salary, commission into v_salary, v_commission from employee where ename='SCOTT';
    
    if v_commission is null then --Ŀ�̼��� ���ٸ�
        v_y_sal := v_salary * 12;
    elsif v_commission is not null then --Ŀ�̼��� �ִٸ�
        v_y_sal := (v_salary * 12) + v_commission;
    end if;    
    
    dbms_output.put_line('SCOTT ����� ���� : '||v_y_sal);
END;

--�ݺ���(�⺻ ������ : ������ 5�� ���)
DECLARE
    dan NUMBER := 5;
    i NUMBER := 1;
BEGIN
    dbms_output.put_line('������ 5��');
    LOOP
        dbms_output.put_line(dan||' x '||i||' = '||(dan*i));
        i := i+1;
        if i  > 9 then --if������ ������ ����� Ż���Ѵ�.
            exit;
        end if;    
    END LOOP;
END;

--�ݺ���(for ������ : ������ 3�� ���)
DECLARE
    dan NUMBER := 3;
    i NUMBER := 1;
BEGIN
    dbms_output.put_line('������ 3��');
    for i in 1..9 loop
        dbms_output.put_line(dan||' x '||i||' = '||(dan*i));
    END LOOP;
END;

--�ݺ���(while ������ : ������ 9�� ���)
DECLARE
    dan NUMBER := 9;
    i NUMBER := 1;
BEGIN
    dbms_output.put_line('������ 9��');
    while i < 10 loop
        dbms_output.put_line(dan||' x '||i||' = '||(dan*i));
        i := i+1;
    END LOOP;
END;

--CURSOR : Ŀ��(��ȸ ����� ���� ���ڵ��� ��� ��� / ��ü �����ȣ, ����̸�, �޿�, �μ���ȣ�� ���)
DECLARE
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_salary employee.salary%type;
    v_dno employee.dno%type;
    cursor c_emp is select eno, ename, salary, dno from employee;
BEGIN
    dbms_output.put_line('�����ȣ / �̸� / �޿� / �μ���ȣ');
    dbms_output.put_line('------------------------------');
    open c_emp;
        loop
            fetch c_emp into v_eno, v_ename, v_salary, v_dno;
            dbms_output.put_line(v_eno||' / '||v_ename||' / '||v_salary||' / '||v_dno);
            if c_emp%notfound then
                exit;
            end if;
        end loop;  
    close c_emp;
END;

--ROWTYPE ���� / ��ü �����ȣ, ����̸�, �޿�, �μ���ȣ�� ���)
DECLARE
    v_emp employee%rowtype;
    cursor c_emp is select eno, ename, salary, dno from employee;
BEGIN
    dbms_output.put_line('�����ȣ / �̸� / �޿� / �μ���ȣ');
    dbms_output.put_line('------------------------------');
    open c_emp;
        loop
            fetch c_emp into v_emp.eno, v_emp.ename, v_emp.salary, v_emp.dno;
            if c_emp%notfound then
                exit;
            end if;
            dbms_output.put_line(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary||' / '||v_emp.dno);
        end loop;  
    close c_emp;
END;

--for �ݺ����� ROWTYPE �̿��� cursor ó��
DECLARE
    v_emp employee%rowtype;
    cursor c_emp is select eno, ename, salary, dno from employee;
BEGIN
    dbms_output.put_line('�����ȣ / �̸� / �޿� / �μ���ȣ');
    dbms_output.put_line('------------------------------');
    for v_emp in c_emp loop
        dbms_output.put_line(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary||' / '||v_emp.dno);
    end loop;
END;