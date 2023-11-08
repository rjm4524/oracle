<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디,패스워드 체크</title>
</head>
<body>
<%
    String uid = request.getParameter("id");
    String upw = request.getParameter("pw");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ora_user", "1111");
        
        // 해싱된 패스워드와 저장된 해시를 비교하는 것이 안전
        // 이 예제에서는 생략하고 평문 비밀번호로 비교하는 방법을 사용
        String query = "SELECT COUNT(*) FROM member WHERE id = ? AND pw = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, uid);
        pstmt.setString(2, upw);
        rs = pstmt.executeQuery();

        if (rs.next()) {
%>
            <script>
                alert("로그인되었습니다.")
                location.href = "jsp_main.jsp"
            </script>
<%
        } else {
%>
            <script>
                alert("아이디 혹은 패스워드가 일치하지 않습니다. 다시 로그인해주세요.")
                location.href = "jsp_login.jsp"
            </script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>