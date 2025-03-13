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
if(request.getAttribute("game")==null){
	out.println("존재하지 않는 게임입니다.");
	out.println("<a href='/game/game-list'>돌아가기</a>");
}else{
%>
<form action="/game/delete" method="POST">
<input type="hidden" name="giNum" value="${game.giNum}">
<table border="1">
<tr>
				<th>번호</th>
				<td>${game.giNum}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${game.giName}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${game.giPrice}</td>
			</tr>
			<tr>
				<th>장르</th>
				<td>${game.giGenre}</td>
			</tr>
			<tr>
				<th>설명</th>
				<td>${game.giDesc}</td>
			</tr>
			<tr>
			<th colspan="2">
			<a href="/game/game-update?giNum=${game.giNum}"><button type="button">수정</button></a>
				<button>삭제</button> <a href="/game/game-list"><button type="button">돌아가기</button></a>
				</th>
				</tr>
</table>
</form>
<%
}
%>
</body>
</html>