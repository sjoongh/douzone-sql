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