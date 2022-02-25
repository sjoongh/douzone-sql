-- PL / SQL
/*
Declare - ����(����)
    Begin
            ����(�ʼ�)
    End;
*/

Begin
    DBMS_output.put_line('�̵���'); --���
End;
----------------------------------------------------
DECLARE NAME VARCHAR2(20) := '��ȿ��';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('�̸��� ' || name); -- ���
    END;
----------------------------------------------------------- ���̺��̸�.�ʵ��%type�� ���� ����
declare e_name emp.ename%type;
    e_sal emp.sal%type;
BEGIN
    select sal, ename into e_sal, e_name from emp where empno='7788';
    DBMS_OUTPUT.PUT_LINE('7788���� �̸��� ' || e_name || ' �޿��� ' || e_sal);
end;

----------------------- ���̺��̸�.�ʵ��%Rowtype�� ���� ����
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
    if num1 >= num2 then DBMS_OUTPUT.PUT_LINE(num1 || '�� Ů�ϴ�');
    else DBMS_OUTPUT.PUT_LINE(num2 || '�� Ů�ϴ�.');
    end if;
END;

---------------------------------------------------------------------------
create PROCEDURE p_sal
is
    declare
        v_salary number := 0;
        v_dept_id number := 0;
    BEGIN
        v_dept_id := round(dbms_random.value(10, 120), -1);
        select sal into v_Salary from emp where deptno = v_dept_id and rownum = 1;
            DBMS_OUTPUT.PUT_LINE(v_salary);
    
        if v_salary between 1 and 3000 then DBMS_OUTPUT.PUT_LINE('��������');
        ELSIF v_salary BETWEEN 3001 and 6000 then DBMS_OUTPUT.PUT_LINE('�ü��� ����');
        else
            DBMS_OUTPUT.PUT_LINE('���� ����');
        end if;
    END;
------------------------------------------------------
create PROCEDURE p_test -- ���ν��� ����
is
begin
    DBMS_OUTPUT.PUT_LINE('�ָ� �ߺ����ڿ�~~~');
end;
------------------------------------------------------
EXECUT p_test; -- ���ν��� ����
EXEC p_test;
------------------------------------------------------
create or replace PROCEDURE p_test( -- ���ν��� ����
    name in VARCHAR2
)
is
begin
    DBMS_OUTPUT.PUT_LINE(name || '�� ���� ���� �ָ� ��������~~');
END;
