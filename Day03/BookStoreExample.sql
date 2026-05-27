-- 김연아 고객의 전화번호를 찾으시오
SELECT phone
FROM Customer
WHERE name='김연아'; 

-- 3-1 모든 도서의 이름과 가격을 검색하시오
SELECT bookname, price
FROM book;

-- 3-2 모든 도서의 도서번호 , 도서이름 , 출판사 , 가격을 검색하시오
SELECT *
FROM book;

-- 3-3 도서 테이블에 있는 모든 출판사를 검색하시오 
SELECT publisher
FROM book;

-- 3-4 가격이 20,000 원 미만인 도서를 검색하시오
SELECT * 
FROM book
WHERE price > 20000;

-- 3-5 가격이 10,000 원 이상 20,000 이하인 도서를 검색하시오
SELECT *
FROM book
WHERE price BETWEEN 10000 AND 20000;

-- 3-6 출판사가 ‘굿스포츠' 혹은 '대한미디어’인 도서를 검색하시오
SELECT *
FROM book 
WHERE publisher IN('굿스포츠','대한미디어');

-- 3-7 ‘축구의 역사’를 출간한 출판사를 검색하시오
SELECT publisher 
FROM book
WHERE bookname = '축구의 역사';

-- 3-8 도서이름에 '축구’가 포함된 출판사를 검색하시오
SELECT publisher, bookname
FROM book
WHERE bookname LIKE '%축구%';

-- 3-9 도서이름의 왼쪽 두 번째 위치에 '구’라는 문자열을 갖는 도서를 검색하시오
SELECT *
FROM book
WHERE bookname LIKE '_구%';

-- 3-10 축구에 관한 도서 중 가격이 20,000 원 이상인 도서를 검색하시오 
SELECT * 
FROM book
WHERE bookname LIKE '%축구%' AND price >= 20000;

-- 3-11 출판사가 ‘굿스포츠' 혹은 대한미디어’인 도서를 검색하시오
SELECT *
FROM book 
WHERE publisher IN('굿스포츠','대한미디어');

-- 3-12 도서를 이름순으로 검색하시오
SELECT * 
FROM book
ORDER BY Book.bookname ASC;

-- 3-13 도서를 가격순으로 검색하고 , 가격이 같으면 이름순으로 검색하시오
SELECT *
FROM book
ORDER BY book.price,bookname;

-- 3-14 도서를 가격의 내림차순으로 검색하시오 . 만약 가격이 같다면 출판사의 오름차순으로 검색하시오
SELECT *
FROM book
ORDER BY book.price DESC, book.publisher ASC;

/* 집계 함수 연습 !!!!! ~~~*/

-- 김연아 고객(고객번호 2)이 주문한 도서의 총판매액을 구하세요. 
SELECT SUM(saleprice)
FROM orders
WHERE custid=2; 

-- 고객이 주문한 도서의 총판매액, 평균값, 최고가, 최저가를 구하세요 
SELECT SUM(saleprice), AVG(saleprice), MAX(saleprice), MIN(saleprice)
FROM orders;

-- count 함수 => 행의 갯수를 세는데, null값을 제외하고 셈 ! 
-- count(distinct )=> 중복 제외하고 카운트 ~ ^^ 
SELECT COUNT(distinct publisher)
FROM book;

SELECT COUNT(publisher)
FROM book;

/* GROUP BY 연습 ~!!!!! */
DESC orders;
-- 3-19. 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오 
SELECT custid, count(orderid) AS 도서수량 , SUM(saleprice) AS 총액
FROM orders
GROUP BY custid;

-- 3-20. 가격이 8,000 원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오 . 단 , 두 권 이상 구매한 고객만 구한다
SELECT custid, count(orderid) AS 주문수량
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING count(orderid) >= 2;

-- 3-21 고객과 고객의 주문에 관한 데이터를 모두 보이시오
SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid ;

-- 3-22 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보이시오 
SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid 
ORDER BY customer.custid DESC;

/*JOIN 연습 ~!!!!!!!!*/ 
/*동등 JOIN*/
-- 3-23 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오. 
SELECT c.name, o.saleprice
FROM customer c, orders o 
WHERE c.custid = o.custid;

-- 3-24 고객별로 주문한 모든 도서의 총 판매액을 구하고 , 고객별로 정렬하시오
SELECT c.name, sum(o.saleprice)
FROM customer c, orders o 
WHERE c.custid = o.custid
GROUP BY name -- c. 생략 가능  
ORDER BY c.name;

-- 3-25 고객의 이름과 고객이 주문한 도서의 이름을 구하시오
SELECT name, bookname -- 테이블명 접근 생략 가능 ^_^ 
FROM customer c, orders o, book b
WHERE c.custid = o.custid AND o.bookid = b.bookid;

-- 3-26 가격이 20,000 원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오
SELECT c.name, b.bookname
FROM customer c, orders o, book b 
WHERE c.custid = o.custid AND price = 20000 AND o.bookid = b.bookid;