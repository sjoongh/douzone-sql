-- select ��Ī�ֱ�
select *
    from emp2
    where position='����';
    
select empno, name, pay, position
    from emp2
    where position='����';
    
select empno as "�����ȣ", name "�� ��", pay �޿�, position "�� ��"
    from emp2
    where position='����';
    
select empno as "�����ȣ", name "�� ��", pay �޿�, position "�� ��"
    from emp2
    where position='����' and name='������';
    
    
select * from emp2 where deptno=1000l

select * 
    from emp2
    where name like '��%';
    
select *
    from emp2
    where name like '��%';
    
select *
    from professor
    where name like '%��';
    
select *
    from professor
--    where name like '_��'
    where name like '__';
    
select *
    from professor
    where name like '%��_';
    
-- ����
select *
    from professor
--    where pay > 500;
    where pay <= 300;
    
select * from professor where bonus is not null;
select * from professor where bonus is null;

-- 1. �޿��� 500 �̻��̰�, ���ʽ��� 60�̻� �޴� ������?
select * 
from professor
where pay >= 500 and bonus >= 60;

-- 2. �̸��� '���Ѷ�'�� '���Ѷ�'���� ����
update emp2 set name='���Ѷ�' 
where name='���Ѷ�';

select name from emp2 where name like '%�Ѷ�'; -- check

-- 3. ��̰� ����� ����鸸 ã �Ƽ� '����'���� ����
update emp2 set hobby='����' 
where hobby='���';

select name, hobby from emp2 where hobby like '����'; -- check

-- 4. ����� ���� ã�Ƽ� ����
delete emp2 
where emp_type='�����';

-- 5. pay�� 50�̻��� ����� ���
select * from professor
where pay >= 50 or bonus >= 50;

-- 6. ~��Ʈ�� �ƴ� ��ǰ�鸸 ���
select * from gift
where gname not like '%��Ʈ%';

-- 7. gno�� 10�� ��ǰ�� �̸��� null ó��
update gift set gname=null 
where gno = 10;

-- 8. gname �̸��� ����, g_Start�� 999�� ���� ���� �������Է�
insert into gift(gname, g_start) values (null, 999);

-- 9. gname�� null�̰ų� ' '�� �����͸� �����ϰ� ���
select * 
from gift
where gname not like null or gname not like ' ';


-- ������
select mod(7, 3) from dual;
select 7/3 from dual;

-- null ������ ������ null
select name, pay, bonus from professor;
select name, pay, nvl(bonus, 0) from professor;

update professor set bonus = bonus+100;
update professor set bonus = nvl(bonus, 0) + 100;
rollback

select * from gift;
select * from gift where gno=1 or gno=3 or gno=7;
select * from gift where gno in(1,3,7); -- ����
select * from gift where gno not in(1,3,7);

select * from gift where gno between 6 and 9;
select * from gift where gno between 9 and 6; -- X

-- �达�� �ƴ� �������� ã��
select * from emp2 where emp_type='������' or name not like '��%';

--����1] �̸����� '�迵��' ������� �����ּ���.
select * from professor
where name like '%�迵��%';

--����2] �̸����� '��'�� ���� ���� ������� �����ּ���.  - ��� : % , �ѱ��� : _
select * from professor
where name like '��__';

--����3] �̸��� �� ������ ��� �����ּ���.
select * from professor
where name like '__';
 
--����4] id�� s or a ���ڰ� ���� ��� ã��
select * from professor
where id like '%s%' or id like '%a%';
   
--����5] ���Ӱ��� ã���ּ���
  select * from professor
  where position like '%���Ӱ���%';

--����6] �г��� 3�г�(grade)�̰� Ű(height)�� 165�̻��� �а��ڵ�(deptno1)�� 101�� �л� ã��
select * from student
where grade = 3 and height >= 164 and deptno1 = 101;

--����7] ������ 77�� ������ �л��� ã��
select * from student
where birthday < '77-01-01'
order by birthday desc;

--����8] ������(deptno2)�� ���� �л��鸸 ã��
select * from student
where deptno2 is not null;

--����9] ��米��(profno)�� 1000 ~ 2001 ���� �л��� ã��
select * from student
where profno between 1000 and 2001;
 -- ����>
-- create table ���̺�� ( �ʵ�� �ڷ���(ũ��), �ʵ�� �ڷ���(ũ��),..... ); 
 -- kosa2  table create  - �̸�name, ����loc, ����óphone
create table kosa2 (
    no primary key,
    name varchar(10),
    loc varchar(10),
    phone varchar(10),
)

-- ����1
-- ���� ���Ե� ����� ����� �˻�
select *
    from professor
    where name between NCHR(51087) and NCHR(52263);

select * from professor
where name between '��' and '��'
order by 1;
