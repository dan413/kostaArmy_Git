<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/supplyProcess.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/const/current_supplyOrder.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/table_custom.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/sorttable.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/print.js"></script>
	

<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">

	<div class="content-wrapper">
		<se:authorize access="hasRole('ROLE_MASTER_SERGEANT')">
			<div class="content_part" style="padding-left: 20px; padding-right: 20px;">


				<div class="datagrid" style="overflow: hidden;">
					<table>
						<thead>
							<tr>
								<th style="font-size: xx-large; font-weight: bolder;">물자 발주
									승인 현황</th>
							</tr>
						</thead>
					</table>


					<div
						style="background-color: #F6F6F6; text-align: center; font-size: large;">
						* 승인확인을 하셔야 재고량이 늘어납니다. *</div>
					<div
						style="background-color: #F6F6F6; border-radius: 10px; padding-top: 10px; padding-bottom: 10px; text-align: right;">

						<c:if test="${countByOrder == 0}">
							<input disabled="true" type="button" class="btn btn-success"
								value="수령확인" id="btn_supplySuccess"
								style="width: 15%; margin-right: 10px;">
						</c:if>
						<c:if test="${countByOrder != agree_count }">
							<input disabled="true" type="button" class="btn btn-success"
								value="수령확인" id="btn_supplySuccess"
								style="width: 15%; margin-right: 10px;">
						</c:if>
						<c:if
							test="${(countByOrder == agree_count) && (countByOrder != 0 && agree_count !=0) }">
							<input type="button" class="btn btn-success" value="수령확인"
								id="btn_supplySuccess" style="width: 15%; margin-right: 10px;">
						</c:if>

						<input type="button" class="btn btn-default" value="목록으로"
							style="width: 15%; margin-right: 10px;"
							onclick="window.location.href='getCurrentApplyList.do'">
						<a onclick="javascript:btn_printSupplyOrder(document.getElementById('printSupplyOrder').innerHTML)"
                     class="btn btn-info" style="width: 15%; margin-right: 10px;">인 쇄</a>
					</div>
				</div>
				<div id="printSupplyOrder">
				<div class="datagrid" style="height: 660px; overflow-y: auto;">
					<table class="sortable"  style="text-align: center;">
						<thead>
							<tr>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">일련번호</th>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">분류</th>
								<th style="width:15%; border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">이름</th>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">신청개수</th>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">신청완료개수</th>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">재고량</th>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">승인</th>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">상태</th>
							</tr>
						</thead>
						<c:if test="${list == null }">
							<tr align="center"
								style="background-color: #fff; font-size: 0.8em; height: 400px;">
								<td colspan="9" style="vertical-align: middle; border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">발주 신청 내역이
									없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="list" items="${list }">
							<c:if test="${list.supply_order != 0 || list.supply_set != 0}">
								<tr>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.supply_num }</td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><c:if test="${list.supply_flag == 0 }">
						일반
					</c:if> <c:if test="${list.supply_flag != 0 }">
						소모
					</c:if></td>
									<td style="width:15%; border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.supply_name }</td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.supply_order }개</td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.supply_set }개</td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${list.supply_total }개</td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><c:if
											test="${list.supply_set == 0 && list.supply_order != 0}">
											<input type="button" class="btn btn-danger btn_SupplyCancel"
												name="btn_${list.supply_num }"
												id="${list.supply_num }/${list.supply_name }/${list.supply_flag}/${group}"
												value="신청취소"
												onclick="window.location.href='deleteOrder.do?supply_num=${list.supply_num}'"
												style="width: 100%; border:0px;">
										</c:if> <c:if
											test="${list.supply_set != 0 && list.supply_order == 0}">
											<input type="button" class="btn btn-danger btn_SupplyCancel"
												name="btn_${list.supply_num }"
												id="${list.supply_num }/${list.supply_name }/${list.supply_flag}/${group}"
												disabled="true" value="신청취소" style="width: 100%; border:0px;">
										</c:if></td>
									<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><c:if test="${list.supply_order == 0 }">
											<font color="blue">승인완료</font>
										</c:if> <c:if
											test="${list.supply_order != 0 && list.supply_comments == 'none' }">
									결제중
									</c:if> <c:if
											test="${list.supply_order != 0 && list.supply_comments != 'none' }">
											<font color="red">취소 (${list.supply_comments })</font>
										</c:if></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		</se:authorize>
		<!-- ============================================================================================================================== -->
		<se:authorize ifNotGranted="ROLE_MASTER_SERGEANT, ROLE_SUPPLY_CAPTAIN">
			권한이 없습니다.
		</se:authorize>
	</div>
</body>
</html>