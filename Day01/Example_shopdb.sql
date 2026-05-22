-- 데이터베이스 생성, 사용 ( 상단에 적어주는 것이 좋다고 함 ) 
create database shop_db; 
USE shop_db; 

-- user 생성 : USER 유저명 |  '%' : 모든 IP 접속 허용 |  DENTIFIED BY 'shopmaster' : 비밀번호 설정 
CREATE USER shopmaster@'%' IDENTIFIED BY 'shopmaster';

-- shopmaster 에게 권한 주기 
GRANT ALL PRIVILEGES
ON shop_db.*
TO shopmaster@'%'WITH GRANT OPTION;


CREATE TABLE member(
member_id CHAR(8) PRIMARY KEY, -- 유일키 (PK) 
member_name CHAR(5) NOT NULL, -- null 허용 X 
member_addr CHAR(20) NULL -- null 허용(기본값이라 생갹 가능) 
);

-- 데이터 입력하기 
/* 전체 드래그 후, 번개? 클릭하면 한번에 실행됨 */  
INSERT INTO member VALUES('TWC', '트와이스','서울');
INSERT INTO member VALUES('BLK', '블랙핑크','경남');
INSERT INTO member VALUES('WMN', '여자친구','경기');
INSERT INTO member VALUES('OMY', '오마이걸', '서울');
INSERT INTO member VALUES('GRL', '소녀시대','서울');
INSERT INTO member VALUES('ITZ', '잇지','경남');
INSERT INTO member VALUES('RED', '레드벨벳','경북');
INSERT INTO member VALUES('APN', '에이핑크','경기');
INSERT INTO member VALUES('IEU', '아이유', '서울');
INSERT INTO member VALUES('MMU', '마마무','전남');

SELECT * FROM member 
WHERE member_name = '아이유'; 


