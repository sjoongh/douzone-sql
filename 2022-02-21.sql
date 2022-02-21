-- select 별칭주기
select *
    from emp2
    where position='부장';
    
select empno, name, pay, position
    from emp2
    where position='부장';
    
select empno as "사원번호", name "성 명", pay 급여, position "직 급"
    from emp2
    where position='부장';
    
select empno as "사원번호", name "성 명", pay 급여, position "직 급"
    from emp2
    where position='과장' and name='유관순';
    
    
select * from emp2 where deptno=1000l

select * 
    from emp2
    where name like '김%';
    
select *
    from emp2
    where name like '아%';
    
select *
    from professor
    where name like '%은';
    
select *
    from professor
--    where name like '_은'
    where name like '__';
    
select *
    from professor
    where name like '%원_';
    
-- 숫자
select *
    from professor
--    where pay > 500;
    where pay <= 300;
    
select * from professor where bonus is not null;
select * from professor where bonus is null;

-- 1. 급여가 500 이상이고, 보너스가 60이상 받는 교수는?
select * 
from professor
where pay >= 500 and bonus >= 60;

-- 2. 이름이 '나한라'을 '너한라'으로 변경
update emp2 set name='너한라' 
where name='나한라';

select name from emp2 where name like '%한라'; -- check

-- 3. 취미가 등산인 사람들만 찾 아서 '수영'으로 변경
update emp2 set hobby='수영' 
where hobby='등산';

select name, hobby from emp2 where hobby like '수영'; -- check

-- 4. 계약직 직원 찾아서 삭제
delete emp2 
where emp_type='계약직';

-- 5. pay가 50이상인 사람만 출력
select * from professor
where pay >= 50 or bonus >= 50;

-- 6. ~세트가 아닌 상품들만 출력
select * from gift
where gname not like '%세트%';

-- 7. gno가 10인 상품의 이름을 null 처리
update gift set gname=null 
where gno = 10;

-- 8. gname 이름이 없고, g_Start가 999인 값을 갖는 데이터입력
insert into gift(gname, g_start) values (null, 999);

-- 9. gname이 null이거나 ' '인 데이터를 제외하고 출력
select * 
from gift
where gname not like null or gname not like ' ';


-- 연산자
select mod(7, 3) from dual;
select 7/3 from dual;

-- null 연산은 무조건 null
select name, pay, bonus from professor;
select name, pay, nvl(bonus, 0) from professor;

update professor set bonus = bonus+100;
update professor set bonus = nvl(bonus, 0) + 100;
rollback

select * from gift;
select * from gift where gno=1 or gno=3 or gno=7;
select * from gift where gno in(1,3,7); -- 권장
select * from gift where gno not in(1,3,7);

select * from gift where gno between 6 and 9;
select * from gift where gno between 9 and 6; -- X

-- 정규직이면서 '백원만' 찾기

-- 정규직이거나 '유도봉' 찾기

-- 수습직이거나 김씨성을 가진 사람 찾기

-- 김씨가 아닌 수습직원 찾기

