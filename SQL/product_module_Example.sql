-- 1-1.product 테이블 전체 내용을 출력하시오.
SELECT *
FROM product;

-- 1-2.category_id가 1인 상품의 product_name,price를 출력하시오.
SELECT product_name, price
FROM product
WHERE category_id = 1;

-- 1-3.상품명 게이밍 헤드셋,카테고리 1,가격 69000,재고 25,제조사 SoundPlay,등록일 2026-04-10 데이터를 삽입하시오.
INSERT INTO product (product_name, category_id, price, stock, manufacturer, created_at)
VALUES ('게이밍 헤드셋', 1, 69000, 25, 'SoundPlay','2026-04-10');
COMMIT;

-- 1-4.product_id가 3인 상품명을'무소음 키보드'로 변경하시오.
UPDATE product
SET product_name = '무소음 키보드'
WHERE product_id = 3;

-- 1-5.price 기준 내림차순으로 모든 컬럼을 출력하시오.
SELECT *
FROM product
ORDER BY price DESC;

-- 2-1.product_name을 모두 대문자로 출력하시오.
SELECT UPPER(product_name) AS upper_product_name
FROM product;

-- 2-2.product_id와 category_id를`1-1`형식으로 결합하여 출력하시오. -> CONCAT()
SELECT CONCAT(product.product_id,'-',product.category_id) AS product_category_code
FROM product;

-- 2-3.manufacturer의 글자 수를 출력하시오.
SELECT CHARACTER_LENGTH(product.manufacturer)
FROM product;

-- 2-4.price 평균값을 출력하시오.
SELECT AVG(product.price)
FROM product;

-- 2-5.category_id별 최대 price를 구하고 최대 price 오름차순으로 출력하시오.
SELECT category_id, MAX(price) AS maxprice
FROM product
GROUP BY category_id
ORDER BY maxprice ASC;

-- 3-1.product와 category를 INNER JOIN하여 product_name,category_name을 출력하시오.
SELECT p.product_name, category_name, p.category_id, c.category_id
FROM product p INNER JOIN category c
                          ON p.category_id = c.category_id;

-- 3-2.category 기준 LEFT OUTER JOIN으로 모든 카테고리와 상품명을 출력하시오.
SELECT c.category_name,product_name
FROM category c LEFT JOIN product p
                          ON p.category_id = c.category_id;

-- 3-3.서브쿼리와 MAX()를 이용하여 가장 높은 가격의 상품명을 출력하시오.
SELECT product_name,price
FROM product
WHERE price = (SELECT MAX(price) FROM product);

-- 4-1.상품이 4개 이상 등록된 카테고리의 category_id,category_name을 출력하시오.
SELECT c.category_id, c.category_name
FROM category c INNER JOIN product p
                           ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
HAVING COUNT(p.product_id) >= 4;

-- 4-2.카테고리별 상품 목록과 상품 개수를 출력하시오.
SELECT c.category_id, c.category_name, COUNT(product_id) `카테고리별 상품 개수`
FROM category c LEFT OUTER JOIN product p
                                ON c.category_id = p.category_id
GROUP BY c.category_id;

SELECT
    category_name,
    GROUP_CONCAT(product_name SEPARATOR ', ') AS product_list,
    COUNT(*) AS product_count
FROM product p LEFT OUTER JOIN category c
                               ON c.category_id = p.category_id
GROUP BY p.category_id;

-- 4-3.4-2 SQL을 Product_Category_View View로 생성하시오.
CREATE OR REPLACE VIEW Product_Category_View AS
SELECT
    c.category_id,
    c.category_name,
    GROUP_CONCAT(p.product_name SEPARATOR ', ') AS product_list,
    COUNT(p.product_id) AS product_count
FROM category c
         LEFT OUTER JOIN product p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;

-- 4-4.View를 이용하여 상품 수가 4개 이상인 카테고리를 출력하시오.
SELECT category_id, category_name, product_count
FROM Product_Category_View
WHERE product_count >= 4;

-- # ## **문제 5번. JDBC INSERT**
-- # Product.java와 ProductDao.java의 insert()를 구현하시오.
-- # Product는 Lombok으로 기본 생성자,전체 생성자,Getter,Setter,toString,Builder를 포함한다.


-- # ## **문제 6번.
-- JDBC SELECT LIST**
-- price 내림차순 정렬 후 입력받은 건수만큼 조회하는 selectList()와 Main의 showList(),printProduct()를 구현하시오.

-- # ## **문제 7번. JDBC SELECT ONE**
-- # product_id를 전달받아 단일 상품을 조회하는 selectOne()과 Main의 showOne()을 구현하시오. 데이터가 없으면 `해당 상품이 없습니다.`를 출력한다.

-- # ## **문제 8번. JDBC JOIN**
-- # product와 category를 조인한 ProductDetail, ProductDao의 getProductDetail(), Main의 showProductDetail()을 구현하시오.

-- # # **문제 9번. SQL 조건 검색**
-- # product 테이블에서 가격이 50,000원 이상이고 재고가 20개 이상인 상품의 product_id,product_name,price,stock을 출력하시오.
-- # 출력 순서는 price 기준 내림차순으로 정렬하시오.
-- SELECT product.product_id,product.product_name,product.price,product.stock
                   FROM product
                   WHERE price >= 50000 AND stock >=20;
#
-- # ## **문제 10번. SQL 집계 함수**
-- # category_id별 상품 개수와 평균 가격을 출력하시오.
-- # 출력 항목은 category_id,product_count,avg_price이며,상품 개수가 많은 순서로 정렬하시오.
#
SELECT category_id,COUNT(product_name) product_count, AVG(price) avg_pric
FROM product
GROUP BY category_id
ORDER BY product_count DESC ;

-- # ## **문제 11번. SQL JOIN + 조건**
-- # category 테이블과 product 테이블을 조인하여
-- # 카테고리명이'전자제품'인 상품의 product_name,category_name,price를 출력하시오.(inner join문 이용)
SELECT c.category_name,p.product_name , p.price
FROM category c JOIN product p
                     ON c.category_id = p.category_id
WHERE c.category_name = '전자제품';

-- # ## **문제 12번. SQL 서브쿼리**
-- # product 테이블에서 전체 평균 가격보다 높은 가격을 가진 상품의 product_name,price를 출력하시오.
-- # (서브쿼리와 AVG()함수 이용)
SELECT product_name, price
FROM product
WHERE price >  (SELECT AVG(price) FROM product);

-- # ## **문제 13번. SQL 재고 분석**
-- # product 테이블에서 stock이 가장 적은 상품의 product_name,stock,manufacturer를 출력하시오.
-- # (서브쿼리와 MIN()

SELECT product_name,stock,manufacturer
FROM product
WHERE stock = (SELECT MIN(stock) FROM product);