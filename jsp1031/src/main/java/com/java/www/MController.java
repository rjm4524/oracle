package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MC")
public class MController extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		String str_script="";
		if(id.equals("aaa") && pw.equals("1111")) {
			str_script = "alert('로그인 되었습니다.');";
			str_script += "location.href='layout/main.html';";
		}else {
			str_script = "alert('아이디 혹은 비밀번호가 일치하지않습니다. 다시 로그인 해주세요.');";
			str_script += "history.back();";
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html>"); 
		writer.println("<head><title>로그인</head></title>"); 
		writer.println("<script>"); 
		writer.println(str_script); 
		writer.println("</script>"); 
		writer.println("아이디 :" + id); 
		writer.println("<br>");
		writer.println("비밀번호 :" + pw); 
		writer.println("</html>"); 
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
		
	}

}
