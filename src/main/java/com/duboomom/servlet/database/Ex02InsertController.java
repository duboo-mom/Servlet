package com.duboomom.servlet.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.duboomom.servlet.common.MysqlService;

@WebServlet("/db/ex02_insert")
public class Ex02InsertController extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
//		response.setContentType("text/plain");
		
//		PrintWriter out = response.getWriter();
		
		// 이름, 생년월일, 이메일 파라미터로 얻기
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		
		// insert 쿼리 수행
		// 채워질 값을 전달 받아서 쿼리에 추가한다.
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String query ="INSERT INTO `new_user`\r\n"
				+ "(`name`, `yyyymmdd`, `email`, `createdAt`, `updatedAt`)\r\n"
				+ "VALUE\r\n"
				+ "('" + name + "', '" + birthday + "', '" + email + "', now(), now());";
		
		int count = mysqlService.update(query);
//		out.println("수행 결과 : " + count);
		
		mysqlService.disconnect();
		
		// redirect
		// response를 만들어내지 않고 다른 페이지로 이동시키는...
		response.sendRedirect("/db/ex02.jsp");
		
	}
	
	
}
