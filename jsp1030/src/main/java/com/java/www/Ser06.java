package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ser06")
public class Ser06 extends HttpServlet {
       
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("doAction");
		PrintWriter write = response.getWriter();
		write.println("<html>");
		write.println("<head>");
		write.println("<title>div배경</title>");
		write.println("<style>div{width:600px; height:600px; text-align: center; font-size: 70px;"
				+ "border : 1px solid black; background:yellow;}</style>");
		write.println("<div>서블릿에서 만든 사각형</div>");
		write.println("<script>alert('당신이 입력한 이름 :"+request.getParameter("name")+"')</script>");
		write.println("</head>");
		write.println("</html>");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request,response);
	
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request,response);
	}

}
