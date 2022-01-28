package net.koreate.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

// 서버 실행 필요 없이 connect 실행 test  
// annotation @Test 
public class MySQLConnectTest {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/smartWeb";
	String username = "smartWeb";
	String password = "12345";

	@Test
	public void testConnection() {
		System.out.println("connection test");
		Connection conn = null;

		try {
			Class.forName(driver);
			System.out.println("Driver 확인 완료");
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("연결 완료 " + conn);
		} catch (SQLException e) {
			System.out.println("Driver 확인실패 찾을 수 없음");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("Driver 확인실패 찾을 수 없음");
			e.printStackTrace();
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}

		}

	}

}
