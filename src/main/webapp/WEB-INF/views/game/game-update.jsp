<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if (request.getAttribute("game") == null) {
	%>
	이미 삭제된 테스트입니다.
	<br>
	<a href="/game/game-list">돌아가기</a>
	<%
	} else {
	%>
	<form action="/game/update" method="POST">
		<input type="hidden" name="giNum" value="${game.giNum}">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="giName" value="${game.giName}"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="giPrice" value="${game.giPrice}"></td>
			</tr>
			<tr>
				<th>장르</th>
				<td><input type="text" name="giGenre" value="${game.giGenre}"></td>
			</tr>
			<tr>
				<th>감상</th>
				<td><input type="text" name="giDesc" value="${game.giDesc}"></td>
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