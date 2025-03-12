<%@page import="com.web.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 리스트</title>
</head>
<body>
<h3>유저 리스트</h3>
<%
List<UserDTO> users = (List<UserDTO>)request.getAttribute("users");
%>
<table border="1">
<tr>
<th>번호</th>
<th>이름</th>
<th>나이</th>
</tr>
<%
for(UserDTO user : users){
%>
<tr>
<td><%=user.getUiNum()%></td>
<td><a href="/user/user-view?uiNum=<%=user.getUiNum()%>"><%=user.getUiName()%></a></td>
<td><%=user.getUiAge()%></td>
</tr>
<%
}
%>
</table>
</body>
</html>