package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ser04")
public class Ser04 extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter write = response.getWriter();
		write.println("<html>");
		write.println("<head>");
		write.println("<title>서블릿페이지</title>");
		write.println("</head>");
		write.println("<body>");
		write.println("<h1>서블릿페이지</h1>");
		write.println("<h2>전달받은 데이터<h2>");
		write.println("<h2>"+request.getParameter("id")+"<h2>");
		write.println("<h2>전달받은 데이터<h2>");
		write.println("<h2>"+request.getParameter("pw")+"<h2>");
		write.println("<h2>전달받은 데이터<h2>");
		write.println("<h2>"+request.getParameter("name")+"<h2>");
		write.println("</body>");
		write.println("</html>");
	}	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("doGet");
	    doAction(request,response);
	    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}

}
