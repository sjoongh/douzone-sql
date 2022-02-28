-- PL/SQL
/*
create [or replace] procedure 프로시저명 ( -- or replace는 생략해도 무관, 프로시저가 존재하면 변경됨
    변수이름 in 데이터타입, 변수이름 in 데이터타입, ...
)
is

Begin
    실행(필수)
End;

---------------------------
-- 실행 형식>
execute 프로시저명
exec 프로시저명(값, 값...)
*/

declare
    vno emp2.empno%type;
    vname varchar2(20);
begin
    select empno, name into vno, vname
        from emp2
        where empno = &empno; -- $empno을 통해 값 입력받기
        dbms_output.put_line('입력된 사번 : ' || vno || ' <---> ' || vname);
end;

----------------------------
select * from emp2;

create or replace PROCEDURE p_test ( 
    name in varchar2, -- in은 값을 받아옴, out은 값을 내보냄
    su in number
)
is
begin
    dbms.output.put_line(name || '님 점수는 : ' || su);
end;

exec p_test('김연아', 99);
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
    name in userlist.name%type DEFAULT '도연이',
    age in userlist.age%type := 10,
    addr in userlist.addr%type := null
)
is 
begin
    insert into userlist VALUES(id, name, age, addr);
    dbms_output.put_line('insert정보는 : ' || id||name||age||addr);
end;


----------------------------------
-- 프로시저 실행시 주석을 없애야함
-- 전체필드 추가
exec p_userlist('yuna','김연아',20,'군포');
exec p_userlist; -- default value input
exec p_userlist(id=>'박보검', age=>33); -- 원하는 필드값만 추가 가능

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
    DBMS_OUTPUT.PUT_LINE('당신의 : ' || su || '점 ==> ' || grade || '학점입니다.');
end;
------------------------------
/*
for 변수이름 in 시작..끝 loop
    반복실행;
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
WHILE 조건식 LOOP
    실행문장;
    증감식;
END LOOP;
*/

declare
    su number := 0;
begin
    while su < 50 loop
        su := su + 1; -- 증감식
        DBMS_OUTPUT.PUTLINE('현재 값은' || su);
    end loop;
end;

------------------------------
-- 1~10 까지 출력
begin
    for i in 1..10 loop
        DBMS_OUTPUT.PUT_LINE(i);
    end loop;
end;
-- 1~10 사이의 짝수만 출력
begin
    for i in 1..10 loop
        if mod(i, 2) = 0 then DBMS_OUTPUT.PUT_LINE(i || ' 짝수입니다.');
        end if;
    end loop;
end;
-- 2단의 구구단 출력
begin
    for i in 1..9 loop
            DBMS_OUTPUT.PUT_LINE(2 || ' * ' || i || ' = ' || 2*i );
    end loop;
end;

-- 사용자 입력(단수)를 받아 구구단 출력 DECLARE vdan NUMBER(1) := &dan &은 사용자 입력
DECLARE
    answer number(1) := &dan;
begin
    for i in 1..9 loop
        DBMS_OUTPUT.PUT_LINE(answer || ' * ' || i || ' = ' || answer*i );
    end loop;
end;
    

-- 구구단을 2중 반복문
begin
    for i in 2..9 loop
        for j in 1..9 loop
            DBMS_OUTPUT.PUT_LINE(i || ' * ' || j || ' = ' || j*i );
        end loop;
    end loop;
end;
-- 1~10까지 총 합계 구하기(loop)
declare
    result number(10) := 0;
begin
    for i in 1..10 loop
        result := result + i;
    end loop;
        DBMS_OUTPUT.PUT_LINE(result);
end;
--------- 프로시저 찾기 ----------------------------------
SELECT * FROM user_objects
    WHERE LOWER(object_type)='procedure'; -- 해당 계정이 갖고있는 프로시저 리스트 보기

SELECT text FROM user_source
    WHERE LOWER(NAME) = 'p_test'; -- p_test 프로시저의 만들어진 내용(text)보기
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
-- rowtype : 변수의 데이터타입, 크기가 선택한 테이블 컬럼의 타입, 크기가 동일하게 됨
-- type : 특정한 컬럼의 한 개의 데이터만을 저장
-- rowtype : 테이블의 행 단위이기때문에 모든 컬럼에 대한 값을 저장, but 한번에 한개의 데이터만 저장함
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

-- 학생 테이블에서 키가 제일 큰 순서로 3명 출력
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

-- 프로시저 실행
exec p_stuMaxHei;

select * from student;
-----------------------------------------------
-- oracle에서 := 기호는 대입연산자
-- mysql은 = 이다
create or replace procedure p_outTest (
    name out varchar2, age out varchar2
)
is
begin
    name := '이나영';
    age := 20;
    DBMS_OUTPUT.PUT_LINE('out을 이용한 프로시저 완료');
end;
-----------------------------------------------
-- variable : out이 있는 프로시져에서 호출
-- 메모리에 만들어짐
-- NUMBER 는 크기를 지정하지 않는다.
variable v_name varchar2(20);
variable v_age NUMBER;

exec p_outTest( :v_name, :v_age);  -- 프로시져를 실행한 후 out을 받을 변수 지정

print v_name; -- 출력
print v_age;

-- print는 모든 섹션 또는 특정 세션만 출력이 가능하다
-- 두개의 변수를 동시에 출력할 수 는 없음
print (v_name, v_age);
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
create or replace procedure p_emp_job( v_job in emp.job%type )
is
    name emp.ename%type;
    empno emp.empno%type;
    sal emp.sal%type;
--  cursor c_name is select empno, ename, sal from emp where job=upper(v_job) or job=lower(v_job);   -- 1.커서선언
    cursor c_name is select empno, ename, sal from emp where job in(upper(v_job), lower(v_job));   -- 1.커서선언
begin
    open c_name;   -- 2.커서열기
    dbms_output.put_line('------------------------------');
    loop
        fetch c_name into empno, name, sal;  -- 3.커서로부터 데이터 읽기
        exit when c_name%NOTFOUND; -- 찾을 데이터가 없으면 반복문 탈출한다.
        dbms_output.put_line(name ||' '||empno||' '||sal||' ' ||v_job);
    end loop;
    dbms_output.put_line('result recode count ==> ' || c_name%rowcount);
     
    close c_name;  -- 4.커서닫기
end;
-----------------------------------
-- 레코드는 대소문자 구분함
exec p_emp_job('manager');
exec p_emp_job(upper('manager'));

select * from emp where job = 'manager';
-----------------------------------
