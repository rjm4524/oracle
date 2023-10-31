package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/S02")
public class S1031_02 extends HttpServlet {
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		String stunum = request.getParameter("stunum");
		String kor = request.getParameter("kor");
		String eng = request.getParameter("eng");
		String math = request.getParameter("math");
		String total = request.getParameter("total");
		String[] sbjects = request.getParameterValues("sbject"); 
		String sbject = "";
		for(int i=0; i<sbjects.length; i++) {
			if(i==0) sbject = sbjects[i];
			else sbject += "," + sbjects[i];
		}
		
		
		writer.println("<html>");
		writer.println("<head><title></title></head>");
		writer.println("<body>");
		writer.println("학번:" +Arrays.toString(request.getParameterValues("stunum")));
		writer.println("학번:" +stunum);
		writer.println("<br>");
		writer.println("이름 :" + request.getParameter("name"));
		writer.println("<br>");
		writer.println("국어:" +kor);
		writer.println("<br>");
		writer.println("수학:" +math);
		writer.println("<br>");
		writer.println("영어:" +eng);
		writer.println("<br>");
		writer.println("합계:" +total);
		writer.println("<br>");
		writer.println("계열선택:"+Arrays.toString(request.getParameterValues("gkr")));
		writer.println("<br>");
		writer.println("좋아하는 과목 :"+Arrays.toString(request.getParameterValues("sbject")));
		writer.println("<br>");
		writer.println("</body>");
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
