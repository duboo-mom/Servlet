<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예제 페이지!</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/jspTemplete/ex02/style.css" type="text/css"> 
</head>
<body>
	<div class="container">
		<%-- 동적방식의 차이는 include하는 파일안에 자바코드를 다 실행하고 사라진 후 결과만 보여줌 그러니 파일내부 변수 사용 불가 --%>
		<%-- 이게 안좋아 보일수 있지만..! 사실 공용으로 파일을 쓰게되면 변수가 겹치는 경우도 생길수 있어서 주로 동적방식 사용 --%>
		<jsp:include page="header.jsp" />
		<jsp:include page="menu.jsp" />
		<section>
			<h1>컨텐츠!</h1>
		</section>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>