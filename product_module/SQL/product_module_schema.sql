CREATE DATABASE product_module;
USE product_module; 

CREATE TABLE category(
 category_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '카테고리 번호' ,
 category_name VARCHAR(50) NOT NULL UNIQUE COMMENT '카테고리명',  
 description VARCHAR(200) COMMENT '설명'
);

CREATE TABLE product(
product_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '상품 번호',
product_name VARCHAR(100) NOT NULL COMMENT '상품명',
category_id INT NOT NULL COMMENT '카테고리 번호',
price INT NOT NULL COMMENT '가격',
stock INT NOT NULL COMMENT '재고',
manufacturer VARCHAR(80) NOT NULL COMMENT '제조사', 
created_at DATE NOT NULL COMMENT '등록일',
CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES category(category_id)
);

