<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.duboomom.servlet.common.MysqlService"%>    
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍당무 마켓</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/db/test03/style.css" type="text/css">
</head>
</head>
<body>

	<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String query = "select * from `used_goods` JOIN `seller` ON used_goods.sellerId = seller.id;";
		ResultSet resultSet = mysqlService.select(query);
		
	%>
	
	<div class="container">
		<%@ include file="header.jsp" %>
		<%@ include file="menu.jsp" %>
		<section class="contents mt-3 d-flex justify-content-between">
			<div class="goods">
				<img src="<%= resultSet.getString("picture") %>">
				<div class="font-weight-bold"><%= resultSet.getString("title") %></div>			
				<div class="text-secondary"><%= resultSet.getInt("price") %>원</div>	
				<div class="coral"><%= resultSet.getString("nickname") %></div>			
			</div>
		</section>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>