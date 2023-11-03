package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/S01")
public class S1103_01 extends HttpServlet {
       

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		 
	    for(int i=2; i<=9; i++) {
	    	for(int j=1; j<=9; j++) {
	    		System.out.println(i+"*"+j+"="+(i*j));
	    	}
	    }
		int sum =0;
		for(int i=1; i<=100; i++) {
			sum+=i;
			System.out.println("합계 :" +sum);
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head><title>표</title><head>");
		writer.println("<body>");
		writer.println("<style>");
		writer.println("table,td,tr{border:1px solid black; border-collapse:collapse;}");
		writer.println("</style>");
		writer.println("<table>");
		writer.println("<tr><td>단</td><td>*</td><td>숫자</td><td>=</td><td>곱셈</td></tr>");
		writer.println("</table>");
		
		for (int i=2; i<=9; i++) {
			for(int j=1; j<=9; j++) {
				writer.println("<tr>");
				writer.println("<td>"+i+"</td>");
				writer.println("<td>*</td>");
				writer.println("<td>"+j+"</td>");
				writer.println("<td>=</td>");
				writer.println("<td>"+(i*j)+"</td>");
				writer.println("</tr>");
				writer.println("");
				writer.println("</body>");
				writer.println("</html>");
				
			}
			
		}
		
		writer.close();
		
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
