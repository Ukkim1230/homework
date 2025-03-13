<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/update" method="POST">
	<input type="hidden" name="uiNum" value="${user.uiNum}">
	<input type="text" name="uiName" placeholder="이름" value="${user.uiName}"><br>
	<input type="text" name="uiAge" placeholder="나이" value="${user.uiAge}"><br>
	<input type="text" name="uiId" placeholder="아이디" value="${user.uiId}"><br>
	<input type="password" name="uiPwd" placeholder="비밀번호" value="${user.uiPwd}"><br>
	<input type="text" name="uiPhone" placeholder="핸드폰번호" value="${user.uiPhone}"><br>
	<input type="text" name="uiAddress" placeholder="주소" value="${user.uiAddress}"><br>
	<input type="radio" id="man" name="uiTrans" value="1"
    ${user.uiTrans == '1' ? 'checked' : ''}><label for="man">남</label><br>
	<input type="radio" id="woman" name="uiTrans" value="2"
	${user.uiTrans == '2' ? 'checked' : ''}><label for="woman">여</label><br>
	<button>수정</button>
	<button type="button" onclick="location.href='/user/user-view?uiNum=${user.uiNum}'">돌아가기</button>
	</form>

</body>
</html>