<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src='${pageContext.request.contextPath }/resources/js/moment.min.js'></script>
<script
	src='${pageContext.request.contextPath }/resources/js/fullcalendar.js'></script>
<link rel='stylesheet'
	href='${pageContext.request.contextPath }/resources/css/fullcalendar.css' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath }/resources/css/fullcalendar.min.css' />
<link
	href="${pageContext.request.contextPath}/resources/css/table_custom.css"
	rel="stylesheet">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강한육군 대한민국 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">

	<div class="content-wrapper">
		<div class="content_part"
			style="padding-left: 20px; padding-right: 20px; margin-top: 20px">
			<div class="supplyList_part">
				<div class="container">
					<div class="datagrid" style="overflow: hidden; height: 670px;">
						<table style="font-size: 1.2em; height: 680px;">
							<thead>
								<tr>
									<th colspan="2"
										style="font-size: xx-large; font-weight: bolder;">
										${cadre_group } ${dTime } 유동병력현황</th>
								</tr>
							</thead>
	
							<tr style="font-weight: bolder; font-size: 1.6em;">
								<td>출 타</td>
								<td>인 원</td>
							</tr>
							<tr>
								<td>총 원</td>
								<td>${total_Count}</td>
							</tr>
	
							<tr>
								<td>휴 가</td>
								<td>${count_by_normal }</td>
							</tr>
	
							<tr>
								<td>외 박</td>
								<td>${count_by_sunday }</td>
							</tr>
	
							<tr>
								<td>입 실</td>
								<td>${count_by_hospital }</td>
							</tr>
	
							<tr>
								<td>파 견</td>
								<td>${count_by_away }</td>
							</tr>
	
							<tr>
								<td>현 재 원</td>
								<td>${count_by_now}</td>
							</tr>
						</table>
					</div>
	
				</div>
			</div>
			<div class="supplyBasket_part">

					<div class="datagrid" style="overflow: hidden;">
						<table>
							<thead>
								<tr>
									<th style="font-size: xx-large; font-weight: bolder;">병력 그래프</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="datagrid" style="height: 600px; overflow-y: auto;">
						<table class="table">
							<tr>
								<td style="width: 78%;">
								<div class="progress" style="width: 100%;">
									<div class="progress-bar progress-bar"
										role="progressbar" aria-valuenow="${total_Count}" aria-valuemin="0"
										aria-valuemax="${total_Count}" style="width: 100%;">
									</div> 
								</div>
								</td>
								<td>
									총원 : ${total_Count}
								</td>
							</tr>
							<tr>
								<td style="width: 78%;">
									<div class="progress" style="width: 100%;">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="${count_by_normal }" aria-valuemin="0"
											aria-valuemax="${total_Count}" style="width: ${count_by_normal / total_Count * 100}%;">
										</div> 
									</div>
								</td>
								<td>
									휴가 : ${count_by_normal } / ${total_Count}
								</td>
							</tr>	
							<tr>
								<td style="width: 78%;">
									<div class="progress" style="width: 100%;">
										<div class="progress-bar progress-bar-info"
											role="progressbar" aria-valuenow="${count_by_sunday }" aria-valuemin="0"
											aria-valuemax="${total_Count}" style="width: ${count_by_sunday / total_Count * 100}%;">
										</div> 
									</div>
								</td>
								<td>
									외박 : ${count_by_sunday } / ${total_Count}
								</td>
							</tr>
							<tr>
								<td style="width: 78%;">
									<div class="progress" style="width: 100%;">
										<div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="${count_by_hospital }" aria-valuemin="0"
											aria-valuemax="${total_Count}" style="width: ${count_by_hospital / total_Count * 100}%;">
										</div> 
									</div>
								</td>
								<td>
									입실 : ${count_by_hospital } / ${total_Count}
								</td>
							</tr>
							<tr>
								<td style="width: 78%;">
									<div class="progress" style="width: 100%;">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="${count_by_away }" aria-valuemin="0"
											aria-valuemax="${total_Count}" style="width: ${count_by_away / total_Count * 100}%;">
										</div> 
									</div>
								</td>
								<td>
									파견 : ${count_by_away } / ${total_Count}
								</td>
							</tr>
							<tr>
								<td style="width: 78%;">
								<div class="progress" style="width: 100%;">
									<div class="progress-bar progress-bar-info"
										role="progressbar" aria-valuenow="${count_by_now}" aria-valuemin="0"
										aria-valuemax="${total_Count}" style="width: ${count_by_now / total_Count * 100}%;">
									</div> 
								</div>
								</td>
								<td>
									현재원 : ${count_by_now} / ${total_Count}
								</td>
							</tr>
						</table>
					
				</div>	
				
			</div>
		</div>
	</div>
</body>
</html>