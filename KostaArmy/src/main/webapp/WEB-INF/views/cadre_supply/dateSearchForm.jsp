<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/supplyProcess.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sorttable.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/print.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/table_custom.css" rel="stylesheet">

<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
   <div class="content-wrapper">
      <se:authorize ifAnyGranted="ROLE_MASTER_SERGEANT, ROLE_SUPPLY_CAPTAIN">
         <div class="content_part"
            style="padding-left: 20px; padding-right: 20px;">


            <div class="datagrid" style="overflow: hidden;">
               <table>
                  <thead>
                     <tr>
                        <th style="font-size: xx-large; font-weight: bolder;">결제 내역
                           & 소비 내역</th>
                     </tr>
                  </thead>
               </table>

               <div
                  style="background-color: #F6F6F6; padding-top: 10px; padding-bottom: 10px; text-align: center;">
                  <form action="dateSearch.do" method="post">
                     <label
                        style="background-color: #E7E7E7; margin-top: 5px; width: 80px; height: 40px; border-radius: 10px; font-size: 1.5em;">Search</label>&nbsp;&nbsp;&nbsp;
                     <input type="radio" name="receipt_type" value="0"
                        checked="checked">보급 <input type="radio"
                        name="receipt_type" value="1">소비 &nbsp;&nbsp;
                     <!-- 응 여기에요~~~~~~~~~~~~~~~~~@@@@@@@@@@@@@@@@@@$@#%#$^&#$%^&*#%^*#%^*#%$^ㅉ*$^&$#%#$#$%#$% -->
                     <input type="date" class="form-control"
                        placeholder="날짜를 선택해주세요." name="date_search"
                        style="width: 200px;">&nbsp;&nbsp;&nbsp; <input
                        type="submit" id="btn_receiptSearch" class="btn btn-default"
                        value="검색"> &nbsp;&nbsp;&nbsp;<a
                        href="dateSearchForm.do" class="btn btn-default">전체목록</a>
                     <a onclick="javascript:btn_printDate(document.getElementById('print_page').innerHTML)" class="btn btn-default">인 쇄 </a>
                  </form>
               </div>
            </div>
            <div class="datagrid" style="height: 670px; overflow-y: auto;">
            <div id="print_page"> <!-- 프린트 영역 -->
               <table class="sortable" style="text-align: center;">
                  <thead style="z-index: 0";>
                     <tr>
                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">신청날짜</th>
                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">중대</th>
                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">일련번호</th>
                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">이름</th>
                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">신청수량</th>
                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">소비수량</th>
                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">재고량</th>
                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">비고</th>
                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">소비사유</th>
                     </tr>
                  </thead>
                  <tbody>
                     <se:authorize access="hasRole('ROLE_MASTER_SERGEANT')">
                        <c:forEach items="${list}" var="list">
                           <c:if test="${list.supply_group == group }">
                              <c:if test="${list.supply_r_flag == 0 }">
                                 <tr>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;"><fmt:formatDate value="${list.supply_r_date }"
                                          pattern="yyyy-MM-dd" /></td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_group }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_num }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_name }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_order }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">-</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_total }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">신청</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">-</td>
                                 </tr>
                              </c:if>
      
                              <c:if test="${list.supply_r_flag == 1 }">
                                 <tr>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;"><fmt:formatDate value="${list.supply_r_date }"
                                          pattern="yyyy-MM-dd" /></td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_group }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_num }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_name }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">-</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_consumeCount }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_total }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">소비</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${list.supply_r_comments }</td>
                                 </tr>
                              </c:if>
                           </c:if>
                        </c:forEach>
                     </se:authorize>
                     <se:authorize access="hasRole('ROLE_SUPPLY_CAPTAIN')">
                        <c:forEach items="${list}" var="list">
                              <c:if test="${list.supply_r_flag == 0 }">
                                 <tr>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;"><fmt:formatDate value="${list.supply_r_date }"
                                          pattern="yyyy-MM-dd" /></td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_group }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_num }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_name }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_order }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">-</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_total }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">신청</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">-</td>
                                 </tr>
                              </c:if>
      
                              <c:if test="${list.supply_r_flag == 1 }">
                                 <tr>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;"><fmt:formatDate value="${list.supply_r_date }"
                                          pattern="yyyy-MM-dd" /></td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_group }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_num }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_name }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">-</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_consumeCount }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_r_total }</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">소비</td>
                                    <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${list.supply_r_comments }</td>
                                 </tr>
                              </c:if>
                        </c:forEach>
                     </se:authorize>
                  </tbody>
               </table>
            </div>
            </div>
         </div>
      </se:authorize>
   </div>
</body>
</html>