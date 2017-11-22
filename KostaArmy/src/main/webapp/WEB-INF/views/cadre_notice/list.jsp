<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/const/notice.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/table_custom.css" rel="stylesheet">

<script>
	function list(page) { //페이징 처리(페이지 번호에 맞는 리스트 출력을 위함)
		location.href = "notice_list.do?curPage=" + page;
	}
	function deptlist(dept,page) { //페이징 처리(페이지 번호에 맞는 리스트 출력을 위함)
	      location.href = "notice_dept_list.do?dept="+dept+"&curPage=" + page;
	}	
</script>

<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
   <!-- ============================================================================================================================== -->

	<div class="content-wrapper">

		<se:authorize ifAnyGranted="ROLE_MASTER_SERGEANT, ROLE_SUPPLY_CAPTAIN, ROLE_MANAGE_CAPTAIN, ROLE_COMMANDER, ROLE_MISSION_CAPTAIN,
		ROLE_TROOP_LIEUTENENT">
			<div class="content_part"
				style="padding-left: 20px; padding-right: 20px;">
				<div class="notice_title" style="margin-top: 30px;">
					<div class="datagrid" style="overflow-y: hidden;">
						<table>
							<thead style="font-size: 30px;">
								<th colspan="2">공지사항 &nbsp <small>[리스트]</small></th>
							</thead>
						</table>

						<div class="noticeTitle_part">
							<div align="center" style="margin-top: 45px">
								<a href="notice_list.do"
									style="text-decoration: none; color: #000; font-size: 0.8em">
									<div class="all_notice">전체</div>
								</a> <a href="notice_dept_list.do?dept=군수"
									style="text-decoration: none; color: #000; font-size: 0.8em">
									<div class="supply_notice">군수</div>
								</a> <a href="notice_dept_list.do?dept=인사"
									style="text-decoration: none; color: #000; font-size: 0.8em">
									<div class="person_notice">인사</div>
								</a> <a href="notice_dept_list.do?dept=행정"
									style="text-decoration: none; color: #000; font-size: 0.8em">
									<div class="manage_notice">행정</div>
								</a>
							</div>
						</div>

						<div class="noticeList_part">
							<se:authorize ifAnyGranted="ROLE_MASTER_SERGEANT, ROLE_SUPPLY_CAPTAIN, ROLE_MANAGE_CAPTAIN, ROLE_COMMANDER, ROLE_MISSION_CAPTAIN">
							<input type="button" class="btn btn-primary btn-lg btn-block"
								onclick="window.location.href='writeform_notice.do'" value="글쓰기"
								style="margin-top: 10px">
							</se:authorize>	
							<se:authorize ifAnyGranted="ROLE_TROOP_LIEUTENENT">
							<input type="button" class="btn btn-primary btn-lg btn-block"
								onclick="window.location.href='writeform_notice.do'" value="글쓰기 (권한이 없습니다.)" disabled="true"
								style="margin-top: 10px">
							</se:authorize>
							<div class="datagrid" style="overflow-y: hidden;">
								<table>
									<thead style="font-size: 0.8em;">
										<tr>
											<th>글번호</th>
											<th style="width: 33%">제목</th>
											<th>부서</th>
											<th>보직</th>
											<th>소속</th>
											<th>계급</th>
											<th>작성자</th>
											<th>조회수</th>
											<th>날짜</th>
										</tr>
									</thead>

									<c:forEach items="${ map.list }" var="list" varStatus="status">
										<tr align="center" onclick="test(this)">
											<td>${list.num }</td>
											<td style="width: 33%; overflow: hidden; text-overflow: ellipsis;"><a style="text-decoration: none; cursor: pointer; color:#000;"
												href="detail_notice.do?num=${ list.num }"> ${ list.title }
											</a></td>
											<td>${ list.dept }</td>
											<td>${ list.position }</td>
											<td>${ list.cadre_group }</td>
											<td>${ list.mmr }</td>
											<td>${ list.writer}</td>
											<td>${ list.hit }</td>
											<td><fmt:formatDate value="${list.idate}"
													pattern="yyyy-MM-dd"/></td>


										</tr>
									</c:forEach>

									<c:forEach items="${list }" var="list" varStatus="status">
										<tr align="center" onclick="test(this)">
											<td>${list.num }</td>
											<td style="width: 33%; overflow: hidden; text-overflow: ellipsis;"><a style="text-decoration: none; cursor: pointer; color:#000;"
												href="detail_notice.do?num=${ list.num }"> ${ list.title }
											</a></td>
											<td>${list.dept }</td>
											<td>${ list.position }</td>
											<td>${ list.cadre_group }</td>
											<td>${ list.mmr }</td>
											<td>${ list.writer}</td>
											<td>${ list.hit }</td>
											<td><fmt:formatDate value="${list.idate}"
													pattern="yyyy-MM-dd" /></td>
											<c:set var="pagedept" value="${ list.dept }" />
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
						<div
							style="margin-top: 640px; margin-left: 20px; height: 50px; background-color: #fff; text-align: center;">
							<c:if test="${map.paging.blockBegin == 1}">
								<c:forEach var="num" begin="${map.paging.blockBegin}"
									end="${map.paging.blockEnd}">
									<c:choose>
										<c:when test="${num == map.paging.curPage}">
											<span class="btn btn-success">${num}</span>&nbsp;
	                                       </c:when>
										<c:otherwise>
											<a class="btn btn-default" href="javascript:list('${num}')">${num}</a>&nbsp;
	                                    </c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
							<c:if test="${deptmap.paging.blockBegin == 1}">
								<c:forEach var="num" begin="${deptmap.paging.blockBegin}"
									end="${deptmap.paging.blockEnd}">

									<c:choose>
										<c:when test="${num == deptmap.paging.curPage}">
											<span class="btn btn-success">${num}</span>&nbsp;
	                                       </c:when>
										<c:otherwise>
											<a class="btn btn-default"
												href="javascript:deptlist('${pagedept}','${num}')">${num}</a>&nbsp;
	                                       </c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</se:authorize>
	</div>
</body>
</html>