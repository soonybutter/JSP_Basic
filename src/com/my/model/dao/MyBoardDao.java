package com.my.model.dao;

<<<<<<< HEAD
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.my.model.dto.MyBoard;


public class MyBoardDao extends SqlMapConfig {
	
	//전체출력
	public List<MyBoard> selectAll(){
		List<MyBoard> res = new ArrayList<>();
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(true);
		res = session.selectList("com.my.myboard.selectAll");
		
		session.close();
		
	    return res;
	}
	
	//선택출력
	public MyBoard selectOne(int myno) {
		SqlSession session = null;
		MyBoard res = null;
		
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne("com.my.myboard.selectOne",myno);
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
		
=======
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.my.model.dto.MyBoard;

public class MyBoardDao {
	Connection con = null;
	String url = "jdbc:oracle:thin:@multi0729_high?TNS_ADMIN=C:\\\\DataBaseTest\\\\Wallet_Multi0729";
	String username = "MULTI";
	String password = "Test09061234";
	
	public MyBoardDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("01.driver 연결");
		}catch(ClassNotFoundException e) {
			System.out.println("01.driver 연결 실패");
			e.printStackTrace();
		}
		
		
	}
	
	
	//전체출력
	public List<MyBoard> selectAll(){
		try {
			con= DriverManager.getConnection(url,username,password);
			System.out.println("02.계정연결");
			
		}catch(SQLException e) {
			System.out.println("02.계정연결 실패");
			e.printStackTrace();
		}
		
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MYBOARD";
		List<MyBoard> res = new ArrayList<>();
		
		try {
			stmt = con.createStatement();
			System.out.println("03. query준비: "+sql);
			
			rs = stmt.executeQuery(sql);
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				MyBoard tmp = new MyBoard(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getString(4),rs.getDate(5));
				
				res.add(tmp);
			}

		}
		catch(SQLException e){
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
			
		}
		finally {
			try {
				rs.close();
				stmt.close();
				con.close();
				System.out.println("05. db종료 \n");
			}
			catch(SQLException e) {
				System.out.println("05. db종료에러");
				e.printStackTrace();
			}
		}
	    return res;
	}
	//선택출력
	public MyBoard selectOne(int myno) {
		
		try {
			con = DriverManager.getConnection(url,username,password);
			System.out.println("02. 계정 연결");
		} catch (SQLException e) {
			System.out.println("02. 계정 연결 실패");
			e.printStackTrace();
		}
		
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = " SELECT * FROM MYBOARD WHERE MYNO=? ";
		MyBoard res = null;
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, myno);
			System.out.println("03. query 준비: "+ sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			if(rs.next()) {  //rs 파싱 DB에서 가져온 rs를 자바에서 쓸 수 있는 형태로 파싱해서 res에 세팅
				res = new MyBoard();
				res.setMyno(rs.getInt(1));
				res.setMyname(rs.getString(2));
				res.setMytitle(rs.getString(3));
				res.setMycontent(rs.getString(4));
				res.setMydate(rs.getDate(5));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstm.close();
				con.close();
				System.out.println("05. db 종료\n");
			}
			catch(SQLException e){
				System.out.println("05. db 종료 오류");
				e.printStackTrace();
				
			}
		}
		
		
		return res;
>>>>>>> practice/JSP_Myboard
	}
	
	//추가
	public int insert(MyBoard dto) {
<<<<<<< HEAD
		//hint = ("namespace.id",dto);
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert("com.my.myboard.myinsert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
=======
		try {
			con = DriverManager.getConnection(url,username,password);
			System.out.println("02. 계정 연결");
		} catch (SQLException e) {
			System.out.println("02. 계정 연결 실패");
			e.printStackTrace();
		}
		
		PreparedStatement pstm = null;
		int res=0;
		String sql = " INSERT INTO MYBOARD VALUES(SEQ_MYBOARD.NEXTVAL,?,?,?,CURRENT_DATE) ";
		
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMyname());
			pstm.setString(2, dto.getMytitle());
			pstm.setString(3, dto.getMycontent());
			System.out.println("03. query 준비: "+ sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			try {
				pstm.close();
				con.close();
				System.out.println("05. db 종료\n");
			} catch (SQLException e) {
				System.out.println("05. db 종료 오류");
				e.printStackTrace();
			}
			
		}
		
		
>>>>>>> practice/JSP_Myboard
		return res;
	}
	
	//수정
	public int update(MyBoard dto) {
		
<<<<<<< HEAD
		return 0;
=======
		try {
			con = DriverManager.getConnection(url,username,password);
			System.out.println("02. 계정 연결");
		} catch (SQLException e) {
			System.out.println("02. 계정 연결 실패");
			e.printStackTrace();
		}
		
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " UPDATE MYBOARD SET MYTITLE=?, MYCONTENT=? "+" WHERE MYNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMytitle());
			pstm.setString(2,  dto.getMycontent());
			pstm.setInt(3,  dto.getMyno());
			System.out.println("03. query 준비: "+ sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			try {
				pstm.close();
				con.close();
				System.out.println("05. db 종료\n");
			} catch (SQLException e) {
				System.out.println("05. db 종료 오류");
				e.printStackTrace();
			}
		}
		
		return res;
>>>>>>> practice/JSP_Myboard
	}
	
	//삭제
	public int delete(int myno) {
<<<<<<< HEAD
		
		
		return 0;
=======
		try {
			con = DriverManager.getConnection(url,username,password);
			System.out.println("02. 계정 연결");
			
		} catch (SQLException e) {
			System.out.println("02. 계정 연결 실패");
			e.printStackTrace();
		}
		
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " DELETE FROM MYBOARD WHERE MYNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, myno);
			System.out.println("03. query 준비: "+ sql);
		}
		catch(SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}
		finally {
			try {
				pstm.close();
				con.close();
				System.out.println("05. db 종료\n");
			}
			catch(SQLException e) {
				System.out.println("05. db 종료 오류");
				e.printStackTrace();
			}
		}
		
		return res;
>>>>>>> practice/JSP_Myboard
		
		
	}

}
