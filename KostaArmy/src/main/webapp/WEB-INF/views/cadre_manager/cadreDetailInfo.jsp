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
                     <td><c:if test="${cadre_num == cadre.cadre_number }">
                              ${cadre.cadre_regidentNumber }
                           </c:if> <c:if test="${cadre_num != cadre.cadre_number }">
                              표시 할 수 없습니다.
                           </c:if></td>
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
</body>
</html>