<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP test01</title>
</head>
<body>
	<%-- 1. 점수들 평균 구하기 --%>
	<%
		int[] scores = {80, 90, 100, 95, 80};
		
		int sum = 0;
		for(int i = 0; i < scores.length; i++) {
			sum += scores[i];
		}
		double avg = sum / (double)scores.length;
	
	%>
	<h3>점수 평균은 <%= avg %> 입니다.</h3>

	<%-- 2. 채점 결과 --%>
	<%
		List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
		int total = 0;
		for(String check:scoreList) {
			if(check.equals("O")) {
				total += 10;
			}
		}
	%>
	
	<h3>채점 결과는 <%= total %>점 입니다.</h3>
	
	<%-- 3. 1부터 n까지의 합계를 구하는 함수 --%>
	<%!
		public int sumOneToN (int n) {
			int result = 0;
			for(int i = 1; i <= n; i++) {
				result += i;
			}
			return result;
		}
	%>
	
	<h3>1에서 50까지의 합은 <%= sumOneToN(50) %></h3>
	
	<%-- 4. 나이 구하기 --%>
	
	<%
		String birthDay = "20010820";
		String yearString = birthDay.substring(0, 4);
		int year = Integer.parseInt(yearString);
		int age = 2022 - year + 1;
	%>
	<h3><%= birthDay %> 의 나이는 <%= age %>살 입니다.</h3>

</body>
</html>