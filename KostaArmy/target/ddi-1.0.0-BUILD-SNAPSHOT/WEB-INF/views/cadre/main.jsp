<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강한육군 대한민국 KostaArmy</title>
</head>
<body>
로그인성공!!!
<se:authorize access="isAuthenticated() ">
	안녕하세요.
</se:authorize>
<se:authorize ifNotGranted="ROLE_SUPPLY_CAPTAIN">
	에러메시지
</se:authorize>
<se:authorize access="isAuthenticated()">
	<a href="${pageContext.request.contextPath}/j_spring_security_logout"><button>로그아웃</button></a><br>
	<a href="getCurrentApplyList.do"><button>물자리스트</button></a>
</se:authorize>
</body>
</html>