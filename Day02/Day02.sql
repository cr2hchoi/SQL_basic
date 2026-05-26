-- CREATE DATABASE doitsql;
-- DROP DATABASE doitsql;
/* 전체 실행 주의 */ 

USE doitsql;

CREATE TABLE doit_create_table(
col_1 INT,
col_2 VARCHAR(50),
col_3 DATETIME
);

INSERT INTO doit_create_table(col_1,col_2,col_3)
VALUES(1,'테스트1','2026-05-26');

COMMIT; -- 커밋명령어를 해줘야 실제저장소에 반영이 됨! 

SELECT * FROM doit_create_table;

-- Null Attribute 
CREATE TABLE doit_notnull (
col_1 INT,
col_2 VARCHAR(50) NOT NULL
);

INSERT INTO doit_notnull (col_1) VALUES (1); -- ⚠️ Error! 
INSERT INTO doit_notnull VALUES (1,NULL); -- ⚠️ Error! 
INSERT INTO doit_notnull VALUES (NULL,'다래'); -- ✅ Sucssese!

-- UPDATE문 연습
CREATE TABLE doit_dml(
col_1 INT,
col_2 VARCHAR(50)
);

INSERT INTO doit_dml 
VALUES (1,'test1'),(2,'test2'),(3,'test3'),(4,'test');

UPDATE doit_dml
SET col_2 = "test4"
WHERE col_1 = 4;

SELECT * FROM doit_dml; 

UPDATE doit_dml
SET col_1 = col_1 - 1; -- 조건문 없이 전체 선탥 

-- DELETE문 연습 
DELETE FROM doit_dml; -- 데이터 전체 삭제 
DELETE FROM doit_dml 
WHERE col_1 = 4;