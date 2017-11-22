<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/initialize.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/supplyProcess.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sorttable.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/print.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/table_custom.css" rel="stylesheet">

<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">

	<div class="content-wrapper">
		<se:authorize access="hasRole('ROLE_MASTER_SERGEANT')">
			<div class="content_part">
				<div class="supplyList_part">


					<div class="datagrid">
						<table>
							<thead>
								<tr>
									<th style="font-size: xx-large; font-weight: bolder;">물자 현황 & 신청</th>
								</tr>
							</thead>
						</table>
						<div
							style="background-color: #E1E1E1; padding-top: 10px; padding-bottom: 10px; text-align: left;">
							<form action="search_supply.do" method="post" align="center">
								<label style="background-color: #E7E7E7; margin-top: 5px; width: 80px; height: 40px; border-radius: 10px; font-size: 1.5em;">Search</label>
								<input type="radio" name="s_search_table" value="supply_normal" checked="checked">&nbsp;일반물자 
								<input type="radio" name="s_search_table" value="supply_complete">&nbsp;소모물자
								<select name="s_search_part" class="form-control" style="width: 120px;">
									<option value="supply_num">일련번호</option>
									<option value="supply_name">품명</option>
								</select>&nbsp;&nbsp; <input size="30" class="form-control" style="width: 200px;" type="search" name="keyvalue" placeholder="물자를 검색합니다."> 
									<input type="submit" class="btn btn-default" value="검색">
									<a class="btn btn-default" role="button" href="getCurrentApplyList.do">모든 품목보기</a>
							</form>
						</div>
					</div>


					<div class="datagrid" style="height: 675px; overflow-y: auto;">
						<table class="sortable">
							<thead>
								<tr style="z-index: 100">
									<th width="8%">일련번호</th>
									<th width="5%">분류</th>
									<th width="20%">이름</th>
									<th>신청수량</th>
									<th>신청완료</th>
									<th>재고수량</th>
									<th width="3%"></th>
									<th width="25%">신청</th>
									<th width="8%">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list }">
									<tr>
										<td width="8%">${list.supply_num }</td>
										<td width="5%"><c:if test="${list.supply_flag == 0 }">일반</c:if>
											<c:if test="${list.supply_flag != 0 }"> 소모 </c:if></td>
										<td data-placement="right" title="${list.supply_name }"
											width="20%">${list.supply_name }</td>
										<td style="text-align: right;">${list.supply_order }개</td>
										<td style="text-align: right;">${list.supply_set }개</td>
										<td style="text-align: center;">${list.supply_total }개</td>
										<td width="3%"><c:if test="${list.supply_total == 0 }">
												<img width="15px" height="15px" src="${pageContext.request.contextPath}/resources/images/warning.jpg">
											</c:if></td>
										<td width="25%">
											<input type="number" class="form-control" placeholder="신청수량" id="osupply_order_${list.supply_num }" 
												name="osupply_order" style="width: 120px;">&nbsp;&nbsp;개&nbsp;&nbsp;
											<c:if test="${list.supply_order == 0 && list.supply_set == 0}">
												<input type="button" class="btn btn-primary btn_AddSupplyBasket" name="btn_${list.supply_num }" 
													id="${list.supply_num }/${list.supply_name }/${list.supply_flag}" value="추가">
											</c:if> 
											<c:if test="${list.supply_order != 0 && list.supply_comments != 'none'}">
												<input type="button" class="btn btn-primary btn_AddSupplyBasket" name="btn_${list.supply_num }"
													id="${list.supply_num }/${list.supply_name }/${list.supply_flag}" disabled="true" value="추가">
											</c:if>
											<c:if test="${list.supply_order != 0 && list.supply_comments == 'none'}">
												<input type="button" class="btn btn-primary btn_AddSupplyBasket" name="btn_${list.supply_num }"
													id="${list.supply_num }/${list.supply_name }/${list.supply_flag}" disabled="true" value="추가">
											</c:if> 
											<c:if test="${list.supply_order == 0 && list.supply_set != 0 && list.supply_comments == 'none'}">
												<input type="button" class="btn btn-primary btn_AddSupplyBasket" name="btn_${list.supply_num }"
													id="${list.supply_num }/${list.supply_name }/${list.supply_flag}" disabled="true" value="추가">
											</c:if></td>
										<td width="8%">
											<c:if test="${list.supply_order == 0 && list.supply_set != 0 && list.supply_comments == 'none'}">
												<font color="blue">승인처리됨</font>
											</c:if>
											<c:if test="${list.supply_order != 0 && list.supply_comments == 'none'}">결제중</c:if>
									 		<c:if test="${list.supply_comments != 'none'}">결제취소 </c:if>
									 	</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="supplyBasket_part">

					<div class="datagrid" style="overflow: hidden;">
						<table>
							<thead>
								<tr>
									<th style="font-size: xx-large; font-weight: bolder;">신청 목록</th>
								</tr>
							</thead>
						</table>
						<div style="background-color: #E1E1E1;">
							<form action="search_supply.do" method="post" align="center">
								<div>
									<table>
										<tr>
											<td>
												  <a href="dateSearchForm.do" class="btn btn-warning btn-lg" style="width: 45%; margin: 8px;">지난 발주 현황</a>
												  <a href="currentSupplyOrder.do?group=${group }" class="btn btn-primary btn-lg" style="width: 45%; margin: 8px;">현재 발주 현황</a>
										   </td>
										</tr>
									</table>
								</div>
							</form>
						</div>
					</div>
					<div class="datagrid" style="height: 600px; overflow-y: auto;">
						<table id="basket_table" class="sortable">
							<thead>
								<tr>
									<th>일련번호</th>
									<th>분류</th>
									<th>이름</th>
									<th>신청개수</th>
									<th>etc</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="datagrid" style="overflow: hidden;">
						<div style="text-align: center; background-color: #F6F6F6;">
							<table>
								<tr>
									<td><input type="button" class="btn btn-primary btn-lg" id="btn_SupplyComplete" value="신청하기" style="width: 49%">
										<input type="button" class="btn btn-default btn-lg" id="btn_goHome" value="취소하기" style="width: 49%"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</se:authorize>
		<se:authorize access="hasRole('ROLE_SUPPLY_CAPTAIN')">
			<div class="content_part" style="padding-left: 20px; padding-right: 20px;">
				<div class="datagrid" style="overflow: hidden;">
					<table>
						<thead>
							<tr>
								<th style="font-size: xx-large; font-weight: bolder;">KOSTA대대 발주 신청 리스트</th>
							</tr>
						</thead>
					</table>
					<div style="background-color: #F6F6F6; padding-top: 10px; padding-bottom: 10px; text-align: left;">
						<div style="text-align: center;">
							<input type="button" class="btn btn-default" onclick="window.location.href='orderGroupView.do?group=본부중대'" value="본부중대" style="width:200px; height:60px;">&nbsp;&nbsp;&nbsp;
							<input type="button" class="btn btn-default" onclick="window.location.href='orderGroupView.do?group=1중대'" value="1중대" style="width:200px; height:60px;">&nbsp;&nbsp;&nbsp;
							<input type="button" class="btn btn-default" onclick="window.location.href='orderGroupView.do?group=2중대'" value="2중대" style="width:200px; height:60px;">&nbsp;&nbsp;&nbsp;
							<input type="button" class="btn btn-default" onclick="window.location.href='orderGroupView.do?group=3중대'" value="3중대" style="width:200px; height:60px;">&nbsp;&nbsp;&nbsp;
							<a onclick="javascript:btn_printSupplyGrupe(document.getElementById('supplyGrupe').innerHTML)">
                        		<input type="button" class="btn btn-default" value="인 쇄" style="width:200px; height:60px;">
                     		</a>
						<div>
					</div>
				</div>

				<div id="supplyGrupe">
				<div class="datagrid" style="height: 680px; overflow-y: auto;">
					<table class="sortable" style="text-align: center;">
						<thead>
							<tr>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">일련번호</th>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">분류</th>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">이름</th>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">신청개수</th>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">신청완료개수</th>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">재고량</th>
								<th style="width:20%; border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">승인</th>
								<th style="border-bottom:3px double #ddd; border-right: 0.5px solid #ddd;">상태</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${order_list == null }">
								<tr>
									<td colspan="8">신청 리스트를 조회할 중대를 선택하세요.</td>
								</tr>
							</c:if>
							<c:if test="${order_list == null }">
								<tr>
									<td colspan="8">발주 신청 내역이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${order_list != null }">
								<c:forEach var="order_list" items="${order_list }">
									<c:if
								test="${order_list.supply_order != 0 || order_list.supply_set != 0}">
								<tbody>
									<tr>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${order_list.supply_num }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><c:if test="${order_list.supply_flag == 0 }">일반</c:if>
										<c:if test="${order_list.supply_flag != 0 }">소모</c:if></td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${order_list.supply_name }</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${order_list.supply_order }개</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${order_list.supply_set }개</td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">${order_list.supply_total }개</td>
										<td style="width:20%; border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;">
											<c:if test="${order_list.supply_set == 0 && order_list.supply_comments == 'none'}">
												<input type="button" class="btn btn-primary btn_SupplyAgree" name="btn_${order_list.supply_num }"
													id="${order_list.supply_num }/${order_list.supply_name }/${order_list.supply_flag}/${supply_group}" value="승인하기" style="width: 49%; border:0px;">
												<input type="button" class="btn btn-danger btn_SupplyDisAgree" name="btn_${order_list.supply_num }"
													id="${order_list.supply_num }/${order_list.supply_name }/${order_list.supply_flag}/${supply_group}" value="승인거절" style="width: 49%; border:0px;">
											</c:if>
											<c:if test="${order_list.supply_set != 0 && order_list.supply_comments == 'none'}">
												<input type="button" class="btn btn-primary btn_SupplyAgree" name="btn_${order_list.supply_num }"
													id="${order_list.supply_num }/${order_list.supply_name }/${order_list.supply_flag}/${supply_group}" disabled="true" value="승인하기" style="width: 49%; border:0px;">
												<input type="button" class="btn btn-danger btn_SupplyDisAgree" name="btn_${order_list.supply_num }"
													id="${order_list.supply_num }/${order_list.supply_name }/${order_list.supply_flag}/${supply_group}" disabled="true" value="승인거절" style="width: 49%; border:0px;">
											</c:if>
											<c:if test="${order_list.supply_order != 0 && order_list.supply_comments != 'none'}">
												<input type="button" class="btn btn-primary btn_SupplyAgree" name="btn_${order_list.supply_num }"
													id="${order_list.supply_num }/${order_list.supply_name }/${order_list.supply_flag}/${supply_group}" disabled="true" value="승인하기" style="width: 49%; border:0px;">
												<input type="button" class="btn btn-danger btn_SupplyDisAgree" name="btn_${order_list.supply_num }"
													id="${order_list.supply_num }/${order_list.supply_name }/${order_list.supply_flag}/${supply_group}" disabled="true" value="승인거절" style="width: 49%; border:0px;">
											</c:if></td>
										<td style="border-bottom:0.5px solid #ddd; border-right: 0.5px solid #ddd;"><c:if test="${order_list.supply_order == 0 && order_list.supply_comments == 'none' }">
												<font color="blue">승인완료</font>
											</c:if> 
											<c:if test="${order_list.supply_order != 0 && order_list.supply_comments == 'none' }">결제중 </c:if>
											<c:if test="${order_list.supply_order != 0 && order_list.supply_comments != 'none' }">
												<font color="red">취소 (${order_list.supply_comments })</font>
											</c:if></td>
									</tr>
								</tbody>
							</c:if>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</se:authorize>
		<!-- ============================================================================================================================== -->
		<!-- ============================================================================================================================== -->
		<!-- ============================================================================================================================== -->
		<!-- ============================================================================================================================== -->
		<!-- ============================================================================================================================== -->
		<se:authorize ifNotGranted="ROLE_MASTER_SERGEANT, ROLE_SUPPLY_CAPTAIN">
			권한이 없습니다.
		</se:authorize>
	</div>

	<div class="modal" id="SupplyCancelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">신청 거절</h5> <button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					&nbsp;&nbsp;&nbsp; 취소 사유 &nbsp; <select name="Sign_reason"
						id="reason_select">
						<option>재고부족</option>
						<option>비편재 물품</option>
					</select>
				</div>

				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">돌아가기</button>
					<input type="button" class="btn btn-primary" value="완료"
						id="btn_SupplyCancelComplete" />
				</div>

			</div>
		</div>
	</div>
</body>
</html>