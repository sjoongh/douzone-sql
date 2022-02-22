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

select position, sum(pay) �޿���, round(12.3456, 2), round(avg(nvl(pay, 0), 2)) ��� 
from emp2
where position is not null -- null�� ����
group by position -- �Ϲ��ʵ� �׷�ȭ
having position ='����'; -- �׷�ȭ�� �Ϳ����� ����

-- ���� �Լ�
select  round(12.3456789, 0), round(12.3456789, 2), round(12.5456789, 0)
from dual;

select ceil(12.34), ceil(-12.34) from dual; -- �ø� �� �� ���� ��ȯ
select floor(12.34), floor(-12.34) from dual; -- ���� �� �� ���� ��ȯ
select * from dept;
select * from emp2, dept2; -- ���̺� �� �� ����
select ceil(12.34), ceil(-12.34), floor(12.34), floor(-12.34) from dual;
select trunc(12.3456, 2), trunc(-12.3756, 2), trunc(12.3756, 0) from dual;

-- ���� ���̺��� ���޿� �λ�� 2%�� �� ����� ����Ͻÿ�, (�Ҽ��� 0ó��)
select ceil((pay *0.2) + pay) ���� from professor;

-- ���� ���̺��� ��� �����鿡�� ���ʽ� 1000���� �߰������ϱ�
select nvl(bonus+1000, 1000) from professor;

-- ���ڿ��Լ�
select UPPER(id) from professor;
select initcap(id) from professor;
select id, length(id), length('abcd') from professor;
select substr(jumin, 7,1) from gogak; -- ������ �Ϻκ� ����-str(���ڿ�, ����, ����)
select instr('abcd', 'b') from dual; -- index��ȣ�� 1���� ����
select id, instr(id, 'b') from professor;
select instr('abasdasdas', 'b', -1) from dual; -- -1�̸� �ڿ������� ã�´�.

-- lpad(���ڿ�, ��ü�ڸ���, Ư������) -> ������ ���� �� ���� �� ���鿡 Ư�����ڷ� ä��
-- Rpad() --> ���� ���� �� ������ �� ���鿡 Ư�����ڷ� ä��
select lpad('abcd', 20, '#') from dual;
select rpad('abcd', 20, '@') from dual;

select length('�����') from dual; -- �ѱ۵� �ѱ��� 1����Ʈ
select lengthb('�����') from dual; -- 9����Ʈ

select dname, length(dname), lengthb(dname) from dept2;
select dname, substr(dname, 3) from dept2; -- 3��°���� ������ ������
select dname, substr(dname, 2, 3) from dept2; 

select rpad(dname, 10, substr('1234567890', length(dname)+1)) RAAD���� from dept2;

-- ltrim ���� ��������
-- rtrim ������ ��������

-- student ���̺��� 1 ������ 201 ���� �л����� id�� �̸��� �Բ� �ҹ���, �빮�ڷ� ���
select UPPER(id), LOWER(id)
from student
where  deptno1 = 201;