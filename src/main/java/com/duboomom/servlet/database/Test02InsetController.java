package com.duboomom.servlet.database;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.duboomom.servlet.common.MysqlService;

@WebServlet("/db/test02_insert")
public class Test02InsetController extends HttpServlet{
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String Query = "INSERT INTO `bookmark`\r\n"
				+ "(`name`, `url`, `createdAt`, `updatedAt`)\r\n"
				+ "VALUE\r\n"
				+ "('" + name +"', '" + url + "', now(), now());";
		
		int count = mysqlService.update(Query);
		
		mysqlService.disconnect();
		
		response.sendRedirect("/db/test02.jsp");
		
	}

}
