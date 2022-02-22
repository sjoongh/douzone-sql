select * from student where weight > any( 70, 80 );

-- 함수
-- 집계(그룹) 함수
select * from gift;
select sum(g_start), sum(g_end) from gift;
select sum(g_start) "시작합계", sum(g_end) "상품 최대값의 총합" from gift;

select sum(g_start), avg(g_start), max(g_start), min(g_start) from gift;


select * from professor;
select count(*) from professor;
select count(hpage) from professor;

-- oracle은 null값이 우선순위 높음, mysql은 null값이 우선순위 낮음
select rank(90001) within group(order by g_start desc)
    from gift
    where g_start is not null; -- null값 제외
    
-- 키가 168인 사람은 몇 번째로 큰지 확인
select rank(168) within group(order by height desc) from student;

-- 몸무게가 58인 사람은 몇번째인지 등수 구하기
select rank(58) within group(order by weight desc) from student;

-- g_end가 200000, 60000보다 작은값 출력(any)
select * from gift
where g_end > any(200000, 600000);

-- 학생들의 키의 합과 평균, 가장 키가 큰 친구, 작은 친구 출력
-- 집계함수 사용시 Group bt : 소계(부분합)
select sum(height) ,avg(height), max(height), min(height) 
from student
group by grade;

-- emp_type별로 pay합, 평균, 최고급여, 최하급여 구하기
select sum(pay), avg(pay), max(pay), min(pay) 
from emp2
group by emp_type;

-- 조건 : where, having 절 이용한다
select grade, sum(height), avg(height), max(height), min(weight)
    from student
    group by grade
    having avg(height) > 172;
    
select avg(height) from student;
select name, height from student;


-- emp2 테이블 이용
-- 부서별로 pay 합과 평균 구하기
select sum(pay) 합, avg(pay) 평균 from emp2
group by deptno;

-- 부서별로 pay 합과 평균 구하기
select sum(pay) 합, avg(pay) 평균 from emp2
group by emp_type;

-- 직급 별(postion)로 급여합, 평균 구해서 급여의 전체 평균보다 많이 받는 사람
select position, avg(pay), sum(pay)
from emp2
group by position
having avg(pay) > (select avg(pay) from emp2);

-- 작급별로 급여합, 평균 구하는데 직급이 과장인 사람들만
select position, sum(pay) 급여합, avg(pay) 평균 
from emp2
group by position
having position ='과장';