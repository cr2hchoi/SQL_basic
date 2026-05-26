USE doitsql;

CREATE TABLE doit_increment (
col_1 INT AUTO_INCREMENT PRIMARY KEY,
col_2 VARCHAR(50),
col_3 INT
);

INSERT INTO doit_increment (col_1, col_2, col_3) VALUES (NULL ,'자동 입력', 1);
INSERT INTO doit_increment (col_2, col_3) VALUES ('자동 입력', 2); 

INSERT INTO doit_increment (col_1, col_2, col_3) VALUES (4 ,'3 건너뛰고 4 입력', 4);

-- AUTO INCREMENT의 마지막 데이터 조회
SELECT last_insert_id();

-- AUTO INCREMENT 시작 번호 변경
ALTER TABLE doit_increment 
AUTO_INCREMENT = 100; 

-- AUTO INCREMENT 의 카운트 값 변경
SET @@auto_increment_increment = 5; 

-- 테이블 복사 INSERT INTO SELECT
CREATE TABLE doit_insert_select_to(
col_1 INT PRIMARY KEY,
col_2 VARCHAR(50) NOT NULL,
col_3 INT
);

INSERT INTO doit_insert_select_to
SELECT *
FROM doit_increment;

-- 부모 테이블 & 자식 테이블 관계 생성
CREATE TABLE doit_parent (
col_1 INT PRIMARY KEY,
col_2 VARCHAR(50)
);

CREATE TABLE doit_child (
id INT AUTO_INCREMENT PRIMARY KEY,
col_1 INT,
col_2 DATE
);

SHOW CREATE TABLE doit_child; -- 설정된 제약 조건 등 확인 가능 ^_^ 

ALTER TABLE doit_child 
ADD FOREIGN KEY(col_1) REFERENCES doit_parent(col_1);  --  FOREIGN KEY() 외래키 추가 메서드 

ALTER TABLE doit_child 
ADD CONSTRAINT fk_doit_child_parent FOREIGN KEY (col_1) -- Foreign key에 이름 지정 (지정 안하면 자동 생성) 
REFERENCES doit_parent(col_1) ON DELETE CASCADE; -- ON DELETE CASCADE : 부모의 PK가 지워지면, 자식 FK도 지워짐 

-- 자식 테이블에 없는 부모 테이블의 값을 참조하게 되면? 
INSERT INTO doit_child VALUES (NULL, 1, '2026-05-21'); -- ⚠️ ERROR 1452!
INSERT INTO doit_parent VALUES (1, '테스트1'); -- 부모 테이블의 col_1속성에 1이라는 값 추가하고 다시 INSERT 해보세용 

-- 참조하고 있는 자식이 있는 부모 테이블의 값을 지우면? 
DELETE FROM doit_parent 
WHERE col_1 = 1; -- ⚠️ ERROR 1451!

DELETE FROM doit_child 
WHERE col_1 = 1; -- 자식 테이블의 참조 데이터를 삭제 먼저 하고, 위 데이터를 삭제 하면! 

-- 제약 조건 삭제 방법? 중 왜래키 삭제 
ALTER TABLE doit_child
DROP FOREIGN KEY fk_doit_child_parent; -- 지정한 왜래키 이름 


