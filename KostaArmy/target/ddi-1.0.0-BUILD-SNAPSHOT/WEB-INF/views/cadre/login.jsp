<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/const/cadreLogin.css"
	type="text/css">
<title>강한육군 대한민국 KostaArmy</title>
</head>
<body>
	<video autoplay="true" loop="loop" volume="0" muted="muted">
		<source
			src="${pageContext.request.contextPath}/resources/background/login-background.mp4">
	</video>
	<div class="login_box">
		<c:url value="/j_spring_security_check" var="loginURL"/>
		<form id="loginForm" action="${loginURL }" method="post">
			<h4 align="center">보안은 생명이다.</h4>
			<div class="input_part">
				<input type="text" class="form-control" name="j_username"
					id="j_username" placeholder="군번을 입력하세요." style="background-color:#D5D5D5;">
			</div>
			<div class="input_part">
				<input type="password" class="form-control" name="j_password"
					id="j_password" placeholder="패스워드를 입력하세요." style="background-color:#D5D5D5;">
			</div>
			<div class="select_part" style="margin-top:5px;">
				<label id="message"></label>
			</div>
			<div class="btn_part">
				<input type="submit" value="로 그 인" class="btn btn-lg btn-default"
					id="btn_login" style="width: 100%; margin-top: 30px;">
			</div>
		</form>
	</div>
	
	<c:if test="${error != null }">
				<script type="text/javascript">
					loginError();
				</script>
	</c:if>
</body>
</html>