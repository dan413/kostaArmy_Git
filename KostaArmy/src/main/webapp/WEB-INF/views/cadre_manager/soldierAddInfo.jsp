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
	src="${pageContext.request.contextPath}/resources/js/soldierProcess.js"></script>
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
			style="padding-left: 20px; padding-right: 20px;">

			<form action="updateSoldier.do" method="post"
				enctype="multipart/form-data">

				<div class="datagrid" style="overflow: hidden;">
					<table>
						<thead>
							<tr>
								<th style="font-size: xx-large; font-weight: bolder;">병 상세
									정보</th>
							</tr>
						</thead>
					</table>


					<se:authorize access="hasRole('ROLE_MASTER_SERGEANT')">
						<div class="datagrid" style="overflow: hidden; margin: 15px;">
							<table style="min-height: auto;">
								<tr>
									<td rowspan="5" width="20%"
										style="z-index: 2; height: 100%; min-height: 450px;"><div
											class="picture"
											style="width: 100%; height: 100%; background-color: #fff; border: medium;">
											<img id="picture_scape"
												style="max-width: 100%; min-height: 300px; height: auto; border-radius: 15px;"
												src="${pageContext.request.contextPath}/resources/uploadFiles/${soldier_obj.soldier_picture}"
												alt="사진">
										</div> <label
										style="text-align: center; align: center; align-content: center; width: 50%; height: 100%; background-color: #F6F6F6; cursor: pointer; border: 1px solid #d5d5d5">사진
											선택 <input type="file" onchange="handleFileSelect()"
											id="btn_addImage" name="soldier_picture"
											class="btn btn-default"
											style="opacity: 0; text-align: center; cursor:pointer;">
									</label></td>
									<td width="10%" style="font-size: 1.2em; font-weight: bolder;">이름</td>
									<td align="left"><input type="text"
										value="${soldier_obj.soldier_name }" name="soldier_name"
										class="form-control"></td>
									<td width="10%" style="font-size: 1.2em; font-weight: bolder;">군번</td>
									<td align="left"><input type="text" readonly="readonly"
										value="${soldier_obj.soldier_number }" name="soldier_number"
										class="form-control"></td>
									<td width="10%" style="font-size: 1.2em; font-weight: bolder;">계급</td>
									<td align="left"><input type="text"
										value="${soldier_obj.soldier_mmr }" name="soldier_mmr"
										class="form-control"></td>
								</tr>
								<tr>
									<td height="20%" style="font-size: 1.2em; font-weight: bolder;">주민등록번호</td>
									<td><input type="text"
										value="${soldier_obj.soldier_regidentNumber }"
										name="soldier_regidentNumber" class="form-control"
										placeholder="주민등록번호 ex) 123456-1234567"></td>
									<td style="font-size: 1.2em; font-weight: bolder;">나이</td>
									<td><input type="text" name="soldier_age"
										value="${soldier_obj.soldier_age }" class="form-control"></td>
									<td style="font-size: 1.2em; font-weight: bolder;">전화번호</td>
									<td><input type="text"
										value="${soldier_obj.soldier_phone }" name="soldier_phone"
										class="form-control" placeholder="전화번호 ex) 010-1111-1234"></td>
								</tr>
								<tr>
									<td height="20%" style="font-size: 1.2em; font-weight: bolder;">병사
										소속</td>
									<td><input type="text"
										value="${soldier_obj.soldier_supergroup }/${soldier_obj.soldier_group }"
										name="soldier_groupFullName" class="form-control"></td>
									<td style="font-size: 1.2em; font-weight: bolder;">보직</td>
									<td><input type="text"
										value="${soldier_obj.soldier_position }"
										name="soldier_position" class="form-control"></td>
									<td style="font-size: 1.2em; font-weight: bolder;">혈액형</td>
									<td><c:if test="${soldier_obj.soldier_bloodType == null }">
											<select name="soldier_bloodType" class="form-control"
												style="width: 100px;">
												<option>A</option>
												<option>B</option>
												<option>AB</option>
												<option>O</option>
											</select>&nbsp;&nbsp;
									</c:if> <c:if test="${soldier_obj.soldier_bloodType eq 'A' }">
											<select name="soldier_bloodType" class="form-control"
												style="width: 100px;">
												<option selected>A</option>
												<option>B</option>
												<option>AB</option>
												<option>O</option>
											</select>&nbsp;&nbsp;
										</c:if> <c:if test="${soldier_obj.soldier_bloodType eq 'B' }">
											<select name="soldier_bloodType" class="form-control"
												style="width: 100px;">
												<option>A</option>
												<option selected>B</option>
												<option>AB</option>
												<option>O</option>
											</select>&nbsp;&nbsp;
									</c:if> <c:if test="${soldier_obj.soldier_bloodType eq 'AB' }">
											<select name="soldier_bloodType" class="form-control"
												style="width: 100px;">
												<option>A</option>
												<option>B</option>
												<option selected>AB</option>
												<option>O</option>
											</select>&nbsp;&nbsp;
									</c:if> <c:if test="${soldier_obj.soldier_bloodType eq 'O' }">
											<select name="soldier_bloodType" class="form-control"
												style="width: 100px;">
												<option>A</option>
												<option>B</option>
												<option>AB</option>
												<option selected>O</option>
											</select>&nbsp;&nbsp;
									</c:if> <c:if test="${soldier_obj.soldier_subbloodType == null }">
											<select name="soldier_subbloodType" class="form-control"
												style="width: 90px;">
												<option>Rh+</option>
												<option>Rh-</option>
											</select>&nbsp;&nbsp;
									</c:if> <c:if test="${soldier_obj.soldier_subbloodType eq 'Rh+' }">
											<select name="soldier_subbloodType" class="form-control"
												style="width: 90px;">
												<option selected>Rh+</option>
												<option>Rh-</option>
											</select>&nbsp;&nbsp;
									</c:if> <c:if test="${soldier_obj.soldier_subbloodType eq 'Rh-' }">
											<select name="soldier_subbloodType" class="form-control"
												style="width: 90px;">
												<option>Rh+</option>
												<option selected>Rh-</option>
											</select>&nbsp;&nbsp;
									</c:if></td>
								</tr>
								<tr>
									<td height="20%" style="font-size: 1.2em; font-weight: bolder;">주소</td>
									<td colspan="3"><input type="text" name="soldier_address"
										value="${soldier_obj.soldier_address }" class="form-control"></td>
									<td style="font-size: 1.2em; font-weight: bolder;">입대일</td>
									<td><input type="date" name="soldier_inputDate"
										value="<fmt:formatDate value="${soldier_obj.soldier_inputDate }" pattern='yyyy-MM-dd'/>"
										class="form-control"></td>

								</tr>
								<tr>
									<td height="20%" style="font-size: 1.2em; font-weight: bolder;">특이사항</td>
									<td colspan="3"><textarea 
											class="form-control" name="soldier_remark">${soldier_obj.soldier_remark } </textarea></td>
									<td style="font-size: 1.2em; font-weight: bolder;">전역일</td>
									<td><input type="date" name="soldier_outputDate"
										value="<fmt:formatDate value="${soldier_obj.soldier_outputDate }" pattern='yyyy-MM-dd'/>"
										class="form-control"></td>
								</tr>
								<tr>
								</tr>
							</table>
						</div>
						<div class="datagrid" style="margin: 15px">
							<table>
								<tr>
									<td rowspan="4" style="font-size: 1.2em; font-weight: bolder;">가족관계</td>
									<td style="background-color: #F6F6F6; vertical-align: middle;">관계</td>
									<td style="background-color: #F6F6F6; vertical-align: middle;">이름</td>
									<td style="background-color: #F6F6F6; vertical-align: middle;">나이</td>
									<td style="background-color: #F6F6F6; vertical-align: middle;">직업</td>
									<td style="background-color: #F6F6F6; vertical-align: middle;">전화번호</td>
								</tr>
								<tr align="center">
									<td><input type="text" class="form-control" name="famRel1"
										value="${famInfo.famRel1 }"></td>
									<td><input type="text" class="form-control"
										name="famName1" value="${famInfo.famName1 }"></td>
									<td><input type="text" class="form-control" name="famAge1"
										value="${famInfo.famAge1 }""></td>
									<td><input type="text" class="form-control" name="famJob1"
										value="${famInfo.famJob1 }""></td>
									<td><input type="text" class="form-control"
										name="famPhone1" value="${famInfo.famPhone1 }"></td>
								</tr>
								<tr align="center">
									<td><input type="text" class="form-control" name="famRel2"
										value="${famInfo.famRel2 }"></td>
									<td><input type="text" class="form-control"
										name="famName2" value="${famInfo.famName2 }"></td>
									<td><input type="text" class="form-control" name="famAge2"
										value="${famInfo.famAge2 }"></td>
									<td><input type="text" class="form-control" name="famJob2"
										value="${famInfo.famJob2 }"></td>
									<td><input type="text" class="form-control"
										name="famPhone2" value="${famInfo.famPhone2 }"></td>
								</tr>
								<tr align="center">
									<td><input type="text" class="form-control" name="famRel3"
										value="${famInfo.famRel3 }"></td>
									<td><input type="text" class="form-control"
										name="famName3" value="${famInfo.famName3 }"></td>
									<td><input type="text" class="form-control" name="famAge3"
										value="${famInfo.famAge3 }"></td>
									<td><input type="text" class="form-control" name="famJob3"
										value="${famInfo.famJob3 }"></td>
									<td><input type="text" class="form-control"
										name="famPhone3" value="${famInfo.famPhone3 }"></td>
								</tr>


							</table>
						</div>
						<div style="text-align: center; margin: 15px">
							<se:authorize access="hasRole('ROLE_MASTER_SERGEANT')">
								<input type="submit" class="btn btn-primary btn-lg" value="저장하기"
									style="width: 49%">
							</se:authorize>
							<a href="soldierList.do" class="btn btn-default btn-lg"
								style="width: 49%">목록으로</a>
						</div>
					</se:authorize>
					<!-- ======================================================================== -->
					<se:authorize access="hasRole('ROLE_MANAGE_CAPTAIN')">
						<div class="datagrid" style="overflow: hidden; margin: 15px;">
							<table style="min-height: auto;">
								<tr>
									<td rowspan="5" width="20%"
										style="z-index: 2; height: 100%; min-height: 450px;"><div
											class="picture"
											style="width: 100%; height: 100%; background-color: #fff; border: medium;">
											<img id="picture_scape" height="100%"
												src="${pageContext.request.contextPath}/resources/uploadFiles/${soldier_obj.soldier_picture}"
												alt="사진"
												style="max-width: 100%; min-height: 300px; height: auto; border-radius: 15px;">
										</div></td>
									<td width="10%" style="font-size: 1.2em; font-weight: bolder;">이름</td>
									<td>${soldier_obj.soldier_name }</td>
									<td width="10%" style="font-size: 1.2em; font-weight: bolder;">군번</td>
									<td>${soldier_obj.soldier_number }</td>
									<td width="10%" style="font-size: 1.2em; font-weight: bolder;">계급</td>
									<td>${soldier_obj.soldier_mmr }</td>
								</tr>
								<tr>
									<td height="20%" style="font-size: 1.2em; font-weight: bolder;">주민등록번호</td>
									<td>${soldier_obj.soldier_regidentNumber }</td>
									<td style="font-size: 1.2em; font-weight: bolder;">나이</td>
									<td>${soldier_obj.soldier_age }</td>
									<td style="font-size: 1.2em; font-weight: bolder;">전화번호</td>
									<td>${soldier_obj.soldier_phone }</td>
								</tr>
								<tr>
									<td height="20%" style="font-size: 1.2em; font-weight: bolder;">병사
										소속</td>
									<td>${soldier_obj.soldier_supergroup }/${soldier_obj.soldier_group }</td>
									<td style="font-size: 1.2em; font-weight: bolder;">보직</td>
									<td>${soldier_obj.soldier_position }</td>
									<td style="font-size: 1.2em; font-weight: bolder;">혈액형</td>
									<td><c:if test="${soldier_obj.soldier_bloodType == null }">

										</c:if> <c:if test="${soldier_obj.soldier_bloodType eq 'A' }">
											A
										</c:if> <c:if test="${soldier_obj.soldier_bloodType eq 'B' }">
										B
									</c:if> <c:if test="${soldier_obj.soldier_bloodType eq 'AB' }">
											AB
									</c:if> <c:if test="${soldier_obj.soldier_bloodType eq 'O' }">
										O
									</c:if> <c:if test="${soldier_obj.soldier_subbloodType == null }">

										</c:if> <c:if test="${soldier_obj.soldier_subbloodType eq 'Rh+' }">
											Rh+
									</c:if> <c:if test="${soldier_obj.soldier_subbloodType eq 'Rh-' }">
										Rh-
									</c:if></td>
								</tr>
								<tr>
									<td height="20%" style="font-size: 1.2em; font-weight: bolder;">주소</td>
									<td colspan="3">${soldier_obj.soldier_address }</td>
									<td style="font-size: 1.2em; font-weight: bolder;">입대일</td>
									<td>${soldier_obj.soldier_inputDate }</td>

								</tr>
								<tr>
									<td height="20%" style="font-size: 1.2em; font-weight: bolder;">특이사항</td>
									<td colspan="3">${soldier_obj.soldier_remark }</td>
									<td style="font-size: 1.2em; font-weight: bolder;">전역일</td>
									<td>${soldier_obj.soldier_outputDate }</td>
								</tr>
								<tr>
								</tr>
							</table>
						</div>
						<div class="datagrid" style="margin: 15px">
							<table>
								<tr>
									<!-- <td rowspan="4" style="width: 20%"></td> -->
									<td rowspan="4" style="font-size: 1.2em; font-weight: bolder;">가족관계</td>
									<td style="background-color: #F6F6F6; vertical-align: middle;">관계</td>
									<td style="background-color: #F6F6F6; vertical-align: middle;">이름</td>
									<td style="background-color: #F6F6F6; vertical-align: middle;">나이</td>
									<td style="background-color: #F6F6F6; vertical-align: middle;">직업</td>
									<td style="background-color: #F6F6F6; vertical-align: middle;">전화번호</td>
								</tr>
								<tr>
									<td height="52.2px">${famInfo.famRel1 }</td>
									<td>${famInfo.famName1 }</td>
									<td>${famInfo.famAge1 }</td>
									<td>${famInfo.famJob1 }</td>
									<td>${famInfo.famPhone1 }</td>
								</tr>
								<tr>
									<td height="52.2px">${famInfo.famRel2 }</td>
									<td>${famInfo.famName2 }</td>
									<td>${famInfo.famAge2 }</td>
									<td>${famInfo.famJob2 }</td>
									<td>${famInfo.famPhone2 }</td>
								</tr>
								<tr>
									<td height="52.2px">${famInfo.famRel3 }</td>
									<td>${famInfo.famName3 }</td>
									<td>${famInfo.famAge3 }</td>
									<td>${famInfo.famJob3 }</td>
									<td>${famInfo.famPhone3 }</td>
								</tr>
							</table>
						</div>
						<div style="text-align: center; margin: 15px">
							<se:authorize access="hasRole('ROLE_MASTER_SERGEANT')">
								<input type="submit" class="btn btn-primary btn-lg" value="저장하기"
									style="width: 49%">
								<a href="soldierList.do" class="btn btn-info btn-lg"
									style="width: 49%">목록으로</a>
							</se:authorize>
							<a href="soldierList.do" class="btn btn-info btn-lg"
								style="width: 100%">목록으로</a>
						</div>
					</se:authorize>
				</div>
			</form>
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