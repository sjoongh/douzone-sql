select * from student;
select * from student where deptno1 = 103;

select name, rtrim(regexp_replace(name, '(.)', '\-1' ), '-') "������"
    from student
    where deptno1 = 103;
    
select name, rtrim(regexp_replace(name, '(/)', '\\' ), '-') "������"
    from student
    where deptno1 = 103;
    
select * from reg_Test;
-- ��¥�Լ� / ����ȯ�Լ�
select sysdate from dual;
select to_char (sysdate, 'YYYY-MM-DD HH:MI:SS') from dual; -- ������, �ú���
select to_char (sysdate, 'YYYY-MM-DD HH:MI') from dual;
select to_char (sysdate, 'YYYY-MM-DD') from dual;
select to_char (sysdate, 'YYYY-MM-DD HH24:MI:SS') from dual;