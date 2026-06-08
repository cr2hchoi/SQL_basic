package com.product.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/** DB 연결 유틸리티 클래스입니다. DAO에서 Connection을 얻을 때 사용합니다. */
public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/product_module?serverTimezone=Asia/Seoul&useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "sql1234";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
