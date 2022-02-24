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
    
--------------------------------------------
select * from dept2 where area='��������';

select empno, name, deptno
    from emp2
    where deptno in (select dcode from dept2 where area='��������');
    
-- 4. emp2 ���̺��� ����Ͽ� ��ü ���� �� ���� ������ �ּ� �����ں���
-- ������ ���� ����� �̸��� ����, ���� ���, �� ���� ��� ������ õ ����
-- ���б�ȣ(,)�� �� ǥ�ñ��� ����ϱ�
select * from emp2;
select name, position, to_char(pay, '999,999,999') || '��' ���� 
from emp2
where pay > any(select min(pay) from emp2 where position='����');

select name, position, to_char(pay, '999,999,999') || '��' ���� 
from emp2
where pay > all(select min(pay) from emp2 where position='����');

--------------------------------------------------------------------
--����5]student ���̺��� ��ȸ�Ͽ� ��ü �л� �߿��� ü���� 4�г� �л����� ü�߿��� ���� ���� ������ 
--�л����� ���� �л��� �̸��� �г�� �����Ը� ���.
select name, grade, weight
from student
where weight < any(select min(weight) from student where grade=4);

--����6]student ���̺��� ��ȸ�Ͽ� �� �г⺰�� �ִ� Ű�� ���� �л����� �г�� �̸��� Ű�� ���.
select * from student;

select name �̸�, grade �Ի���, height �а���
from student
where (grade, height) in (select max(grade), max(height) from student group by grade);

--����7]professor ���̺��� ��ȸ�Ͽ� �� �а����� �Ի����� ���� ������ ������ ������ȣ�� �̸�, �Ի���, �а����� ���. 
-- ��, �а�������� �������� ����.
select * from professor;

select name �̸�, hiredate �Ի���, deptno �а���
from professor
where (deptno, hiredate) in (select max(deptno) ,min(hiredate) from professor group by deptno)
order by deptno;