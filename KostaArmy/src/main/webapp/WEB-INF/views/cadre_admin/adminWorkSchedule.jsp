<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se"
   uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/adminWorkProcess.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/adminProcess.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/DragAndDrop.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/onclick.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/print.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/table_custom.css" rel="stylesheet">


<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<div class="content-wrapper">
		<div class="content_part">
			<div id="schedule"
				style="width: 70%; padding-left: 1%; padding-right: 1%; float: left;">
				<div class="datagrid" style="overflow-y: hidden;">
					<div id="menu" style="display: block;">
						<table ondrop="onDrop(event)" ondragover="onDragOver(event)">
							<thead style="font-size: 30px;">
								<tr>
									<th colspan="6">근무일지</th>
								</tr>
							</thead>

							<tr>
								<th><input id="btn_adminTower" type="button"
									class="btn btn-success" value="근무 일지 (초소)" style="width: 49%;">
									<input id="btn_adminNight" type="button"
									class="btn btn-warning" value="근무 일지 (불침번)" style="width: 49%;"></th>
							</tr>
						</table>
					</div>

					<div id="adminTower" style="display: none;">
						<!-- <div id="print_pageTower"> 프린트 영역 -->
						<div id="print_page">
							<!-- 프린트 영역 -->
							<form method="post" action="AdminTowerExel.do">
								<div class="datagrid" style="margin: 7px">

									<table style="text-align: center;">
										<tr>
											<td colspan="6"
												style="font-weight: bolder; font-size: x-large;">초소근무</td>
										</tr>
										<tr>
											<td colspan="3"
												style="font-weight: bolder; font-size: large;">근무일자</td>
											<td colspan="3""><input class="form-control"
												name="today" type="date" style="float: right; border: 0px;"></td>
										</tr>
										<tr>
											<td style="font-weight: bolder; font-size: medium;">당직사관</td>
											<td colspan="2""><input style="border: 0px;"
												name="officerName" class="form-control" type="text"
												placeholder="당직 사관 이름"></td>
											<td style="font-weight: bolder; font-size: medium;">당직부사관</td>
											<td colspan="2""><input style="border: 0px;"
												name="officerSubName" class="form-control" type="text"
												placeholder="당직 부사관 이름"></td>
										</tr>

										<tr>
											<td style="font-weight: bolder; font-size: medium;">시 간</td>
											<td style="font-weight: bolder; font-size: medium;">이 름</td>
											<td style="font-weight: bolder; font-size: medium;">서 명</td>
											<td style="font-weight: bolder; font-size: medium;">시 간</td>
											<td style="font-weight: bolder; font-size: medium;">이 름</td>
											<td style="font-weight: bolder; font-size: medium;">서 명</td>
										</tr>
										<tr>
											<td rowspan="2">22 : 00 <br> ~ 24 : 00
											</td>
											<td><input style="border: 0px;" name="nightWitch1"
												class="form-control" type="text" placeholder="사수 이름"></td>
											<td></td>
											<td rowspan="2">10 : 00 <br> ~ 12 : 00
											</td>
											<td><input style="border: 0px;" name="nightWitch2"
												class="form-control" type="text" placeholder="사수 이름"></td>
											<td></td>
										</tr>
										<tr>
											<td><input style="border: 0px;" name="nightWitch3"
												class="form-control" type="text" placeholder="부사수 이름"></td>
											<td></td>
											<td><input style="border: 0px;" name="nightWitch4"
												class="form-control" type="text" placeholder="부사수 이름"></td>
											<td></td>
										</tr>
										<tr>
											<td rowspan="2">24 : 00 <br> ~ 02 : 00
											</td>
											<td><input style="border: 0px;" name="nightWitch5"
												class="form-control" type="text" placeholder="사수 이름"></td>
											<td></td>
											<td rowspan="2">12 : 00 <br> ~ 14 : 00
											</td>
											<td><input style="border: 0px;" name="nightWitch6"
												class="form-control" type="text" placeholder="사수 이름"></td>
											<td></td>
										</tr>
										<tr>
											<td><input style="border: 0px;" name="nightWitch7"
												class="form-control" type="text" placeholder="부사수 이름"></td>
											<td></td>
											<td><input style="border: 0px;" name="nightWitch8"
												class="form-control" type="text" placeholder="부사수 이름"></td>
											<td></td>
										</tr>
										<tr>
											<td rowspan="2">02 : 00 <br> ~ 04 : 00
											</td>
											<td><input name="nightWitch9" style="border: 0px;"
												class="form-control" type="text" placeholder="사수 이름"></td>
											<td></td>
											<td rowspan="2">14 : 00 <br> ~ 16 : 00
											</td>
											<td><input name="nightWitch10" style="border: 0px;"
												class="form-control" type="text" placeholder="사수 이름"></td>
											<td></td>
										</tr>
										<tr>
											<td><input name="nightWitch11" style="border: 0px;"
												class="form-control" type="text" placeholder="부사수 이름"></td>
											<td></td>
											<td><input name="nightWitch12" style="border: 0px;"
												class="form-control" type="text" placeholder="부사수 이름"></td>
											<td></td>
										</tr>
										<tr>
											<td rowspan="2">04 : 00<br> ~ 06 : 00
											</td>
											<td><input name="nightWitch13" style="border: 0px;"
												class="form-control" type="text" placeholder="사수 이름"></td>
											<td></td>
											<td rowspan="2">16 : 00 <br> ~ 18 : 00
											</td>
											<td><input name="nightWitch14" style="border: 0px;"
												class="form-control" type="text" placeholder="사수 이름"></td>
											<td></td>
										</tr>
										<tr>
											<td><input name="nightWitch15" style="border: 0px;"
												class="form-control" type="text" placeholder="부사수 이름"></td>
											<td></td>
											<td><input name="nightWitch16" style="border: 0px;"
												class="form-control" type="text" placeholder="부사수 이름"></td>
											<td></td>
										</tr>
										<tr>
											<td rowspan="2">06 : 00<br> ~ 08 : 00
											</td>
											<td><input name="nightWitch17" style="border: 0px;"
												class="form-control" type="text" placeholder="사수 이름"></td>
											<td></td>
											<td rowspan="2">18 : 00<br> ~ 20 : 00
											</td>
											<td><input name="nightWitch18" style="border: 0px;"
												class="form-control" type="text" placeholder="사수 이름"></td>
											<td></td>
										</tr>
										<tr>
											<td><input name="nightWitch19" style="border: 0px;"
												class="form-control" type="text" placeholder="부사수 이름"></td>
											<td></td>
											<td><input name="nightWitch20" style="border: 0px;"
												class="form-control" type="text" placeholder="부사수 이름"></td>
											<td></td>
										</tr>
										<tr>
											<td rowspan="2">08 : 00<br> ~ 10 : 00
											</td>
											<td><input name="nightWitch21" style="border: 0px;"
												class="form-control" type="text" placeholder="사수 이름"></td>
											<td></td>
											<td rowspan="2">20 : 00<br> ~ 22 : 00
											</td>
											<td><input name="nightWitch22" style="border: 0px;"
												class="form-control" type="text" placeholder="사수 이름"></td>
											<td></td>
										</tr>
										<tr>
											<td><input name="nightWitch23" style="border: 0px;"
												class="form-control" type="text" placeholder="부사수 이름"></td>
											<td></td>
											<td><input name="nightWitch24" style="border: 0px;"
												class="form-control" type="text" placeholder="부사수 이름"></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="1"
												style="font-weight: bolder; font-size: medium;">비고</td>
											<td colspan="5"><input name="memo" style="border: 0px;"
												class="form-control" type="text" placeholder="비고"></td>
										</tr>
										<tr>
											<td colspan="6" align="center">
												<div id="btnall" style="display: block;">
													<input type="reset" class="btn btn-warning " value="초기화"
														style="width: 31%"> <input
														class="btn btn-primary " type="submit" value="Excel저장"
														style="width: 31%"> <a onclick="pageprint()">
														<input type="button" class="btn btn-info" value="인 쇄"
														style="width: 31%">
													</a>
												</div>
											</td>
										</tr>
									</table>
								</div>

							</form>
						</div>

					</div>

					<div id="adminNight" style="display: none;">
						<div id="print_page">
							<!-- 프린트 영역 -->
							<form method="post" action="AdminNightExel.do">
								<div class="datagrid" style="margin: 10px">
									<table style="text-align: center;">
										<tr>
											<td colspan="6"
												style="font-weight: bolder; font-size: x-large;">불침번</td>
										</tr>
										<tr>
											<td colspan="3"
												style="font-weight: bolder; font-size: large;">근무일자</td>
											<td colspan="3"><input class="form-control"
												name="nightDate" type="date"
												style="float: right; border: 0px;"></td>
										</tr>
										<tr>
											<td style="font-weight: bolder; font-size: medium;">당직사관</td>
											<td colspan="2"><input name="officerName"
												class="form-control" type="text" placeholder="당직 사관 이름"
												style="border: 0px;"></td>
											<td style="font-weight: bolder; font-size: medium;">당직부사관</td>
											<td colspan="2"><input name="officerSubName"
												class="form-control" type="text" placeholder="당직 부사관 이름"
												style="border: 0px;"></td>
										</tr>

										<tr>
											<td style="font-weight: bolder; font-size: medium;">시 간</td>
											<td style="font-weight: bolder; font-size: medium;">이 름</td>
											<td style="font-weight: bolder; font-size: medium;">서 명</td>
											<td style="font-weight: bolder; font-size: medium;">시 간</td>
											<td style="font-weight: bolder; font-size: medium;">이 름</td>
											<td style="font-weight: bolder; font-size: medium;">서 명</td>
										</tr>
										<tr>
											<td>22 : 00<br> ~ 23 : 30</td>
											<td><input name="nightWitch1" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td></td>
											<td>02 : 30<br> ~ 04 : 00</td>
											<td><input name="nightWitch2" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td></td>
										</tr>
										<tr>
											<td>23 : 30<br> ~ 01 : 00</td>
											<td><input name="nightWitch3" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td></td>
											<td>04 : 00<br> ~ 05 : 30</td>
											<td><input name="nightWitch4" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td></td>
										</tr>
										<tr>
											<td>01 : 00<br> ~ 02 : 30</td>
											<td><input name="nightWitch5" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td></td>
											<td>05 : 30<br> ~ 06 : 30</td>
											<td><input name="nightWitch6" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="6" style="font-weight: bolder; font-size: large;">5 분 대기조</td>
										</tr>
										<tr>
											<td style="font-weight: bolder; font-size: medium;">5 대기 조장</td>
											<td colspan="2" style="border-bottom: 0.5px solid #ddd; border-right: 0.5px solid #ddd;">
											<input name="fiveMinuteCaptain" class="form-control" type="text" placeholder="조장 이름" style="border: 0px;"></td>
											<td style="font-weight: bolder; font-size: medium;">5 대기 운전병</td>
											<td colspan="2"><input name="fiveMinuteDriver" class="form-control" type="text" placeholder="운전병 이름" style="border: 0px;"></td>
										</tr>
										<tr>
											<td style="font-weight: bolder; font-size: medium;">이름</td>
											<td colspan="2" style="font-weight: bolder; font-size: medium;">서명</td>
											<td style="font-weight: bolder; font-size: medium;">이 름</td>
											<td colspan="2" style="font-weight: bolder; font-size: medium;">서명</td>
										</tr>
										<tr>
											<td><input name="fiveMinute1" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td colspan="2"></td>
											<td><input name="fiveMinute2" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td colspan="2"></td>
										</tr>
										<tr>
											<td><input name="fiveMinute3" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td colspan="2"></td>
											<td><input name="fiveMinute4" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td colspan="2"></td>
										</tr>
										<tr>
											<td><input name="fiveMinute5" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td colspan="2"></td>
											<td><input name="fiveMinute6" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td colspan="2"></td>
										</tr>
										<tr>
											<td><input name="fiveMinute7" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td colspan="2"></td>
											<td><input name="fiveMinute8" class="form-control" type="text" placeholder="근무자 이름" style="border: 0px;"></td>
											<td colspan="2"></td>
										</tr>
										<tr>
											<td colspan="1" style="font-weight: bolder; font-size: medium;">비고</td>
											<td colspan="5">
												<input name="note" class="form-control" type="text" placeholder="비고" style="border: 0px;">
											</td>
										</tr>
										<tr>
											<td colspan="6" align="center">
												<div id="btnall2" style="display: block;">
													<input type="reset" class="btn btn-warning " value="초기화"
														style="width: 31%"> <input
														class="btn btn-primary " type="submit" value="Excel저장"
														style="width: 31%"> <a onclick="pageprint()">
														<input type="button" class="btn btn-info" value="인 쇄"
														style="width: 31%">
													</a>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</form>
						</div>
					</div>
				</div> 
			</div>

			<!-- 검색 부분 -->
			<div id="cattery" style="width: 30%; padding-left: 1%; padding-right: 1%; float: right; display: block;">
				<div class="datagrid" style="overflow-y: hidden; height: 800px; overflow-y: auto;">
					<table>
						<thead style="font-size: 30px;">
							<tr>
								<th colspan="6">근무자 검색</th>
							</tr>
						</thead>
						<tr>
							<th>
								<div style="width: 30%; float: left; padding-right: 1%;">
									<select class="form-control" id="selection">
										<option value="cadre">간부 검색</option>
										<option value="soldier">병사 검색</option>
										<option value="driver">운전병 검색</option>
									</select>
								</div>
								<input class="form-control" id="keyvalue" type="text" placeholder="근무자 이름 검색" style="width: 70%;">
							</th>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-success btn-lg" onclick="searchFunction();" style="width: 50%;">검 색</button></td>
						</tr>
						<tbody id="search" ondragstart="onDrag(event)" />
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>