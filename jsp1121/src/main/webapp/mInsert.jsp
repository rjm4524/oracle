<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
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
				
				$("#idCheck").click(function(){
					if($("#id").val().length<1){
						alert("아이디는 3자리 이상 입력하셔야합니다.")
						$("#id").focus();
						return false;
					}
					
					alert("아이디를 중복체크 합니다.")
					var id = $("#id").val();
					 //ajax을 사용해서 id가 존재하는지 확인
					 $.ajax({
						 url:"IdCheck", //url 확인주소
					 	 type:"post", //get,post
						 data:{"id":id,"name":$("#name").val()},     //url 전달할 데이터
						 dataType:"json",//xml,json,html,text
						 success:function(data){
							/*  alert("성공"); */
							 console.log("전달받은 데이터 :" +data[0]);
							 console.log("전달받은 데이터 :" +data[0].result);
							 if(data[0].result==0) {
								 alert("아이디가 존재합니다. 다른아이디를 사용해주새요.")
								 $("#id").val("");
								 $("#id").focus();
								 return false;
							 }else {
								 alert("아이디를 사용가능 합니다.")
							 }
						 },
						 error:function(){
							 alert("실패");
						 }
						 
						 
					 });//ajax
					 
				});//idcheck
				
				
			});//jquery
		</script>
	</head>
	<body>
		<div>
			<h1>회원가입</h1>
			<form name="mFrm" method="post" action=DoMInsert.do>
				<table>
					<tr>
						<th>아이디</th>
						<td>
						<input type="text" name="id" id="id">
						<button type="button" id="idCheck">아이디 확인</button>
						</td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="password" name="pw" id="pw"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="phone" id="phone"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<input type="radio" name="gender" id="Male" value="Male">
							<label for="Male">남자</label>
							<input type="radio" name="gender" id="Female" value="Female">
							<label for="Female">여자</label>
						</td>
					</tr>
					<tr>
						<th>취미</th>
						<td>
							<input type="checkbox" name="hobby" id="game" value="game">
							<label for="game">game</label>
							<input type="checkbox" name="hobby" id="golf" value="golf">
							<label for="golf">golf</label>
							<input type="checkbox" name="hobby" id="run" value="run">
							<label for="run">run</label>
							<input type="checkbox" name="hobby" id="cook" value="cook">
							<label for="cook">cook</label>
							<input type="checkbox" name="hobby" id="book" value="book">
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