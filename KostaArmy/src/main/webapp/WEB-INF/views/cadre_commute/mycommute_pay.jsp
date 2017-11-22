<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/print.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sorttable.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/table_custom.css" rel="stylesheet">

<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<div class="content-wrapper">
		<div class="content_part">
			<div class="supplyList_part">
				<div class="datagrid">
						<table>
							<thead>
								<tr>
									<th style="font-size: xx-large; font-weight: bolder;">출퇴근 내역</th>
								</tr>
							</thead>
						</table>
						<div style="background-color: #E1E1E1; padding-top: 10px; padding-bottom: 10px;">
								<input type="button" class="btn btn-default btn_month" id="1" value="1월" style="width: 100px;" onclick="window.location.href='mycommute_pay.do?month=1'">
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-default btn_month" id="2" value="2월" style="width: 100px;" onclick="window.location.href='mycommute_pay.do?month=2'">
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-default btn_month" id="3" value="3월" style="width: 100px;" onclick="window.location.href='mycommute_pay.do?month=3'">
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-default btn_month" id="4" value="4월" style="width: 100px;" onclick="window.location.href='mycommute_pay.do?month=4'">
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-default btn_month" id="5" value="5월" style="width: 100px;" onclick="window.location.href='mycommute_pay.do?month=5'">
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-default btn_month" id="6" value="6월" style="width: 100px;" onclick="window.location.href='mycommute_pay.do?month=6'"><br>
								
								<input type="button" class="btn btn-default btn_month" id="7" value="7월" style="width: 100px;" onclick="window.location.href='mycommute_pay.do?month=7'">
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-default btn_month" id="8" value="8월" style="width: 100px;" onclick="window.location.href='mycommute_pay.do?month=8'">
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-default btn_month" id="9" value="9월" style="width: 100px;" onclick="window.location.href='mycommute_pay.do?month=9'">
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-default btn_month" id="10" value="10월" style="width: 100px;" onclick="window.location.href='mycommute_pay.do?month=10'">
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-default btn_month" id="11" value="11월" style="width: 100px;" onclick="window.location.href='mycommute_pay.do?month=11'">
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-default btn_month" id="12" value="12월" style="width: 100px;" onclick="window.location.href='mycommute_pay.do?month=12'">
						
						</div>
					</div>


					<div class="datagrid" style="height: 675px; overflow-y: auto;">
						<table class="sortable">
							<thead>
								<tr style="z-index: 100">
									<th>출근시간</th>
									<th>퇴근시간</th>
									<th>초과근무</th>
									<th>초과수당</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${nullMessage == null}">
									<c:forEach var="cadre_commuteList" items="${cadre_commuteList }">
											<tr>
												<td>${cadre_commuteList.start_time }</td>
												<td>${cadre_commuteList.end_time }</td>
												<td>
													<c:if test="${cadre_commuteList.over_time == null}">
														<span class="label label-default">초과근무 x</span>
													</c:if>
													<c:if test="${cadre_commuteList.over_time != null}">
														<span class="label label-info">초과근무 o</span>
													</c:if>
												</td>
												<td>${cadre_commuteList.over_pay }</td>
											</tr>
										
									</c:forEach>
								</c:if>
								<c:if test="${nullMessage != null }">
									<tr>
										<td colspan="4" style="height:620px; vertical-align: middle;">${nullMessage}</td>
									</tr>
								</c:if>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="print_page"> <!-- 프린트 영역 -->
			<div class="supplyBasket_part">
				<div class="datagrid">
				
						<table>
							<thead>
								<tr>
									<th style="font-size: xx-large; font-weight: bolder; text-align: center;">월급명세서</th>
								</tr>
							</thead>
						</table>
				</div>
					<div class="datagrid" style="height: 450px; overflow-y: auto;">
						<c:if test="${cadre_payObj != null }">
					 	<table class="table table-bordered" style="text-align: center;">
					 		<thead>
								<tr>
									<th colspan="4" style="border-bottom:0.5px solid #ddd;">${month } 월 월급명세서</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2" style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">월급지급일</td>
									<td colspan="2" style="border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;"><fmt:formatDate value="${cadre_payObj.cadre_sendPayDate }" pattern="yyyy-MM-dd"/></td>
								</tr>
								<tr>
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">군번</td>
									<td style="border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">${cadre_obj.cadre_number }</td>
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">이름</td>
									<td style="border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">${cadre_obj.cadre_name }</td>
								</tr>
								<tr>
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">계급</td>
									<td style="border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">${cadre_obj.cadre_mmr }</td>
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">직급</td>
									<td style="border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">${cadre_obj.cadre_position }</td>
								</tr>
								<tr>
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">소속</td>
									<td colspan="3" style="border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">${cadre_obj.cadre_supergroup } ${cadre_obj.cadre_group }</td>
								</tr>
								<tr style="border-color: #000;">
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;" colspan="2">지급계</td>
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;" colspan="2">공제계</td>
								</tr>
								<tr>
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">총 지급액</td>
									<td align="left" style="border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">
										<fmt:formatNumber value="${cadre_payObj.cadre_normalPay + cadre_payObj.cadre_overPay }" pattern="###,###"/> 원
									</td>
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">총 공제액</td>
									<td align="left" style="border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">
										<fmt:formatNumber value="${cadre_payObj.cadre_incomeTax + cadre_payObj.cadre_sub_incomeTax + cadre_payObj.cadre_healthyTax }" pattern="###,###"/> 원
									</td>
								</tr>
								<tr>
									<td style="background-color: #F6F6F6;border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">기본급</td>
									<td align="left" style="border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">
										<fmt:formatNumber value="${cadre_payObj.cadre_normalPay}" pattern="###,###"/> 원
									</td>
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">소득세</td>
									<td align="left" style="border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">
										<fmt:formatNumber value="${cadre_payObj.cadre_incomeTax}" pattern="###,###"/> 원
									</td>
								</tr>
								<tr>
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">추가수당</td>
									<td align="left" style="border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">
										<fmt:formatNumber value="${cadre_payObj.cadre_overPay}" pattern="###,###"/> 원
									</td>
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">지방소득세</td>
									<td align="left" style="border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">
										<fmt:formatNumber value="${cadre_payObj.cadre_sub_incomeTax}" pattern="###,###"/> 원
									</td>
								</tr>
								<tr>
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">실수령액</td>
									<td align="left" style="background-color: #FAF4C0; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">
										<fmt:formatNumber value="${cadre_payObj.cadre_normalPay + cadre_payObj.cadre_overPay - cadre_payObj.cadre_incomeTax - cadre_payObj.cadre_sub_incomeTax - cadre_payObj.cadre_healthyTax }" pattern="###,###"/> 원
									</td>
									<td style="background-color: #F6F6F6; border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">건강보험료</td>
									<td align="left" style="border-bottom:0.5px solid #ddd; border-right:0.5px solid #ddd;">
										<fmt:formatNumber value="${cadre_payObj.cadre_healthyTax}" pattern="###,###"/> 원
									</td>
								</tr>	
							</tbody>
						</table>
						</c:if>
						
						<c:if test="${cadre_payObj == null }">
							<table>
								<tr>
									<td style="vertical-align: middle; height:380px;">
										월급 내역이 없습니다.
									</td>
								</tr>
							</table><br>
						</c:if>
						
						<div style="text-align: center;">
							<input type="button" class="btn btn-primary" value="홈으로" onclick="window.location.href='login-success.do'">
							<a onclick="javascript:btn_printPay(document.getElementById('print_page').innerHTML)" class="btn btn-info">인 쇄 </a>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>