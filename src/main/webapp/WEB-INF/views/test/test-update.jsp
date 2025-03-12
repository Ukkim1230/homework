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
	%>
	이미 삭제된 테스트입니다.
	<br>
	<a href="/test/test-list">돌아가기</a>
	<%
	} else {
	%>
	<form action="/test/update" method="POST">
		<input type="hidden" name="tiNum" value="${test.tiNum}">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="tiName" value="${test.tiName}"></td>
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