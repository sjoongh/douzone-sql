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

select name, tel, instr(tel, ')' ) ������ȣ
    from student;
-- substr(tel, ������ġ, ��������);
select name, tel, substr(tel, 1, instr(tel, ')') -1 ) ������ȣ
    from student
    where deptno1=101;
    
select dname, substr(dname, 3) from dept2;
select dname, substr(dname, 2,3) from dept2;

select rpad(dname, 10, substr('1234567890', length(dname)+1) ) RAAD���� 
from dept2;

select concat(name, position) || '��'
from professor;

select name || position || '��' -- || �� ���ڿ� ��ġ�� ������
from professor;


-- order by
select * from emp2
order by name, deptno desc, pay desc;

select * from emp2
-- order by�� ���ڷ� ������ �� �ִ�. ���� �İ� ���� ������ ��
order by 2, 4 desc, 8 desc; -- sql�� �ε����� 1������ ������

-- �����Լ� ����
-- dept2 ���̺��� ����Ͽ� dname
-- rpad : Ư�� ���ڷ� �ڸ��� ä���
-- rpad(�ʵ��, ��ü�ڸ���, ǥ���Ǳ� ���ϴ� ��ȣ);
-- substr : ���ڿ� �Ϻκ�����
-- substr(�����ҹ��ڿ�, ����);
select rpad(dname, 10, substr('1234567890', length(dname)+1))
from dept2;

select Months_between(to_date('02-23-2022', 'MM-DD-YYYY'),
    to_date('01-01-2016', 'MM-DD-YYYY')) Months from dual;

select trunc(Months_between(sysdate, birthday), 0) Months
from emp2;
    
select hiredate, to_char(ADD_MONTHS(hiredate, 1), 'DD-MON-YYYY') from professor;

select next_day('2022/02/23', 2) "Next Day" from dual; -- 1 : �Ͽ��� 2 : ������
select next_day('2022/02/23', 6) "Next Day" from dual; -- 6 : �ݿ���

select sysdate, last_day(sysdate) "Last day",
    last_day(sysdate) - sysdate "Days Left"
    from dual;
    
select to_char(2000, '999,999'),
    to_char(2000, 'L999,999'),
    to_char(2000, '$999,999')
    from dual;
    
select * from emp;

-- DECODE(deptname, 'A',1,0)
-- deptname�� 'A'�� ������ 1�� �ƴ϶�� 0�� ���
-- 0�� �� �ְ� ����� �� �� ����
-- DECODE(deptname, 'A', 1)

select ename,
    CASE -- CASE sal���� sal�� ��������
    WHEN sal < 1000 THEN sal+(sal*0.8)
    WHEN sal BETWEEN 1000 AND 2000 THEN sal+(sal * 0.9)
    ELSE sal+(sal*0.1)
    END sal
FROM emp;

-- pdept�� ���� ������� ����ϼ��� (dcode, case �̿�)
select DECODE(pdept, pdept, dname) from dept2;

select dname,
    CASE
    WHEN pdept = pdept THEN pdept
    END pdept
from dept2;