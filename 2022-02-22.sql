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

select position, sum(pay) 급여합, round(12.3456, 2), round(avg(nvl(pay, 0), 2)) 평균 
from emp2
where position is not null -- null값 제외
group by position -- 일반필드 그룹화
having position ='과장'; -- 그룹화한 것에대한 조건

-- 숫자 함수
select  round(12.3456789, 0), round(12.3456789, 2), round(12.5456789, 0)
from dual;

select ceil(12.34), ceil(-12.34) from dual; -- 올림 한 후 정수 반환
select floor(12.34), floor(-12.34) from dual; -- 내림 한 후 정수 반환
select * from dept;
select * from emp2, dept2; -- 테이블 두 개 보기
select ceil(12.34), ceil(-12.34), floor(12.34), floor(-12.34) from dual;
select trunc(12.3456, 2), trunc(-12.3756, 2), trunc(12.3756, 0) from dual;

-- 교수 테이블에서 월급에 인상률 2%를 한 결과를 출력하시요, (소수점 0처리)
select ceil((pay *0.2) + pay) 월급 from professor;

-- 교수 테이블에서 모든 교수들에게 보너스 1000원씩 추가지급하기
select nvl(bonus+1000, 1000) from professor;

-- 문자열함수
select UPPER(id) from professor;
select initcap(id) from professor;
select id, length(id), length('abcd') from professor;
select substr(jumin, 7,1) from gogak; -- 문자의 일부분 추출-str(문자열, 시작, 개수)
select instr('abcd', 'b') from dual; -- index번호가 1부터 시작
select id, instr(id, 'b') from professor;
select instr('abasdasdas', 'b', -1) from dual; -- -1이면 뒤에서부터 찾는다.

-- lpad(문자열, 전체자리수, 특정문자) -> 오른쪽 정렬 후 왼쪽 빈 공백에 특정문자로 채움
-- Rpad() --> 왼쪽 정렬 후 오른쪽 빈 공백에 특정문자로 채움
select lpad('abcd', 20, '#') from dual;
select rpad('abcd', 20, '@') from dual;

select length('사장실') from dual; -- 한글도 한글자 1바이트
select lengthb('사장실') from dual; -- 9바이트

select dname, length(dname), lengthb(dname) from dept2;
select dname, substr(dname, 3) from dept2; -- 3번째부터 끝까지 가져옴
select dname, substr(dname, 2, 3) from dept2; 

select rpad(dname, 10, substr('1234567890', length(dname)+1)) RAAD연습 from dept2;

-- ltrim 왼쪽 공백제거
-- rtrim 오른쪽 공백제거

-- student 테이블에서 1 전공이 201 번인 학생들의 id를 이름과 함께 소문자, 대문자로 출력
select UPPER(id), LOWER(id)
from student
where  deptno1 = 201;