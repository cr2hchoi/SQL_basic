package org.scoula.jdbc_ex.test;

import org.junit.jupiter.api.*;

import javax.xml.transform.Result;
import java.sql.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class) //내가 지정한 순서대로 테스트메서드를 실행하겠다는 어노테이션
public class CrudTest {
    Connection conn = JDBCUtil.getConnection();

    @AfterAll
    static void tearDown(){
        JDBCUtil.close();
    }

    @Test
    @DisplayName("새로운 user 등록")
    @Order(1) //테스트 순서 지정 : 상대적인
    public void insertUser() throws SQLException {
        String sql = "INSERT INTO USERS (id, password, name, role) VALUES(?,?,?,?)";
        try(PreparedStatement pstmt = conn.prepareStatement(sql)){ //Staement : SQL문 실행 클래스. 실행하고 싶은 쿼리문(문자열)을 넘겨준다능
            pstmt.setString(1, "scoula");
            pstmt.setString(2,"scoula3");
            pstmt.setString(3,"스콜라");
            pstmt.setString(4, "User");

            int count = pstmt.executeUpdate(); //영향 받은 행의 갯수리턴
            Assertions.assertEquals(1,count);
        }
    }

    @Test
    @DisplayName("user 목록 추출")
    @Order(2)
    public void selectUser() throws SQLException {
        String sql = "SELECT * FROM USERS";
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql);
        )  {
            while (rs.next()){
                System.out.println(rs.getString("name"));
            }
        }
    }

    @Test
    @DisplayName("특정 user 검색하기")
    @Order(3)
    public void selectUserByID() throws SQLException {
        String sql = "SELECT * FROM USER WHERE id = ?";
        String userid = "scoula";
        try(PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setString(1,userid); //파라미터 세팅 구문이있을 때는 자동닫기 구문에 못들어감.
            try(ResultSet rs = stmt.executeQuery()){
                if(rs.next()) {
                    System.out.println(rs.getString("name")); //데이터가 없어도 쿼리문은 실행이 되기 때문에, 데이터가 있는지 검사 후
                } else {
                    throw new SQLException("scoula not found");//직접 예외 던지기
                }
            }
        }
    }

    @Test
    @DisplayName("특정 user 수정한다.")
    @Order(4)
    public void updateUser() throws SQLException{
        String userid = "scoula";
        String sql = "UPDATE users SET name = ? WHERE ID = ?";
        try(PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setString(1, "스콜라 수정");
            stmt.setString(2, userid);
            int count= stmt.executeUpdate();
            Assertions.assertEquals(1,count);
        }
    }

    public void deleteUser() throws SQLException{
        String userid = "scoula";
        String sql = "DELETE FROM users WHERE id = ?";
        try(PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setString(1,userid);
            int count = stmt.executeUpdate();
            Assertions.assertEquals(1,count);
        }
    }

}
