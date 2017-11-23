<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/adminDailyProcess.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/table_custom.css" rel="stylesheet">
<title>강한육군 KostaArmy</title>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- ============================================================================================================================== -->

	<div class="content-wrapper">
		<div class="content_part">
			<div class="container">
				<div class="datagrid" style="overflow-y: hidden;">
					<table style="text-align: left;">
						<thead style="font-size: 30px;">
							<tr><th colspan="2">복무일지</th></tr>
							<tr><td colspan="2"><input id="today" type="date" class="form-control"></td></tr>
						</thead>
						<tbody id=dailyList></tbody>
					</table>

					<div class="datagrid" style="margin: 10px;">
						<table>
							<thead style="font-size: 25px;">
								<tr><th colspan="2">복무일지 입력란</th></tr>
							</thead>
							<tr>
								<td>
									<textarea id="dailyContent" class="form-control"
										placeholder="내용 입력 하세요" maxlength="500"
										style="width: 100%; height: 100px;"></textarea>
								</td>
							</tr>

							<tr>
								<td>
									<input id="dailyMemo" type="text" class="form-control" placeholder="비 고" style="width: 70%; float: left;">&nbsp;&nbsp; 
									<input id="dailyTime" class="form-control" type="text" placeholder="시간을 입력 하세요" style="width: 25%;">
									<input id="cadre_group" type="hidden" value="${cadre_group}">
								</td>
							</tr>
							<tr>
								<td>
									<button type="button" class="btn btn-primary btn-lg" onclick="submitFunction();" style="width: 49%;">추 가</button>
									<a class="btn btn-warning btn-lg " data-toggle="modal" data-target="#exelModal" style="width: 49%">Exel저장</a> 
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- 엑셀 저장 버튼 누를떄 -->
	<div class="modal" id="exelModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content" style="margin-top: 45%">
					<div class="modal-header" id="messageType">
						<h5 class="modal-title">엑셀 저장</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
					</div>
					<div class="modal-body">웹에 있는 데이터는 삭제됩니다. 엑셀로 저장 하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							id="btn_gotoNextPage" onclick="dailyExelFunction();">확인</button>
						&nbsp;&nbsp;&nbsp;
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">돌아가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>