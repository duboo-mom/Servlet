<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의민족 검색</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<%
		List<Map<String, Object>> list = new ArrayList<>();
		// 하나의 맵에서 value가 타입이 다르기 때문에 Object 사용
	    Map<String, Object> map = new HashMap<String, Object>() {{ put("name", "버거킹"); put("menu", "햄버거"); put("point", 4.3); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "BBQ"); put("menu", "치킨"); put("point", 3.8); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "교촌치킨"); put("menu", "치킨"); put("point", 4.1); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "도미노피자"); put("menu", "피자"); put("point", 4.5); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "맥도날드"); put("menu", "햄버거"); put("point", 3.8); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "BHC"); put("menu", "치킨"); put("point", 4.2); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "반올림피자"); put("menu", "피자"); put("point", 4.3); } };
	    list.add(map);
	    
	    String inputMenu = request.getParameter("inputMenu");
	    String pointFilter = request.getParameter("pointFilter");
	    
	    // null 일때 false라는 값을 넣어주는 조건
	    if(pointFilter == null) {
	    	pointFilter = "false";
	    }
	
	%>

	<div class="container text-center">
		<h1>검색 결과</h1>
		<table class="table">
			<thead>
				<tr>
					<th>메뉴</th>
					<th>상호</th>
					<th>별점</th>
				</tr>
			</thead>
			<tbody>
			<% for(Map<String, Object> review:list) {

				
				if(review.get("menu").equals(inputMenu)) {
					
					double point = (Double) review.get("point");
					
					// 앞에서부터 || 또는 이 if문에 있을 경우에는 앞에 조건이 true면 뒤에 확인도 안하고 넘어감
					// if(pointFilter.equals("false") || pointFilter.equals("true") && point >= 4)
						// 그래서 사실 false아니면 true니까 false가 아니면 ~ 사실 'pointFilter.equals("true")' 없어도 됨
					//if(pointFilter.equals("false") || point >= 4.0) {
					
					// 아니면
					// 포인터 필터가 true이고, 4.0 미만이면 보여주지 말아라
					if(pointFilter.equals("true") && point < 4.0) {
						continue;
					}
					%>
					<tr>
						<td><%= review.get("menu")%></td>
						<td><%= review.get("name")%></td>
						<td><%= review.get("point")%></td>
					</tr>

			<%		//}
				}
			}%>
			
			</tbody>
			
		</table>
	
	</div>

</body>
</html>