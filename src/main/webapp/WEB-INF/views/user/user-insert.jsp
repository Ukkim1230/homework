<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="/user/insert" method="POST">
	<input type="text" name="uiName" placeholder="이름"><br>
	<input type="text" name="uiAge" placeholder="나이"><br>
	<input type="text" name="uiId" placeholder="아이디"><br>
	<input type="password" name="uiPwd" placeholder="비밀번호"><br>
	<input type="text" name="uiPhone" placeholder="핸드폰번호"><br>
	<input type="text" name="uiAddress" placeholder="주소"><br>
	<input type="radio" id="man" name="uiTrans" value="1"><label for="man">남</label><br>
	<input type="radio" id="woman" name="uiTrans" value="2"><label for="woman">여</label><br>
	<button>등록</button> <button type="button" onclick="location.href='/user/user-list'">돌아가기</button>
	</form>
</body>
</html>