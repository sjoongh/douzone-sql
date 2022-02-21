select * from tab;

create table SampleTable (
    num number,
    name VARCHAR2(20) not null,
    phone varchar2(15),
    address varchar2(50)
);

select * from sampletable; -- 전체보기
select name, address from sampletable; -- 특정 필드만 보기

-- insert --
insert into sampletable values(10, 'doyeon', '010-9872-0202', '서울');
insert into sampletable values(20, '강감찬', '010-5555-0202', '부산');
insert into sampletable (name, address, phone, num) values('aa', 'jeju', '2222', 30);
insert into sampletable (name, address) values('bb', '2222');

commit; -- 완료

-- update --
update sampletable set name ="이도연"; -- 전체수정
update sampletable set name ="이도연" where name='doyeon'; -- 조건수정
update sampletable set name ="doyeon", address='대구' where name='이도연';

desc sampletable; -- 테이블 구조
delete sampletable; -- 레코드 전체 삭제
rollback;

delete sampletable where name="aa";

drop table sampletable; -- rollback 안됨

-- 한 줄 주석
/* 여러줄 주석 */

select * from emp2;
desc emp2;
select empno, name, emp_type, deptno from emp2; -- 사번, 이름, 타입, 부서

select *
    from emp2
    where emp_type ="계약직"
    -- order by name; -- 오름차순 정렬
    order by name desc; -- 내림차순 정렬
    
show user;

select sysdate from emp2;
select sysdate from sampletable;
select sysdate from dual; -- 가상테이블 제공


--제약조건
CREATE TABLE userlist(
id VARCHAR2(10) CONSTRAINT id_pk PRIMARY key, 
name varchar2(10) not null
);

select * from userlist;

insert into userlist values('smile', '김연아');
insert into userlist values('kingsmile', '박연아');
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
--age컬럼의 값은 20~30사이만 허용
);

select * from ck_Test;
insert into ck_test values('aa', 21);
insert into ck_test values('bb', 19);
insert into ck_test values('cc', 41);

CREATE TABLE db_test (
    NAME VARCHAR2(10) NOT NULL,
    addr VARCHAR2(10) DEFAULT '서울'
);

select * from emp2;

-- 컬럼삭제
alter table userlist drop COLUMN no;
alter table userlist drop (name, gender);

-- datatype 변경
-- alter table 테이블이름 modify 컬럼이름 변경 자료형
