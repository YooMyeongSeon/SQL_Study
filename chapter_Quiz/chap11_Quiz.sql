--1. Employee���̺��Ǳ����������Ͽ�EMP_SAMPLE���̸������̺������弼�� ������̺��ǻ����ȣĮ�������̺�����primarykey���������������ϵ����������̸���my_emp_pk�������ϼ���.
create table EMP_SAMPLE as select * from Employee where 1=0;
alter table EMP_SAMPLE add CONSTRAINT my_emp_pk primary key(eno);

--2. department���̺��Ǳ����������Ͽ�dept_sample�̶����̺������弼��. dept_sample�Ǻμ���ȣĮ�������̺�����primarykey���������������ϵ����������̸���my_dept_pk�������ϼ���.
create table dept_sample as select * from department where 1=0;
alter table dept_sample add CONSTRAINT my_dept_pk primary key(dno);

--3.������̺��Ǻμ���ȣĮ�������������ʴºμ��ǻ���̹��������ʵ��Ͽܷ�Ű���������������ϵ����������̸���my_emp_dept_fk�������ϼ���.
alter table EMP_SAMPLE add CONSTRAINT my_emp_dept_fk FOREIGN key(dno) references dept_sample(dno);

--4. ������̺���Ŀ�̼��÷���0����ū�������Է��Ҽ���   �������������������ϼ���
alter table EMP_SAMPLE modify commission check(0 < commission);