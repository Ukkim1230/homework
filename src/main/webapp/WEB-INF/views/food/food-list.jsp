<%@page import="com.web.dto.FoodDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/views/food/food-insert">메뉴추가</a>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>가격</th>
		</tr>
		<%
		List<FoodDTO> foods = (List<FoodDTO>) request.getAttribute("foods");
		for (FoodDTO food : foods){
		%>
		<tr>
			<td><%=food.getFiNum()%></td>
			<td><a href="/food/food-view?fiNum=<%=food.getFiNum()%>"><%=food.getFiName()%></a></td>
			<td><%=food.getFiPrice()%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>