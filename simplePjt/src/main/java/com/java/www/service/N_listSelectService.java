package com.java.www.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.dao.BoardDao;
import com.java.www.dto.BoardDto;

public class N_listSelectService implements Service {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//dao 접근
		
		BoardDao bdao = new BoardDao();
		ArrayList<BoardDto> list = bdao.n_lsitSelect();
		
		//requset 추가
		request.setAttribute("list", list);
		
	}

}
