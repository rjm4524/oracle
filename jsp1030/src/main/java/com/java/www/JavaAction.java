package com.java.www;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/JJJ")
public class JavaAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//웹브라우저에서 url입력시 모두 doget으로 들어옴, form태그 method = "get" 
		System.out.println("서블릿 doGet메소드가 호출되었습니다.");
		
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//form태그 method = "post" 전송할때만 dopost
	}

}
