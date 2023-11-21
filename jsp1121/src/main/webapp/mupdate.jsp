<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보수정</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
			*{margin:0; padding:0;}
		   div{width:600px; margin:30px auto; text-align: center;}
		   h1{margin-bottom:30px; }
		   table,th,td{border:1px solid black; border-collapse: collapse;
		   font-size: 16px; }
		   th{width:200px; height:40px; }
		   td{width:400px; text-align:left;padding-left:50px}
		   button{width:200px; height:60px; margin-top:30px; }
		   td*{vertical-align:middle;}
		   #idCheck{width:100px;height:20px;margin-top:0;}
		</style>
		<script>
			$(function(){
				$("#fbtn").click(function(){
					if($("#id").val().length<2){
						alert("아이디를 입력하셔야 합니다.");
						$("#id").focus();
						return false;
					}
					
					alert( "회원정보를 저장합니다." );
					mFrm.submit();
				});//click
			});//jquery
		</script>
	</head>
	<body>
		<div>
			<h1>회원정보수정</h1>
			<form name="mFrm" method="post" action=doMUpdate.do>
				<input type="hidden" name="id" id="id" value="${mdto.id }">
				<table>
					<tr>
						<th>아이디</th>
						<td>${mdto.id }</td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="password" name="pw" id="pw"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name" value="${mdto.name }"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="phone" id="phone" value="${mdto.phone }"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<input type="radio" name="gender" id="Male" value="Male"
								<c:if test="${fn:contains(mdto.gender,'Male')}">checked</c:if>
							>
							<label for="Male">남자</label>
							<input type="radio" name="gender" id="Female" value="Female"
							<c:if test="${fn:contains(mdto.gender,'Feale')}">checked</c:if>
							>
							<label for="Female">여자</label>
						</td>
					</tr>
					<tr>
						<th>취미</th>
						<td>
							<input type="checkbox" name="hobby" id="game" value="game"
							<c:if test="${fn:contains(mdto.hobby,'game')}">checked</c:if>>
							<label for="game">game</label>
							<input type="checkbox" name="hobby" id="golf" value="golf"
							<c:if test="${fn:contains(mdto.hobby,'golf')}">checked</c:if>>
							<label for="golf">golf</label>
							<input type="checkbox" name="hobby" id="run" value="run"
							<c:if test="${fn:contains(mdto.hobby,'run')}">checked</c:if>>
							<label for="run">run</label>
							<input type="checkbox" name="hobby" id="cook" value="cook"
							<c:if test="${fn:contains(mdto.hobby,'cook')}">checked</c:if>>
							<label for="cook">cook</label>
							<input type="checkbox" name="hobby" id="book" value="book"
							<c:if test="${fn:contains(mdto.hobby,'book')}">checked</c:if>>
							<label for="book">book</label>
						</td>
					</tr>
				</table>
				<button type="button" id="fbtn">저장</button>
				<button type="button" onclick="javascript:history.back()">취소</button>
			</form>
		</div>
	
	</body>
</html>