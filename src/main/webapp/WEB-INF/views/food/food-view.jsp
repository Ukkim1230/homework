<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if (request.getAttribute("food") == null) {
		out.println("존재하지 않는 메뉴입니다.");
		out.println("<a href='/food/food-list'>돌아가기</a>");
	} else {
	%>
	<form action="/food/delete" method="POST">
		<input type="hidden" name="fiNum" value="${food.fiNum}">
		<table border="1">
			<tr>
				<th>번호</th>
				<td>${food.fiNum}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${food.fiName}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${food.fiPrice}</td>
			</tr>
			<tr>
			<th colspan="2">
			<a href="/food/food-update?fiNum=${food.fiNum}"><button type="button">수정</button></a>
				<button>삭제</button>
			</th>
			</tr>
		</table>
	</form>
	<%
	}
	%>
</body>
</html>