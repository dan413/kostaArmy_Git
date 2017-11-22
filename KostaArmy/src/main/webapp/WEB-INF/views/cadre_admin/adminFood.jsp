<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/table_custom.css" rel="stylesheet">
<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
   <!-- ============================================================================================================================== -->
   
    <div class="content-wrapper">
		<div class="content_part">
			<div class="container">
				<div class="datagrid" style="overflow-y: hidden;">
					<form method="post" action="AdminFoodExel.do">
						<table>
							<thead style="font-size: 30px;">
								<tr><th colspan="2">급양관리</th></tr>
							</thead>
							<tbody>
								<tr>
									<td style="width: 30%; font-weight: bolder; font-size: medium;">행정보급관</td>
									<td><input name="supplyName" class="form-control" type="text" placeholder="행정 보급관 이름"></td>
								</tr>
								<tr>
									<td style="font-weight: bolder; font-size: medium;">당직사관</td>
									<td><input name="officerName" class="form-control"
										type="text" placeholder="당직 사관 이름"></td>
								</tr>
								<tr>
									<td style="font-weight: bolder; font-size: medium;">날 짜</td>
									<td><input name="today" class="form-control" type="date" placeholder="날 짜"></td>
								</tr>
								<tr>
									<td style="font-weight: bolder; font-size: medium;">조 식</td>
									<td><textarea name="breakFast" class="form-control" maxlength="2048" style="height: 150px" placeholder="조 식"></textarea></td>
								</tr>
								<tr>
									<td style="font-weight: bolder; font-size: medium;">중 식</td>
									<td><textarea name="lunch" class="form-control" maxlength="2048" style="height: 150px" placeholder=" 중 식" /></textarea></td>
								</tr>
								<tr>
									<td style="font-weight: bolder; font-size: medium;">석 식</td>
									<td><textarea name="dinner" class="form-control" maxlength="2048" style="height: 150px" placeholder=" 석 식" /></textarea></td>
								</tr>
								<tr>
									<td style="font-weight: bolder; font-size: medium;">증 식</td>
									<td><textarea name="supplyFood" class="form-control" maxlength="2048" style="height: 150px" placeholder=" 증 식" /></textarea></td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="reset" class="btn btn-warning btn-lg " value="초기화" style="width: 49%"> 
										<input class="btn btn-primary btn-lg " type="submit" value="Excel저장" style="width: 49%">
									</td>
								</tr>
						</table>
					</from>
				</div>
			</div>
		</div>
	</div>
	<!-- ========================================================= -->

</body>
</html>