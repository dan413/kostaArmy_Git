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
                     <th style="font-size: xx-large; font-weight: bolder;">간부 신상
                        정보</th>
                  </tr>
               </thead>
            </table>
            <div class="datagrid" style="margin: 15px; overflow: hidden;">
               <table>
                  <tr>
                     <td rowspan="6" style="width: 20%"><div class="picture">
                           <img id="picture_scape"
                              src="${pageContext.request.contextPath}/resources/uploadFiles/${cadre.cadre_picture}"
                              alt="사진"
                              style="max-width: 100%; min-height: 300px; height: auto;">
                        </div></td>
                     <td width="8%" height="16%"
                        style="font-size: 1.2em; font-weight: bolder;">이름</td>
                     <td>${cadre.cadre_name }</td>
                     <td width="7%" height="16%"
                        style="font-size: 1.2em; font-weight: bolder;">군번</td>
                     <td width="12%">${cadre.cadre_number }</td>
                     <td width="7%" height="16%"
                        style="font-size: 1.2em; font-weight: bolder;">계급</td>
                     <td>${cadre.cadre_mmr }</td>
                  </tr>
                  <tr>
                     <td width="8%" height="16%"
                        style="font-size: 1.2em; font-weight: bolder;">주민등록번호</td>
                     <td>${cadre.cadre_regidentNumber }</td>
                     <td width="8%" height="16%"
                        style="font-size: 1.2em; font-weight: bolder;">나이</td>
                     <td style="width: 12%">${cadre.cadre_age }세</td>
                     <td width="8%" height="16%"
                        style="font-size: 1.2em; font-weight: bolder;">전화번호</td>
                     <td>${cadre.cadre_phone }</td>
                  </tr>
                  <tr>
                     <td width="8%" height="16%"
                        style="font-size: 1.2em; font-weight: bolder;">소속</td>
                     <td width="20%">${cadre.cadre_supergroup }  ${cadre.cadre_group }</td>
                     <td style="font-size: 1.2em; font-weight: bolder;">보직</td>
                     <td>${cadre.cadre_position }</td>
                     <td style="font-size: 1.2em; font-weight: bolder;">혈액형</td>
                     <td>${cadre.cadre_bloodType }/${cadre.cadre_subbloodType }</td>
                  </tr>
                  <tr>
                     <td width="8%" height="16%"
                        style="font-size: 1.2em; font-weight: bolder;">주소</td>
                     <td colspan="3">${cadre.cadre_address }</td>


                     <td style="font-size: 1.2em; font-weight: bolder;">복무기간</td>
                     <td><fmt:formatDate value="${cadre.cadre_inputDate }"
                           pattern='yyyy-MM-dd' /> ~ <fmt:formatDate
                           value="${cadre.cadre_outputDate }" pattern='yyyy-MM-dd' /></td>
                  </tr>
                  <tr>
                     <td style="font-size: 1.2em; font-weight: bolder;">특이사항</td>
                     <td colspan="5"><textarea disabled="true"
                           style="resize: none; height: 250px;" class="form-control"
                           name="soldier_remark">${cadre.cadre_remark }</textarea></td>
                  </tr>
               </table>
            </div>
            <div style="margin: 15px">
               <c:if test="${cadre_num ==  cadre.cadre_number}">
                  <a href="updateCadreForm.do?cadre_number=${cadre.cadre_number }"
                     class="btn btn-warning btn-lg " style="width: 49%">수정하기</a>
               </c:if>
               <se:authorize access="hasRole('ROLE_MANAGE_CAPTAIN')">
               	 <c:if test="${cadre_num !=  cadre.cadre_number}">
                  <input type="button" class="btn btn-primary btn-lg btn-upgradeMMR" value="진급처리" id="${cadre.cadre_number }" style="width: 49%">
              	 </c:if>
               </se:authorize>
               <a href="cadreList.do" class="btn btn-info btn-lg"
                  style="width: 49%">목록으로</a>
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
   
   <div class="modal" id="cadre_upgradeMMR_Modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #E0FFDB;">
					<h5 class="modal-title" id="exampleModalLabel">간부 진급 처리</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<h6 align="center">계급 / 소속을 모두 선택하세요.</h6>
					<br><br>
					<table class="table table-bordered" style="font-size: 0.8em;">
						<tr>
							<td align="center"
								style="background-color: #F6F6F6; vertical-align: middle;">계급</td>
							<td align="left"><select name="cadre_mmr" id="cadre_mmr" class="form-control">
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
									</select>
							</td>
						</tr>
						<tr>
							<td align="center"
								style="background-color: #F6F6F6; vertical-align: middle;">소속</td>
							<td align="left">
								<select name="cadre_group" id="cadre_group" class="form-control">
								</select>
							</td>
						</tr>
						<tr>
							<td align="center"
								style="background-color: #F6F6F6; vertical-align: middle;">보직</td>
							<td align="left"><select id="cadre_position" name="cadre_position"
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
								</select>
							</td>
						</tr>
					</table>

				</div>

				<div class="modal-footer">
					<button class="btn btn-default" type="button"
						data-dismiss="modal">돌아가기</button>
					&nbsp;&nbsp;&nbsp; <input type="button" class="btn btn-primary"
						value="진급처리" id="btn_cadreUpgradePro" />
				</div>

			</div>
		</div>
	</div>
   
   
</body>
</html>