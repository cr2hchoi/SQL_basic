package com.kbbank.jdbc_ex.common;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;

import java.sql.*;

public class CRUDTest {
    Connection connection = JDBCUtil.getConnection();

    @Test
    @DisplayName("새로운 user 등록")
    public void insertUser() throws SQLException {
        String sql = "INSERT INTO USERS VALUES(?,?,?,?);";
        try(PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1,"테스트1");
            pstmt.setString(2,"1234");
            pstmt.setString(3,"test");
            pstmt.setString(4,"테스트맨");

            int resultack = pstmt.executeUpdate();
            Assertions.assertEquals(1,resultack);
        }
    }

    @Test
    @DisplayName("user 목록 추출")
    @Order(2)
    public void selectUser() throws SQLException {
        String sql = "SELECT * FROM USERS";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);
        )  {
            while (rs.next()){
                System.out.println(rs.getString("name"));
            }
        }
    }
}
