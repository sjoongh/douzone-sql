select * from student;
select * from student where deptno1 = 103;

select name, rtrim(regexp_replace(name, '(.)', '\-1' ), '-') "변경후"
    from student
    where deptno1 = 103;
    
select name, rtrim(regexp_replace(name, '(/)', '\\' ), '-') "변경후"
    from student
    where deptno1 = 103;
    
select * from reg_Test;
-- 날짜함수 / 형변환함수
select sysdate from dual;
select to_char (sysdate, 'YYYY-MM-DD HH:MI:SS') from dual; -- 연월일, 시분초
select to_char (sysdate, 'YYYY-MM-DD HH:MI') from dual;
select to_char (sysdate, 'YYYY-MM-DD') from dual;
select to_char (sysdate, 'YYYY-MM-DD HH24:MI:SS') from dual;

select name, tel, instr(tel, ')' ) 지역번호
    from student;
-- substr(tel, 시작위치, 뽑을개수);
select name, tel, substr(tel, 1, instr(tel, ')') -1 ) 지역번호
    from student
    where deptno1=101;
    
select dname, substr(dname, 3) from dept2;
select dname, substr(dname, 2,3) from dept2;

select rpad(dname, 10, substr('1234567890', length(dname)+1) ) RAAD연습 
from dept2;

select concat(name, position) || '님'
from professor;

select name || position || '님' -- || 는 문자열 합치는 연산자
from professor;


-- order by
select * from emp2
order by name, deptno desc, pay desc;

select * from emp2
-- order by를 숫자로 정렬할 수 있다. 위의 식과 같은 동작을 함
order by 2, 4 desc, 8 desc; -- sql은 인덱스가 1번부터 시작함

-- 문자함수 퀴즈
-- dept2 테이블을 사용하여 dname
-- rpad : 특정 문자로 자리수 채우기
-- rpad(필드명, 전체자리수, 표현되길 원하는 기호);
-- substr : 문자열 일부분추출
-- substr(추출할문자열, 기준);
select rpad(dname, 10, substr('1234567890', length(dname)+1))
from dept2;

select Months_between(to_date('02-23-2022', 'MM-DD-YYYY'),
    to_date('01-01-2016', 'MM-DD-YYYY')) Months from dual;

select trunc(Months_between(sysdate, birthday), 0) Months
from emp2;
    
select hiredate, to_char(ADD_MONTHS(hiredate, 1), 'DD-MON-YYYY') from professor;

select next_day('2022/02/23', 2) "Next Day" from dual; -- 1 : 일요일 2 : 월요일
select next_day('2022/02/23', 6) "Next Day" from dual; -- 6 : 금요일

select sysdate, last_day(sysdate) "Last day",
    last_day(sysdate) - sysdate "Days Left"
    from dual;
    
select to_char(2000, '999,999'),
    to_char(2000, 'L999,999'),
    to_char(2000, '$999,999')
    from dual;
    
select * from emp;

-- DECODE(deptname, 'A',1,0)
-- deptname이 'A'와 같으면 1을 아니라면 0을 출력
-- 0을 안 넣고 사용할 수 도 있음
-- DECODE(deptname, 'A', 1)

select ename,
    CASE -- CASE sal에서 sal은 생략가능
    WHEN sal < 1000 THEN sal+(sal*0.8)
    WHEN sal BETWEEN 1000 AND 2000 THEN sal+(sal * 0.9)
    ELSE sal+(sal*0.1)
    END sal
FROM emp;

-- pdept에 따라서 지사명을 출력하세요 (dcode, case 이용)
select DECODE(pdept, pdept, dname) from dept2;

select dname,
    CASE
    WHEN pdept = pdept THEN pdept
    END pdept
from dept2;

-- join-- pk / fk관계
select ename, job, sal, emp.deptno, dname
from emp, dept
where emp.deptno = dept.deptno;

select ename, job, sal, e.deptno, dname
from emp e, dept d
where e.deptno = d.deptno; -- inner join

select ename, job, sal, e.deptno, dname
from emp e inner join dept d -- 양쪽 일치데이터
on e.deptno = d.deptno; -- inner join, join만 쓰면 inner join역할

