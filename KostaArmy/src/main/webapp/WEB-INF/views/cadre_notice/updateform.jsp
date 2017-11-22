<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table_custom.css" type="text/css">
<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- ============================================================================================================================== -->
	<div class="content-wrapper">
		<se:authorize ifAnyGranted="ROLE_MASTER_SERGEANT, ROLE_SUPPLY_CAPTAIN, ROLE_MANAGE_CAPTAIN, ROLE_COMMANDER, ROLE_MISSION_CAPTAIN, ROLE_TROOP_LIEUTENENT">
			<div class="content_part" style="padding-left: 20px; padding-right: 20px;">
				<div class="supply_title" style="margin-top: 30px;">
					<div class="container">
						<div class="datagrid" style="overflow-y: hidden;">
							<table>
								<thead style="font-size: 30px;">
									<tr>
										<th colspan="2">공지사항 &nbsp <small>[글수정]</small></th>
									</tr>
								</thead>
							</table>
							<form action="update_notice.do?num=${list.num }" method="post">
								<div class="datagrid" style="margin: 10px">
									<table>
										<tr>
											<td style="font-weight: bolder; font-size: large;">제목</td>
											<td style="width: 70%;"><input type="text"
												class="form-control" name="title" placeholder="제목을 입력해주세요"
												required="required" value="${list.title }"></td>
										</tr>
										<tr>
											<td style="font-weight: bolder; font-size: large;">내용</td>
											<td><textarea class="form-control" name="content"
													id="content" placeholder="내용을 입력해주세요" maxlength="2048"
													style="height: 350px; resize: none;">${list.content}</textarea>
											</td>
										</tr>
										<tr align="center">
											<td colspan="2">
												<input type="submit" class="btn btn-success btn-lg" value="수정" style="width: 49%">
												<input type="button" type="button" class="btn btn-default btn-lg" value="취소"
												onclick="window.location.href='notice_list.do'" style="width: 49%">
											</td>
										</tr>
									</table>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</se:authorize>	
	</div>
</body>
</html>