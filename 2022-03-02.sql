-- 정규식 표현
-- 특정한 규칙을 가진 문자열의 집합을 표현하는 데 사용하는 형식 언어

select * from reg_test;

select *
    from reg_test
    where REGEXP_LIKE (text, '([aeiou])\1', 'i'); -- 문자열(또는 문자열 포함 필드명), 패턴, ㅑ : 대소문자구분x 옵션
    
select *
    from reg_test
    where REGEXP_LIKE (text, '[abc]');

select *
    from reg_test
    where REGEXP_LIKE (text, '[a-z] [0-9]'); --
    
-- 소문자나 공백이나 숫자가 들어가는 것
select * from reg_Test where REGEXP_LIKE(text, '[a-z] ? [0-9]'); -- 대소문자 구분 없음. ?
select * from reg_Test where REGEXP_LIKE(text, '[0-9] ? [a-z]');
select * from reg_Test where REGEXP_LIKE(text, '[A-Z] * [0-9]'); -- 대소문자 구분 없음. *
select * from reg_Test where REGEXP_LIKE(text, '[A-Z] ? [0-9]');
select * from reg_Test where REGEXP_LIKE(text, '[0-9] ? [A-Z]');
