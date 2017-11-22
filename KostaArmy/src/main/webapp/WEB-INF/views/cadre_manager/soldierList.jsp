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
	src="${pageContext.request.contextPath}/resources/js/soldierProcess.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="${pageContext.request.contextPath}/resources/css/table_custom.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/sorttable.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/print.js"></script>
<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">

	<div class="content-wrapper">
		<div class="content_part"
			style="padding-left: 20px; padding-right: 20px; ">
			<se:authorize access="hasRole('ROLE_MANAGE_CAPTAIN')">


				<div class="datagrid" style="overflow: hidden;">
					<table>
						<thead>
							<tr>
								<th style="font-size: xx-large; font-weight: bolder;">현재 대대
									병력 현황</th>
							</tr>
						</thead>
					</table>
					<div
						style="background-color: #E1E1E1; border-radius: 10px; padding-top: 10px; padding-bottom: 10px; text-align: left;">
						<form action="search_soldier.do" method="post" align="center">
							<label
								style="background-color: #E7E7E7; margin-top: 5px; width: 80px; height: 40px; border-radius: 10px; font-size: 1.5em;">Search</label>
							&nbsp;&nbsp;&nbsp;&nbsp; 
							<select name="m_search_table"
								style="width: 100px;" class="form-control">
								<option>본부중대</option>
								<option>1중대</option>
								<option>2중대</option>
								<option>3중대</option>
								<option>KOSTA대대</option>
							</select>&nbsp;&nbsp; 
							<select name="m_search_part" style="width: 100px;"
								class="form-control">
								<option value="soldier_number">군번</option>
								<option value="soldier_name">이름</option>
								<option value="soldier_mmr">계급</option>
							</select>&nbsp;&nbsp; <input type="search" name="keyvalue"
								class="form-control" style="width: 200px;" size="30"
								placeholder="병사를 검색합니다.">&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="submit" class="btn btn-default" value="검색">&nbsp;&nbsp;&nbsp;<a
								href="soldierList.do" class="btn btn-default">모든 병력 조회</a> <a
                        onclick="javascript:btn_printSoldierAll(document.getElementById('printSoldierAll').innerHTML)"
                        class="btn btn-default">인 쇄 </a>

						</form>
					</div>
				</div>
				<div>
					<input type="button" id="btn_addSoldier"
						class="btn btn-primary btn-lg btn-block" value="병사신규등록"
						style="font-size: large;">
				</div>
				<div id="printSoldierAll">
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

							<c:forEach items="${list }" var="list">
								<c:if
									test="${list.soldier_enabled != 0 || list.soldier_bloodType == null}">
									<tr align="center">
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.soldier_number }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.soldier_name }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.soldier_mmr }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.soldier_group }</td>
										<td style="width: 18%; border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><fmt:formatDate
												value="${list.soldier_inputDate }" pattern="yyyy-MM-dd" />
											~ <fmt:formatDate value="${list.soldier_outputDate }"
												pattern="yyyy-MM-dd" /></td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.soldier_d_day }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.soldier_phone }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">
										<c:if test="${list.soldier_bloodType == null}">
											<span class="label label-default" style="width: 100%">처리중</span>
											<!-- <button type="button" class="btn btn-warning" disabled
											style="width: 100%">처리중</button> -->
										</c:if> 
										<c:if
											test="${list.soldier_bloodType != null && list.soldier_d_day != 0}">
											<span class="label label-success" style="width: 100%">복무중</span>
											<!-- 		<button type="button" class="btn btn-success" disabled
											style="width: 100%">복무중</button> -->
										</c:if>
										<c:if
											test="${list.soldier_v_flag eq '3'}">
											<span class="label label-warning" style="width: 100%">휴가중</span>
											<!-- 		<button type="button" class="btn btn-success" disabled
											style="width: 100%">복무중</button> -->
										</c:if>  
										<c:if
											test="${list.soldier_bloodType != null && list.soldier_d_day == 0 && list.soldier_enabled == 1}">
											<!-- <span class="label label-warning" style="width: 100%">전역처리
											요망</span> -->
											<button type="button" class="btn btn-Danger" disabled
												style="width: 100%">전역처리</button>
										</c:if>
										</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">
											<c:if test="${list.soldier_bloodType == null}">
												<input type="button" class="btn btn-info" disabled="true"
													value="상세보기"
													onclick="window.location.href='detailSoldier.do?soldier_number=${list.soldier_number}'"
													style="width: 100%; border:0px;">
											</c:if> 
											<c:if
												test="${list.soldier_bloodType != null && list.soldier_d_day > 0}">
												<input type="button"
													class="btn btn-info btn_detailSoldier.do" value="상세보기"
													onclick="window.location.href='detailSoldier.do?soldier_number=${list.soldier_number}'"
													style="width: 100%; border:0px;">
											</c:if> 
											<c:if
												test="${list.soldier_bloodType != null && list.soldier_d_day <= 0}">
												<input type="button" class="btn btn-info btn_discharge"
													id="${list.soldier_number }" value="전역처리"
													style="width: 100%; border:0px;">
											</c:if>
										</td>
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
								<th style="font-size: xx-large; font-weight: bolder;">현재 중대
									병력 현황</th>
							</tr>
						</thead>
					</table>

					<div
						style="background-color: #E1E1E1; border-radius: 10px; padding-top: 10px; padding-bottom: 10px; text-align: left;">
						<form action="search_soldier.do" method="post" align="center">
							<label
								style="background-color: #E7E7E7; margin-top: 5px; width: 80px; height: 40px; border-radius: 10px; font-size: 1.5em;">Search</label>
							&nbsp;&nbsp;&nbsp;&nbsp; <select name="m_search_table"
								style="width: 100px;" class="form-control" hidden="hidden">
								<option>${group }</option>
							</select>&nbsp;&nbsp; <select name="m_search_part" style="width: 100px;"
								class="form-control">
								<option value="soldier_number">군번</option>
								<option value="soldier_name">이름</option>
								<option value="soldier_mmr">계급</option>
							</select>&nbsp;&nbsp; <input type="search" name="keyvalue"
								class="form-control" style="width: 200px;" size="30"
								placeholder="병사를 검색합니다.">&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="submit" class="btn btn-default" value="검색">&nbsp;&nbsp;&nbsp;<a
								href="soldierList.do" class="btn btn-default">모든 병력 조회</a>  <a
                        onclick="javascript:btn_printSoldier(document.getElementById('printSoldier').innerHTML)"
                        class="btn btn-default">인 쇄 </a>
						</form>
					</div>
				</div>
				<div id="printSoldier">
					<div class="datagrid" style="overflow-y: auto; height: 670px">
						<table class="sortable" style="text-align: center;">
							<thead>
								<tr>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">군번</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">이름</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">계급</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">소속</th>
									<th style="width: 18%; border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">복무기간</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">비고</th>
									<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">조회</th>
								</tr>
							</thead>
							<c:forEach items="${list }" var="list">
								<c:if
									test="${list.soldier_number != null && group == list.soldier_group}">
									<tr align="center">
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.soldier_number }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.soldier_name }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.soldier_mmr }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.soldier_group }</td>
										<td style="width: 18%; border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><fmt:formatDate
												value="${list.soldier_inputDate }" pattern="yyyy-MM-dd" />
											~ <fmt:formatDate value="${list.soldier_outputDate }"
												pattern="yyyy-MM-dd" /></td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><c:if test="${list.soldier_bloodType == null}">

												<!-- <button type="button" class="btn btn-warning" disabled
												style="width: 100%">처리중</button> -->
												<span class="label label-default" style="width: 100%">처리중</span>
											</c:if> <c:if test="${list.soldier_bloodType != null}">
												<!-- <button type="button" class="btn btn-success" disabled
												style="width: 100%">복무중</button> -->
												<span class="label label-success" style="width: 100%">복무중</span>
											</c:if> <c:if test="${list.soldier_v_flag eq '3'}">
												<span class="label label-warning" style="width: 100%">휴가중</span>
												<!-- 		<button type="button" class="btn btn-success" disabled
											style="width: 100%">복무중</button> -->
											</c:if></td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><c:if test="${list.soldier_bloodType == null}">
												<input type="button"
													class="btn btn-primary btn_detailSoldier.do" value="인적사항입력"
													onclick="window.location.href='detailSoldier.do?soldier_number=${list.soldier_number}'"
													style="width: 100%; border:0px;">
											</c:if> <c:if test="${list.soldier_bloodType != null}">
												<input type="button" class="btn btn-info" value="상세보기"
													onclick="window.location.href='detailSoldier.do?soldier_number=${list.soldier_number}'"
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

	<div class="modal" id="AddSoldierModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #E0FFDB;">
					<h5 class="modal-title" id="exampleModalLabel">병사 신규 등록</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-bordered" style="font-size: 0.8em;">
						<tr>
							<td align="center"
								style="background-color: #F6F6F6; vertical-align: middle;">군번</td>
							<td align="left"><input type="text" id="text_soldier_number"
								placeholder="군번을 입력하세요. ex) 12-12345678" class="form-control">
							</td>
						</tr>
						<tr>
							<td align="center"
								style="background-color: #F6F6F6; vertical-align: middle;">이름</td>
							<td align="left"><input type="text" id="text_soldier_name"
								placeholder="이름을 입력하세요." class="form-control"></td>
						</tr>
						<tr>
							<td align="center"
								style="background-color: #F6F6F6; vertical-align: middle;">계급</td>
							<td align="left"><select id="select_soldier_mmr"
								style="width: 100px;" class="form-control">
									<option>이등병</option>
									<option>일병</option>
									<option>상병</option>
									<option>병장</option>
							</select></td>
						</tr>
						<tr>
							<td align="center"
								style="background-color: #F6F6F6; vertical-align: middle;">소속</td>
							<td align="left"><select id="select_soldier_group"
								style="width: 100px;" class="form-control">
									<option>본부중대</option>
									<option>1중대</option>
									<option>2중대</option>
									<option>3중대</option>
							</select></td>
						</tr>
						<tr>
							<td align="center"
								style="background-color: #F6F6F6; vertical-align: middle;">복무기간</td>
							<td align="left">입대일 : <input type="date"
								id="text_soldier_inputDate" class="form-control"
								style="width: 160px;"><br> <br> 전역일 : <input
								type="date" id="text_soldier_outputDate" class="form-control"
								style="width: 160px;">
							</td>
						</tr>
					</table>

				</div>

				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">돌아가기</button>
					&nbsp;&nbsp;&nbsp; <input type="button" class="btn btn-primary"
						value="등록하기" id="btn_addSoldierPro" />
				</div>

			</div>
		</div>
	</div>
</body>
</html>