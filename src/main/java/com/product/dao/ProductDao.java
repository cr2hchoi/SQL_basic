package com.product.dao;

import com.product.util.DBUtil;
import com.product.vo.Product;
import com.product.vo.ProductDetail;

import java.io.IOException;
import java.sql.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.*;

import static com.product.util.DBUtil.getConnection;

/** TODO: 문제 5~8번 JDBC 기능을 구현하세요.
 * -> 상품 테이블에 접근하는 DAO 클래스
 * **/
public class ProductDao {
    public int insert(Product product) {
        // TODO 문제 5번 구현
        // 1. sql 변수에 쿼리문 담기
        String sql =
                """
                INSERT INTO product (product_name, category_id, price, stock, manufacturer, created_at)
                    VALUES (?,?,?,?,?,?)
                """;
        // 2. 커넥션 얻어오기
        try(Connection connection = getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql);
        ) {
            pstmt.setString(1,product.getProductName());
            pstmt.setInt(2,product.getCategoryId());
            pstmt.setInt(3, product.getPrice());
            pstmt.setInt(4,product.getStock());
            pstmt.setString(5,product.getManufacturer());
            pstmt.setDate(6, Date.valueOf(product.getCreatedAt())); //java sql에서 호환되는 Date 타입으로 바꿔줘야함

            return pstmt.executeUpdate();

        } catch (SQLException e){
            e.getMessage();
        e.printStackTrace();
        };
        return  0;
    }
    public List<Product> selectList(int count) {
        // TODO 문제 6번 구현
//      price 내림차순 정렬 후 입력받은 건수만큼 조회하는 selectList()와 Main의 showList(),printProduct()를 구현하시오.
        List<Product> products = new ArrayList<>();
        String sql = """ 
               SELECT product_id,product_name,category_id,price,stock,manufacturer,created_at
                  FROM product ORDER BY price DESC  LIMIT ?
                 """;

        try(Connection connection = getConnection(); PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setInt(1,count);
            try(ResultSet rs = pstmt.executeQuery()){
                while(rs.next()) products.add(mapProduct(rs));
            }
        } catch(SQLException e){
            e.getMessage();
            //e.printStackTrace();
        }
        return products;
    }

    private Product mapProduct(ResultSet rs) throws SQLException{
        return Product.builder()
                .productId(rs.getInt("product_id"))
                .categoryId(rs.getInt("category_id"))
                .productName(rs.getString("product_name"))
                .price(rs.getInt("price"))
                .stock(rs.getInt("stock"))
                .manufacturer(rs.getString("manufacturer"))
                .createdAt(rs.getDate("created_at").toLocalDate())
                .build();
    }

    // TODO 문제 7번 구현
    public Product selectOne(int productId) throws IOException {
        String sql = """
                SELECT product_id,product_name,category_id,price,stock,manufacturer,created_at
                FROM product WHERE  product_id = ?
                """;
        try(Connection connection = getConnection(); PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setInt(1,productId);
            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()) return mapProduct(rs);
            }
        } catch(SQLException e){
            e.getMessage();
            //e.printStackTrace();
        }

        return null;
    }

    // TODO 문제 8번 구현
    // product와 category를 조인한 ProductDetail (vo)
    // ProductDao의 getProductDetail(),
    // Main의 showProductDetail()을 구현하시오.
    public ProductDetail getProductDetail(int productId) {
        String sql = """
                SELECT p.product_id, p.product_name, p.category_id, c.category_name,
                       p.price, p.stock, p.manufacturer, p.created_at
               FROM product p\s
               INNER JOIN category c ON p.category_id = c.category_id
               WHERE p.product_id = ?
                """;

        try(Connection connection = getConnection(); PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setInt(1,productId);
            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()) return mapProductDetail(rs);
            }

        } catch(SQLException e){
            e.getMessage();
            //e.printStackTrace();
        }
        return null;
    }

    private ProductDetail mapProductDetail(ResultSet rs) throws SQLException{

        return ProductDetail.builder()
                .productId(rs.getInt("product_id"))
                .categoryId(rs.getInt("category_id"))
                .productName(rs.getString("product_name"))
                .categoryName(rs.getString("category_name"))
                .price(rs.getInt("price"))
                .stock(rs.getInt("stock"))
                .manufacturer(rs.getString("manufacturer"))
                .createdAt(rs.getDate("created_at").toLocalDate())
                .build();
    }

}
