<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/adminProcess.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/table_custom.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<div class="content-wrapper">
		<div class="content_part" style="padding-left: 20px; padding-right: 20px; margin-top: 20px">
			<div class="datagrid" style="overflow-y: hidden;">
				<table>
					<thead style="font-size: 30px;">
						<tr>
							<th colspan="9">주간계획</th>
						</tr>
					</thead>
				</table>
				<form action="weekSave.do" method="post">
					<div class="datagrid" style="margin: 10px">
						<table>
							<tr>
								<td></td>
								<td>기 간</td>
								<td>월 요 일</td>
								<td>화 요 일</td>
								<td>수 요 일</td>
								<td>목 요 일</td>
								<td>금 요 일</td>
								<td>토 요 일</td>
								<td>일 요 일</td>
							</tr>
							<tr>
								<td style="width: 15%;">
								<select name="w_num" id="w_num" class="form-control" style="width:100px;">
									<option value="${cadre_group}-1">1</option>
									<option value="${cadre_group}-2">2</option>
									<option value="${cadre_group}-3">3</option>
									<option value="${cadre_group}-4">4</option>
									<option value="${cadre_group}-5">5</option>
									<option value="${cadre_group}-6">6</option>
								</select>&nbsp;&nbsp; 주차
								</td>
								<td><input type="text" name="weekly" id="weekly" class="form-control" placeholder=" - " /></td>
								<td><input type="text" name="w_monday" id="w_monday" class="form-control" placeholder=" - " /></td>
								<td><input type="text" name="w_tuesday" id="w_tuesday" class="form-control" placeholder=" - " /></td>
								<td><input type="text" name="w_wednesday" id="w_wednesday" class="form-control" placeholder=" - " /></td>
								<td><input type="text" name="w_thursday" id="w_thursday" class="form-control" placeholder=" - " /></td>
								<td><input type="text" name="w_friday" id="w_friday" class="form-control" placeholder=" - " /></td>
								<td><input type="text" name="w_saturday" id="w_saturday" class="form-control" placeholder=" - " /></td>
								<td><input type="text" name="w_sunday" id="w_sunday" class="form-control" placeholder=" - " /></td>
							</tr>
						</table>
					</div>
					<div style="margin: 5px">
						<input name="cadre_group" type="hidden" value="${cadre_group}">
						<input type="submit" class="btn btn-primary btn-lg btn-block" value="저 장" />
					</div>
				</form>
			</div>

			<!-- 입력한 값 리스트로 뿌려주기  -->
			<div class="datagrid" style="margin-top: 30px; overflow: hidden;">
				<table>
					<thead>
						<tr>
							<th colspan="10" style="font-size: 25px;">주 간 계 획 종 합</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 10%"></td>
							<td>기 간</td>
							<td>월 요 일</td>
							<td>화 요 일</td>
							<td>수 요 일</td>
							<td>목 요 일</td>
							<td>금 요 일</td>
							<td>토 요 일</td>
							<td>일 요 일</td>
							<td style="width: 20%"></td>
						</tr>
						<c:set var="num" value="1" />
						<c:forEach var="list" items="${list }">
							<tr>
								<td>${list.w_num }주차<input type="hidden" id="w_num_${num}"
									value="${list.w_num }">
								</td>
								<td>
									<div id="weeklyDate_${num}">${list.weekly }</div>
									<div id="weeklyUpdate_${num}" style="display: none;">
										<input type="text" id="weekly_${num }" class="form-control">
									</div>
								</td>
								<td>
									<div id="weeklyDate1_${num}">${list.w_monday }</div>
									<div id="weeklyUpdate1_${num}" style="display: none;">
										<input type="text" id="w_monday_${num }" class="form-control">
									</div>
								</td>
								<td>
									<div id="weeklyDate2_${num}">${list.w_tuesday }</div>
									<div id="weeklyUpdate2_${num}" style="display: none;">
										<input type="text" id="w_tuesday_${num }" class="form-control">
									</div>
								</td>
								<td>
									<div id="weeklyDate3_${num}">${list.w_wednesday }</div>
									<div id="weeklyUpdate3_${num}" style="display: none;">
										<input type="text" id="w_wednesday_${num }"
											class="form-control">
									</div>
								</td>
								<td>
									<div id="weeklyDate4_${num}">${list.w_thursday }</div>
									<div id="weeklyUpdate4_${num}" style="display: none;">
										<input type="text" id="w_thursday_${num }"
											class="form-control">
									</div>
								</td>
								<td>
									<div id="weeklyDate5_${num}">${list.w_friday }</div>
									<div id="weeklyUpdate5_${num}" style="display: none;">
										<input type="text" id="w_friday_${num }" class="form-control">
									</div>
								</td>
								<td>
									<div id="weeklyDate6_${num}">${list.w_saturday }</div>
									<div id="weeklyUpdate6_${num}" style="display: none;">
										<input type="text" id="w_saturday_${num }"
											class="form-control">
									</div>
								</td>
								<td>
									<div id="weeklyDate7_${num}">${list.w_sunday }</div>
									<div id="weeklyUpdate7_${num}" style="display: none;">
										<input type="text" id="w_sunday_${num }" class="form-control">
									</div>
								</td>
								<td>
									<div id="weeklyDate8_${num}">
										<button class="btn btn-warning" onclick="updateWeek(${num});"
											style="width: 48%">수 정</button>
										<a class="btn btn-primary"
											href="weekExcel.do?w_num=${list.w_num}" style="width: 48%">엑셀
											저장</a>
									</div>
									<div id="weeklyUpdate8_${num}" style="display: none;">
										<button class="btn btn_default btn-block btn-lg"
											onclick="update_s_week(${num})" style="width: 100%">수정완료</button>
									</div>
								</td>
							</tr>
							<c:set var="num" value="${num+1}" />
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>