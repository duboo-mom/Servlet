<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>변환 결과</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

	<%
		String lengthString = request.getParameter("length");
		
		int length = Integer.parseInt(lengthString);
		
		double inch = length / 2.54;
		double yard = length / 91.44;
		double feet = length / 30.48;
		double meter = length / 100.0;

		String[] unitArray = request.getParameterValues("unit");
		// in, yd
		
		String resultString = "";
		for(int i = 0; i > unitArray.length; i++) {
			if(unitArray[i].equals("in")) {
				resultString += unitArray[i] + " ";
			} else if(unitArray[i].equals("yd <br>")) {
				resultString += unitArray[i] + " ";
			} else if(unitArray[i].equals("ft <br>")) {
				resultString += unitArray[i] + " ";
			} else if(unitArray[i].equals("m <br>")) {
				resultString += unitArray[i] + " ";
			}
		}
	
	%>
	<div class="container">
		
		<h2>변환 결과</h2>
		<div><%= length %>cm</div>
		<hr>
		<div><%= resultString %></div>
	</div>


</body>
</html>