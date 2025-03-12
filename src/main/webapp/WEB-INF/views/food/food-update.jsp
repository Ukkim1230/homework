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
	%>
	이미 삭제된 테스트입니다.
	<br>
	<a href="/food/food-list">돌아가기</a>
	<%
	} else {
	%>
	<form action="/food/update" method="POST">
		<input type="hidden" name="fiNum" value="${food.fiNum}">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="fiName" value="${food.fiName}"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="fiPrice" value="${food.fiPrice}"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button>수정</button>
				</th>
			</tr>
		</table>
	</form>
	<%
	}
	%>
</body>
</html>