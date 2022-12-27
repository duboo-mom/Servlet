package com.duboomom.servlet.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex03")
public class Ex03Controller extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
//		response.setContentType("application/json");
		
		PrintWriter out = response.getWriter();
		
		// 이름과 생년월일을 전달 받고, 이름과 나이를 html 구성
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		
//		out.println(name + " " + birthday);
		
		// 생년월일로 나이계산
		// 20011023
		String yearString = birthday.substring(0, 4);
		int year = Integer.parseInt(yearString);
		
		int age = 2022 - year + 1;
		
		out.println("<html><head><title>나이</title></head>");
		out.println("<body> <h2> 이름 : " + name + "</h2>");
		out.println("<h3>나이 : " + age + "</h3> </body> </html>");
		
		// 문자열을 통해 데이터 전달
		// xml
		// <name>안미정</name> <age>20</age>
		// json
		// {"name":"안미정", "age":20}
		// ["안미정", "유재석", "지석진"]
		
//		out.println("{\"name\":\"" + name + "\",\"age\":" + age + "}");
			
		
		
	}
	
}
