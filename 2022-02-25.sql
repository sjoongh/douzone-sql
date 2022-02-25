insert into c_emp4(ename, mgr, sal, deptno)
select ename, mgr, sal, deptno from emp;

-- 다른 테이블에서도 레코드 복사 가능
select * from c_emp4;
insert into c_emp4(empno, job, hiredate, comm)
    select empno, emp_type, birthday from emp2;
    
desc c_emp4;
desc emp2;

-- rownum : 검색 할 때 자동 행 번호 추가
-- 게시판 만들때 페이징 처리시 이용한다
select ename, job, rownum, sal from emp;

select rownum, job from emp where sal > 3000; -- rownum : 조건 적용x
select rownum, job sal, rowid from wmp; -- where sal > 3000;

-- 가상 테이블 : dual
select sysdate from dual;

-- Sequence : 자동 증가 번호
create sequence autonum; -- 1부터 증가해서 1씩 증가한다

select AUTONUM.nextval from dual; -- 시퀀스값 증가
select AUTONUM.currval from dual; -- 현재 시퀀스값 가져오기

create table kosa_T (
    no number,
    name varchar2(20)
);

insert into kosa_t values(AUTONUM.nextval, 'aa');

select * from kosa_T;

insert into kosa values(AUTONUM.nextval, 'aa', 'name');

create sequence seq_kosa
    INCREMENT by 100;
    
select * from kosa;

create sequence seq_board
    start with 100
    increment by 100;

create table kosa2(
    num number,
    id varchar2(10),
    name varchar2(20)
);

alter sequence seq_board
    cycle;
    
insert into kosa2 values(seq_Board.nextval, 'aa', 'name');

create sequence seq_jumin_no
    increment by 10
    start with 10
    maxvalue 150
    minvalue 9
    cycle
    cache 2;
    
create table jumin_T(
    seq number,
    name varchar2(10),
    phone varchar2(15)
);  -- seqment creation immediate;

insert into jumin_T values(seq_jumin_no.nextval, 'aa', '111');
insert into jumin_T values(seq_jumin_no.nextval, 'bb', '222');

select * from jumin_T;

-- Transaction
create table c_emp100
as
    select * from emp where 1=2; -- 조건에 맞지 않은 상태
-----------------------------
begin
    for i in 1..10000 loop -- for 반복문
        insert into c_emp100
            select * from emp;
    end loop;
end;

---------------------------------------------------------------
select * from c_emp100;
rollback;

update c_emp100 set sal=1000;
delete from c_emp where deptno=20;
rollback;

update c_emp set sal=888 where deptno=20;

select * from c_emp100;
select sum(sal) from c_emp100;

rollback to savepoint update_sal;
commit;

savepoint create_tt;
create table tt ( id number );
insert into tt values(1);
insert into tt values(2);

select * from tt;
rollback to savepoint create_tt;