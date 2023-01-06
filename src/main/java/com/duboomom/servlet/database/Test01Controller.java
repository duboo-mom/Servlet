package com.duboomom.servlet.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.duboomom.servlet.common.MysqlService;

@WebServlet("db/test01")
public class Test01Controller extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("text/plain");
		
		PrintWriter out = response.getWriter();
		
		MysqlService mysqlService = new MysqlService();
		mysqlService.connect();
//		String selectQuery = "SELECT * FROM `real_estate`;";
//		ResultSet resultSet = mysqlService.select(selectQuery);
//		out.println(resultSet);
		
		String insertQuery = "INSERT INTO `real_estate`\r\n"
				+ "(`realtorId`, `address`, `area`, `type`, `price`, `rentPrice`, `createdAt`, `updatedAt`)\r\n"
				+ "VALUE\r\n"
				+ "(3, '헤라펠리스 101동 5305호', 350,	'매매', 1500000,	NULL, now(), now());";
		
		int countRow = mysqlService.update(insertQuery);
		
		String selectQuery = "SELECT `address`, `area`, `type` FROM `real_estate`\r\n"
				+ "ORDER BY `area` DESC\r\n"
				+ "LIMIT 10;";
		ResultSet resultSet = mysqlService.select(selectQuery);
		
		try {
			while(resultSet.next()) {
				
				String address = resultSet.getString("address");
				int area = resultSet.getInt("area");
				String type = resultSet.getString("type");
				
				out.println("매물 주소 : " + address + ", 면적 : " + area + ", 타입 : " + type);
								
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		mysqlService.disconnect();
		
	}
}
