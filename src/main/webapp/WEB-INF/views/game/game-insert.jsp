<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/game/insert" method="POST">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="giName" placeholder="이름"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="giPrice" placeholder="가격"></td>
			</tr>
			<tr>
				<th>장르</th>
				<td><input type="text" name="giGenre" placeholder="장르"></td>
			</tr>
			<tr>
				<th>감상</th>
				<td><input type="text" name="giDesc" placeholder="감상"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button>수정</button>
				</th>
			</tr>
		</table>
	</form>
</body>
</html>