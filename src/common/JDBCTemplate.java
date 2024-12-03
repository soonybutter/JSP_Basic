package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {
	
	//1.연결
	public static Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
			System.out.println("01. driver Connect!");
		} catch (ClassNotFoundException e) {
			System.out.println("01. driver Connect fail..");
=======
			System.out.println("01. driver 연결");
		} catch (ClassNotFoundException e) {
			System.out.println("01. driver 연결 실패");
>>>>>>> practice/JSP_AnswerBoard
=======
			System.out.println("01. driver 연결");
		} catch (ClassNotFoundException e) {
			System.out.println("01. driver 연결 실패");
>>>>>>> practice/JSP_LoginBoard
=======
			System.out.println("01. driver 연결");
		} catch (ClassNotFoundException e) {
			System.out.println("01. driver 연결 실패");
>>>>>>> practice/JSP_MVC_Mybatis
=======
			System.out.println("01. driver 연결");
		} catch (ClassNotFoundException e) {
			System.out.println("01. driver 연결 실패");
>>>>>>> practice/JSP_MVC
			e.printStackTrace();
		}
		
		Connection con = null;
		String url = "jdbc:oracle:thin:@multi0729_high?TNS_ADMIN=C:\\\\DataBaseTest\\\\Wallet_Multi0729";
		String id= "MULTI";
		String pw = "Test09061234";
		
		try {
			con = DriverManager.getConnection(url,id,pw);
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
			System.out.println("02. account Connect!");
			
			con.setAutoCommit(false); //손수 한땀한땀 작업하겠다.
		}catch(SQLException e) {
			System.out.println("02. account fail...");
=======
			System.out.println("02. 계정 연결");
			
			con.setAutoCommit(false); //손수 한땀한땀 작업하겠다.
		}catch(SQLException e) {
			System.out.println("02. 계정 연결 실패");
>>>>>>> practice/JSP_AnswerBoard
=======
			System.out.println("02. 계정 연결");
		}catch(SQLException e) {
			System.out.println("02. 계정 연결 실패");
>>>>>>> practice/JSP_LoginBoard
=======
			System.out.println("02. 계정 연결");
		}catch(SQLException e) {
			System.out.println("02. 계정 연결 실패");
>>>>>>> practice/JSP_MVC_Mybatis
=======
			System.out.println("02. 계정 연결");
		}catch(SQLException e) {
			System.out.println("02. 계정 연결 실패");
>>>>>>> practice/JSP_MVC
			e.printStackTrace();
		}
		return con;
		
	}
	
	public static void close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void close(Statement stmt) {
		try {
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	
	public static void commit(Connection con) {
		
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void rollback(Connection con) {
		
		try {
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
=======
>>>>>>> practice/JSP_LoginBoard
=======
>>>>>>> practice/JSP_MVC_Mybatis
=======
>>>>>>> practice/JSP_MVC

	
	
	
	
	
}
