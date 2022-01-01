SELECT * FROM tab;

CREATE TABLE BONUS (
	ENAME VARCHAR2(10),
	JOB VARCHAR2(10),
	SAL NUMBER,
	COMM NUMBER
);

COMMENT ON COLUMN BONUS.ENAME IS '�̸�';
COMMENT ON COLUMN BONUS.JOB IS '����';
COMMENT ON COLUMN BONUS.SAL IS '�޿�';
COMMENT ON COLUMN BONUS.COMM IS 'Ŀ�̼�';

CREATE TABLE DEPT (
	DEPTNO NUMBER,
	DNAME VARCHAR2(14),
	LOC VARCHAR2(13)
);

COMMENT ON COLUMN DEPT.DEPTNO IS '�μ���ȣ';
COMMENT ON COLUMN DEPT.DNAME IS '�̸�';
COMMENT ON COLUMN DEPT.LOC IS '����';

CREATE TABLE EMP (
	EMPNO NUMBER,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER,
	HIREDATE DATE,
	SAL NUMBER,
	COMM NUMBER,
	DEPTNO NUMBER
);

COMMENT ON COLUMN EMP.EMPNO IS '�����ȣ';
COMMENT ON COLUMN EMP.ENAME IS '����̸�';
COMMENT ON COLUMN EMP.JOB IS '����';
COMMENT ON COLUMN EMP.MGR IS '��� �����ȣ';
COMMENT ON COLUMN EMP.HIREDATE IS '�Ի���';
COMMENT ON COLUMN EMP.SAL IS '�޿�';
COMMENT ON COLUMN EMP.COMM IS 'Ŀ�̼�';
COMMENT ON COLUMN EMP.DEPTNO IS '�ٹ� �μ���ȣ';

CREATE TABLE SALGRADE (
	GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER
);

COMMENT ON COLUMN SALGRADE.GRADE IS '���';
COMMENT ON COLUMN SALGRADE.LOSAL IS '���� �޿���';
COMMENT ON COLUMN SALGRADE.HISAL IS '�ְ� �޿���';

----------------------------------------------------------

-- DML Select
-- �μ��� ��� ������ �����´� 
SELECT * FROM DEPT;

-- ����� ��� ������ �����´�
SELECT * FROM EMP;

-- ����� �̸��� ��� ��ȣ�� �����´�
SELECT ENAME, EMPNO FROM EMP;

-- ����� �̸��� ��� ��ȣ, ����, �޿��� �����´�
SELECT ENAME, EMPNO, JOB, SAL FROM EMP;

-- �μ� ��ȣ�� �μ� �̸��� �����´�.
SELECT DEPTNO, DNAME FROM DEPT;

-- DML ������ ����ϱ�

-- ��� ������
-- �� ������� �޿��װ� �޿��׿��� 
-- 1000�� ���� ��, 200�� �� ��, 2�� ���� ��,
-- 2�� ���� ���� �����´�
SELECT SAL, SAL + 1000, SAL - 200, SAL * 2, SAL / 2
FROM EMP;

-- �� ����� �޿���, Ŀ�̼�, �޿� + Ŀ�̼� �׼��� �����´�.
SELECT SAL, NVL(COMM, 0), SAL + NVL(COMM, 0)
FROM EMP;

-- concat ������
-- ������� �̸��� ������ ���� ������� �����´�.
-- 000 ����� ��� ������ XXX �Դϴ�.
SELECT ENAME || '����� ��� ������ ' || JOB || '�Դϴ�'
FROM EMP;

-- Distinct
-- ������� �ٹ��ϰ� �ִ� �ٹ� �μ��� ��ȣ�� �����´�.
SELECT DISTINCT DEPTNO FROM EMP;

테스트