-- View
/*
-- create view ���̸�
create or replace view ���̸�
    as ���ǳ���
    
drop view ���̸�
*/


create view v_emp
as
    select empno, ename, deptno from emp;

select * from v_emp;

-- ����10] 30�� �μ� ������� ����, �̸�, ������ ���� view ���̺� ����� (emp)
create view v_emp2
as
    select job ����, ename �̸�, sal ���� from emp;

select * from emp;
-- ����11] 30�� �μ� ������� ����, �̸�, ������ ���� view ���̺� ����µ�,
-- �÷����� ����, ����̸�, �޿��� Alias�� �ְ� ������ 3000���� ���� ����鸸 �����Ѵ�.
create view v_emp3
as
    select  job ����, ename ����̸�, sal Alias from emp where deptno= 30 and 3000 < sal;
    
select * from v_emp3;
drop view v_emp3;
-- ����12] �μ��� �ִ�޿�, �ּұ޿�, ��ձ޿��� ���� view ����ÿ�
create view v_emp4
as
    select deptno, max(sal) �ִ�޿�, min(sal) �ּұ޿�, ceil(avg(sal)) ��ձ޿� from emp group by deptno;
select * from v_emp4;
-- ����13] �μ��� ��ձ޿��� ���� view ����µ�, ��ձ޿��� 2000�̻��� �μ��� ����ϼ���.
create view v_emp5
as
    select deptno, ceil(avg(sal)) ��ձ޿� from emp group by deptno 
    having avg(sal) <= 2000;

 -- 14. ������ �ѱ޿��� ���ϴ� view ���̺��� ����µ�, ����(job)�� manager�� �������
 -- �����ϰ� �� �޿��� 3000�̻��� �����鸸 ������ ���̺� �����
 create view v_emp6
 as
    select job, sum(sal) �޿� from emp 
    where job not in ('MANAGER', 'manager')
    group by job
    having sum(sal) >= 3000;
    
 -- 15. �л� ���̺��� �г⺰ Ű�� 165�̻��̰�
 -- �����Դ� 60 �̻��� ����鸸 ����ϴ� �� ���̺� �����asd
 -- round 0->(�⺻)�Ҽ��� ù��°�ڸ�, 1 -> �Ҽ��� �ι�° �ڸ�
 -- -1 -> �����ڸ�
 -- -2 -> �����ڸ�
 create view v_emp7
 as
    select grade, round(avg(height), 1) Ű, avg(weight) ������ from student 
    group by grade
    having avg(height) >= 165 and avg(weight) >= 60;
    
select * from v_emp7;

-- 16. �������̺��� ���Ӱ���鸸 �ִ� ���� ���̺� �����
create view v_pro
as
    select * from professor where position in '���Ӱ���';

select * from v_pro;

 -- �������� Ȯ�� �� ���� ���� ���� ������ ��