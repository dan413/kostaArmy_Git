<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/supplyProcess.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/datepicker.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" rel="stylesheet"/> 
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/icon.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>


<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="login-success.do">KOSTA ARMY</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">

				<!--board-->
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="board">
					<a class="nav-link" href="#"> 
						<span class="glyphicon-pushpin"></span>
						<span class="nav-link-text">공 지</span>
					</a>
				</li>

				<!--supply-->
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="supply">
					<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#supply_sub" data-parent="#exampleAccordion"> 
						<span class="glyphicon-briefcase"></span> 
						<span class="nav-link-text">군 수</span>
					</a>
					<ul class="sidenav-second-level collapse" id="supply_sub">
						<li><a href="getCurrentApplyList.do">- 물자조회 및 신청</a></li>
						<li><a href="#">- 소비하기</a></li>
						<li><a href="#">- 지난재고</a></li>
						<li><a href="#">- 군수공지</a></li>
					</ul>
				</li>

				<!--manager-->
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="manager">
					<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#manager_sub" data-parent="#exampleAccordion"> 
						<span class="glyphicon-camera"></span> 
						<span class="nav-link-text">인 사</span>
					</a>
					<ul class="sidenav-second-level collapse" id="manager_sub">
						<li><a href="#">- 병 사 등 록</a></li>
						<li><a href="#">- 전 역 병 사</a></li>
						<li><a href="#">- 병 사 관 리</a></li>
						<li><a href="#">- 간 부 관 리</a></li>
					</ul>
				</li>

				<!-- admin -->
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="admin"><a class="nav-link nav-link-collapse collapsed"
					data-toggle="collapse" href="#admin_sub"
					data-parent="#exampleAccordion"> <span class="glyphicon-wrench"></span>
						<span class="nav-link-text"> 행 정</span>
				</a>
					<ul class="sidenav-second-level collapse" id="admin_sub">
						<li><a href="#">Navbar</a></li>
						<li><a href="#">Cards</a></li>
					</ul></li>

				<!-- command -->
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="command">
					<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#command_sub" data-parent="#exampleAccordion"> 
						<span class="glyphicon-pencil"></span> 
						<span class="nav-link-text">정보ㆍ작전</span>
					</a>
					<ul class="sidenav-second-level collapse" id="command_sub">
						<li><a href="#">정 보</a></li>
						<li><a href="#">작 전</a></li>
					</ul>
				</li>
			</ul>

			<!-- 메뉴 접기 부분 -->
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <span class="glyphicon-off"></span>
				</a></li>
			</ul>

			<ul class="navbar-nav ml-auto">
				<li><a class="nav-link" href="#"> <span
						class="glyphicon-bell" width="30px" height="30px"></span>
				</a></li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li><a class="nav-link" href="#"> <span
						class="glyphicon-envelope"></span>
				</a></li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal"> <span class="glyphicon-eye-close"></span>
						로그아웃
				</a></li>
			</ul>
		</div>
	</nav>

	<div class="content-wrapper">
		<div class="content_part" style="padding-left: 20px; padding-right: 20px;">
			<div class="supply_title" style="margin-top:30px;">
					<h3 align="center">지난 물자 신청 내역</h3>
			</div>
			<div style="margin-top:30px; background-color: #F6F6F6; border-radius: 10px; padding-top:10px; padding-bottom: 10px; text-align:center;">
				Search&nbsp;&nbsp;&nbsp;
				<input type="text" id="testDatepicker" class="form-control" placeholder="날짜를 선택해주세요." 
				name="date_search" style="width:200px;">&nbsp;&nbsp;&nbsp;
				<input type="button" id="btn_receiptSearch" class="btn btn-default" value="검색">  
			</div>
			<div style="height:660px; overflow-y: auto; ">
					<table class="table table-hover" style="margin-top:20px;">
						<tr align="center" style="background-color: #F6FFCC; font-size:0.8em;">
							<td width="30px">신청날짜</td>
							<td width="30px">일련번호</td>
							<td width="70px">이름</td>
							<td width="60px">신청수량</td>
							<td width="80px">재고량</td>
						</tr>
						<c:forEach items="${ list }" var="list">
						<tr align="center">
							<td>${ list.supply_r_date }</td>				
							<td>${ list.supply_r_num }</td>			
							<td>${ list.supply_r_name }</td>
							<td>${ list.supply_r_order }</td>				
							<td>${ list.supply_r_total }</td>
						</tr>	
						</c:forEach>
					</table>
			</div>
		</div>
	</div>
	
		<footer class="sticky-footer">
			<div class="container">
				<div class="text-center">
					<small>Kosta ARMY 서승범, 김병권, 신지훈, 엄태광, 정민석, 김현재, 방명철</small>
				</div>
			</div>
		</footer>

		<!-- Logout Modal 로그아웃 버튼을 눌렀을 경우 실행 됨-->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">로그아웃 하시겠습니까?</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">돌아가기</button> &nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/j_spring_security_logout">로그아웃</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 서브 메뉴 숨기기 기능 -->
		<script src="${pageContext.request.contextPath}/resources/js/sb-admin.min.js"></script>
	</div>

	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content" style="margin-top: 45%">
					<div class="modal-header" id="messageType">
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