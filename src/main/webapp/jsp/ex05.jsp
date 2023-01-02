<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
</head>
<body>
	<%
		//Date now = new Date();
		
		// Date와 달리 시간 계산이 가능함
		// 오늘 날짜 정보를 얻어 온다.
		Calendar today = Calendar.getInstance();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일");
				
		// 하루 빼기
		today.add(Calendar.DATE, -53);
		today.add(Calendar.MONTH, 8);
		
		
		String formatString = formatter.format(today.getTime());
	%>

	<div><%= formatString %></div>



</body>
</html>