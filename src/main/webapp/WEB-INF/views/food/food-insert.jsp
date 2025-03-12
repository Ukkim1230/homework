<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/food/insert" method="POST">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="fiName" placeholder="이름"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="fiPrice" placeholder="가겨"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button>등록</button>
				</th>
			</tr>
		</table>
	</form>
</body>
</html>