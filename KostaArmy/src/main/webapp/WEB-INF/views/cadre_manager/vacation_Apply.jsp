<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include><meta
	http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href='${pageContext.request.contextPath}/resources/css/table_custom.css?ver=4'
	rel="stylesheet" />
<link rel='stylesheet'
	href='${pageContext.request.contextPath }/resources/css/fullcalendar.css' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath }/resources/css/fullcalendar.min.css' />
<script
	src='${pageContext.request.contextPath }/resources/js/moment.min.js'></script>
<script
	src='${pageContext.request.contextPath }/resources/js/fullcalendar.js'></script>
<script
	src='${pageContext.request.contextPath }/resources/js/vacationProcess.js'></script>
<script
	src="${pageContext.request.contextPath}/resources/js/sorttable.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var date = new Date();
				var text = '${jsonObject}';
				var obj = JSON.parse(text);
				var events_array = [];
				for ( var i in obj.list) {
					var vacation_object = {
						title : obj.list[i].vacation_name,
						start : obj.list[i].vacation_start1,
						end : obj.list[i].vacation_end1
					};
					events_array.push(vacation_object);
				}

				var calendar = $('#calendar')
						.fullCalendar(
								{
									defaultDate : '${fullcal}',
									lang : "ko",
									editable : false,
									eventLimit : false,
									header : {
										left : "",
										center : "title",
										right : "prev, next"
									},
									monthNames : [ "1월", "2월", "3월", "4월",
											"5월", "6월", "7월", "8월", "9월",
											"10월", "11월", "12월" ],
									monthNamesShort : [ "1월", "2월", "3월", "4월",
											"5월", "6월", "7월", "8월", "9월",
											"10월", "11월", "12월" ],
									dayNames : [ "일요일", "월요일", "화요일", "수요일",
											"목요일", "금요일", "토요일" ],
									dayNamesShort : [ "일", "월", "화", "수", "목",
											"금", "토" ],
									selectable : true,
									events : events_array
								});
			});
</script>
<style type='text/css'>
#calendar {
	width: 100%;
	margin: 0 auto;
}

.fc-sat {
	color: blue;
}

.fc-sun {
	color: red;
}

.fc-other-month {
	color: #BBBBBB;
}
</style>

