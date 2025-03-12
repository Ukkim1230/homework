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
	<a href="/views/game/game-insert">게임등록</a>
	${empty games}
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>가격</th>
			<th>장르</th>
			<th>설명</th>
		</tr>
		<c:forEach items="${games}" var="game">
			<tr>
				<td>${game.giNum}</td>
				<td><a href="/game/game-view?giNum=${game.giNum}">${game.giName}</a></td>
				<td>${game.giPrice}</td>
				<td>${game.giGenre}</td>
				<td>${game.giDesc}</td>
			</tr>
			</c:forEach>
	</table>
</body>
</html>