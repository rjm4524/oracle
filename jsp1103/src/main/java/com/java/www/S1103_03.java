package com.java.www;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/S03")
public class S1103_03 extends HttpServlet {

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		int page = Integer.parseInt(request.getParameter("page"));
		String search = request.getParameter("searchword");
		int snum = ((10*(page-1))+1);
		int Enum = 10*page;
		
		System.out.println("호출한 페이지 : "+page);
		System.out.println("시작페이지 : "+snum);
		System.out.println("끝나는 페이지 : "+Enum);
		System.out.println("검색어 : "+search);
		
		String query = "select * from (select row_number() over (order by bno desc) as rnum,bno,btitle,bcontent,bdate from board where bcontent like '%"+search+"%') a where a.rnum >="+snum+" and a.rnum<="+Enum+"";
		
		System.out.println("오라클 구문 :" + query);
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
