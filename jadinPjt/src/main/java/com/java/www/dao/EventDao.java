package com.java.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.java.www.dto.BoardDto;
import com.java.www.dto.EcommentDto;

public class EventDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	BoardDto bdto = null;
	ArrayList<BoardDto> list = new ArrayList<BoardDto>();
	int bno,bgroup,bstep,bindent,bhit;
	String btitle,bcontent,id,bfile,query="";
	Timestamp bdate;
	int result,listCount;
	int cno;
	String cpw,ccontent;
	Timestamp cdate;
	EcommentDto ecdto = null;
	
	//getConnection
	public Connection getConnection() {
		Connection connection = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle18");
			connection = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}//getConnection

	//게시글 전체 가져오기
	public ArrayList<BoardDto> selectAll() {
		try {
			conn=getConnection();
			query="select * from (select row_number() over(order by bgroup desc, bstep asc) rnum, a.* from board a) where rnum between ? and ?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 10);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bno=rs.getInt("bno");
				btitle=rs.getString("btitle");
				bcontent=rs.getString("bcontent");
				bdate=rs.getTimestamp("bdate");
				id=rs.getString("id");
				bgroup=rs.getInt("bgroup");
				bstep=rs.getInt("bstep");
				bindent=rs.getInt("bindent");
				bhit=rs.getInt("bhit");
				bfile=rs.getString("bfile");
				
				list.add(new BoardDto(bno, btitle, bcontent, bdate, id, bgroup, bindent, bstep, bhit, bfile));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}

	//게시글 1개 가져오기
	public BoardDto selectOne(int bno2) {
		try {
			conn=getConnection();
			query="select * from board where bno=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, bno2);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bno=rs.getInt("bno");
				btitle=rs.getString("btitle");
				bcontent=rs.getString("bcontent");
				bdate=rs.getTimestamp("bdate");
				id=rs.getString("id");
				bgroup=rs.getInt("bgroup");
				bstep=rs.getInt("bstep");
				bindent=rs.getInt("bindent");
				bhit=rs.getInt("bhit");
				bfile=rs.getString("bfile");
				
				bdto = new BoardDto(bno, btitle, bcontent, bdate, id, bgroup, bindent, bstep, bhit, bfile);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bdto;
	}//selectOne

	//하단댓글 모두 가져오기
	public ArrayList<EcommentDto> commSelectAll(int bno2) {
		ArrayList<EcommentDto> clist = new ArrayList();
		try {
			conn=getConnection();
			query="select * from ecomment where bno=? order by cno desc";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, bno2);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				cno=rs.getInt("cno");
				bno=rs.getInt("bno");
				id=rs.getString("id");
				cpw=rs.getString("cpw");
				ccontent=rs.getString("ccontent");
				cdate=rs.getTimestamp("cdate");

				clist.add(new EcommentDto(cno, bno, id, cpw, ccontent, cdate));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return clist;
	}//commSelectAll
	
	//하단댓글 1개 저장 및 검색
	public EcommentDto CInsert(int bno2, String id2, String cpw2, String ccontent2) {
		try {
			conn=getConnection();
			//cno가져오기
			query="select ecomment_seq.nextval cno from dual";
			pstmt=conn.prepareStatement(query);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				cno=rs.getInt("cno");
				System.err.println("edao Cinsert :"+cno);
				
			}
			//하단댓글 저장 
			query = "insert into ecomment values(?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cno);
			pstmt.setInt(2, bno2);
			pstmt.setString(3, id2);
			pstmt.setString(4, cpw2);
			pstmt.setString(5, ccontent2);
			pstmt.executeUpdate();
			
			//하단댓글 1개 가져오기
			query="select * from ecomment where cno=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, cno);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				cno=rs.getInt("cno");
				bno=rs.getInt("bno");
				id=rs.getString("id");
				cpw=rs.getString("cpw");
				ccontent=rs.getString("ccontent");
				cdate=rs.getTimestamp("cdate");

				ecdto = new EcommentDto(cno, bno, id, cpw, ccontent, cdate);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ecdto;
	}
	
}
