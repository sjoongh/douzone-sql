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