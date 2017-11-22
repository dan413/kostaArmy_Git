<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<script
	src="${pageContext.request.contextPath}/resources/js/cadreProcess.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="${pageContext.request.contextPath}/resources/css/const/soldierList.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/table_custom.css"
	rel="stylesheet">
<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">

	<div class="content-wrapper">
		<div class="content_part"
			style="padding-left: 20px; padding-right: 20px; margin-top: 20px">
			<div class="datagrid" style="overflow: hidden;">
				<table>
					<thead>
						<tr>
							<th style="font-size: xx-large; font-weight: bolder;">간부 신규
								등록</th>
						</tr>
					</thead>
				</table>
				<form action="addNewCadre.do" method="post"
					enctype="multipart/form-data">

					<se:authorize access="hasRole('ROLE_MANAGE_CAPTAIN')">
						<div class="datagrid"
							style="margin: 15px; height: auto; overflow: hidden;">
							<table>
								<tbody>
									<tr>
										<td rowspan="6" style="width: 20%"><div class="picture"
												style="width: 100%; min-height: 300px; background-color: #fff; border: medium;">
												<img id="picture_scape" width="100%" height="100%" src=""
													alt="사진" />
											</div>

											<div class="picture_btn"
												style="height: 50px; background-color: #fff; padding: 5px; align: center; border: 1px solid #d5d5d5;">
												<label
													style="text-align: center; width: 50%; height: 100%; background-color: #F6F6F6; cursor: pointer; border: 1px solid #d5d5d5">사진
													선택 <input type="file" onchange="handleFileSelect()"
													id="btn_addImage" name="cadre_picture"
													class="btn btn-default"
													style="opacity: 0; text-align: center;">
												</label>
											</div>
										<td width="180px" height="60px"
											style="font-size: 1.2em; font-weight: bolder;">이름</td>
										<td><input type="text" name="cadre_name"
											class="form-control"></td>
										<td width="180px"
											style="font-size: 1.2em; font-weight: bolder;">군번</td>
										<td><input type="text" name="cadre_number"
											class="form-control"></td>
										<td width="180px"
											style="font-size: 1.2em; font-weight: bolder;">계급</td>
										<td style=""><select name="cadre_mmr" id="cadre_mmr"
											class="form-control">
												<option>선택</option>
												<option id="1">하사</option>
												<option id="1">중사</option>
												<option id="1">상사</option>
												<option id="1">원사</option>
												<option id="1">준위</option>
												<option id="1">소위</option>
												<option id="1">중위</option>
												<option id="2">대위</option>
												<option id="2">소령</option>
												<option id="2">중령</option>
												<option id="2">대령</option>
												<option id="2">준장</option>
										</select></td>
									</tr>
									<tr>
										<td height="60px"
											style="font-size: 1.2em; font-weight: bolder;">주민등록번호</td>
										<td><input type="text" name="cadre_regidentNumber"
											class="form-control" placeholder="주민등록번호 ex) 123456-1234567"></td>
										<td height="60px"
											style="font-size: 1.2em; font-weight: bolder;">나이</td>
										<td><input type="text" name="cadre_age"
											class="form-control"></td>
										<td height="60px"
											style="font-size: 1.2em; font-weight: bolder;">전화번호</td>
										<td><input type="text" name="cadre_phone"
											class="form-control" placeholder="전화번호 ex) 010-1111-1234"></td>
									</tr>
									<tr>
										<td height="60px"
											style="font-size: 1.2em; font-weight: bolder;">소속</td>
										<td><input type="text" name="cadre_supergroup"
											id="cadre_supergroup" readonly="readonly"
											class="form-control" style="width: 48%"> <select
											name="cadre_group" id="cadre_group" class="form-control"
											style="width: 48%">
										</select></td>
										<td height="60px"
											style="font-size: 1.2em; font-weight: bolder;">보직</td>
										<td><select id="cadre_position" name="cadre_position"
											class="form-control">
										</select></td>
										<td height="60px"
											style="font-size: 1.2em; font-weight: bolder;">혈액형</td>
										<td><select name="cadre_bloodType" class="form-control"
											style="width: 48%">
												<option>A</option>
												<option>B</option>
												<option>AB</option>
												<option>O</option>
										</select>&nbsp;<select name="cadre_subbloodType" class="form-control"
											style="width: 48%">
												<option>Rh+</option>
												<option>Rh-</option>
										</select></td>
									</tr>
									<tr>
										<td height="60px"
											style="font-size: 1.2em; font-weight: bolder;">주소</td>
										<td colspan="5"><input type="text" name="cadre_address"
											class="form-control"></td>
									</tr>
									<tr>
										<td height="60px"
											style="font-size: 1.2em; font-weight: bolder;">입대일</td>
										<td colspan="2"><input type="date"
											name="cadre_inputDate" class="form-control"
											style="width: 90%">
										<td height="60px"
											style="font-size: 1.2em; font-weight: bolder;">전역일</td>
										<td colspan="2"><input type="date"
											name="cadre_outputDate" class="form-control"
											style="width: 90%">
									</tr>
									<tr>
										<td style="font-size: 1.2em; font-weight: bolder;">특이사항</td>
										<td colspan="5"><textarea
												style="resize: none; width: 100%; height: 130px;"
												class="form-control" name="cadre_remark">${soldier_obj.soldier_remark } </textarea></td>
									</tr>

								</tbody>
							</table>
						</div>
						<div style="text-align: center; margin: 15px">
							<se:authorize access="hasRole('ROLE_MANAGE_CAPTAIN')">
								<input type="submit" class="btn btn-primary btn-lg"
									style="width: 49%" value="저장하기">
							</se:authorize>
							<a href="cadreList.do" class="btn btn-secondary btn-lg"
								style="width: 49%">목록으로</a>
						</div>
					</se:authorize>
				</form>
			</div>
		</div>
	</div>

	<c:if test="${patternError != null }">
		<script>
				$('#message').html('${patternError}');
				$('#messageType').css('background-color', '#CEF279');
				$('#messageModal').modal("show");
				<%request.getSession().removeAttribute("patternError");%>
			</script>
	</c:if>
	<c:if test="${successInput != null }">
		<script>
				$('#message').html('${successInput}');
				$('#messageType').css('background-color', '#CEF279');
				$('#messageModal').modal("show");
				<%request.getSession().removeAttribute("successInput");%>
			</script>
	</c:if>
</body>
</html>