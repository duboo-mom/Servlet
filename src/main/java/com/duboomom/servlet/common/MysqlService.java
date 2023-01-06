package com.duboomom.servlet.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.Driver;

public class MysqlService {

	// 디자인패턴 single tone
	// 객체 1개만 생성되도록..!
	// 클래스 내부에서 객체를 미리 생성하고 static으로 하면 밖에서 못만들게!
	private static MysqlService mysqlService = null;
	
	// 접속주소, 아이디, 비밀번호
	// final -상수 값 변경X
	private final String url ="jdbc:mysql://localhost:3306/duboo_1213";
	private final String userId = "root";
	private final String password = "root";
	
	private Connection connection;
	private Statement statement;	
	
	private MysqlService() {
		
	}
	
	// 객체 생성을 관리하는 메소드
	// 객체 생성없이 이 클래스를 사용할 수 있도록 여기서 객체 만들기
	public static MysqlService getInstance() {
		// 하나의 객체만 생성
		if(mysqlService == null) {
			mysqlService = new MysqlService();
		}
		
		return mysqlService;
	}
	
	// 접속기능
	public void connect() {
		// 접속
	
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			connection = DriverManager.getConnection(url, userId, password);
			statement = connection.createStatement();
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
