<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/ko.js"></script>
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
<link
	href="${pageContext.request.contextPath}/resources/css/table_custom.css?ver=1"
	rel="stylesheet">
<script type="text/javascript">

	$(document).ready(function() {

		var date = new Date();

		var text = '${jsonObject}';
		var obj = JSON.parse(text);
		var events_array = [];

		for (var i in obj.list) {
			var vacation_object = {
				title : obj.list[i].vacation_name,
				start : obj.list[i].vacation_start1,
				end : obj.list[i].vacation_end1
			};
			events_array.push(vacation_object);
		}


		var calendar = $('#calendar').fullCalendar({
			lang : "ko",
			editable : false,
			eventLimit : false,
			header : {
				left : "",
				center : "title",
				right : "prev, next"
			},
			monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
			dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],

			selectable : true,
			selectHelper : false,
			editable : false,
			events : events_array
		});


	});
</script>
<style type='text/css'>
#calendar {
	width: 700px;
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

	<div class="content-wrapper">
		<div class="content_part">


			<div class="supplyList_part" style="width: 50%; margin-top: 30px;">
				<div class="datagrid" style="overflow: hidden;">
					<table>
						<thead>
							<tr>
								<th><h3>KOSTA 대대 휴가결제</h3></th>
							</tr>
						</thead>
					</table>
					<table>
						<tr
							style="background-color: #D5D5D5; font-style: normal; font-size: large; font-weight: bolder;">
							<td>중대</td>
							<td>상태</td>
							<td>조회</td>
						</tr>
						<c:if
							test="${center_v_count == 0 && squad1_v_count == 0 && squad2_v_count == 0 && squad3_v_count == 0 }">
							<tr align="center">
								<td colspan="3"
									style="height: 600px; vertical-align: middle; background-color: #fff;">
									결제가 올라온 휴가신청이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${center_v_count > 0}">
							<tr align="center">
								<td>본부중대</td>
								<td>결제대기</td>
								<td><input type="button" class="btn btn-primary btn-block"
									value="휴가 조회"
									onclick="window.location.href='search_vacation_Sign.do?m_search_table=본부중대'"></td>
							</tr>
						</c:if>
						<c:if test="${squad1_v_count > 0}">
							<tr align="center">
								<td>1중대</td>
								<td>결제대기</td>
								<td><input type="button" class="btn btn-primary btn-block"
									value="휴가 조회"
									onclick="window.location.href='search_vacation_Sign.do?m_search_table=1중대'"></td>
							</tr>
						</c:if>
						<c:if test="${squad2_v_count > 0}">
							<tr align="center">
								<td>2중대</td>
								<td>결제대기</td>
								<td><input type="button" class="btn btn-primary btn-block"
									value="휴가 조회"
									onclick="window.location.href='search_vacation_Sign.do?m_search_table=2중대'"></td>
							</tr>
						</c:if>
						<c:if test="${squad3_v_count > 0}">
							<tr align="center">
								<td>3중대</td>
								<td>결제대기</td>
								<td><input type="button" class="btn btn-primary btn-block"
									value="휴가 조회"
									onclick="window.location.href='search_vacation_Sign.do?m_search_table=3중대'"></td>
							</tr>
						</c:if>
					</table>
				</div>
			</div>
			<div class="supplyBasket_part" style="width: 50%;">
				<c:if test="${vacation_group != null }">
					<div class="supply_title" style="margin-top: 30px;">
						<h3 align="center">${vacation_group }</h3>
					</div>
					<div id='calendar' style="margin-top: 20px;">
						<div
							style="text-align: center; margin-top: 40px; width: 100%; align-content: center;">
							<a href='vacation_success.do?vacation_group=${vacation_group }'
								class="btn btn-success btn-lg " style="width: 48%"> 휴가승인 </a> <a
								href='vacation_refuse.do?vacation_group=${vacation_group }'
								class="btn btn-danger btn-lg " style="width: 48%"> 승인취소 </a>
						</div>
					</div>

				</c:if>
			</div>




		</div>
	</div>
</body>
</html>