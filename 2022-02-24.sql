-- SubQuery
-- ex) select * from emp where ename = (������������);
-- ��Į�� ��������
-- view(�������̺�)
-- ��������
select * from emp2;
select * from emp2 where name='�����';

select * from emp2 where pay > (select pay from emp2 where name='�����');

select * from emp2
where pay < (select avg(pay) from emp2);

-- 1. student ���̺�� depart���̺��� ����Ͽ� ������ �л��� ������ ������
-- �л����� �̸��� ���� �̸� ���
select name, dname
from student s, department d
where s.deptno1 = d.deptno 
and s.deptno1 = (select deptno1 from student where name='������');

-- �������̺��� �Ի����� �۵��� �������� ���߿� �Ի��� ����� �Ի���, �а��� ���
select * from professor;

select hiredate, deptno
from professor
where hiredate > (select hiredate from professor where name = '�۵���');

-- 3. �л����̺��� ����1�� 101�� �а��� ��� �����Ժ��� �����԰� ����
-- �л����� �̸��� ������ ���
select name, weight
from student
where weight > (select avg(weight) from student where deptno1=101);
select deptno1, weight
    from student
    where deptno1 > (select avg(weight) from student where deptno1 = 101);
    