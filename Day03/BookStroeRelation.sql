-- 외래키 지정
ALTER TABLE orders
ADD CONSTRAINT fk_orders_book 
FOREIGN KEY (bookid) REFERENCES book(bookid);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (custid) REFERENCES customer(custid);

DESC customer;

SHOW CREATE TABLE orders;