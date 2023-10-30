package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/S_01")
public class Ser1030_01 extends HttpServlet {
	
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("doGet접근");
		response.setContentType("text/html; charset=utf-8"); //html파일임을 선언
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>서블릿파일</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>doGet 메소드 호출후 S_01페이지입니다.</h1>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost접근");
		response.setContentType("text/html; charset=utf-8"); //html파일임을 선언
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>서블릿파일</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>doGet 메소드 호출후 S_01페이지입니다.</h1>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
	}
		
}