<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- ============================================================================================================================== -->

	<div class="content-wrapper">
		<se:authorize access="hasRole('ROLE_MASTER_SERGEANT')">
			<div class="content_part"
				style="padding-left: 20px; padding-right: 20px; margin-top: 20px">
				<div class="supplyList_part">
					<div class="datagrid">
						<table>
							<thead>
								<tr>
									<th><h3>${group }&nbsp;&nbsp;출타신청</h3></th>
								</tr>
							</thead>
						</table>
						<div
							style="background-color: #E1E1E1; padding-top: 10px; padding-bottom: 10px; text-align: left;">
							<form action="search_vacation.do" method="post" align="center">
								<label
									style="background-color: #E7E7E7; margin-top: 5px; width: 80px; height: 40px; border-radius: 10px; font-size: 1.5em;">Search</label>
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
									name="m_search_table" value="manager_soldier" checked="checked">&nbsp;병
								사 <input type="radio" name="m_search_table"
									value="manager_cadre">&nbsp;간 부 <select
									name="m_search_part" class="form-control" style="width: 100px;">
									<option value="manager_num">군 번</option>
									<option value="manager_name">이 름</option>
								</select>&nbsp;&nbsp; <input size="30" class="form-control"
									style="width: 200px;" type="search" name="keyvalue"
									placeholder="중대원 검색"> &nbsp;&nbsp;&nbsp; <input
									type="submit" class="btn btn-default" value="검색">&nbsp;&nbsp;&nbsp;
								<a href="soldierOutSide_sub.do" class="btn btn-default">전체목록</a>
							</form>
						</div>
					</div>

					<div class="datagrid" style="height: 640px; overflow-y: auto;">
						<table class="sortable">
							<thead>
								<tr>
									<th>분류</th>
									<th>군 번</th>
									<th>이 름</th>
									<th>계 급</th>
									<th width="20%">최근 출타현황</th>
									<th>신청</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${part_flag == null}">
									<c:forEach var="soldier_list" items="${soldier_list }">
										<c:if test="${group == soldier_list.soldier_group }">
											<tr align="center">
												<td>병사 ${button_valid }</td>
												<td>${soldier_list.soldier_number }</td>
												<td>${soldier_list.soldier_name }</td>
												<td>${soldier_list.soldier_mmr }</td>
												<td width="20%">[<c:if
														test="${soldier_list.soldier_vacation == 'none' || soldier_list.soldier_vacation == null}">
												최근 출타 없음
											</c:if> <c:if test="${soldier_list.soldier_vacation != 'none' }">
												${soldier_list.soldier_vacation }
											</c:if>]<br> <fmt:formatDate
														value="${soldier_list.soldier_s_vacation }"
														pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
														value="${soldier_list.soldier_e_vacation }"
														pattern="yyyy-MM-dd" />
												</td>
												<td><c:if
														test="${soldier_list.soldier_v_flag == 0 && v_ing == 0 && v_agree == 0}">
														<button class="btn btn-info btn_soldieraddVacation"
															id="${soldier_list.soldier_number }/${soldier_list.soldier_name }/${soldier_list.soldier_mmr }/${soldier_list.soldier_group }">
															출타신청</button>
													</c:if> <c:if
														test="${soldier_list.soldier_v_flag == 0 && v_ing != 0 || v_agree != 0}">
														<button class="btn btn-info btn_soldieraddVacation"
															disabled="disabled"
															id="${soldier_list.soldier_number }/${soldier_list.soldier_name }/${soldier_list.soldier_mmr }/${soldier_list.soldier_group }">
															출타신청</button>
													</c:if> <c:if
														test="${soldier_list.soldier_v_flag == 1 && v_ing == 0 && v_agree == 0}">
														<a
															href='reset_vacation_apply.do?vacation_number=${soldier_list.soldier_number }'
															class="btn btn-default">신청취소</a>
													</c:if> <c:if
														test="${soldier_list.soldier_v_flag == 1 && v_ing != 0 || v_agree != 0}">

													</c:if></td>
												<td><c:if test="${soldier_list.soldier_v_flag == 0 }">
														<span class="label label-danger">출타 신청 가능</span>
													</c:if> <c:if test="${soldier_list.soldier_v_flag == 1 }">
														<span class="label label-default">출타 결제 대기</span>
													</c:if> <c:if test="${soldier_list.soldier_v_flag == 2 }">
														<span class="label label-success">출타 승인 완료</span>
													</c:if></td>
											</tr>
										</c:if>
									</c:forEach>
									<c:forEach var="cadre_list" items="${cadre_list }">
										<c:if test="${group == cadre_list.cadre_group }">
											<tr align="center">
												<td>간부</td>
												<td>${cadre_list.cadre_number }</td>
												<td>${cadre_list.cadre_name }</td>
												<td>${cadre_list.cadre_mmr }</td>
												<td width="20%">[<c:if
														test="${cadre_list.cadre_vacation == 'none' || cadre_list.cadre_vacation == null}">
												최근 출타 없음
											</c:if> <c:if test="${cadre_list.cadre_vacation != 'none' }">
												${cadre_list.cadre_vacation }
											</c:if>]<br> <fmt:formatDate
														value="${cadre_list.cadre_s_vacation }"
														pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
														value="${cadre_list.cadre_e_vacation }"
														pattern="yyyy-MM-dd" />
												</td>
												<td><c:if
														test="${cadre_list.cadre_v_flag == 0 && v_ing == 0 && v_agree == 0}">
														<button class="btn btn-info btn_cadreaddVacation"
															id="${cadre_list.cadre_number }/${cadre_list.cadre_name }/${cadre_list.cadre_mmr }/${cadre_list.cadre_group }">
															출타신청</button>
													</c:if> <c:if
														test="${cadre_list.cadre_v_flag == 0 && v_ing != 0 || v_agree != 0}">
														<button class="btn btn-info btn_cadreaddVacation"
															disabled="disabled"
															id="${cadre_list.cadre_number }/${cadre_list.cadre_name }/${cadre_list.cadre_mmr }/${cadre_list.cadre_group }">
															출타신청</button>
													</c:if> <c:if
														test="${cadre_list.cadre_v_flag == 1 && v_ing == 0 && v_agree == 0}">
														<a
															href='reset_vacation_apply.do?vacation_number=${cadre_list.cadre_number }'
															class="btn btn-default">신청취소</a>
													</c:if> <c:if
														test="${cadre_list.cadre_v_flag == 1 && v_ing != 0 || v_agree != 0}">
													</c:if></td>
												<td><c:if test="${cadre_list.cadre_v_flag == 0 }">
														<span class="label label-danger">출타 신청 가능</span>
													</c:if> <c:if test="${cadre_list.cadre_v_flag == 1 }">
														<span class="label label-default">출타 결제 대기</span>
													</c:if> <c:if test="${cadre_list.cadre_v_flag == 2 }">
														<span class="label label-success">출타 승인 완료</span>
													</c:if></td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${part_flag == 'manager_soldier'}">
									<c:forEach var="soldier_list" items="${soldier_list }">
										<c:if test="${group == soldier_list.soldier_group }">
											<tr align="center">
												<td>병사</td>
												<td>${soldier_list.soldier_number }</td>
												<td>${soldier_list.soldier_name }</td>
												<td>${soldier_list.soldier_mmr }</td>
												<td width="20%">[ <c:if
														test="${soldier_list.soldier_vacation == 'none' || soldier_list.soldier_vacation == null }">
												최근 출타 없음
											</c:if> <c:if test="${soldier_list.soldier_vacation != 'none' }">
												${soldier_list.soldier_vacation }
											</c:if> ]<br> <fmt:formatDate
														value="${soldier_list.soldier_s_vacation }"
														pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
														value="${soldier_list.soldier_e_vacation }"
														pattern="yyyy-MM-dd" />
												</td>
												<td><c:if
														test="${soldier_list.soldier_v_flag == 0 && v_ing == 0 && v_agree == 0}">
														<button class="btn btn-info btn_soldieraddVacation"
															id="${soldier_list.soldier_number }/${soldier_list.soldier_name }/${soldier_list.soldier_mmr }/${soldier_list.soldier_group }">
															출타신청</button>
													</c:if> <c:if
														test="${soldier_list.soldier_v_flag == 0 && v_ing != 0 || v_agree != 0}">
														<button class="btn btn-info btn_soldieraddVacation"
															disabled="disabled"
															id="${soldier_list.soldier_number }/${soldier_list.soldier_name }/${soldier_list.soldier_mmr }/${soldier_list.soldier_group }">
															출타신청</button>
													</c:if> <c:if
														test="${soldier_list.soldier_v_flag == 1 && v_ing == 0 && v_agree == 0}">
														<a
															href='reset_vacation_apply.do?vacation_number=${soldier_list.soldier_number }'
															class="btn btn-default">신청취소</a>
													</c:if> <c:if
														test="${soldier_list.soldier_v_flag == 1 && v_ing != 0 || v_agree != 0}">

													</c:if></td>
												<td><c:if test="${soldier_list.soldier_v_flag == 0 }">
														<span class="label label-danger">출타 신청 가능</span>
													</c:if> <c:if test="${soldier_list.soldier_v_flag == 1 }">
														<span class="label label-default">출타 결제 대기</span>
													</c:if> <c:if test="${soldier_list.soldier_v_flag == 2 }">
														<span class="label label-success">출타 승인 완료</span>
													</c:if></td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${part_flag == 'manager_cadre'}">
									<c:forEach var="cadre_list" items="${cadre_list }">
										<c:if test="${group == cadre_list.cadre_group }">
											<tr align="center">
												<td>간부</td>
												<td>${cadre_list.cadre_number }</td>
												<td>${cadre_list.cadre_name }</td>
												<td>${cadre_list.cadre_mmr }</td>
												<td width="20%">[<c:if
														test="${cadre_list.cadre_vacation == 'none' || cadre_list.cadre_vacation == null}">
												최근 출타 없음
											</c:if> <c:if test="${cadre_list.cadre_vacation != 'none' }">
												${cadre_list.cadre_vacation }
											</c:if>]<br> <fmt:formatDate
														value="${cadre_list.cadre_s_vacation }"
														pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
														value="${cadre_list.cadre_e_vacation }"
														pattern="yyyy-MM-dd" />
												</td>
												<td><c:if
														test="${cadre_list.cadre_v_flag == 0 && v_ing == 0 && v_agree == 0}">
														<button class="btn btn-info btn_cadreaddVacation"
															id="${cadre_list.cadre_number }/${cadre_list.cadre_name }/${cadre_list.cadre_mmr }/${cadre_list.cadre_group }">
															출타신청</button>
													</c:if> <c:if
														test="${cadre_list.cadre_v_flag == 0 && v_ing != 0 || v_agree != 0}">
														<button class="btn btn-info btn_cadreaddVacation"
															disabled="disabled"
															id="${cadre_list.cadre_number }/${cadre_list.cadre_name }/${cadre_list.cadre_mmr }/${cadre_list.cadre_group }">
															출타신청</button>
													</c:if> <c:if
														test="${cadre_list.cadre_v_flag == 1 && v_ing == 0 && v_agree == 0}">
														<a
															href='reset_vacation_apply.do?vacation_number=${cadre_list.cadre_number }'
															class="btn btn-default">신청취소</a>
													</c:if> <c:if
														test="${cadre_list.cadre_v_flag == 1 && v_ing != 0 || v_agree != 0}">
													</c:if></td>
												<td><c:if test="${cadre_list.cadre_v_flag == 0 }">
														<span class="label label-danger">출타 신청 가능</span>
													</c:if> <c:if test="${cadre_list.cadre_v_flag == 1 }">
														<span class="label label-default">출타 결제 대기</span>
													</c:if> <c:if test="${cadre_list.cadre_v_flag == 2 }">
														<span class="label label-success">출타 승인 완료</span>
													</c:if></td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>


				<div class="supplyBasket_part">
					<div id="calendar_part">
						<div id="calendar"></div>
					</div>
					<div class="datagrid">
						<table>
							<thead>
								<tr>
									<th width="20%">총원</th>
									<th width="20%">병사</th>
									<th width="20%">간부</th>
									<th width="20%">출타신청자</th>
									<th width="20%">상태</th>
								</tr>
							</thead>
							<tr>
								<td>${total_count }</td>
								<td>${soldier_count }</td>
								<td>${cadre_count }</td>
								<td>${receipt_count }</td>
								<td><c:if test="${v_ing != 0 }">
								결 제 처 리 중
							</c:if> <c:if test="${v_agree != 0 }">
								결 제 승 인 됨
							</c:if> <c:if test="${v_disagree != 0 }">
								결 제 취 소 됨
							</c:if></td>
							</tr>
							<tr align="center">
								<td colspan="5" style="width: 100%"><c:if
										test="${v_ing == 0 && v_agree == 0 && v_disagree == 0 }">
										<input id="btn_sendVacationInfo" name="${group }"
											type="button" class="btn btn-primary  btn-lg btn-block"
											value="결 제" />
									</c:if> <c:if test="${v_ing != 0 }">
										<input type="button" class="btn btn-warning btn-lg btn-block"
											value="결 제 중" disabled="disabled">
									</c:if> <c:if test="${v_agree != 0 }">
										<input type="button" class="btn btn-success btn-lg btn-block"
											value="결제확인"
											onclick="window.location.href='ok_bySergeant.do?vacation_group=${group}'">
									</c:if> <c:if test="${v_disagree != 0 }">
										<input type="button" class="btn btn-danger btn-lg btn-block"
											value="결제취소"
											onclick="window.location.href='reset_bySergeant.do?vacation_group=${group}'">
									</c:if></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</se:authorize>
	</div>

	<div class="modal" id="vacationModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		style="margin-top: 230px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">출타신청</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form">
						<table class="table table-bordered">
							<tr>
								<td>출 타 종 류</td>
								<td><select name="vacation_list" id="vacation_list"
									class="form-control" style="width: 100px;">
										<option value="신병">신 병</option>
										<option value="1차">1 차</option>
										<option value="2차">2 차</option>
										<option value="3차">3 차</option>
										<option value="포상">포 상</option>
										<option value="외출">외 출</option>
										<option value="외박">외 박</option>
										<option value="파견">파 견</option>
										<option value="입실">입 실</option>
								</select></td>
							</tr>
							<tr>
								<td>출 발 일</td>
								<td><input type="date" class="form-control"
									id="vacation_start" name="vacation_start" /></td>
							</tr>
							<tr>
								<td>복 귀 일</td>
								<td><input type="date" class="form-control"
									id="vacation_end" name="vacation_end" /></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button class="btn btn-default" type="button" data-dismiss="modal">돌아가기</button>
						&nbsp;&nbsp;&nbsp; <input type="button" class="btn btn-primary"
							id="btn_completeVacation" value="신청" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>