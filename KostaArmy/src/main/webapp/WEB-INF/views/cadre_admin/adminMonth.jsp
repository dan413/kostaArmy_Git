<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/adminProcess.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/print.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/table_custom.css" rel="stylesheet">

<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<div class="content-wrapper">
		<div class="content_part" style="padding-left: 20px; padding-right: 20px; margin-top: 20px">
			<div class="datagrid" style="overflow-y: hidden;">
				<table>
					<thead style="font-size: 30px;">
						<tr><th>월간종합</th></tr>
					</thead>
				</table>
				<div id="print_page">
					<!-- 프린트 영역 -->
					<div class="datagrid" style="margin: 10px">
						<table style="text-align: center;">
							<tr>
								<td style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;"></td>
								<td style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">기 간</td>
								<td style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">월 요 일</td>
								<td style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">화 요 일</td>
								<td style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">수 요 일</td>
								<td style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">목 요 일</td>
								<td style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">금 요 일</td>
								<td style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">토 요 일</td>
								<td style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">일 요 일</td>
							</tr>
							<c:forEach var="list" items="${list }">
								<tr>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.w_num }주차</td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.weekly }</td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.w_monday }</td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.w_tuesday }</td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.w_wednesday }</td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.w_thursday }</td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.w_friday }</td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.w_saturday }</td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.w_sunday }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div style="margin: 5px">
					<a onclick="javascript:btn_printMonth(document.getElementById('print_page').innerHTML)"
						class="btn btn-default btn-lg" style="width: 32%">
						인 쇄 
					</a> 
					<a href="monthExcel.do">
						<input type="button" class="btn btn-primary btn-lg" value="저 장" style="width: 32%" />
					</a>
					<a href="monthDelete.do">
						<input type="button" class="btn btn-danger btn-lg" value="비우기" style="width: 32%">
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>