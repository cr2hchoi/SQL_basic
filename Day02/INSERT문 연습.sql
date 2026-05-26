SHOW DATABASES;
SHOW TABLES;

USE sqldb;
DESC buytbl;
DESC usertbl;

-- GROUP BY, ROLL UO 연습 
SELECT num, groupName, SUM(price * amount) AS '비용' 
FROM buytbl
GROUP BY groupName, num
WITH ROLLUP;

SELECT  groupName, num, SUM(price * amount) AS '비용' 
FROM buytbl
GROUP BY groupName, num
WITH ROLLUP;

-- insert문(AUTO_INCREMENT) 연습
CREATE TABLE testTbl2(
	id INT AUTO_INCREMENT PRIMARY KEY,
    userName CHAR(3),
    age INT
);

INSERT INTO testTbl2 VALUES (NULL, '지민', 25);
INSERT INTO testTbl2 VALUES (NULL, '유나', 22);
INSERT INTO testTbl2 VALUES (NULL, '유경', 21);
INSERT INTO testTbl2 VALUES (NULL, '다래', 22) , (NULL, '지우', 22), (NULL, '혜원', 23), (NULL, '원형', 25); -- 여러 값 한번에 입력 가능 
SELECT * FROM testTbl2;

ALTER TABLE testTbl2 AUTO_INCREMENT = 100; -- AUTO_INCREMENT 값을 100부터 입력하게 변경하고 싶을 때! 
SET @@auto_increment_increment =2; -- AUTO_INCREMENT의 증가값을 변경하고싶을 떄 (서버번수의 값 변경) 

-- 대량의 샘플 데이터 생성 
CREATE TABLE testTbl4 (id INT, Fname VARCHAR(50), Lname VARCHAR(50)); 
INSERT INTO testTbl4 
SELECT emp_no, first_name, last_name
FROM employees.employees;