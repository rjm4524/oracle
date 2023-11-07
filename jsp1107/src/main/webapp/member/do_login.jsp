<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		
	
	
	
	<%
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	%>
		<%if(id.equals("admin") && pw.equals("1111")) { 
			session.setAttribute("session_id",id);
			session.setAttribute("session_nicName","진민스");
		%>
		<script>
			alert("로그인 하셨습니다!"); location.href="../layout/main.jsp";
		</script>
		<%}else  {%>//실패할 경우
			
			<script>
				alert("아이디 혹은 패스워드가 일치하지 않습니다. 다시 로그인 해주세요.");
				location.href="login.jsp";
			</script>
		<% } %>
	
	</body>
</html>