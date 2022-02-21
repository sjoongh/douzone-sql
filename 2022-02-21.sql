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
    where pay > 500;
    