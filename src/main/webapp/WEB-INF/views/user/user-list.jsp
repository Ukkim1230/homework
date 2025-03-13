<%@page import="com.web.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>유저 리스트</title>
</head>
<body>
	<form method="GET" action="/user/user-list">
		<select name="search">
			<option value="uiName" ${param.search=="uiName"?"selected":""}>이름</option>
			<option value="uiAge" ${param.search=="uiAge"?"selected":""}>나이</option>
			<option value="uiId" ${param.search=="uiId"?"selected":""}>아이디</option>
			<option value="uiPwd" ${param.search=="uiPwd"?"selected":""}>패스워드</option>
			<option value="uiPhone" ${param.search=="uiPhone"?"selected":""}>핸드폰번호</option>
			<option value="uiAddress" ${param.search=="uiAddress"?"selected":""}>주소</option>
			<option value="uiTrans" ${param.search=="uiTrans"?"selected":""}>성별</option>
		</select> <input type="text" name="searchStr" value="${param.searchStr}">
		<button>검색</button>
	</form>
	<a href="/user/user-insert">유저등록</a>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>핸드폰번호</th>
			<th>주소</th>
			<th>성별</th>
		</tr>
		<c:forEach items="${users}" var="user">
			<tr>
				<td>${user.uiNum}</td>
				<td><a href="/user/user-view?uiNum=${user.uiNum}">${user.uiName}</a></td>
				<td>${user.uiAge}</td>
				<td>${user.uiId}</td>
				<td>${user.uiPwd}</td>
				<td>${user.uiPhone}</td>
				<td>${user.uiAddress}</td>
				<td><c:choose>
						<c:when test="${user.uiTrans == '1'}">남</c:when>
						<c:when test="${user.uiTrans == '2'}">여</c:when>
						<c:otherwise>기타</c:otherwise>
					</c:choose></td>

			</tr>
		</c:forEach>
	</table>
</body>
</html>