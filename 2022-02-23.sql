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