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

-- join-- pk / fk����
select ename, job, sal, emp.deptno, dname
from emp, dept
where emp.deptno = dept.deptno;

select ename, job, sal, e.deptno, dname
from emp e, dept d
where e.deptno = d.deptno; -- inner join

select ename, job, sal, e.deptno, dname
from emp e inner join dept d -- ���� ��ġ������
on e.deptno = d.deptno; -- inner join, join�� ���� inner join����

select ename, job, sal, e.deptno, dname
from emp e left outer join dept d -- left outer join
on e.deptno = d.deptno; -- ���ʿ� �ִ� ������ ��� �������� ��ġ�ϴ� �����͸�

select ename, job, sal, e.deptno, dname
from emp e right outer join dept d -- right outer join
on e.deptno = d.deptno; -- �����ʿ� �ִ� ������ ��� ������ ��ġ�ϴ� �����͸�

-- = (inner join), *= (left outer join), =* (right outer join) ������

-- ���� 1, professor / student table �̿�
select p.name, p.position, p.profno, s.name, s.studno, s.grade, s.deptno1 
from professor p join student s
on p.profno = s.profno;

-- ���� ���̺�(3�� �̻�) ���� ���
select �÷���,...
    from ���̺��1 ��Ī1 outer left join
    ���̺��2 ��Ī2 right outer join ���̺��3 ��Ī3
    on ��Ī1.�÷��� = ��Ī2.�÷���,
    on ��Ī2.�÷��� = ��Ī3.�÷���;

select e.ename, d.dname, e.empno, e.job, d.loc 
from emp e 
join dept d on e.deptno = d.deptno;

-- ���̺� ���� / ���ڵ� ���� -----------
-- ���̺� ���縦 �ϸ� ���������� ������� �ʴ´�.
-- ����
create table ���̺��̸�
    as select �ʵ��,...... from ���̺��

select * from emp;
create table c_emp
    as
    select * from c_emp;
    
create table c_emp_30
    as select empno ��ȣ, ename �̸�, job ����, sal �޿�
    from emp
    where deptno=30; -- ��������, ��Ī
    
 -- �������� Ȯ�� ��� 1) ���̿� 2) ��ɾ�
 select * from all_constraints
 where table_name = 'EMP'; -- ������ ��ųʸ����� ��κ� �빮�ڷ� �����
    
-- ���� ���̺��� ���Ӱ��縸 �̾Ƽ� ���̺� ����
create table test
    as select position ���Ӱ���
    from professor
    where professor = '���Ӱ���';
-- emp ���̺��� mgr(�Ŵ�����ȣ)�� 7566�� ����� �����ؼ� ���ο� ���̺� ����
create table test2
as select * from emp
where mgr = 7566;
rollback;

-- ���ڵ庹��
-- ����> �������� �����ϱ� ���Ҷ�

create table c_emp3
    as select empno, ename, job, sal from emp; -- ���ϴ��ʵ忡 �ش��ϴ� ���ڵ� ����

-- union

select * from emp
union -- �ߺ��� ����
    select * from c_emp;

select * from emp
union all -- �ߺ��� ����
    select * from c_emp;
    
-- �˻�
select * from c_emp where job in ('MANAGER', 'manager');
select * from c_emp where job = 'MANAGER'  or job = 'manager';

-- pprt 3��,4��,8�� �ǽ�

-- 1. c_emp_20, c_emp4 union ���
select * from c_emp20
union
select * from e_emp4 union;

-- 2. �����ȣ, �̸�, �޿� �׸��� 15%�λ�� �޿��� ������ ǥ���ϵ�
-- �÷����� New Salary�� �����Ͽ� ���
select empno �����ȣ, ename �̸�, sal �޿�, ceil(sal * 1.15)+sal "New Salary" 
from emp;

--����3] 15�� ������ ������ �����Ϳ��� �޿� �λ��(�� �޿����� ���� 
-- �޿��� �� ��)�� �߰��ؼ� ����϶�.(�÷����� Increase�� �϶�).  
select empno, ename, sal, ceil(sal *1.15) - sal as Increase
from emp;
--����4] �� ����� �̸��� ǥ���ϰ� �ٹ� �� ���� ����Ͽ� �÷����� 
-- Months_Works�� �����ϰ�, �ٹ� �޼��� �������� ������ 
-- ������� �����Ͽ� ����϶�.    
select ename, hiredate, floor(months_between(sysdate, hiredate)) as Months_Works
from emp 
order by Months_Works desc;

select * from emp;

--����5] ����� �̸��� Ŀ�̼��� ����ϵ�, Ŀ�̼��� å������ ���� 
-- ����� Ŀ�̼��� 'no commission'���� ����϶�.
select ename, nvl(to_char(comm), 'no commission') as comm
from emp;