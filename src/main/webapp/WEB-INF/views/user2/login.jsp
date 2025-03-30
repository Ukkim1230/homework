<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
<link href="/resources/css/login.css" rel="stylesheet">
</head>
<body class="text-center">
<main class="form-signin w-100 m-auto">
  <form method="POST" action="/user/login" onsubmit="return validation()">
    <img class="mb-4" src="/resources/svg/bootstrap-logo.svg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">Login</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="uiId" placeholder="아이디" name="uiId">
      <label for="id">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="uiPwd" name="uiPwd" placeholder="비밀번호">
      <label for="uiPwd">비밀번호</label>
    </div>

    <div class="checkbox mb-3">
      <label> <input type="checkbox" value="remember-me">
      		아이디 기억하기
      </label>
    </div>
    <button class="w-40 btn btn-lg btn-primary" type="submit">로그인</button>
    <button class="w-40 btn btn-lg btn-secondary" type="button" onclick="goPage('/views/user2/join')">회원가입</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2025-2026</p>
  </form>
</main>
<script>
//id는 4글자 , 비밀번호도 4글자 미만 일경우 alert 뜨위고 focus
//모두다 정상일경우 UserServlet으로 보내고
//아이디 비밀번호가 맞으면 session에 user라는 키값으로 저장
function validation(){
	const uiId = document.querySelector('#uiId');
	if(uiId.value.trim().length<4){
		alert('아이디는 최소 4자 이상이어야 합니다.');
		uiId.focus();
		return false;
	}
	const uipwd = document.querySelector('#uiPwd');
	if(uiPwd.value.trim().length<4){
		alert('비밀번호는 최소 4자 이상이어야 합니다')
		uiPwd.focus();
		return false;
	}
	return true;
}
</script>
</body>
</html>