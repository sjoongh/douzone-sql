select * from student where weight > any( 70, 80 );

-- �Լ�
-- ����(�׷�) �Լ�
select * from gift;
select sum(g_start), sum(g_end) from gift;
select sum(g_start) "�����հ�", sum(g_end) "��ǰ �ִ밪�� ����" from gift;

select sum(g_start), avg(g_start), max(g_start), min(g_start) from gift;
