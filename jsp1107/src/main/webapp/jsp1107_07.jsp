<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%> <!-- DriverManager를 import 추가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			int Bno = 0;
			String Btitle = "";
			String Bcontent = "";
			String id = "";
			int Bstep = 0;
			int BIndent = 0; 
			int Bhit = 0;
			String Bfile = "";
			String Bdate = "";

			try {
				Class.forName("oracle.jdbc.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ora_user", "1111");
				stmt = conn.createStatement();
				String query = "select * from board";
				rs = stmt.executeQuery(query);

				while (rs.next()) {
					Bno = rs.getInt("Bno");
					Btitle = rs.getString("Btitle");
					Bcontent = rs.getString("Bcontent");
					id = rs.getString("id");
					Bstep = rs.getInt("Bstep");
					BIndent = rs.getInt("Bindent");
					Bhit = rs.getInt("Bhit");
					Bfile = rs.getString("Bfile");
					Bdate = rs.getString("Bdate");
					out.println("번호:"+Bno+",제목 :"+Btitle+",내용 :" +Bcontent+",아이디 :" +id+",Bstep :" +Bstep+
					",Bindent :" +BIndent+ ",조회수 :" +Bhit+ ",파일 :" +Bfile+",날짜 :" +Bdate+"<br>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) rs.close();
					if (stmt != null) stmt.close();
					if (conn != null) conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		%>
	</body>
</html>