-- PL/SQL
/*
create [or replace] procedure ���ν����� ( -- or replace�� �����ص� ����, ���ν����� �����ϸ� �����
    �����̸� in ������Ÿ��, �����̸� in ������Ÿ��, ...
)
is

Begin
    ����(�ʼ�)
End;

---------------------------
-- ���� ����>
execute ���ν�����
exec ���ν�����(��, ��...)
*/

declare
    vno emp2.empno%type;
    vname varchar2(20);
begin
    select empno, name into vno, vname
        from emp2
        where empno = &empno; -- $empno�� ���� �� �Է¹ޱ�
        dbms_output.put_line('�Էµ� ��� : ' || vno || ' <---> ' || vname);
end;

----------------------------
select * from emp2;

create or replace PROCEDURE p_test ( 
    name in varchar2, -- in�� ���� �޾ƿ�, out�� ���� ������
    su in number
)
is
begin
    dbms.output.put_line(name || '�� ������ : ' || su);
end;

exec p_test('�迬��', 99);
------------------------------
select * from userlist;
drop table userlist;

create table userlist (
    id varchar2(10),
    name varchar2(20),
    age number,
    addr varchar(50)
);

create or replace procedure p_userlist (
    id in userlist.id%type := 'kingsmile',
    name in userlist.name%type DEFAULT '������',
    age in userlist.age%type := 10,
    addr in userlist.addr%type := null
)
is 
begin
    insert into userlist VALUES(id, name, age, addr);
    dbms_output.put_line('insert������ : ' || id||name||age||addr);
end;


----------------------------------
-- ���ν��� ����� �ּ��� ���־���
-- ��ü�ʵ� �߰�
exec p_userlist('yuna','�迬��',20,'����');
exec p_userlist; -- default value input
exec p_userlist(id=>'�ں���', age=>33); -- ���ϴ� �ʵ尪�� �߰� ����

select * from userlist;
------------------------------------------
declare
    su number := 90;
begin
    DBMS_OUTPUT.PUT_LINE('Program started. ');
    IF ( su >= 90 ) then
        DBMS_OUTPUT.PUT_LINE('A');
    ELSIF ( su >= 80 ) then
        DBMS_OUTPUT.PUT_LINE(su || 'B');
    end if;
    DBMS_OUTPUT.PUT_LINE('Program end. ');
end;
------------------------------
declare
    su number := 90;
    grade varchar2(2);
begin
    IF ( su >= 90 ) then grade := 'A';
    ELSIF ( su >= 80 ) then grade := 'B';
    ELSIF ( su >= 80 ) then grade := 'C';
    ELSIF ( su >= 80 ) then grade := 'D';
    else grade := 'F';
    end if;
    DBMS_OUTPUT.PUT_LINE('����� : ' || su || '�� ==> ' || grade || '�����Դϴ�.');
end;
------------------------------
/*
for �����̸� in ����..�� loop
    �ݺ�����;
end loop */

begin
    for i in 1..100 loop
        if mod(i, 2) = 0 then DBMS_OUTPUT.PUT_LINE(i || ' ==> even!!');
        else DBMS_OUTPUT.PUT_LINE(i || ' ==> odd');
        end if;
    end loop;
end;
-------------------------------
begin
    for su_list in (
        select 1 as num from dual
        union all
        select 2 as num from dual
        union all
        select 3 as num from dual
        union all
        select 4 as num from dual
    )
    loop
        if mod(su_list.num, 2) = 0 then DBMS_OUTPUT.PUT_LINE(su_list.num || ' ==> even!!');
        else DBMS_OUTPUT.PUT_LINE(su_list.num || ' ==> odd!!');
        end if;
    end loop;
end;

------------------------
/*
WHILE ���ǽ� LOOP
    ���๮��;
    ������;
END LOOP;
*/

declare
    su number := 0;
begin
    while su < 50 loop
        su := su + 1; -- ������
        DBMS_OUTPUT.PUTLINE('���� ����' || su);
    end loop;
end;

------------------------------
-- 1~10 ���� ���
begin
    for i in 1..10 loop
        DBMS_OUTPUT.PUT_LINE(i);
    end loop;
end;
-- 1~10 ������ ¦���� ���
begin
    for i in 1..10 loop
        if mod(i, 2) = 0 then DBMS_OUTPUT.PUT_LINE(i || ' ¦���Դϴ�.');
        end if;
    end loop;
end;
-- 2���� ������ ���
begin
    for i in 1..9 loop
            DBMS_OUTPUT.PUT_LINE(2 || ' * ' || i || ' = ' || 2*i );
    end loop;
end;

-- ����� �Է�(�ܼ�)�� �޾� ������ ��� DECLARE vdan NUMBER(1) := &dan &�� ����� �Է�
DECLARE
    answer number(1) := &dan;
begin
    for i in 1..9 loop
        DBMS_OUTPUT.PUT_LINE(answer || ' * ' || i || ' = ' || answer*i );
    end loop;
end;
    

