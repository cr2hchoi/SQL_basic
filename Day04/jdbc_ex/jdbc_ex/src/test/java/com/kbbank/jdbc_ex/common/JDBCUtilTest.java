package com.kbbank.jdbc_ex.common;

import com.mysql.cj.jdbc.Driver;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtilTest {
    @Test
    @DisplayName("jdbc_ex1에 접속한다.")
    public void testConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("드라이버 로드 ok!");
        String url = "jdbc:mysql://127.0.0.1:3306/jdbc_ex";
        String id = "scoula";
        String password = "1234";

        Connection connection = DriverManager.getConnection(url,id,password);
        System.out.println("db connection ok!");
        connection.close();
    }
}
