package com.java.www.controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.service.DoMInsertService;
import com.java.www.service.DoMUpdateService;
import com.java.www.service.MDoLoginService;
import com.java.www.service.MUpdateService;
import com.java.www.service.Service;
@WebServlet("*.do")
public class FController extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
	
		String uri = request.getRequestURI();
		String uPath = request.getContextPath();
		String fileName = uri.substring(uPath.length());
		System.out.println("파일이름 : "+fileName);
		
		Service service = null;
		String url=null;
		switch (fileName) {
		case "/index.do": //데이터베이스연결필요없음
			response.sendRedirect("index.jsp");
			break;
		case "/mInsert.do": //데이터베이스연결필요없음
			response.sendRedirect("mInsert.jsp");
			break;
		case "/DoMInsert.do": //데이터베이스연결필요없음
			service = new DoMInsertService();
			service.execute(request, response);
			url="doMInsert.jsp";
			break;
		case "/login.do": //데이터베이스연결필요없음
			response.sendRedirect("login.jsp");
			break;
		case "/logout.do": //데이터베이스연결필요없음
			response.sendRedirect("logout.jsp");
			break;
			
		case "/doLogin.do": //데이터베이스연결필요
			//MDoLoginService 접근
			service = new MDoLoginService();
			service.execute(request, response);
			url= "doLogin.jsp";
			break;
			
		case "/mupdate.do": //데이터베이스연결필요
			//MUpdateService 접근
			service = new MUpdateService();
			service.execute(request, response);
			url= "mupdate.jsp";
			break;
		case "/doMUpdate.do": //데이터베이스연결필요
			//DoMUpdateService 접근
			service = new DoMUpdateService();
			service.execute(request, response);
			url= "doMUpdate.jsp";
			break;
			
		}//switch
			if(url!=null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response); //
		}
		
		
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