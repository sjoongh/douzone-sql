select * from tab;

create table SampleTable (
    num number,
    name VARCHAR2(20) not null,
    phone varchar2(15),
    address varchar2(50)
);

select * from sampletable; -- ��ü����
select name, address from sampletable; -- Ư�� �ʵ常 ����

-- insert --
insert into sampletable values(10, 'doyeon', '010-9872-0202', '����');
insert into sampletable values(20, '������', '010-5555-0202', '�λ�');
insert into sampletable (name, address, phone, num) values('aa', 'jeju', '2222', 30);
insert into sampletable (name, address) values('bb', '2222');

commit; -- �Ϸ�

-- update --
update sampletable set name ="�̵���"; -- ��ü����
update sampletable set name ="�̵���" where name='doyeon'; -- ���Ǽ���
update sampletable set name ="doyeon", address='�뱸' where name='�̵���';

desc sampletable; -- ���̺� ����
delete sampletable; -- ���ڵ� ��ü ����
rollback;

delete sampletable where name="aa";

drop table sampletable; -- rollback �ȵ�

-- �� �� �ּ�
/* ������ �ּ� */

select * from emp2;
desc emp2;
select empno, name, emp_type, deptno from emp2; -- ���, �̸�, Ÿ��, �μ�

select *
    from emp2
    where emp_type ="�����"
    -- order by name; -- �������� ����
    order by name desc; -- �������� ����
    
show user;

select sysdate from emp2;
select sysdate from sampletable;
select sysdate from dual; -- �������̺� ����


--��������
CREATE TABLE userlist(
id VARCHAR2(10) CONSTRAINT id_pk PRIMARY key, 
name varchar2(10) not null
);

select * from userlist;

insert into userlist values('smile', '�迬��');
insert into userlist values('kingsmile', '�ڿ���');
--insert into userlist(name) values('happy');

select * from professor;
select * from student;
select * from department;

CREATE TABLE userlist2(
id VARCHAR2(10) CONSTRAINT userlist2_id_pk PRIMARY key, 
jumin char(13)  CONSTRAINT jumin_un unique
);

select * from userlist2;
insert into userlist values('aa', '111');
insert into userlist2(id) values('kang');

CREATE TABLE ck_Test(
    NAME VARCHAR2(10) NOT NULL,
    age NUMBER(2) NOT NULL 
    CHECK (age BETWEEN 20 AND 30 ) 
--age�÷��� ���� 20~30���̸� ���
);

select * from ck_Test;
insert into ck_test values('aa', 21);
insert into ck_test values('bb', 19);
insert into ck_test values('cc', 41);

CREATE TABLE db_test (
    NAME VARCHAR2(10) NOT NULL,
    addr VARCHAR2(10) DEFAULT '����'
);

select * from emp2;

-- �÷�����
alter table userlist drop COLUMN no;
alter table userlist drop (name, gender);

-- datatype ����
-- alter table ���̺��̸� modify �÷��̸� ���� �ڷ���
select * from userlist;
desc userlist;
alter table userlist modify gender numbr;
alter table userlist modify no varchar2(20); -- �÷��� ������ ���� ��� Ÿ�� ���� ����

update userlist set phone=' '; -- phone = null;
alter table userlist modify phone number;

-- �÷� �̸� ����
-- alter table ���̺��̸� rename column �����÷��� to �����÷���
alter table userlist rename column no to num;

-- ���̺� ����
-- drop table ���̺��̸�
drop table userlist;

-- ���ڵ� ����
delete from userlist2;
desc userlist2;
drop table userlist2;

-- ���� ���̺� ��� ����
show recyclebin;
desc recyclebin;

-- ����(������ ���̺�)
FLASHBACK table userlist to before drop;

-- ������ ����
PURGE RECYCLEBIN;
select * from userlist;

drop table userlist PURGE; -- �����뿡 �ȳ���� ���� ����

-- ���ڵ� ���� / ���� / ����


-- truncate table ���̺��̸�;
select * from emp2;
delete emp2; -- ���ǿ� �´°͸� ����
rollback;
delete emp2 where emp_type='������';

truncate table emp2; -- where�� ��� ����, rollback �ȵ�

select DISTINCT emp_type -- �ߺ� �����ϰ� ������
    from emp2
    order by name desc;
    
    
create table userlist (
    id varchar2(20),
    name varchar2(20)
);

insert into userlist values('kingsmile', 'hi');

select * from userlist
where name is null;
-- where name is not null;

update userlist set name = ' ' where id = 'kang2';


