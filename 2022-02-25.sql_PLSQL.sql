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
declare
    v_salary number := 3;
    v_dept_id number := 5;
BEGIN
END;