<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table_custom.css" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/const/notice.css" rel="stylesheet">

<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
   <!-- ============================================================================================================================== -->
   
   <div class="content-wrapper">
		<se:authorize ifAnyGranted="ROLE_MASTER_SERGEANT, ROLE_SUPPLY_CAPTAIN, ROLE_MANAGE_CAPTAIN, ROLE_COMMANDER, ROLE_MISSION_CAPTAIN,
		ROLE_TROOP_LIEUTENENT">
			<div class="content_part"
				style="padding-left: 20px; padding-right: 20px;">
				<div class="supply_title" style="margin-top: 30px;">
					
						<div class="datagrid">
							<table>
								<thead style="font-size: 30px;">
									<tr>
										<th colspan="2">공지사항 &nbsp <small>[글보기]</small></th>
									</tr>
								</thead>
							</table>
							<div class="noticeList_part" style="heigth: 640px; width: 100%;">
								<div class="datagrid" style="margin: 10px; overflow-y: hidden;">
									<table style="heigth: 640px;">
										<tr>
											<td style="font-weight: bolder; font-size: large;">제목</td>
											<td colspan="2" align="left">${list.title}</td>
											<td style="font-weight: bolder; font-size: large;">작성날짜</td>
											<td colspan="2" align="left">${list.idate}</td>
										</tr>
										<tr>
											<td style="font-weight: bolder; font-size: large;">작성자</td>
											<td align="left">${list.mmr }&nbsp;&nbsp;&nbsp;${list.writer }</td>
											<td style="font-weight: bolder; font-size: large;">소속</td>
											<td align="left">${list.cadre_group }-${list.position }</td>
											<td style="font-weight: bolder; font-size: large;">조회수</td>
											<td align="left">${list.hit }</td>
										</tr>
										<tr>
											<td style="font-weight: bolder; font-size: large;">내용</td>
											<td colspan="5" style="height: 480px; text-align:left; word-break: break-all; table-layout: fixed; white-space: normal;">
												<textarea  style=" background-color:#fff; width:100%; height:470px; resize:none; border:none;" readonly="readonly">${list.content }</textarea>
											</td>
										</tr>
										<tr align="center">
											<td colspan="6">
											<input type="button" value="목록으로" style="width:200px;" class="btn btn-default" onclick="window.location.href='notice_list.do'">
												<c:if test="${cadre_num == list.cadre_num}">
													&nbsp;&nbsp;&nbsp;
													<input type="button" value="삭제" class="btn btn-danger" style="width:200px;"
													onclick="window.location.href='delete_notice.do?num=${ list.num }'">
													&nbsp;&nbsp;&nbsp;
													<input type="button" value="수정" class="btn btn-warning"  style="width:200px;"
													onclick="window.location.href='updateform_notice.do?num=${ list.num }'">
												</c:if>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
				</div>
			</div>
		</se:authorize>
		
	</div>
		
	
</body>
</html>