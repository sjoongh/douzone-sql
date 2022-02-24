-- SubQuery
-- ex) select * from emp where ename = (서브쿼리문장);
-- 스칼라 서브쿼리
-- view(가상테이블)
-- 서브쿼리
select * from emp2;
select * from emp2 where name='백원만';

select * from emp2 where pay > (select pay from emp2 where name='백원만');

select * from emp2
where pay < (select avg(pay) from emp2);

-- 1. student 테이블과 depart테이블을 사용하여 이윤나 학생과 전공이 동일한
-- 학생들의 이름과 전공 이름 출력
select name, dname
from student s, department d
where s.deptno1 = d.deptno 
and s.deptno1 = (select deptno1 from student where name='이윤나');

-- 교수테이블에서 입사일이 송도권 교수보다 나중에 입사한 사람의 입사일, 학과명 출력
select * from professor;

select hiredate, deptno
from professor
where hiredate > (select hiredate from professor where name = '송도권');

-- 3. 학생테이블에서 전공1이 101인 학과의 평균 몸무게보다 몸무게가 많은
-- 학생들의 이름과 몸무게 출력
select name, weight
from student
where weight > (select avg(weight) from student where deptno1=101);
select deptno1, weight
    from student
    where deptno1 > (select avg(weight) from student where deptno1 = 101);
    