select ename, job, sal, e.deptno, dname
from emp e left outer join dept d -- left outer join
on e.deptno = d.deptno; -- 왼쪽에 있는 데이터 모두 오른쪽은 일치하는 데이터만

select ename, job, sal, e.deptno, dname
from emp e right outer join dept d -- right outer join
on e.deptno = d.deptno; -- 오른쪽에 있는 데이터 모두 왼쪽은 일치하는 데이터만

-- = (inner join), *= (left outer join), =* (right outer join) 연산자

-- 문제 1, professor / student table 이용
select p.name, p.position, p.profno, s.name, s.studno, s.grade, s.deptno1 
from professor p join student s
on p.profno = s.profno;

-- 여러 테이블(3개 이상) 조인 방법
select 컬럼명,...
    from 테이블명1 별칭1 outer left join
    테이블명2 별칭2 right outer join 테이블명3 별칭3
    on 별칭1.컬럼명 = 별칭2.컬럼명,
    on 별칭2.컬럼명 = 별칭3.컬럼명;

select e.ename, d.dname, e.empno, e.job, d.loc 
from emp e 
join dept d on e.deptno = d.deptno;

-- 테이블 복사 / 레코드 복사 -----------
-- 테이블 복사를 하면 제약조건은 복사되지 않는다.
-- 형식
create table 테이블이름
    as select 필드명,...... from 테이블명

select * from emp;
create table c_emp
    as
    select * from c_emp;
    
create table c_emp_30
    as select empno 번호, ename 이름, job 직업, sal 급여
    from emp
    where deptno=30; -- 조건적용, 별칭
    
 -- 제약조건 확인 방법 1) 툴이용 2) 명령어
 select * from all_constraints
 where table_name = 'EMP'; -- 데이터 딕셔너리에는 대부분 대문자로 저장됨
    
-- 교수 테이블에서 전임강사만 뽑아서 테이블 생성
create table test
    as select position 전임강사
    from professor
    where professor = '전임강사';
-- emp 테이블에서 mgr(매니저번호)가 7566인 사람만 추출해서 새로운 테이블 생성
create table test2
as select * from emp
where mgr = 7566;
rollback;

-- 레코드복사
-- 형식> 구조물만 복사하길 원할때

create table c_emp3
    as select empno, ename, job, sal from emp; -- 원하는필드에 해당하는 레코드 복사

-- union

select * from emp
union -- 중복행 제거
    select * from c_emp;

select * from emp
union all -- 중복행 포함
    select * from c_emp;
    
-- 검색
select * from c_emp where job in ('MANAGER', 'manager');
select * from c_emp where job = 'MANAGER'  or job = 'manager';

-- pprt 3장,4장,8장 실습

-- 1. c_emp_20, c_emp4 union 결과
select * from c_emp20
union
select * from e_emp4 union;

-- 2. 사원번호, 이름, 급여 그리고 15%인상된 급여를 정수로 표현하되
-- 컬럼명을 New Salary로 지정하여 출력
select empno 사원번호, ename 이름, sal 급여, ceil(sal * 1.15)+sal "New Salary" 
from emp;

--문제3] 15번 문제와 동일한 데이터에서 급여 인상분(새 급여에서 이전 
-- 급여를 뺀 값)을 추가해서 출력하라.(컬럼명은 Increase로 하라).  
select empno, ename, sal, ceil(sal *1.15) - sal as Increase
from emp;
--문제4] 각 사원의 이름을 표시하고 근무 달 수를 계산하여 컬럼명을 
-- Months_Works로 지정하고, 근무 달수를 기준으로 오래된 
-- 사람부터 정렬하여 출력하라.    
select ename, hiredate, floor(months_between(sysdate, hiredate)) as Months_Works
from emp 
order by Months_Works desc;

select * from emp;

--문제5] 사원의 이름과 커미션을 출력하되, 커미션이 책정되지 않은 
-- 사원의 커미션은 'no commission'으로 출력하라.
select ename, nvl(to_char(comm), 'no commission') as comm
from emp;