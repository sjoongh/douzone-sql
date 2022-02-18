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
select sysdate from dual;