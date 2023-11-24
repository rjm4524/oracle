<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>홈페이지 틀</title>
		<style>
		*{margin: 0 auto; padding: 0;}
		.main{font-weight: 700 ; display:flex;}
		.main ul li{margin:15px;}
		a{text-decoration: none; color:#000;}
		p{text-align: center; color:#000; letter-spacing: 4.5px;
		width:235px; font-family: "Saira Condensed";
		}
		.main1{display:flex; margin: 8px 0 -15px; list-style: none; justify-content: center;
		  border:1px solid black; 		}
		.memberin{display:flex; flex-basis: 25%; list-style: none; justify-content: flex-end;
		height: 45px; margin : 15px; text-align: right; width: 200px; border: 1px solid black; 
		float: left;
		}
			
		</style>
	</head>
	<body>
	<header>
		<div class="main">
			<h1><p>REALMANIA</p></h1>
			<ul class="main1">
				<li>뉴스</li>
				<li>축구</li>
				<li>멀티</li>
				<li>자유</li>
				<li>경기</li>
				<li>선수</li>
				<li>CHAT</li>
				<li>M.</li>
			</ul>
			<ul class="memberin">
				<li><a href="">로그인</a></li>
				<li><a href="">회원가입</a></li>
			</ul>
			<hr>
		</div>
	</header>
	</body>
</html>