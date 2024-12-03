package com.mvc.dao;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mvc.dto.MVCBoardDto;


public class MVCBoardDao extends SqlMapConfig {
	private String namespace ="com.my.mvc.";
	
	
	//전체선택
	public List<MVCBoardDto> selectAll(){
		SqlSession session = null;
		List<MVCBoardDto> res = null;
		
		 //true: autocommit ㅇ
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectList(namespace+"selectAll");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
		
=======
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mvc.dto.MVCBoardDto;
import static common.JDBCTemplate.*;

public class MVCBoardDao {
	
	//전체선택
	public List<MVCBoardDto> selectAll(){
		//준비
		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<MVCBoardDto> res = new ArrayList<>();
		
		String sql = " SELECT * FROM MVCBOARD ORDER BY SEQ DESC ";
		
		try {
			stmt = con.createStatement();
			System.out.println("03. query 준비: "+ sql);
			
			rs = stmt.executeQuery(sql);
			System.out.println("04. query 실행 및 리턴");
			
			//next()를 통해 커서를 이동할때마다 이동한 위치에 있는 데이터들을 담는다!
			while(rs.next()) {
				MVCBoardDto tmp = new MVCBoardDto();
				tmp.setSeq(rs.getInt(1));
				tmp.setWriter(rs.getString(2));
				tmp.setTitle(rs.getString(3));
				tmp.setContent(rs.getString(4));
				tmp.setRegdate(rs.getDate(5));
				
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
			close(con);
			System.out.println("05. db 종료 \n");
		}
		
		return res;
>>>>>>> practice/JSP_MVC
	}
	
	//단일선택
	public MVCBoardDto selectOne(int seq) {
<<<<<<< HEAD
		SqlSession session = null;
		MVCBoardDto res = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectOne(namespace+"selectOne",seq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
		
=======
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MVCBoardDto res = new MVCBoardDto();
		
		String sql = " SELECT * FROM MVCBOARD WHERE SEQ=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			System.out.println("03. query 준비: "+ sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			if(rs.next()) {
				res.setSeq(rs.getInt(1));
				res.setWriter(rs.getString(2));
				res.setTitle(rs.getString(3));
				res.setContent(rs.getString(4));
				res.setRegdate(rs.getDate(5));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
			
		}
		
		return res;
>>>>>>> practice/JSP_MVC
	}
	
	//추가
	public int insert(MVCBoardDto dto) {
<<<<<<< HEAD
		SqlSession session = null;
		int res = 0;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert",dto);
			
			if(res>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
=======
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res =0;
		
		String sql =" INSERT INTO MVCBOARD VALUES(SEQ_MVCBOARD.NEXTVAL, ?,?,?,CURRENT_DATE) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getWriter());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			System.out.println("03. query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}	
>>>>>>> practice/JSP_MVC
		return res;
	}
	
	
	//수정
	public int update(MVCBoardDto dto) {
<<<<<<< HEAD
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"update", dto);
			
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
=======
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MVCBOARD SET TITLE=?,CONTENT=? WHERE SEQ=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getSeq());
			System.out.println("03. query 준비: "+ sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}
		finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
>>>>>>> practice/JSP_MVC
		}
		
		return res;
	}
<<<<<<< HEAD
	
	
	//삭제
	public int delete(int seq) {
		SqlSession session = null;
		int res=0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"delete", seq);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return res;
	}
	
	//다중삭제
	public int multiDelete(String[] seq) {
		SqlSession session = null;
		int res = 0;
		
		Map<String, String[]> map = new HashMap<String,String[]>();
		map.put("seq", seq);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"muldel",map);
			
			if(res>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
		
=======
	//삭제
	public int delete(int seq) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res =0;
		
		String sql =" DELETE FROM MVCBOARD WHERE SEQ=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			System.out.println("03. query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		
		return res;
>>>>>>> practice/JSP_MVC
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
