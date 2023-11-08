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
		<title>회원정보</title>
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
			<h1>회원정보</h1>
			<table>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>성별</th>
					<th>취미</th>
				</tr>
				<!--while 시작-->
				<%
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				String id,pw,name,phone,gender,hobby;
				int i = 0;
				
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user","1111");
				stmt = conn.createStatement();
				String query = "select * from member";
				rs = stmt.executeQuery(query);
				
				while(rs.next()){
					i++;
					id= rs.getString("id");
					pw= rs.getString("pw");
					name= rs.getString("name");
					phone= rs.getString("phone");
					gender= rs.getString("gender");
					hobby= rs.getString("hobby");
					
					
				
				%>
				<!-- while 끝 -->
				<tr>
					<th><%=i %></th>
					<th><%=id %></th>
					<th><%=pw %></th>
					<th><%=name %></th>
					<th><%=phone %></th>
					<%if(gender.equals("Male")) { %>
					<th>남자</th>
					<%}else { %>
					<th>여자</th>
					<%} %>
					<th><%=hobby %></th>
				</tr>
				<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
				}catch(Exception e2) {e2.printStackTrace();}
			}
				
				%>
				
			</table>
			
			
		</div>
	
	</body>
</html>