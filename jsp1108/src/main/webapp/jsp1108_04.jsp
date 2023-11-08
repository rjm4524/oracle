<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판</title>
		<style>
			*{margin:0; padding:0;}
			div{width: 1400px; margin:30px auto;}
			h1{text-align: center; margin-bottom:20px;}
			table{width: 1200px;}
			table,th,td{border:1px solid black; border-collapse: collapse; 
			font-size: 16px; text-align: center;}
			th,td{width: 200px; height: 40px;} 
		</style>
	</head>
	<body>
	<div>
			<h1>게시판정보</h1>
			<table>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
					<th>조회수</th>
					
				</tr>
			<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			int i=0;
			int rnum,bhit;
			String id,btitle,bcontent,bdate;
			
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user","1111");
				stmt = conn.createStatement();
				String query = "select * from (select row_number() over(order by bgrouup desc,bstep asc) rnum, a.*from board a where btitle like '%ia%') where rnum>=11 and rnum <=20";
				rs = stmt.executeQuery(query);
				
				while(rs.next()){
					i++;
					rnum = rs.getInt("rnum");
					bhit = rs.getInt("bhit");
					id = rs.getString("id");
					btitle = rs.getString("btitle");
					bcontent = rs.getString("bcontent");
					bdate = rs.getString("bdate");
				}
			}catch (Exception e){
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
					
				}catch (Exception e2) {e2.printStackTrace();}
			}
			%>
				
				
				<tr>
					<td><%=rnum %></td>
					<td><%=id %></td>
					<td><%=btitle %></td>
					<td><%=bcontent %></td>
					<td><%=bdate %></td>
					<td><%=bhit %></td>
				</tr>
			
			</table>
		</div>
	
	</body>
</html>