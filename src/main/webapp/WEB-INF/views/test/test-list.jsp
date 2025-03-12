<%@page import="com.web.dto.TestDTO"%>
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
	<a href="/views/test/test-insert">테스트추가</a>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
		</tr>
		<%
		List<TestDTO> tests = (List<TestDTO>) request.getAttribute("tests");
		for (TestDTO test : tests) {
		%>
		<tr>
			<td><%=test.getTiNum()%></td>
			<td><a href="/test/test-view?tiNum=<%=test.getTiNum()%>"><%=test.getTiName()%></a></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>