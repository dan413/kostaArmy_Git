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
	src="${pageContext.request.contextPath}/resources/js/cadreProcess.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="${pageContext.request.contextPath}/resources/css/table_custom.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/print.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/sorttable.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/print.js"></script>

<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">

	<div class="content-wrapper">
		<div class="content_part"
			style="padding-left: 20px; padding-right: 20px;">
			<se:authorize access="hasRole('ROLE_MANAGE_CAPTAIN')">
				<div class="datagrid" style="overflow: hidden;">
					<table>
						<thead>
							<tr>
								<th style="font-size: xx-large; font-weight: bolder;">KOSTA
									대대 간부 리스트</th>
							</tr>
						</thead>
					</table>
					<div
						style="background-color: #E1E1E1; padding-top: 10px; padding-bottom: 10px; text-align: left;">
						<form action="search_cadre.do" method="post" align="center">
							<label
								style="background-color: #E7E7E7; margin-top: 5px; width: 80px; height: 40px; border-radius: 10px; font-size: 1.5em;">Search</label>
							&nbsp;&nbsp;&nbsp;&nbsp; <select name="m_search_table"
								style="width: 120px;" class="form-control">
								<option>본부중대</option>
								<option>1중대</option>
								<option>2중대</option>
								<option>3중대</option>
								<option>KOSTA대대</option>
							</select>&nbsp;&nbsp; <select name="m_search_part" style="width: 100px;"
								class="form-control">
								<option value="cadre_number">군번</option>
								<option value="cadre_name">이름</option>
								<option value="cadre_mmr">계급</option>
							</select>&nbsp;&nbsp; <input type="search" name="keyvalue"
								class="form-control" style="width: 200px;" size="30"
								placeholder="간부를 검색합니다.">&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="submit" class="btn btn-default" value="검색">&nbsp;&nbsp;&nbsp;<a
								href="cadreList.do" class="btn btn-default">모든 병력 조회</a> <a
                        onclick="javascript:btn_printCadreAll(document.getElementById('printCadreAll').innerHTML)"
                        class="btn btn-default">인 쇄 </a>
						</form>
					</div>
				</div>
				<div>
					<input type="button" class="btn btn-primary btn-lg btn-block"
						value="간부등록" onclick="window.location.href='cadreAddInfo.do'">
				</div>
				<div id="printCadreAll">
					<div class="datagrid" style="overflow-y: auto; height: 620px">
						<table class="sortable">
							<thead>
								<tr>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">군번</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">이름</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">계급</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">소속</th>
									<th style="width: 18%; border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">복무기간</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">D-Day</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">연락처</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">비고</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">조회</th>
								</tr>
							</thead>
							<c:forEach items="${cadre_list}" var="cadre_list">
								<c:if test="${cadre_list.cadre_enabled != 0 }">
									<tr align="center">
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${cadre_list.cadre_number }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${cadre_list.cadre_name }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${cadre_list.cadre_mmr }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${cadre_list.cadre_group }</td>
										<td style="width: 18%; border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><fmt:formatDate
												value="${cadre_list.cadre_inputDate }" pattern="yyyy-MM-dd" />
											~ <fmt:formatDate value="${cadre_list.cadre_outputDate }"
												pattern="yyyy-MM-dd" /></td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${cadre_list.cadre_d_day }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${cadre_list.cadre_phone }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><c:if test="${cadre_list.cadre_bloodType == null}">
												<span class="label label-default" style="width: 100%">처리중</span>
												<!-- <button type="button" class="btn btn-warning" disabled
												style="width: 100%">처리중</button> -->
											</c:if> <c:if
												test="${cadre_list.cadre_bloodType != null && cadre_list.cadre_d_day != 0}">
												<span class="label label-success" style="width: 100%">복무중</span>
												<!-- <button type="button" class="btn btn-success" disabled
												style="width: 100%">복무중</button> -->
											</c:if> 
											
											<c:if
												test="${cadre_list.cadre_v_flag == 3}">
												<span class="label label-warning" style="width: 100%">휴가중</span>
												<!-- <button type="button" class="btn btn-success" disabled
												style="width: 100%"></button> -->
											</c:if>
											
											<c:if
												test="${cadre_list.cadre_bloodType != null && cadre_list.cadre_d_day == 0 && cadre_list.cadre_enabled == 1}">
												<span class="label label-warning" style="width: 100%">전역처리요망</span>
												<!-- <button type="button" class="btn btn-danger" disabled
												style="width: 100%">전역처리요망</button> -->
											</c:if></td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><c:if test="${cadre_list.cadre_bloodType == null}">
												<input type="button" class="btn btn-info" disabled="true"
													value="상세보기"
													onclick="window.location.href='detailCadre.do?cadre_number=${cadre_list.cadre_number}'"
													style="width: 100%; border:0px;">
											</c:if> <c:if test="${cadre_list.cadre_bloodType != null}">
												<input type="button" class="btn btn-info" value="상세보기"
													onclick="window.location.href='detailCadre.do?cadre_number=${cadre_list.cadre_number}'"
													style="width: 100%; border:0px;">
											</c:if> <c:if test="${cadre_list.cadre_d_day <= 0 }">
                           &nbsp;&nbsp;
                           <input type="button"
													class="btn btn-info btn_discharge"
													id="${cadre_list.cadre_number }" value="전역처리"
													style="width: 100%; border:0px;">
											</c:if></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</div>
			</se:authorize>

			<se:authorize access="hasRole('ROLE_MASTER_SERGEANT')">

				<div class="datagrid" style="overflow: hidden;">
					<table>
						<thead>
							<tr>
								<th style="font-size: xx-large; font-weight: bolder;">${group }
									간부리스트</th>
							</tr>
						</thead>
					</table>

					<div
						style="background-color: #E1E1E1; padding-top: 10px; padding-bottom: 10px; text-align: left;">
						<form action="search_cadre.do" method="post" align="center">
							<label
								style="background-color: #E7E7E7; margin-top: 5px; width: 80px; height: 40px; border-radius: 10px; font-size: 1.5em;">Search</label>
							&nbsp;&nbsp;&nbsp;&nbsp; <select name="m_search_table"
								style="width: 100px;" class="form-control" hidden="hidden">
								<option>${group }</option>
							</select>&nbsp;&nbsp; <select name="m_search_part" style="width: 100px;"
								class="form-control">
								<option value="cadre_number">군번</option>
								<option value="cadre_name">이름</option>
								<option value="cadre_mmr">계급</option>
							</select>&nbsp;&nbsp; <input type="search" name="keyvalue"
								class="form-control" style="width: 200px;" size="30"
								placeholder="간부를 검색합니다.">&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="submit" class="btn btn-default" value="검색">&nbsp;&nbsp;&nbsp;<a
								href="cadreList.do" class="btn btn-default">모든 병력 조회</a><a
                        onclick="javascript:btn_printCadre(document.getElementById('printCadre').innerHTML)"
                        class="btn btn-default">인 쇄 </a>
						</form>
					</div>
				</div>
				<div id="printCadre">
					<div class="datagrid" style="overflow-y: auto; height: 670px">
						<table class="sortable" style="text-align: center;">
							<thead>
								<tr>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">군번</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">이름</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">계급</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">소속</th>
									<th style="width: 18%; border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">복무기간</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">D-Day</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">연락처</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">비고</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">조회</th>
								</tr>
							</thead>

							<c:forEach items="${cadre_list}" var="cadre_list">
								<c:if
									test="${cadre_list.cadre_number != null && group == cadre_list.cadre_group}">
									<tr align="center">
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${cadre_list.cadre_number }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${cadre_list.cadre_name }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${cadre_list.cadre_mmr }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${cadre_list.cadre_group }</td>
										<td style="width: 18%; border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><fmt:formatDate
												value="${cadre_list.cadre_inputDate }" pattern="yyyy-MM-dd" />
											~ <fmt:formatDate value="${cadre_list.cadre_outputDate }"
												pattern="yyyy-MM-dd" /></td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${cadre_list.cadre_d_day }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${cadre_list.cadre_phone }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><c:if test="${cadre_list.cadre_bloodType == null}">
												<span class="label label-default">처리중</span>
												<!-- <button type="button" class="btn btn-warning" disabled
												style="width: 100%">처리중</button> -->
											</c:if> 
											
											
											<c:if test="${cadre_list.cadre_bloodType != null}">
												<span class="label label-success">복무중</span>
												<!-- <button type="button" class="btn btn-success" disabled
												style="width: 100%">처리중</button> -->
											</c:if>
											<c:if
												test="${cadre_list.cadre_v_flag == 3}">
												<span class="label label-warning" style="width: 100%">휴가중</span>
												<!-- <button type="button" class="btn btn-success" disabled
												style="width: 100%"></button> -->
											</c:if>
											
											</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><c:if
												test="${cadre_list.cadre_regidentNumber != null}">
												<input type="button" class="btn btn-info" value="상세보기"
													onclick="window.location.href='detailCadre.do?cadre_number=${cadre_list.cadre_number}'"
													style="width: 100%; border:0px;">
											</c:if></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</div>
			</se:authorize>
		</div>
	</div>
</body>
</html>