<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<title>학생성적프로그램</title>
		<style>
			table,td{border:1px solid black; border-collapse: collapse; font-size:16px
			text-align:center;
			}
			td{width:150px; height:40px;}
			
		</style>
		<%request.setCharacterEncoding("utf-8"); %>
		<script>
		
		</script>
	</head>
	<body>
		<jsp:useBean id="score1" class="com.java.www.StuScore"/>
		<jsp:setProperty property="*" name="score1"/>
		<h1>학생성적프로그램</h1>
		<table>
			<tr>
				<td>학번</td>
				<td><%=score1.getStuNum() %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=score1.getName() %></td>
			</tr>
			<tr>
				<td>국어</td>
				<td><%=score1.getKor()%></td>
			</tr>
			<tr>
				<td>영어</td>
				<td><%=score1.getEng() %></td>
			</tr>
			<tr>
				<td>수학</td>
				<td><%=score1.getMath() %></td>
			</tr>
			<tr>
				<td>합계</td>
				<%score1.setTotal(score1.getKor()+score1.getEng()+score1.getMath()); %>
				<td><%=score1.getTotal()%></td>
			</tr>
			<tr>
				<td>평균</td>
				<%score1.setAvg(score1.getTotal()/3.0); %>
				<td><%=score1.getAvg() %></td>
			</tr>
		</table>
	
	</body>
</html>