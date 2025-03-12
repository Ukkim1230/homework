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
	if (request.getAttribute("test") == null) {
		out.println("존재하지 않는 test입니다.");
		out.println("<a href='/test/test-list'>돌아가기</a>");
	} else {
	%>
	<form action="/test/delete" method="POST">
		<input type="hidden" name="tiNum" value="${test.tiNum}">
		<table border="1">
			<tr>
				<th>번호</th>
				<td>${test.tiNum}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${test.tiName}</td>
			</tr>
			<tr>
				<th colspan="2">
				<a href="/test/test-update?tiNum=${test.tiNum}"><button type="button">수정</button></a>
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