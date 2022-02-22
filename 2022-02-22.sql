select * from student where weight > any( 70, 80 );

-- �Լ�
-- ����(�׷�) �Լ�
select * from gift;
select sum(g_start), sum(g_end) from gift;
select sum(g_start) "�����հ�", sum(g_end) "��ǰ �ִ밪�� ����" from gift;

select sum(g_start), avg(g_start), max(g_start), min(g_start) from gift;


select * from professor;
select count(*) from professor;
select count(hpage) from professor;

-- oracle�� null���� �켱���� ����, mysql�� null���� �켱���� ����
select rank(90001) within group(order by g_start desc)
    from gift
    where g_start is not null; -- null�� ����
    
-- Ű�� 168�� ����� �� ��°�� ū�� Ȯ��
select rank(168) within group(order by height desc) from student;

-- �����԰� 58�� ����� ���°���� ��� ���ϱ�
select rank(58) within group(order by weight desc) from student;

-- g_end�� 200000, 60000���� ������ ���(any)
select * from gift
where g_end > any(200000, 600000);

-- �л����� Ű�� �հ� ���, ���� Ű�� ū ģ��, ���� ģ�� ���
-- �����Լ� ���� Group bt : �Ұ�(�κ���)
select sum(height) ,avg(height), max(height), min(height) 
from student
group by grade;

-- emp_type���� pay��, ���, �ְ�޿�, ���ϱ޿� ���ϱ�
select sum(pay), avg(pay), max(pay), min(pay) 
from emp2
group by emp_type;

-- ���� : where, having �� �̿��Ѵ�
select grade, sum(height), avg(height), max(height), min(weight)
    from student
    group by grade
    having avg(height) > 172;
    
select avg(height) from student;
select name, height from student;


-- emp2 ���̺� �̿�
-- �μ����� pay �հ� ��� ���ϱ�
select sum(pay) ��, avg(pay) ��� from emp2
group by deptno;

-- �μ����� pay �հ� ��� ���ϱ�
select sum(pay) ��, avg(pay) ��� from emp2
group by emp_type;

-- ���� ��(postion)�� �޿���, ��� ���ؼ� �޿��� ��ü ��պ��� ���� �޴� ���
select position, avg(pay), sum(pay)
from emp2
group by position
having avg(pay) > (select avg(pay) from emp2);

-- �۱޺��� �޿���, ��� ���ϴµ� ������ ������ ����鸸
select position, sum(pay) �޿���, avg(pay) ��� 
from emp2
group by position
having position ='����';