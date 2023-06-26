package com.shop.first;

import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class JDBCBasicCRUD {

    //DB 접속 정보 설정
    //DB 접속 정보 설정
    private String id = "team_web";
    private String pw = "0000";
    private String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private String driver = "oracle.jdbc.driver.OracleDriver";

    @Test
    //@DisplayName("customer 데이터를 추가하기")
    public void insertTest() {

        try {
            //1. 드라이버 로딩
            Class.forName(driver);
            //2. 연결 정보 객체 생성
            Connection conn
                    = DriverManager.getConnection(url, id, pw);
            //3. SQL 실행 객체 생성
            String sql = "INSERT INTO customer VALUES ('BC@naver.com','4321','장마','남자','010-1111-1111','33333', '대전광역시 서구','둔산동 111','대전광역시','2000-11-11')";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            //4. ?값 채우기
           // pstmt.setString(1, "공기청정기");
           // pstmt.setInt(2, 670000);

            //5. SQL 실행 명령
            //a : INSERT, UPDATE, DELETE  - executeUpdate()
            //b : SELECT                   - executeQuery()
            int resultNum = pstmt.executeUpdate(); //성공한 쿼리의 수 리턴
            if (resultNum == 1) {
                System.out.println("입력 성공!");
            }
            Assertions.assertTrue(resultNum == 1);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }//
}
