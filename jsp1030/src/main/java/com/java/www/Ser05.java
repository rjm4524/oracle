package com.java.www;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ser05")
public class Ser05 extends HttpServlet {
       //프로그램이 시작할때
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init()메소드는 시작할때 1번 실행이 됨.");
	}
		//프로그램이 종료될때 한번 실행
	public void destroy() {
		System.out.println("destory()메소드는 종료될때 1번 실행이 됨.");
	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet는 url접속도 get방식, form에서 get방식 접속마다 계속실행");
		doAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost는 post방식으로 들어올때 계속실행");
		doAction(request,response);
	}

}
