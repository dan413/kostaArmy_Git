<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/commuteProcess.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Alram.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/icon.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/const/supplyList.css" rel="stylesheet">

<title>강한육군 대한민국 KostaArmy</title>
</head>
<body>

	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
		<a class="navbar-brand" href="login-success.do">
		<img src="${pageContext.request.contextPath}/resources/images/icon/kosta.png" style="width:30px; height:30px;">
		KOSTA ARMY
		</a>
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" 
		data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">

				<!--board-->
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="board">
					<a class="nav-link" href="notice_list.do"> 
						<img src="${pageContext.request.contextPath}/resources/images/icon/board3.png" style="width:25px; height:25px;">
						<span class="nav-link-text">공 지</span>
					</a>
				</li>

				<!--supply-->
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="supply">
					<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#supply_sub" data-parent="#exampleAccordion"> 
						<img src="${pageContext.request.contextPath}/resources/images/icon/gunsu.png" style="width:25px; height:25px;">
						<span class="nav-link-text">군 수</span>
					</a> 
					<se:authorize access="hasRole('ROLE_MASTER_SERGEANT')">
						<ul class="sidenav-second-level collapse" id="supply_sub">
							<li><a href="getCurrentApplyList.do">- 물자현황 & 조회</a></li>
							<li><a href="supplyConsumeForm.do">- 보급 관리 & 소비</a></li>
							<!-- 소비 -->
							<li><a href="currentSupplyOrder.do?group=${group }">- 현재 발주 현황</a></li>
							<li><a href="dateSearchForm.do">- 결제 & 소비 내역</a></li>
						</ul>
					</se:authorize> 
					<se:authorize access="hasRole('ROLE_SUPPLY_CAPTAIN')">
						<ul class="sidenav-second-level collapse" id="supply_sub">
							<li><a href="getCurrentApplyList.do">- 물자신청현황</a></li>
							<li><a href="dateSearchForm.do">- 결제 & 소비 내역</a></li>
						</ul>
					</se:authorize>
				</li>

				<!--manager-->
	            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="manager">
	               <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#manager_sub" data-parent="#exampleAccordion"> 
	                  <img src="${pageContext.request.contextPath}/resources/images/icon/manager.png" style="width:25px; height:25px;">
	                  <span class="nav-link-text">인 사</span>
	               </a> 
	               <se:authorize access="hasRole('ROLE_MANAGE_CAPTAIN')">
	                  <ul class="sidenav-second-level collapse" id="manager_sub">
	                     <li><a href="soldierList.do">- 병 사 관 리</a></li>
	                     <li><a href="cadreList.do">- 간 부 관 리</a></li>
	                     <li><a href="vacation_SignForm.do"> - 휴 가 관 리</a>
	                     <li><a href="#">- 총 원 관 리</a></li>
	                  </ul>
	               </se:authorize> 
	               <se:authorize access="hasRole('ROLE_MASTER_SERGEANT')">
	               
	                  <ul class="sidenav-second-level collapse" id="manager_sub">
	                     <li><a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti1"> - 중 대 원 관 리</a></li>
	                        <ul class="sidenav-third-level collapse" id="collapseMulti1">
	                           <li><a href="soldierList.do">- ${group} 병 사 조 회</a></li>
	                           <li><a href="cadreList.do">- ${group} 간 부 조 회</a></li>
	                           <li><a href="sergeant_Total_gragh.do">- ${group} 유 동 병 력</a></li>
	                        </ul>
	                     <li><a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti2"> - 휴 가 관 리</a></li>
	                        <ul class="sidenav-third-level collapse" id="collapseMulti2">
	                           <li><a href="soldierOutSide.do">- 출 타 자 등 록</a></li>
	                           <li><a href="vaction_soldierList.do">- 휴 가 자 관 리</a></li>
	                           <li><a href="Total_vacation.do">- 지 난 휴 가 내 역</a></li>
	                        </ul>
	                  </ul>
	               </se:authorize>
	            </li>

				<!-- admin -->
				<!-- 행보관이 보이는 메뉴 -->
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="admin">
					<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#admin_sub" data-parent="#exampleAccordion"> 
						<img src="${pageContext.request.contextPath}/resources/images/icon/admin.png" style="width:25px; height:25px;">
						<span class="nav-link-text">행 정</span>
					</a>
					<se:authorize access="hasRole('ROLE_MASTER_SERGEANT')">
						<ul class="sidenav-second-level collapse" id="admin_sub">
							<li>
								<a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti3"> - 일 일 업 무</a>
							</li>
							<ul class="sidenav-third-level collapse" id="collapseMulti3">
								<li><a href="AdminFood.do">- 급 양 관 리</a></li>
								<li><a href="AdminDaily.do">- 복 무 일 지</a></li>
								<li><a href="AdminWorkSchedule.do">- 근 무 일 지</a></li>
							</ul>
							<li><a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti4"> - 주 간 업 무</a></li>
							<ul class="sidenav-third-level collapse" id="collapseMulti4">
								<li><a href="weekPlan.do">- 주 간 계 획</a></li>
							</ul>
							<li><a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti5"> - 월 간 업 무</a></li>
							<ul class="sidenav-third-level collapse" id="collapseMulti5">
								<li><a href="Vacation_Calendar.do">- 월 간 휴 가 종 합</a></li>
								<li><a href="monthPlan.do">- 월 간 종 합</a></li>
							</ul>
						</ul>
					</se:authorize>
				</li>
				
			</ul>

			<!-- 메뉴 접기 부분 -->
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item">
					<a class="nav-link text-center" id="sidenavToggler"> 
						<span class="glyphicon glyphicon-bookmark"></span>
					</a>
				</li>
			</ul>

			<ul class="navbar-nav ml-auto">
				<li style="color: white; padding-top: 1%; font-size: 17px;">
					${cadre_name}님 환영합니다.
				</li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li>
					<a class="nav-link" id="btn_commute" style="cursor: pointer;">
						출/퇴근 처리
					</a>
				</li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li>
					<a class="nav-link" href="updateCadreForm.do?cadre_number=${cadre_num}">
						내 정보 조회
					</a>
				</li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<li>
					<a class="nav-link" href="messagePage.do"> 
					<img src="${pageContext.request.contextPath}/resources/images/icon/message.png" style="width:25px; height:25px;">
					<span class="badge badge-primary" id="count">${ count }</span>
					</a>
				</li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li class="nav-item">
					<a class="nav-link" data-toggle="modal" data-target="#exampleModal"> 
						<img src="${pageContext.request.contextPath}/resources/images/icon/close.png" style="width:25px; height:25px;">
						<!-- <span class="glyphicon-eye-close"></span> --> 로그아웃
					</a>
				</li>
			</ul>
		</div>
	</nav>

	<footer class="sticky-footer">
		<div class="container">
			<div class="text-center">
				<small>Kosta ARMY 서승범, 김병권, 신지훈, 엄태광, 정민석, 김현재, 방명철</small>
			</div>
		</div>
	</footer>

	<!-- Logout Modal 로그아웃 버튼을 눌렀을 경우 실행 됨-->
	<div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #E0FFDB;">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">로그아웃 하시겠습니까?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">돌아가기</button>
					&nbsp;&nbsp;&nbsp; 
					<a class="btn btn-primary" href="${pageContext.request.contextPath}/j_spring_security_logout">로그아웃</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 서브 메뉴 숨기기 기능 -->
	<script src="${pageContext.request.contextPath}/resources/js/sb-admin.min.js"></script>
	<div class="modal" id="commuteModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content" style="margin-top: 45%">
					<div class="modal-header" style="background-color: #E0FFDB;">
					<h5 class="modal-title">출/퇴근 처리</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
					</div>
					<div class="modal-body">
						<table class="table table-bordered">
							<tr align="center" style="background-color: #FCFCFC;">
								<td colspan="2">
									<c:if test="${start_time == null}">
										<input type="button" class="btn btn-primary" value="출 근" id="btn_commute_start">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
									</c:if>
									<c:if test="${start_time != null}">
										<input disabled="disabled" type="button" class="btn btn-primary" value="출 근" id="btn_commute_start">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
									</c:if>
									<c:if test="${over_time == null && end_time == null}">
									<input type="button" class="btn btn-warning" value="초 과 근 무" id="btn_commute_over">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</c:if>
									<c:if test="${over_time == null && end_time != null}">
									<input disabled="disabled" type="button" class="btn btn-warning" value="초 과 근 무" id="btn_commute_over">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</c:if>
									<c:if test="${over_time != null }">
									<input disabled="disabled" type="button" class="btn btn-warning" value="초 과 근 무" id="btn_commute_over">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</c:if>
									<c:if test="${end_time == null }">
										<input type="button" class="btn btn-default" value="퇴 근" id="btn_commute_end">
									</c:if>
									<c:if test="${end_time != null }">
										<input disabled="disabled" type="button" class="btn btn-default" value="퇴 근" id="btn_commute_end">
									</c:if>
								</td>
							</tr>
							<tr align="center" style="background-color: #FCFCFC;">
								<td colspan="2">
									<input type="button" value="출퇴근 & 월급내역" class="btn btn-default" onclick="window.location.href='mycommute_pay.do'" > 
								</td>
							</tr>
							<tr>
								<td align="center" style="width:110px; background-color: #f6f6f6;">
									출 근
								</td>
								<td align="center" id="start_date">
									${start_time }
								</td>
							</tr>
							<tr>
								<td align="center" style="width:110px; background-color: #f6f6f6;">
									퇴 근
								</td>
								<td align="center" id="end_date">
									${end_time }
								</td>
							</tr>
							<tr>
								<td align="center" style="width:110px; background-color: #f6f6f6;">
									초 과 근 무
								</td>
								<td align="center" id="over_date">
									<c:if test="${over_time == null }">
									해 당 없 음
									</c:if>
									<c:if test="${over_time != null }">
									${over_time } 부터 시작
									</c:if>
								</td>
							</tr>
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top: 50px; z-index: 5000;">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content" style="margin-top: 45%">
					<div class="modal-header" id="messageType" style="background-color: #E0FFDB;">
					<h5 class="modal-title">Message</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
					</div>

					<div class="modal-body" id="message"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							id="btn_gotoNextPage">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>