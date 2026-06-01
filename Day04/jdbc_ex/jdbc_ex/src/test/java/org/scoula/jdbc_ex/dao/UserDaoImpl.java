package org.scoula.jdbc_ex.dao;

import org.scoula.jdbc_ex.domain.UserVO;
import org.scoula.jdbc_ex.test.ConnectionTest;
import org.scoula.jdbc_ex.test.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserDaoImpl implements UserDao{
    Connection conn = JDBCUtil.getConnection();

    //USERS 테이블 관련 SQL 명령어
    private String USER_LIST = "SELECT * FROM USERS";
    private String USER_GET = "SELECT * FROM USERS WHERE id = ?";
    private String USER_INSERT = "INSERT INTO USERS VALUES(?,?,?,?)";
    private String USER_UPDATE = "UPDATE USERS SET name = ?, role = ? WHERE id = ?T ";
    private String USER_DELETE = "DELETE FROM USERS WHERE id = ?";

    // 회원 등록
    @Override
    public int create(UserVO user) throws SQLException {
        try(PreparedStatement stmt = conn.prepareStatement(USER_INSERT)) {
            stmt.setString(1, user.getId());
            stmt.setString((2, user.getPasssword()));
            stmt.setString(3, user.getName());
            stmt.setString(4, user.getRole());

            return stmt.executeUpdate();

        }
    }

    private UserVO map(ResultSet rs) throws SQLException {
        UserVO user = new UserVO();
        user.setId(rs.getString("ID"));
        user.setPassword(rs.getString("PASSWORD"));
        user.setName(rs.getString("NAME"));
        user.setRole(rs.getString("ROLE"));
        return user;
    };

    // 회원 목록 조회
    @Override
    public List<UserVO> getList() throws SQLException {
            List<UserVO> userList = new ArrayList<>();
            Connection conn = JDBCUtil.getConnection();
            try(PreparedStatement stmt = conn.prepareStatement(USER_LIST);
                ResultSet rs = stmt.executeQuery()) {
                while (rs.next()){
                    UserVO user = map(rs);
                    userList.add(user);
                }
            }
            return userList;
        }

    // 회원 정보 조회

    @Override
    public Optional<UserVO> get(String id) throws SQLException {
        try(PreparedStatement stmt = conn.prepareStatement(USER_GET)){
            stmt.setString(1, id);
            try(ResultSet rs = stmt.executeQuery()){
                if(rs.next()){
                    return Optional.of(map(rs));
                }
            }
        }
        return Optional.empty();
    }

    //회원 정보 수정
    @Override
    public int update(UserVO user) throws SQLException {

    }


    @Override
    public int delete(String id) throws SQLException {
        try(PreparedStatement stmt = conn.prepareStatement(USER_DELETE)){
            stmt.setString(1, id);
            return stmt.executeUpdate();
        }
    }
}
