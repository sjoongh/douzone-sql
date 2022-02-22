select * from student where weight > any( 70, 80 );

-- 함수
-- 집계(그룹) 함수
select * from gift;
select sum(g_start), sum(g_end) from gift;
select sum(g_start) "시작합계", sum(g_end) "상품 최대값의 총합" from gift;

select sum(g_start), avg(g_start), max(g_start), min(g_start) from gift;
