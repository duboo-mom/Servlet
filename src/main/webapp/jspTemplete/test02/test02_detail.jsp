<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>곡 정보</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/jspTemplete/test02/style.css" type="text/css"> 
</head>
<body>

<%@ include file="data.jsp" %>

<%
	String idString = request.getParameter("songId");
	
	Integer id = null;
	if(idString != null) {
	    id = Integer.parseInt(idString);		
	}
    
    String title = request.getParameter("title");

    
%>

	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="menu.jsp" />
		
		<section>
			<div class="detail-info">
				<h4>곡 정보</h4>
				<div class="border border-success p-3 d-flex">
				
				<% for(Map<String, Object> song:musicList) {
					Integer songId = (Integer)song.get("id");
					// 아이디가 null이 아니면, 아이디가 일치하는 결과
					// title이 null이 아니면, 타이틀이 일치하는 결과
					// if(id.equals(songId)
					// if(title.equals(song.get("title"))) {
					if((id != null && id.equals(songId)) 
							|| (title != null && title.equals(song.get("title")))) {
						int second = (Integer)song.get("time");
						int minute = second / 60;
						second = second % 60;
					
					%>
					
					<div class="photo">
						<img height="200" src="<%= song.get("thumbnail")%>">
					</div>
					<div class="info ml-3">
						<div class="display-4"><%= song.get("title")%></div>
						<div class="font-weight-bold text-success"><%= song.get("singer") %></div>
						<div class="d-flex mt-3">
							<div class="small">
								<div>앨범</div>
								<div>재생시간</div>
								<div>작곡가</div>
								<div>작사가</div>
							</div>
							<div class="small ml-3">
								<div><%= song.get("title")%></div>
								<div><%= minute%> : <%= second %></div>
								<div><%= song.get("composer")%></div>
								<div><%= song.get("lyricist")%></div>
							</div>
				<%	}
				 }%>
						</div>
					</div>
				</div>
			</div>
			<div class="lyrics mt-5">
				<h4>가사</h4>
				<hr>
				<div>가사 정보 없음</div>
			</div>
		
		</section>
		
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>