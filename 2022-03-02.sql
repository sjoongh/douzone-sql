-- ���Խ� ǥ��
-- Ư���� ��Ģ�� ���� ���ڿ��� ������ ǥ���ϴ� �� ����ϴ� ���� ���

select * from reg_test;

select *
    from reg_test
    where REGEXP_LIKE (text, '([aeiou])\1', 'i'); -- ���ڿ�(�Ǵ� ���ڿ� ���� �ʵ��), ����, �� : ��ҹ��ڱ���x �ɼ�
    
select *
    from reg_test
    where REGEXP_LIKE (text, '[abc]');

select *
    from reg_test
    where REGEXP_LIKE (text, '[a-z] [0-9]'); --
    
-- �ҹ��ڳ� �����̳� ���ڰ� ���� ��
select * from reg_Test where REGEXP_LIKE(text, '[a-z] ? [0-9]'); -- ��ҹ��� ���� ����. ?
select * from reg_Test where REGEXP_LIKE(text, '[0-9] ? [a-z]');
select * from reg_Test where REGEXP_LIKE(text, '[A-Z] * [0-9]'); -- ��ҹ��� ���� ����. *
select * from reg_Test where REGEXP_LIKE(text, '[A-Z] ? [0-9]');
select * from reg_Test where REGEXP_LIKE(text, '[0-9] ? [A-Z]');
