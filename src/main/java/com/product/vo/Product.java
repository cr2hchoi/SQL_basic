package com.product.vo;

import lombok.*;

import java.time.LocalDate;

/**
 * product 테이블의 한 행을 표현하는 VO 클래스입니다.
 */
//Product는 Lombok으로 기본 생성자,전체 생성자,Getter,Setter,toString,Builder를 포함한다.

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class Product {
    private int productId;        // 상품 번호, PK
    private String productName;   // 상품명
    private int categoryId;       // 카테고리 번호, FK
    private int price;            // 가격
    private int stock;            // 재고
    private String manufacturer;  // 제조사
    private LocalDate createdAt;  // 등록일
}