-- �������� 2�� �ݺ���
begin
    for i in 2..9 loop
        for j in 1..9 loop
            DBMS_OUTPUT.PUT_LINE(i || ' * ' || j || ' = ' || j*i );
        end loop;
    end loop;
end;
-- 1~10���� �� �հ� ���ϱ�(loop)
declare
    result number(10) := 0;
begin
    for i in 1..10 loop
        result := result + i;
    end loop;
        DBMS_OUTPUT.PUT_LINE(result);
end;
--------- ���ν��� ã�� ----------------------------------
SELECT * FROM user_objects
    WHERE LOWER(object_type)='procedure'; -- �ش� ������ �����ִ� ���ν��� ����Ʈ ����

SELECT text FROM user_source
    WHERE LOWER(NAME) = 'p_test'; -- p_test ���ν����� ������� ����(text)����
-----------------------------------------------
declare
    v_emprow emp%rowtype;
begin
    for i in 1..5 loop
        select  into v_emprow 
        from ( select * from ( select * from emp order by sal desc ) 
        where rownum <= i )  where rownum <= 5;
    end loop;
end;
-----------------------------------------------
select * from emp order bt sal desc;

select sal, rownum
        from ( select * 
                from ( select * from emp order by sal desc )
                    where rownum <= 5 )
        sal rank
-----------------------------------------------
-- rowtype : ������ ������Ÿ��, ũ�Ⱑ ������ ���̺� �÷��� Ÿ��, ũ�Ⱑ �����ϰ� ��
-- type : Ư���� �÷��� �� ���� �����͸��� ����
-- rowtype : ���̺��� �� �����̱⶧���� ��� �÷��� ���� ���� ����, but �ѹ��� �Ѱ��� �����͸� ������
create or replace procedure p_empMaxSal
is
    v_emprow emp%rowtype;
begin
    for i in 1..5 loop
        select *  into v_emprow 
        from ( select * from ( select * from emp order by sal desc ) 
        where rownum <= i order by sal, ename )  where rownum = 1 order by sal desc;
        DBMS_OUTPUT.PUT_LINE(v_emprow.empno || ' ' || v_emprow.ename || ' ' || v_emprow.sal);
    end loop;
end;
-----------------------------------------------
exec p_empmaxsal;
-----------------------------------------------
desc emp;
insert into emp (empno, ename, sal) values(8888, 'DoYeon', 5500);

-- �л� ���̺��� Ű�� ���� ū ������ 3�� ���
create or replace procedure p_stuMaxHei
is
    v_sturow student%rowtype;
begin
    for i in 1..3 loop
        select * into v_sturow
            from ( select * 
                from ( select * from student order by height desc)
                    where rownum <= i order by height, name) where rownum = 1;
                        DBMS_OUTPUT.PUT_LINE(v_sturow.name || ' ' || v_sturow.height);
    end loop;
end;

-- ���ν��� ����
exec p_stuMaxHei;

select * from student;
-----------------------------------------------
create or replace procedure p_outTest (
    name out varchar2, age out varchar2
)
is
begin
    name := '�̳���';
    age := 20;
    DBMS_OUTPUT.PUT_LINE('out�� �̿��� ���ν��� �Ϸ�');
end;
-----------------------------------------------
-- ���� ����
-- NUMBER �� ũ�⸦ �������� �ʴ´�.
variable v_name varchar2(20);
variable v_age NUMBER;

exec p_outTest( :v_name, :v_age);

print v_name;
print v_age;

-- print�� ��� ���� �Ǵ� Ư�� ���Ǹ� ����� �����ϴ�
-- �ΰ��� ������ ���ÿ� ����� �� �� ����
print (v_name, v_age);

print CAST(@v_name as VARCHAR) + CAST(@v_age as VARCHAR);

-- declare�� ����?
declare x INT;
    
PRINT 'There are ' + CAST(@x AS VARCHAR);
-----------------------------------
create or replace procedure p_out ( x in out number )
as
begin
    DBMS_OUTPUT.PUT_LINE('x = ' || x);
    x := 55;
end;

variable x varchar2(25);
exec p_out(:x);
print x;

exec p_out(:x);

variable y varchar2(25);
exec p_out(:y);
print y;
-----------------------------------
create or replace procedure p_emp_job (
    v_job in emp.job%type
)
is
    name emp.ename%type;
    cursor c_name is select empno, ename from emp where job = v_job; -- 1. Ŀ������
begin
    open c_name; -- 2. Ŀ�� ����
    dbms_output.put_line('-------------------------');
    loop
            fetch c_name into name; -- 3. Ŀ���κ��� ������ �б�
            exit when c_name%notfound; -- Ŀ���� ������ ����������
            DBMS_OUTPUT.PUT_LINE(name || ' ' || empno || ' ' || sal || ' ' || v_job);
    end loop;
        DBMS_OUTPUT.PUT_LINE('result recode count =>' || c_name%rowcount);
        close c_name; -- 4. Ŀ���ݱ�
end;

exec p_emp_job('SALESMAN');

select * from emp;
