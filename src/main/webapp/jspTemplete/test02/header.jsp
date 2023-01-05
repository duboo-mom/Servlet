<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<header class="d-flex">
			<div class="logo col-2 d-flex align-items-center">
				<h1 class="text-success">Melong</h1>			
			</div>
			<div class="search col-10 d-flex align-items-center">
					
				<form method="get" action="/jspTemplete/test02/test02_detail.jsp">	
					<div class="input-group">
						<input type="text" class="form-control col-10" name="titleInput">
						<div class="input-group-append">
							<button type="submit" class="btn btn-success">검색</button>				
						</div>					
					</form>
				</div>
			</div>
		</header>