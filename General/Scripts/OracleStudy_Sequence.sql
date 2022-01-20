DROP TABLE TEST_TABLE1;

CREATE TABLE TEST_TABLE1 (
	IDX NUMBER CONSTRAINT TEST_TABLE1_IDK_PK PRIMARY KEY,
	NUMBER_DATA NUMBER NOT NULL
);

CREATE SEQUENCE TEST_SEQ1
START WITH 0
INCREMENT BY 1 -- START min value보다 작은 값 못가짐 최소값 DEFAULT 1
MINVALUE 0; 

SELECT TEST_SEQ1.CURRVAL FROM DUAL;
-- 반드시 NEXTVAL을 써서 다음 시퀀스값을 가져와야 CURRVAL을 쓸 수 있음

INSERT INTO TEST_TABLE1 (IDX, NUMBER_DATA)
VALUES (TEST_SEQ1.NEXTVAL, 100);

INSERT INTO TEST_TABLE1 (IDX, NUMBER_DATA)
VALUES (TEST_SEQ1.NEXTVAL, 200);

SELECT * FROM TEST_TABLE1;

SELECT TEST_SEQ1.CURRVAL FROM DUAL; -- 2가 들어감

DROP SEQUENCE TEST_SEQ1;

