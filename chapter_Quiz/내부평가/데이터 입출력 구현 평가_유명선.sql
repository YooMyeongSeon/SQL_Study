--������ ����� ���� ��
--������ : 2022�� 07�� 05��
--���ѽð� : 240��
--�Ʒû��� : ����

--���� ����
create user hongTeam identified by green1234;

--���̺� ���� �ο�
alter user hongTeam default tablespace users;
alter user hongTeam temporary tablespace temp;

--���� �ο�
grant connect, resource to hongTeam;

--������ ���� �߰� �ο�
grant dba to hongTeam;

--���̺� ����
create table product(
    productId char(10) constraint pk_product_productId primary key,
    productName nvarchar2(20) not null,
    price number not null,
    amount number not null);
    
create table customer(
    customerId char(10) constraint pk_customer_customerId primary key,
    customerName nvarchar2(20) not null,
    customerAddress nvarchar2(100) not null,    
    customerContract char(13) not null);
    
create table trade(
    tradeId char(10) constraint pk_trade_tradeId primary key,
    customerId char(10),
    productId char(10),
    tradeAmount number not null,
    constraint fk_trade_customer foreign key(customerId) references customer(customerId),
    constraint fk_trade_product foreign key(productId) references product(productId));

create sequence trade_seq nocache;

--������ �Է�
insert into product values('B001', 'Java', 20000, 100);
insert into product values('B002', 'HtmlCSS', 15000, 150);
insert into product values('B003', 'Python', 17500, 200);
insert into product values('B004', 'Javascript', 17000, 150);
insert into product values('B005', 'Oracle', 25000, 75);
commit;

select * from product;

insert into customer values('N001', '�������Ʈ����', '��⵵ ȭ����', '010-4567-9365');
insert into customer values('K001', '����IDC����', '��⵵ ��õ��', '010-1475-3695');
insert into customer values('K002', '�����������', '��⵵ �����', '010-9875-3215');
insert into customer values('S001', '����IT�׷�', '��⵵ ������', '010-1234-5678');
insert into customer values('S002', '��������Ʈ����', '��⵵ ���ν�', '010-1235-7895');
commit;

select * from customer;

insert into trade values(trade_seq.nextval, 'N001', 'B001', 50);
insert into trade values(trade_seq.nextval, 'N001', 'B004', 50);
insert into trade values(trade_seq.nextval, 'K001', 'B005', 20);
insert into trade values(trade_seq.nextval, 'K002', 'B002', 35);
insert into trade values(trade_seq.nextval, 'K002', 'B004', 45);
insert into trade values(trade_seq.nextval, 'K002', 'B005', 25);
insert into trade values(trade_seq.nextval, 'S001', 'B003', 75);
insert into trade values(trade_seq.nextval, 'S002', 'B001', 24);
commit;

select * from trade;

--���ν��� ����
create or REPLACE PROCEDURE insert_Book_info(
    p_productId in product.productId%type,
    p_productName in product.productName%type,
    p_price in product.price%type,
    p_amount in product.amount%type) is
BEGIN
    insert into product values(p_productId, p_productName, p_price, p_amount);
    commit;
END;

create or REPLACE PROCEDURE insert_customer_info(
    p_customerId in customer.customerId%type,
    p_customerName in customer.customerName%type,
    p_customerAddress in customer.customerAddress%type,
    p_customerContract in customer.customerContract%type) is
BEGIN
    insert into customer values(p_customerId, p_customerName, p_customerAddress, p_customerContract);
    commit;
END;

--���ν��� ����
EXECUTE insert_Book_info('B006', 'Kotlin', 20000, 100);
EXECUTE insert_Book_info('B007', 'ReAct', 19500, 80);
EXECUTE insert_Book_info('B008', 'Spring', 22000, 120);

EXECUTE insert_customer_info('N002', '�δ��������θ�Ʈ', '��⵵ �Ⱦ��', '010-9586-5748');
EXECUTE insert_customer_info('S003', '���IT����', '��⵵ �ϳ���', '010-1596-3574');
EXECUTE insert_customer_info('K003', 'AS����Ʈ����', '��⵵ �Ȼ��', '010-6547-6541');

--�ŷ��� ���� �Է�
insert into trade values(trade_seq.nextval, 'N002', 'B006', 20);
insert into trade values(trade_seq.nextval, 'S001', 'B006', 25);
insert into trade values(trade_seq.nextval, 'S003', 'B007', 15);
insert into trade values(trade_seq.nextval, 'K002', 'B007', 10);
insert into trade values(trade_seq.nextval, 'K003', 'B008', 20);
insert into trade values(trade_seq.nextval, 'K001', 'B008', 50);
commit;

SET SERVEROUTPUT ON;
--���ν��� ����
create or REPLACE PROCEDURE check_info(p_customerName in customer.customerName%type) is
    v_customerName customer.customerName%type;
    v_productName product.productName%type;
    v_tradeAmount trade.tradeAmount%type;
    v_price product.price%type;
BEGIN
    DECLARE
        cursor c_trade is select c.customerName, p.productName, t.tradeAmount, p.price from product p INNER JOIN trade t on p.productid = t.productid INNER JOIN customer c on c.customerid = t.customerid where c.customerName = p_customerName;
    BEGIN  
        open c_trade;
            loop
                fetch c_trade into v_customerName, v_productName, v_tradeAmount, v_price;
                exit when c_trade%notfound;
                dbms_output.put_line('------------------------------');
                dbms_output.put_line('�ŷ�ó : '||v_customerName);
                dbms_output.put_line('�ŷ� ������ : '||v_productName);
                dbms_output.put_line('�ŷ��� : '||v_tradeAmount);
                dbms_output.put_line('�� �ŷ� ��� : '||v_price);
            end loop;
        close c_trade;
    END;
END;

EXECUTE check_info('�������Ʈ����');