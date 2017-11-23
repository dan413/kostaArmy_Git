<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../mainForm/header.jsp"></jsp:include>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/supplyProcess.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/soldierProcess.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/icon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/soldierList.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/table_custom.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/sorttable.js"></script>
<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">

	<div class="content-wrapper">
		<div class="content_part"
			style="padding-left: 20px; padding-right: 20px; margin-top: 20px">

			<c:if test="${part == 2 }">

				<div class="datagrid" style="overflow: hidden;">
					<table>
						<thead>
							<tr>
								<th style="font-size: xx-large; font-weight: bolder;">익월 중대 출타자 관리</th>
							</tr>
						</thead>
					</table>
					<div
						style="background-color: #E1E1E1; border-radius: 10px; padding-top: 10px; padding-bottom: 10px; text-align: left;">
						<form action="select_vacation_for_Radio.do" method="post"
							align="center">
							<label
								style="background-color: #E7E7E7; margin-top: 5px; width: 80px; height: 40px; border-radius: 10px; font-size: 1.5em;">Search</label>
							&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
								name="m_search_table" value="soldier" checked="checked">&nbsp;병사
							<input type="radio" name="m_search_table" value="cadre">&nbsp;간부
							&nbsp;&nbsp; <input type="submit" class="btn btn-default"
								value="검색">&nbsp;
						</form>
					</div>
				</div>



				<div class="datagrid" style="overflow-y: auto; height: 620px">
					<table class="sortable">
						<thead>
							<tr>
								<th>군번</th>
								<th>이름</th>
								<th>계급</th>
								<th>소속</th>
								<th>출타종류</th>
								<th>출타기간</th>
								<th>조회</th>
							</tr>
						</thead>
						<c:forEach items="${list }" var="list">

							<tr align="center">
								<td>${list.cadre_number }</td>
								<td>${list.cadre_name }</td>
								<td>${list.cadre_mmr }</td>
								<td>${list.cadre_group }</td>
								<td>${list.cadre_vacation }</td>

								<td><fmt:formatDate value="${list.cadre_s_vacation }"
										pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
										value="${list.cadre_e_vacation }" pattern="yyyy-MM-dd" /></td>


								<td><c:if
										test="${list.cadre_current_vacation =='start_now'}">
										<input type="button"
											class="btn btn-primary btn_detailSoldier.do" value="출타 처리"
											onclick="window.location.href='cadre_vacation_start.do?cadre_number=${list.cadre_number}'">
									</c:if> <c:if test="${list.cadre_current_vacation =='start_before'}">
											-일정대기-
										</c:if> <c:if test="${list.cadre_current_vacation =='start_after'}">
										<input type="button"
											class="btn btn-primary btn_detailSoldier.do" value="출타 처리"
											onclick="window.location.href='cadre_vacation_start.do?cadre_number=${list.cadre_number}'">
									</c:if> <c:if test="${list.cadre_current_vacation =='end_now'}">
										<input type="button"
											class="btn btn-primary btn_detailSoldier.do" value="복귀 처리"
											onclick="window.location.href='cadre_vacation_end.do?cadre_number=${list.cadre_number}'">
									</c:if> <c:if test="${list.cadre_current_vacation =='end_before'}">
											-출타중-
										</c:if> <c:if test="${list.cadre_current_vacation =='end_after'}">
										<input type="button"
											class="btn btn-primary btn_detailSoldier.do" value="복귀 처리"
											onclick="window.location.href='cadre_vacation_end.do?cadre_number=${list.cadre_number}'">
									</c:if></td>

							</tr>

						</c:forEach>
					</table>
				</div>
			</c:if>
			<c:if test="${part ==1 }">
				<div class="datagrid" style="overflow: hidden;">
					<table>
						<thead>
							<tr>
								<th style="font-size: xx-large; font-weight: bolder;">익월 중대
									출타자 관리</th>
							</tr>
						</thead>
					</table>
					<div
						style="background-color: #E1E1E1; border-radius: 10px; padding-top: 10px; padding-bottom: 10px; text-align: left;">

						<form action="select_vacation_for_Radio.do" method="post"
							align="center">
							<label
								style="background-color: #E7E7E7; margin-top: 5px; width: 80px; height: 40px; border-radius: 10px; font-size: 1.5em;">Search</label>
							&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
								name="m_search_table" value="soldier" checked="checked">&nbsp;병사
							<input type="radio" name="m_search_table" value="cadre">&nbsp;간부

							&nbsp;&nbsp; <input type="submit" class="btn btn-default"
								value="검색">&nbsp;

						</form>
					</div>
				</div>



				<div class="datagrid" style="overflow-y: auto; height: 620px">
					<table class="sortable">
						<thead>
							<tr>
								<th>군번</th>
								<th>이름</th>
								<th>계급</th>
								<th>소속</th>
								<th>출타종류</th>
								<th>출타기간</th>
								<th>조회</th>
							</tr>
						</thead>
						<c:forEach items="${list }" var="list">

							<tr align="center">
								<td>${list.soldier_number }</td>
								<td>${list.soldier_name }</td>
								<td>${list.soldier_mmr }</td>
								<td>${list.soldier_group }</td>
								<td>${list.soldier_vacation }</td>

								<td><fmt:formatDate value="${list.soldier_s_vacation }"
										pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
										value="${list.soldier_e_vacation }" pattern="yyyy-MM-dd" /></td>


								<td><c:if
										test="${list.solider_current_vacation =='start_now'}">
										<input type="button"
											class="btn btn-primary btn_detailSoldier.do" value="출타 처리"
											onclick="window.location.href='soldier_vacation_start.do?soldier_number=${list.soldier_number}'">
									</c:if> <c:if test="${list.solider_current_vacation =='start_before'}">
											-일정대기-
										</c:if> <c:if test="${list.solider_current_vacation =='start_after'}">
										<input type="button"
											class="btn btn-primary btn_detailSoldier.do" value="출타 처리"
											onclick="window.location.href='soldier_vacation_start.do?soldier_number=${list.soldier_number}'">
									</c:if> <c:if test="${list.solider_current_vacation =='end_now'}">
										<input type="button"
											class="btn btn-primary btn_detailSoldier.do" value="복귀 처리"
											onclick="window.location.href='soldier_vacation_end.do?soldier_number=${list.soldier_number}'">
									</c:if> <c:if test="${list.solider_current_vacation =='end_before'}">
											-출타중-
										</c:if> <c:if test="${list.solider_current_vacation =='end_after'}">
										<input type="button"
											class="btn btn-primary btn_detailSoldier.do" value="복귀 처리"
											onclick="window.location.href='soldier_vacation_end.do?soldier_number=${list.soldier_number}'">
									</c:if></td>

							</tr>

						</c:forEach>
					</table>
				</div>
			</c:if>
			<%-- </se:authorize> --%>
		</div>
	</div>

</body>
</html>