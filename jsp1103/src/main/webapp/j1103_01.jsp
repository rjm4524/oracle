<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
		table,tr,td{border:1px solid black; border-collapse:collapse;
			text-align: center;
		}
		th,td{width:200px; height: 40px;}
		.back{background: yellow;}
		</style>
		
	</head>
	<body>
		<table>
			<tr>
				<th>단</th>
				<th>*</th>
				<th>숫자</th>
				<th>=</th>
				<th>곱셈</th>
			</tr>
			<%for (int i=2; i<=9; i++){//2단에 1,3,5,7,9
				for(int j=1; j<=9; j++) {
					if(j%2==0) continue;
				%>
				<tr>
					<td><%= i%></td>
					<td>*</td>
					<%if(j%3==0) { %>
						<td class="back"><%=j %></td>
					<% }else  { %> 
						<td><%=j %></td>
					<% }%>
					<td>=</td>
					<td><%= i*j%></td>
				</tr>
					
		<%
					
				}
			}
		%>
			
			
			<tr>
				<td>2</td>
				<td>*</td>
				<td>1</td>
				<td>=</td>
				<td>2</td>
			</tr>
		</table>
	
	</body>
</html>