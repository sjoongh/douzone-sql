select * from tab;

create table SampleTable (
    num number,
    name VARCHAR2(20),
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

commit;

-- update --
update sampletable set name ="�̵���";