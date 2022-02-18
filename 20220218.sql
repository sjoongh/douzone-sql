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
select sysdate from dual;