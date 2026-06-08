package com.product.vo;

import lombok.*;

import java.time.LocalDate;

/**
 * product와 category 조인 결과를 담는 VO 클래스입니다.
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class ProductDetail {
    private int productId;
    private String productName;
    private int categoryId;
    private String categoryName;
    private int price;
    private int stock;
    private String manufacturer;
    private LocalDate createdAt;
}
