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
			<form action="updateCadre.do" method="post"
				enctype="multipart/form-data">
				<div class="datagrid" style="overflow: hidden;">
					<table>
						<thead>
							<tr>
								<th style="font-size: xx-large; font-weight: bolder;">간부 신상
									정보</th>
							</tr>
						</thead>
					</table>
					<div class="datagrid" style="margin: 15px; overflow: hidden;">
						<table>
							<tr>
								<td rowspan="6" width="20%"><div class="picture">
										<img id="picture_scape"
											src="${pageContext.request.contextPath}/resources/uploadFiles/${cadre.cadre_picture}"
											alt="사진"
											style="max-width: 100%; min-height: 300px; height: auto; border-radius: 15px;">
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
									</div></td>
								<td width="10%" height="16%"
									style="font-size: 1.2em; font-weight: bolder;">이름</td>
								<td><input type="text" value="${cadre.cadre_name}"
									name="cadre_name" class="form-control"></td>
								<td width="10%" height="16%"
									style="font-size: 1.2em; font-weight: bolder;">군번</td>
								<td><input type="text" value="${cadre.cadre_number}"
									id="cadre_number" readonly="readonly" name="cadre_number"
									class="form-control"></td>
								<td width="10%" height="16%"
									style="font-size: 1.2em; font-weight: bolder;">계급</td>
								<td><select name="cadre_mmr" id="cadre_mmr"
									class="form-control">
										<c:if test="${cadre.cadre_mmr eq '하사'}">
											<option>-</option>
											<option id="1" selected>하사</option>
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
										</c:if>
										<c:if test="${cadre.cadre_mmr eq '중사'}">
											<option>-</option>
											<option id="1">하사</option>
											<option id="1" selected>중사</option>
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
										</c:if>
										<c:if test="${cadre.cadre_mmr eq '상사'}">
											<option>-</option>
											<option id="1">하사</option>
											<option id="1">중사</option>
											<option id="1" selected>상사</option>
											<option id="1">원사</option>
											<option id="1">준위</option>
											<option id="1">소위</option>
											<option id="1">중위</option>
											<option id="2">대위</option>
											<option id="2">소령</option>
											<option id="2">중령</option>
											<option id="2">대령</option>
											<option id="2">준장</option>
										</c:if>
										<c:if test="${cadre.cadre_mmr eq '원사'}">
											<option>-</option>
											<option id="1">하사</option>
											<option id="1">중사</option>
											<option id="1">상사</option>
											<option id="1" selected>원사</option>
											<option id="1">준위</option>
											<option id="1">소위</option>
											<option id="1">중위</option>
											<option id="2">대위</option>
											<option id="2">소령</option>
											<option id="2">중령</option>
											<option id="2">대령</option>
											<option id="2">준장</option>
										</c:if>
										<c:if test="${cadre.cadre_mmr eq '준위'}">
											<option>-</option>
											<option id="1">하사</option>
											<option id="1">중사</option>
											<option id="1">상사</option>
											<option id="1">원사</option>
											<option id="1" selected>준위</option>
											<option id="1">소위</option>
											<option id="1">중위</option>
											<option id="2">대위</option>
											<option id="2">소령</option>
											<option id="2">중령</option>
											<option id="2">대령</option>
											<option id="2">준장</option>
										</c:if>
										<c:if test="${cadre.cadre_mmr eq '소위'}">
											<option>-</option>
											<option id="1">하사</option>
											<option id="1">중사</option>
											<option id="1">상사</option>
											<option id="1">원사</option>
											<option id="1">준위</option>
											<option id="1" selected>소위</option>
											<option id="1">중위</option>
											<option id="2">대위</option>
											<option id="2">소령</option>
											<option id="2">중령</option>
											<option id="2">대령</option>
											<option id="2">준장</option>
										</c:if>
										<c:if test="${cadre.cadre_mmr eq '중위'}">
											<option>-</option>
											<option id="1">하사</option>
											<option id="1">중사</option>
											<option id="1">상사</option>
											<option id="1">원사</option>
											<option id="1">준위</option>
											<option id="1">소위</option>
											<option id="1" selected>중위</option>
											<option id="2">대위</option>
											<option id="2">소령</option>
											<option id="2">중령</option>
											<option id="2">대령</option>
											<option id="2">준장</option>
										</c:if>
										<c:if test="${cadre.cadre_mmr eq '대위'}">
											<option>-</option>
											<option id="1">하사</option>
											<option id="1">중사</option>
											<option id="1">상사</option>
											<option id="1">원사</option>
											<option id="1">준위</option>
											<option id="1">소위</option>
											<option id="1">중위</option>
											<option id="2" selected>대위</option>
											<option id="2">소령</option>
											<option id="2">중령</option>
											<option id="2">대령</option>
											<option id="2">준장</option>
										</c:if>
										<c:if test="${cadre.cadre_mmr eq '소령'}">
											<option>-</option>
											<option id="1">하사</option>
											<option id="1">중사</option>
											<option id="1">상사</option>
											<option id="1">원사</option>
											<option id="1">준위</option>
											<option id="1">소위</option>
											<option id="1">중위</option>
											<option id="2">대위</option>
											<option id="2" selected>소령</option>
											<option id="2">중령</option>
											<option id="2">대령</option>
											<option id="2">준장</option>
										</c:if>
										<c:if test="${cadre.cadre_mmr eq '중령'}">
											<option>-</option>
											<option id="1">하사</option>
											<option id="1">중사</option>
											<option id="1">상사</option>
											<option id="1">원사</option>
											<option id="1">준위</option>
											<option id="1">소위</option>
											<option id="1">중위</option>
											<option id="2">대위</option>
											<option id="2">소령</option>
											<option id="2" selected>중령</option>
											<option id="2">대령</option>
											<option id="2">준장</option>
										</c:if>
										<c:if test="${cadre.cadre_mmr eq '대령'}">
											<option>-</option>
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
											<option id="2" selected>대령</option>
											<option id="2">준장</option>
										</c:if>
										<c:if test="${cadre.cadre_mmr eq '준장'}">
											<option>-</option>
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
											<option id="2" selected>준장</option>
										</c:if>

										<c:if test="${cadre.cadre_mmr == null}">
											<option>-</option>
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
										</c:if>
								</select></td>
							</tr>
							<tr>
								<td width="10%" height="16%"
									style="font-size: 1.2em; font-weight: bolder;">주민등록번호</td>
								<td><input type="text" name="cadre_regidentNumber"
									value="${cadre.cadre_regidentNumber}" class="form-control"
									placeholder="주민등록번호 ex) 123456-1234567"></td>
								<td width="10%" height="16%"
									style="font-size: 1.2em; font-weight: bolder;">나이</td>
								<td><input type="text" value="${cadre.cadre_age}"
									name="cadre_age" class="form-control"></td>
								<td width="10%" height="16%"
									style="font-size: 1.2em; font-weight: bolder;">전화번호</td>
								<td><input type="text" value="${cadre.cadre_phone }"
									name="cadre_phone" class="form-control"
									placeholder="전화번호 ex) 010-1111-1234"></td>
							</tr>
							<tr>
								<td width="10%" height="16%"
									style="font-size: 1.2em; font-weight: bolder;">소속</td>
								<td colspan="2"><input type="text"
									value="${cadre.cadre_supergroup}" name="cadre_supergroup"
									id="cadre_supergroup" readonly="readonly" class="form-control"></td>

								<td><select name="cadre_group" id="cadre_group"
									class="form-control">

								</select></td>
								<td style="font-size: 1.2em; font-weight: bolder;">보직</td>
								<td><select id="cadre_position" name="cadre_position"
									class="form-control">
										<script>
											$(function() {
												var group_level = $('#cadre_mmr option:selected').attr('id');
												$('#cadre_group').empty();
												$('#cadre_position').empty();
												if (group_level == '1') {
													$('#cadre_supergroup').attr("value", "KOSTA사단 KOSTA연대 KOSTA대대");
										
													var group = [ "본부중대", "1중대", "2중대", "3중대" ];
													for (var i = 0; i < group.length; i++) {
														var option;
														if (group[i] == '${cadre.cadre_group}') {
															option = '<option selected>' + group[i] + '</option>';
														} else {
															option = '<option>' + group[i] + '</option>';
														}
														$('#cadre_group').append(option);
													}
										
													var position = [ '중대장', '행정보급관' ];
													for (var i = 0; i < position.length; i++) {
														var position_option;
														if (position[i] == '${cadre.cadre_position}') {
															position_option = '<option selected>' + position[i] + '</option>';
														} else {
															position_option = '<option>' + position[i] + '</option>';
														}
										
														$('#cadre_position').append(position_option);
													}
												} else if (group_level == '2') {
													$('#cadre_supergroup').attr("value", "KOSTA사단 KOSTA연대");
													var group = 'KOSTA대대';
													var option = $('<option>' + group + '</option>');
													$('#cadre_group').append(option);
										
													var position = [ '대대장', '군수과장', '인사과장', '작전과장' ];
													for (var i = 0; i < position.length; i++) {
														var position_option;
														if (position[i] == '${cadre.cadre_position}') {
															position_option = '<option selected>' + position[i] + '</option>';
														} else {
															position_option = '<option>' + position[i] + '</option>';
														}
										
														$('#cadre_position').append(position_option);
													}
												}
											});
										</script>
								</select></td>
							</tr>
							<tr>
								<td style="font-size: 1.2em; font-weight: bolder;">혈액형</td>
								<td><c:if test="${cadre.cadre_bloodType == null }">
										<select name="cadre_bloodType" class="form-control"
											style="width: 45%">
											<option>A</option>
											<option>B</option>
											<option>AB</option>
											<option>O</option>
										</select>&nbsp;&nbsp;
                              </c:if> <c:if
										test="${cadre.cadre_bloodType eq 'A' }">
										<select name="cadre_bloodType" class="form-control"
											style="width: 45%">
											<option selected>A</option>
											<option>B</option>
											<option>AB</option>
											<option>O</option>
										</select>&nbsp;&nbsp;
                                 </c:if> <c:if
										test="${cadre.cadre_bloodType eq 'B' }">
										<select name="cadre_bloodType" class="form-control"
											style="width: 45%">
											<option>A</option>
											<option selected>B</option>
											<option>AB</option>
											<option>O</option>
										</select>&nbsp;&nbsp;
                              </c:if> <c:if
										test="${cadre.cadre_bloodType eq 'AB' }">
										<select name="cadre_bloodType" class="form-control"
											style="width: 45%">
											<option>A</option>
											<option>B</option>
											<option selected>AB</option>
											<option>O</option>
										</select>&nbsp;&nbsp;
                              </c:if> <c:if
										test="${cadre.cadre_bloodType eq 'O' }">
										<select name="cadre_bloodType" class="form-control"
											style="width: 45%">
											<option>A</option>
											<option>B</option>
											<option>AB</option>
											<option selected>O</option>
										</select>&nbsp;&nbsp;
                              </c:if> <c:if
										test="${cadre.cadre_subbloodType == null }">
										<select name="cadre_subbloodType" class="form-control"
											style="width: 45%">
											<option>Rh+</option>
											<option>Rh-</option>
										</select>&nbsp;&nbsp;
                              </c:if> <c:if
										test="${cadre.cadre_subbloodType eq 'Rh+' }">
										<select name="cadre_subbloodType" class="form-control"
											style="width: 45%">
											<option selected>Rh+</option>
											<option>Rh-</option>
										</select>&nbsp;&nbsp;
                              </c:if> <c:if
										test="${cadre.cadre_subbloodType eq 'Rh-' }">
										<select name="cadre_subbloodType" class="form-control"
											style="width: 45%">
											<option>Rh+</option>
											<option selected>Rh-</option>
										</select>&nbsp;&nbsp;
                              </c:if></td>
								<td style="font-size: 1.2em; font-weight: bolder;">입대일</td>
								<td><input type="date" name="cadre_inputDate"
									value="<fmt:formatDate value="${cadre.cadre_inputDate }" pattern='yyyy-MM-dd'/>"
									class="form-control"></td>
								<td style="font-size: 1.2em; font-weight: bolder;">전역일</td>
								<td><input type="date" name="cadre_outputDate"
									value="<fmt:formatDate value="${cadre.cadre_outputDate }" pattern='yyyy-MM-dd'/>"
									class="form-control"></td>
							</tr>
							<tr>
								<td width="10%" height="16%"
									style="font-size: 1.2em; font-weight: bolder;">주소</td>
								<td colspan="5"><input type="text"
									value="${cadre.cadre_address }" name="cadre_address"
									class="form-control"></td>



							</tr>
							<tr>
								<td style="font-size: 1.2em; font-weight: bolder;">특이사항</td>
								<td colspan="5"><textarea
										style="resize: none; width: 100%; height: 200px;"
										class="form-control" name="cadre_remark">${cadre.cadre_remark } </textarea></td>



							</tr>
						</table>
					</div>



					<div style="text-align: center; margin: 15px">
						<c:if test="${cadre_num ==  cadre.cadre_number}">
							<input type="submit" class="btn btn-primary btn-lg" value="저장하기"
								style="width: 32%">
						</c:if>
						<se:authorize
							ifAnyGranted="ROLE_MANAGE_CAPTAIN, ROLE_MASTER_SERGEANT">
							<a href="cadreList.do" class="btn btn-info btn-lg"
								style="width: 32%">목록으로</a>
						</se:authorize>
						<input type="button" id="btn_changePassword"
							class="btn btn-warning btn-lg" value="비밀번호 변경" style="width: 32%">
					</div>
				</div>
			</form>
		</div>
	</div>


	<div class="modal" id="ChangePasswordModal" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content" style="margin-top: 45%">
					<div class="modal-header">
						<h5 class="modal-title">비밀번호 변경</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
					</div>

					<div class="modal-body">
						<form>
							<table class="table table-bordered">
								<tr>
									<td align="center"
										style="background-color: #F6F6F6; vertical-align: middle;">현재
										비밀번호</td>
									<td align="left"><input type="password"
										class="form-control" id="currentPassword"></td>
								</tr>
								<tr>
									<td align="center"
										style="background-color: #F6F6F6; vertical-align: middle;">변경
										비밀번호</td>
									<td align="left"><input type="password"
										class="form-control" id="NewPassword"></td>
								</tr>
								<tr>
									<td align="center"
										style="background-color: #F6F6F6; vertical-align: middle;">변경
										비밀번호 확인</td>
									<td align="left"><input type="password"
										class="form-control" id="NewPassword_compare"></td>
								</tr>
								<tr>
									<td colspan="2"><label id="label_passwordState"></label></td>
								</tr>
							</table>
						</form>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">돌아가기</button>
						&nbsp;&nbsp;
						<button type="button" class="btn btn-primary"
							id="btn_pwChangeComplete">변경하기</button>
					</div>
				</div>
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