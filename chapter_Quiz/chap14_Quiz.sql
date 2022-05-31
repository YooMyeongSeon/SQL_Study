SET SERVEROUTPUT ON;

--1. IF��������Ͽ�KING����Ǻμ���ȣ�����ͼ��μ���ȣ�������μ���������ϼ���.
DECLARE
    v_dno employee.dno%type;
    v_dn0_check department.dno%type;
    v_dname department.dname%type;
BEGIN
    select dno into v_dno from employee where ename='KING';
    select dno, dname into v_dn0_check, v_dname from department where dno = v_dno;
    if v_dno = v_dn0_check then
        dbms_output.put_line('KING�� �μ��� : '||v_dname);
    end if;    
END;

--2. BASICLOOP������1����10�������ڿ������������Ͽ�����ϼ���.
DECLARE
    i NUMBER := 1;
    j NUMBER := 0;
BEGIN
    LOOP
        j := j+i;
        i := i+1;
        if i  > 10 then
            exit;
        end if;    
    END LOOP;
    dbms_output.put_line('1���� 10������ �ڿ����� ��'||j);
END;

--3. FORLOOP������1����10�������ڿ������������Ͽ�����ϼ���.
DECLARE
    i NUMBER := 1;
    j NUMBER := 0;
BEGIN
    for i in 1..10 loop
        j := j+i;
    END LOOP;
    dbms_output.put_line('1���� 10������ �ڿ����� ��'||j);
END;

--4. WHILELOOP������1����10�������ڿ������������Ͽ�����ϼ���.
DECLARE
    i NUMBER := 1;
    j NUMBER := 0;
BEGIN
    while i < 11 loop
        j := j+i;
        i := i+1;
    END LOOP;
    dbms_output.put_line('1���� 10������ �ڿ����� ��'||j);
END;

--5. ������̺���Ŀ�̼���NULL�ƴѻ����ǻ����ȣ, �̸�, �޿����̸��������ο����������������Ѱ��������ϼ���.
DECLARE
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_salary employee.salary%type;
    cursor c_emp is select eno, ename, salary from employee where commission is not null and commission != 0 order by ename;
BEGIN
    dbms_output.put_line('�����ȣ / �̸� / �޿�');
    open c_emp;
        loop
            fetch c_emp into v_eno, v_ename, v_salary;
            if c_emp%notfound then
                exit;
            end if;
            dbms_output.put_line(v_eno||' / '||v_ename||' / '||v_salary);
        end loop;
    close c_emp;
END;

--6. �������������̺�(Student)����������͸��Է��Ѵ�.(��������)
create table Student(
    sid number PRIMARY KEY,
    sname nvarchar2(5) Not null,
    kscore number(3) Check(0 <= kscore and kscore <= 100),
    escore number(3) Check(0 <= escore and escore <= 100),
    mscore number(3) Check(0 <= mscore and mscore <= 100));
    
--�й���������(seq_stu_id)�������Ѵ�.
create SEQUENCE seq_stu_id start WITH 1 INCREMENT BY 1;
insert into student values(seq_stu_id.nextval, '��浿', 78, 64, 82);
insert INTO student values(seq_stu_id.nextval, '��浿', 85, 71, 64);
insert INTO student values(seq_stu_id.nextval, '�̱浿', 74, 69, 57);
insert INTO student values(seq_stu_id.nextval, '�ڱ浿', 74, 77, 95);
insert INTO student values(seq_stu_id.nextval, 'ȫ�浿', 68, 95, 84);
commit;

--�л�����������������ϼ���.
DECLARE
    v_sname student.sname%type;
    v_kscore student.kscore%type;
    v_escore student.escore%type;
    v_mscore student.mscore%type;
    cursor c_stu is select sname, kscore, escore, mscore from student;
BEGIN
    dbms_output.put_line('�̸� / ���� / ���� / ���� / �հ� / ���');
    open c_stu;
        loop
            fetch c_stu into v_sname, v_kscore, v_escore, v_mscore;
            if c_stu%notfound then
                exit;
            end if;
            dbms_output.put_line(v_sname||' / '||v_kscore||' / '||v_escore||' / '||v_mscore||' / '||(v_kscore+v_escore+v_mscore)||' / '||((v_kscore+v_escore+v_mscore)/3));
        end loop;
    close c_stu;
END;

--������������������ϼ���.
DECLARE
    v_kscore student.kscore%type;
    v_escore student.escore%type;
    v_mscore student.mscore%type;
BEGIN
    select sum(kscore), sum(escore), sum(mscore) into v_kscore, v_escore, v_mscore from student;
    dbms_output.put_line('���� / ���� / ���');
    dbms_output.put_line('���� / '||v_kscore||' / '||v_kscore/5);
    dbms_output.put_line('���� / '||v_escore||' / '||v_escore/5);
    dbms_output.put_line('���� / '||v_mscore||' / '||v_mscore/5);
END;