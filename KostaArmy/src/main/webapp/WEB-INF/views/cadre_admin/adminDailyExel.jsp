<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<ol class="breadcrumb">
	        <li class="breadcrumb-item">
	          	복 무 일 지
	        </li>
	      </ol>

			<table class="table table-hover" border="1">
				<tr>
					<th colspan="3" style="text-align: center;">복 무 일 지</th>
					<th>${today}</th>
				</tr>
				<tr>
					<th>번 호</th>
					<th>시 간</th>
					<th>내 용</th>
					<th>비 고</th>
				</tr>
				<c:set var="num" value="1"/>
				<c:forEach items="${dailyList}" var="dailyList" varStatus="status">
				<tr>
					<td style="text-align: center;">${num}</td>
					<td>${dailyList.dailyTime}</td>
					<td>${dailyList.dailyContent}</td>
					<td>${dailyList.dailyMemo}</td>
				</tr>
				<c:set var="num" value="${num+1}"/>
				</c:forEach>
			</table>

</body>
</html>