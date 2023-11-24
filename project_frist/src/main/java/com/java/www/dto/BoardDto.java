package com.java.www.dto;

import java.sql.Timestamp;

public class BoardDto {
	
	int bno;
	String btitle;
	String bcontent;
	Timestamp bdate;
	String id;
	int bgroup;
	int bstep;
	int bindent;
	int bhit;
	String bfile;
	
	public BoardDto () {}
	
	public BoardDto(String btitle, String bcontent, String id, String bfile) {
		super();
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.id = id;
		this.bfile = bfile;
	}

	public BoardDto(int bno, String btitle, String bcontent, Timestamp bdate, String id, int bgroup, int bstep,
			int bindent, int bhit, String bfile) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bdate = bdate;
		this.id = id;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.bhit = bhit;
		this.bfile = bfile;
	}
	
}
