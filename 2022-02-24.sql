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
    
--------------------------------------------
select * from dept2 where area='서울지사';

select empno, name, deptno
    from emp2
    where deptno in (select dcode from dept2 where area='서울지사');
    
-- 4. emp2 테이블을 사용하여 전체 직원 중 과장 직급의 최소 연장자보다
-- 연봉이 높은 사람의 이름과 직급, 연봉 출력, 단 연봉 출력 형식은 천 단위
-- 구분기호(,)와 원 표시까지 출력하기
select * from emp2;
select name, position, to_char(pay, '999,999,999') || '원' 연봉 
from emp2
where pay > any(select min(pay) from emp2 where position='과장');

select name, position, to_char(pay, '999,999,999') || '원' 연봉 
from emp2
where pay > all(select min(pay) from emp2 where position='과장');

--------------------------------------------------------------------
--문제5]student 테이블을 조회하여 전체 학생 중에서 체중이 4학년 학생들의 체중에서 가장 적게 나가는 
--학생보다 적은 학생의 이름과 학년과 몸무게를 출력.
select name, grade, weight
from student
where weight < any(select min(weight) from student where grade=4);

--문제6]student 테이블을 조회하여 각 학년별로 최대 키를 가진 학생들의 학년과 이름과 키를 출력.
select * from student;

select name 이름, grade 입사일, height 학과명
from student
where (grade, height) in (select max(grade), max(height) from student group by grade);

--문제7]professor 테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의 교수번호와 이름, 입사일, 학과명을 출력. 
-- 단, 학과명순으로 오름차순 정렬.
select * from professor;

select name 이름, hiredate 입사일, deptno 학과명
from professor
where (deptno, hiredate) in (select max(deptno) ,min(hiredate) from professor group by deptno)
order by deptno;