package com.duboomom.servlet.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {

	// 접속주소, 아이디, 비밀번호
	// final -상수 값 변경X
	private final String url ="jdbc:mysql://localhost:3306/duboo_1213";
	private final String userId = "root";
	private final String password = "root";
	
	private Connection connection;
	private Statement statement;	
	
	// 접속기능
	public void connect() {
		// 접속
	
		try {
			connection = DriverManager.getConnection(url, userId, password);
			Statement statement = connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 쿼리 수행 기능 select
	public ResultSet select(String query) {
		
		try {
			return statement.executeQuery(query);
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			return null;
		}
	}
	
	// 쿼리 수행 기능 insert, update, delete
	public int update(String query) {
		try {
			return statement.executeUpdate(query);
		} catch (SQLException e) {
			
			e.printStackTrace();
			// 일반적으로 에러 상황은 음수로 구분함
			return -1;
		}
	}
	
	// 접속 끊는 메소드
	public void disconnect() {
		try {
			statement.close();
			connection.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	
}
