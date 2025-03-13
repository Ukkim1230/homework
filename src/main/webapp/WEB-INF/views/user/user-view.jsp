<%@page import="com.web.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저상세화면</title>
</head>
<body>
<h3>상세화면</h3>
<%
if(request.getAttribute("user")==null){
	out.println("존재하지 않는 유저입니다.");
	out.println("<a href='/user/user-list'>돌아가기</a>");
}else{
%>
<form action="/user/delete" method="POST">
<input type="hidden" name="uiNum" value="${user.uiNum}">
<table border="1">
<tr>
<th>번호</th>
<td>${user.uiNum}</td>
</tr>
<tr>
<th>이름</th>
<td>${user.uiName}</td>
</tr>
<tr>
<th>나이</th>
<td>${user.uiAge}</td>
</tr>
<tr>
<th>아이디</th>
<td>${user.uiId}</td>
</tr>
<tr>
<th>비밀번호</th>
<td>${user.uiPwd}</td>
</tr>
<tr>
<th>핸드폰번호</th>
<td>${user.uiPhone}</td>
</tr>
<tr>
<th>주소</th>
<td>${user.uiAddress}</td>
</tr>
<tr>
<th>성별</th>
<td>${user.uiTrans}</td>
</tr>
<tr>
<th colspan="2">
<a href="/user/user-update?uiNum=${user.uiNum}"><button type="button">수정</button></a>
<button>삭제</button> <a href="/user/user-list"><button type="button">돌아가기</button></a>
</tr>
</table>
</form>
<%
}
%>
</body>
</html>