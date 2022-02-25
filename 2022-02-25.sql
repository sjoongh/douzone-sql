insert into c_emp4(ename, mgr, sal, deptno)
select ename, mgr, sal, deptno from emp;

-- �ٸ� ���̺����� ���ڵ� ���� ����
select * from c_emp4;
insert into c_emp4(empno, job, hiredate, comm)
    select empno, emp_type, birthday from emp2;
    
desc c_emp4;
desc emp2;

-- rownum : �˻� �� �� �ڵ� �� ��ȣ �߰�
-- �Խ��� ���鶧 ����¡ ó���� �̿��Ѵ�
select ename, job, rownum, sal from emp;

select rownum, job from emp where sal > 3000; -- rownum : ���� ����x
select rownum, job sal, rowid from wmp; -- where sal > 3000;

-- ���� ���̺� : dual
select sysdate from dual;

-- Sequence : �ڵ� ���� ��ȣ
create sequence autonum; -- 1���� �����ؼ� 1�� �����Ѵ�

select AUTONUM.nextval from dual; -- �������� ����
select AUTONUM.currval from dual; -- ���� �������� ��������

create table kosa_T (
    no number,
    name varchar2(20)
);

insert into kosa_t values(AUTONUM.nextval, 'aa');

select * from kosa_T;