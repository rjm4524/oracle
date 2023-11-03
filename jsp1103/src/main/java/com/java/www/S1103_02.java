package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/S02")
public class S1103_02 extends HttpServlet {
       
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		int page = Integer.parseInt(request.getParameter("page"));
		String searchword = request.getParameter("searchword");
	 	int startrow = (10*(page-1))+1;
	 	int endrow = page*10;
		System.out.println("호출한 페이지 :" + page);//1페이지 
		System.out.println("가져올 시작번호 :" + startrow);//11페이지 
		System.out.println("가져올 마지막번호 :" + endrow);//20페이지 
		System.out.println("넘어오는 검색어 :" + searchword); 
		
	String query = "select * from (select row_number() over (order by bno desc) as rnum,bno,btitle,bcontent,bdate from board where bcontent like '%"+searchword+"%') a where a.rnum >="+startrow+" and a.rnum<="+endrow+"";
		
		System.out.println("오라클 구문 :"+query); 
		
		
		
		
		
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
