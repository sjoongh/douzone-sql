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
    where pay > 500;
    