package com.java.www.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.dao.BoardDao;
import com.java.www.dto.BoardDto;

public class BviewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse respones) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("BviewService bno : " + bno);
		
		//dao 접근
		BoardDao bdao = new BoardDao();
		BoardDto bdto = bdao.bSelectOne(bno);
		System.out.println("bdto.btitle" + bdto.getBtitle());
		
		//request갹체 담음
		
		request.setAttribute("bdto", bdto);
		
	}	
	
	

}
