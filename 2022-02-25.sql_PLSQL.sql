-- PL / SQL
/*
Declare - 선언(선택)
    Begin
            실행(필수)
    End;
*/

Begin
    DBMS_output.put_line('이도연'); --출력
End;
----------------------------------------------------
DECLARE NAME VARCHAR2(20) := '이효리';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('이름은 ' || name); -- 출력
    END;
----------------------------------------------------------- 테이블이름.필드명%type에 대한 예제
declare e_name emp.ename%type;
    e_sal emp.sal%type;
BEGIN
    select sal, ename into e_sal, e_name from emp where empno='7788';
    DBMS_OUTPUT.PUT_LINE('7788님의 이름은 ' || e_name || ' 급여는 ' || e_sal);
end;

----------------------- 테이블이름.필드명%Rowtype에 대한 예제
DECLARE data emp%ROWTYPE;
BEGIN
    SELECT * INTO data From emp where empno = '7788';
    DBMS_OUTPUT.PUT_LINE(data.ename || ', ' || data.job || ',');
END;

-----------------------
declare
    num1 number := 3;
    num2 number := 5;
BEGIN
    if num1 >= num2 then DBMS_OUTPUT.PUT_LINE(num1 || '이 큽니다');
    else DBMS_OUTPUT.PUT_LINE(num2 || '이 큽니다.');
    end if;
END;

---------------------------------------------------------------------------
declare
    v_salary number := 3;
    v_dept_id number := 5;
BEGIN
END;