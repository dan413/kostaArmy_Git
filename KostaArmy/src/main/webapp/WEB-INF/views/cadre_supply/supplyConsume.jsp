<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
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
      <se:authorize access="hasRole('ROLE_MASTER_SERGEANT')">
         <div class="content_part" style="padding-left: 20px; padding-right: 20px;">
			<div class="datagrid" style="overflow: hidden;">
				<table>
					<thead>
						<tr>
							<th style="font-size: xx-large; font-weight: bolder;">보급 관리
								& 소비</th>
						</tr>
					</thead>
				</table>
				<div style="background-color: #E1E1E1; padding-top: 10px; padding-bottom: 10px; text-align: left;">
					<form action="search_supply_order.do" method="post" align="center">
						<label style="background-color: #E7E7E7; margin-top: 5px; width: 80px; height: 40px; border-radius: 10px; font-size: 1.5em;">Search</label>
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" name="s_search_table" value="supply_normal" checked="checked">&nbsp;일반물자
						<input type="radio" name="s_search_table" value="supply_complete">&nbsp;소모물자
						<select name="s_search_part" class="form-control" style="width: 120px;">
							<option value="supply_num">일련번호</option>
							<option value="supply_name">품명</option>
						</select>&nbsp;&nbsp; 
						<input size="30" class="form-control" style="width: 200px;" type="search" name="keyvalue" placeholder="물자를 검색합니다."> &nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="submit" class="btn btn-default" value="검색">&nbsp;
						<a class="btn btn-default" role="button" href="order_getCurrentApplyList.do">모든 품목보기</a> 
						<a onclick="javascript:btn_printSupply(document.getElementById('print_page').innerHTML)" class="btn btn-default">인 쇄 </a>
					</form>
				</div>
			</div>


			<div class="datagrid" style="height: 670px; overflow-y: auto;">
	            <div id="print_page"> <!-- 프린트 영역 -->
	               <table class="sortable" style="text-align: center;">
	                  <thead>
	                     <tr>
	                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">일련번호</th>
	                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">분류</th>
	                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">이름</th>
	                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">재고량</th>
	                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">처리</th>
	                        <th style="border-bottom:3px double #ddd;border-right:0.5px solid #ddd; border-top: 0.5px solid #ddd;">비고</th>
	                     </tr>
	                  </thead>
	                  <tbody>
	                     <c:forEach var="list" items="${list }">
	                        <tr>
	                           <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_num }</td>
	                           <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">
		                           <c:if test="${list.supply_flag == 0 }">일반</c:if>
		                    	   <c:if test="${list.supply_flag != 0 }">소모</c:if>
	                    	   </td>
	                           <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_name }</td>
	                           <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">${ list.supply_total }</td>
	                           <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">
	                           	 <c:if test="${list.supply_total != 0 }">
	                          	 <input type="button" class="btn btn-warning btn_rewriteTotal" value="재고수정" id="${list.supply_num }" style="width: 100%; height: 33%; border:0px;">
	                          	 </c:if>
	                          	  <c:if test="${list.supply_total == 0 }">
	                          	 <input type="button" disabled="disabled" class="btn btn-warning btn_rewriteTotal" value="재고수정" id="${list.supply_num }" style="width: 100%; height: 33%; border:0px;">
	                          	 </c:if>
	                           </td>
	                           <td style="border-bottom:0.5px solid #ddd;border-right:0.5px solid #ddd;">
	                           	  <c:if test="${list.supply_total == 0 }">
	                                 <font color="red">재고부족</font>
	                              </c:if> 
	                              <c:if test="${list.supply_total > 0 }">
	                                 <font color="blue">보급가능</font>
	                              </c:if>
	                           </td>
	                        </tr>
	                     </c:forEach>
	                  </tbody>
	               </table>
	            </div>
            </div>
         </div>
      </se:authorize>
   </div>

   <div class="modal" id="SupplyReTotalModal" tabindex="-1"
      role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">보급 수정</h5>
               <button class="close" type="button" data-dismiss="modal"
                  id="btn_reTotalCancel" aria-label="Close">
                  <span aria-hidden="true">×</span>
               </button>
            </div>
            <div class="modal-body">
               <form id="reTotalForm">
                  <table>
                     <tr align="center">
                        <td width="90px" align="right">보급용도</td>
                        <td width="200px"><select name="consume_reason"
                           id="reason_select" class="form-control" style="width: 150px;">
                              <option>훈련 교보재</option>
                              <option>정기 불출</option>
                              <option>물자 소비</option>
                        </select></td>
                     </tr>
                     <tr align="center">
                        <td width="90px" align="right">수량</td>
                        <td width="200px"><input type="number" placeholder="수량을 입력해주세요." id="consume_count" class="form-control" style="width: 150px;"></td>
                     </tr>
                  </table>
               </form>
            </div>
            <div class="modal-footer">
               <button class="btn btn-default" type="button" data-dismiss="modal"
                  id="btn_reTotalCancel">돌아가기</button>
               &nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
                  class="btn btn-primary" value="완료" id="btn_SupplyReTotalComplete" />
            </div>
         </div>
      </div>
   </div>
</body>
</html>