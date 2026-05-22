/*실행하고 싶은 쿼리문(세미콜론 옆)에 커서를 두고, 
ctrl + enter 를 하면 실행할 수 있습니다랭이~  */ 

-- 데이터 베이스 생성 
create database Day1;
drop database Day1;

use Day1;
-- 데이터 베이스 확인 
show databases;
-- 테이블 생성 
create table doit_table(
	col_1 int, col_2 varchar(30), col_3 datetime
);

create table doit_dml(
col_1 int,
col_2 varchar(30),
col_3 datetime
);

desc doit_dml; -- 테이블 구조 확인

-- doit_dml 테이블에 데이터 삽입 
select* from doit_dml; -- 선택 
insert into doit_dml(col_1) values('1');
insert into doit_dml(col_1) values(2);
insert into doit_dml(col_1,col_2,col_3) values(2,'Darae','2026-05-22');
-- 테이블에서 컬럼 순서는 상관 x, 각 컬럼 타입과 값의 타입이 일치하면 OK >< 

insert into doit_dml(col_1,col_2,col_3)
value (3,'Woobin','2026-05-22'), (4,'SungHyeon','2026-05-22'), (5,'Hyeonjun','2026-05-22');






