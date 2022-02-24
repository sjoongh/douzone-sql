-- View
/*
-- create view 뷰이름
create or replace view 뷰이름
    as 뷰의내용
    
drop view 뷰이름
*/


create view v_emp
as
    select empno, ename, deptno from emp;

select * from v_emp;

-- 문제10] 30번 부서 사원들의 직위, 이름, 월급을 담은 view 테이블 만들기 (emp)
create view v_emp2
as
    select job 직위, ename 이름, sal 월급 from emp;

select * from emp;
-- 문제11] 30번 부서 사원들의 직위, 이름, 월급을 담은 view 테이블 만드는데,
-- 컬럼명을 직위, 사원이름, 급여로 Alias를 주고 월급이 3000보다 많은 사원들만 추출한다.
create view v_emp3
as
    select  job 직위, ename 사원이름, sal Alias from emp where deptno= 30 and 3000 < sal;
    
select * from v_emp3;
drop view v_emp3;
-- 문제12] 부서별 최대급여, 최소급여, 평균급여를 갖는 view 만드시오
create view v_emp4
as
    select deptno, max(sal) 최대급여, min(sal) 최소급여, ceil(avg(sal)) 평균급여 from emp group by deptno;
select * from v_emp4;
-- 문제13] 부서별 평균급여를 갖는 view 만드는데, 평균급여가 2000이상인 부서만 출력하세요.
create view v_emp5
as
    select deptno, ceil(avg(sal)) 평균급여 from emp where avg(sal) <= 2000;