<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
    <%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/js/supplyProcess.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
   type="text/css">
<title>발주 현황</title>

<script type="text/javascript">

function show(str){
   
    console.log(str);
    $("#modal_num").val(str);
    $("#exampleModal").modal('show');

}

   $(function() {
      
      $(document).on("click", ".Sign_Order", function() {

         var data = $(this).attr("value");
         
         $.ajax({
            type : 'POST',
            url : 'Sign_Order.do',
            data : {
               supply_num : data
            },
            success : function(result) {
               location.reload();
            }
         });
      });
   });
</script>

</head>
<body>

<h1>KostaArmy 물자 현황 및 신청</h1>

      
<hr>
      <c:if test="${access == 1 }">
      
   <table class="table table-hover">
      <tr align="center">
         <td width="90px">물품일련번호</td>
         <td width="90px">물품분류</td>
         <td width="90px">물품이름</td>
         <td width="50px">물품신청개수</td>
         <td width="50px">물품신청완료개수</td>
         <td width="50px">물품재고량</td>
         <td width="90px">신청</td>
         <td width="50px">전달사항</td>
         
      </tr>
      <c:forEach var="list" items="${list }">
         <tr align="center">
            <c:if test="${list.supply_flag == 0 }">
            <td width="90px">${list.supply_num }</td>
               <td width="90px">일반소비</td>
               <td width="90px">${list.supply_name }</td>
               <td width="50px">${list.supply_order }개</td>
               <td width="50px">${list.supply_set }개</td>
               <td width="50px">${list.supply_total }개</td>
               <td width="180px">
               <c:if test="${list.supply_order != 0 and list.supply_set == 0}">
                  결제 대기 &nbsp;
                  
                  <c:if test="${list.supply_coments != 'none' }">
                  -> 승인 거절
                     <%-- <a href="deleteOrder.do?supply_num=${list.supply_num }"><button>내역 삭제</button></a> --%>
                  </c:if>
               </c:if>
               
               <c:if test="${list.supply_order == 0 and list.supply_set != 0}">
                  승인 완료
               </c:if>
               
                </td>
                
                <td width="50px">
                <c:if test="${list.supply_order != 0 and list.supply_set == 0}">
                   <a href="deleteOrder.do?supply_num=${list.supply_num }"><button>발주 취소</button></a>
               </c:if>
                </td>
               
            </c:if>
            <c:if test="${list.supply_flag != 0 }">
            <td width="90px">${list.supply_num }</td>
               <td width="90px">완전소비</td>
               <td width="90px">${list.supply_name }</td>
               <td width="50px">${list.supply_order }개</td>
               <td width="50px">${list.supply_set }개</td>
               <td width="50px">${list.supply_total }개</td>
               <td width="180px">
               <c:if test="${list.supply_order != 0 and list.supply_set == 0}">
                  결제 대기 &nbsp;
                  
                  <c:if test="${list.supply_coments != 'none' }">
                  -> 승인 거절
                     <%-- <a href="deleteOrder.do?supply_num=${list.supply_num }"><button>내역 삭제</button></a> --%>
                  </c:if>
               </c:if>
               
               <c:if test="${list.supply_order == 0 and list.supply_set != 0}">
                  승인 완료
               </c:if>
               
                </td>
                
                <td width="50px">
                <c:if test="${list.supply_order != 0 and list.supply_set == 0}">
                   <a href="deleteOrder.do?supply_num=${list.supply_num }"><button>발주 취소</button></a>
               </c:if>
                </td>
            </c:if>

            
         </tr>
      </c:forEach>
   </table>

    <center>
    
      <c:if test="${countByOrder != 0}">
                  <a href="completeOrder.do"><button>물자 수령</button></a>
               </c:if>
               
   </center> 
   
   </c:if>
   
   <c:if test="${access == 2 }">
   
   <table class="table table-hover">
      <tr align="center">
         <td width="90px">물품일련번호</td>
         <td width="90px">물품분류</td>
         <td width="90px">물품이름</td>
         <td width="50px">물품신청개수</td>
         <td width="90px">신청</td>
         <td width="50px">처리</td>
         
      </tr>
      <c:forEach var="list" items="${list }">
         <tr align="center">
            <c:if test="${list.supply_flag == 0 }">
            <td width="90px">${list.supply_num }</td>
               <td width="90px">일반소비</td>
               <td width="90px">${list.supply_name }</td>
               <td width="50px">${list.supply_order }개</td>
               
               <td width="90px">
               <c:if test="${list.supply_order != 0 and list.supply_set == 0}">
                  결제 대기 &nbsp;
                  
               </c:if>
               
               <c:if test="${list.supply_order == 0 and list.supply_set != 0}">
                  결제완료(수령 대기중)
               </c:if>
               <c:if test="${list.supply_coments != 'none'}">
                  -> 승인 거절
               </c:if>
                </td>
            
            <td width="50px">
                  <c:if test="${list.supply_order != 0 and list.supply_set == 0}">      
                  <c:if test="${list.supply_coments == 'none'}">
                  <button value="${list.supply_num }" class="Sign_Order" >결제</button> 
                  
                  <button type="button" class="btn btn-info btn-lg" onclick="show('${list.supply_num}')">결제불가</button>
                  </c:if>
                  </c:if>

               </td>
            
               </td>
               
            </c:if>
            
            <c:if test="${list.supply_flag != 0 }">
            <td width="90px">${list.supply_num }</td>
               <td width="90px">완전소비</td>
               <td width="90px">${list.supply_name }</td>
               <td width="50px">${list.supply_order }개</td>
               
               <td width="90px">
               <c:if test="${list.supply_order != 0 and list.supply_set == 0}">
                  결제 대기 &nbsp;
                  
               </c:if>
               
               <c:if test="${list.supply_order == 0 and list.supply_set != 0}">
                  결제완료(수령 대기중)
               </c:if>
               <c:if test="${list.supply_coments != 'none'}">
                  -> 승인 거절
               </c:if>
                </td>
            
            <td width="50px">
                  <c:if test="${list.supply_order != 0 and list.supply_set == 0}">      
                  <c:if test="${list.supply_coments == 'none'}">
                  <button value="${list.supply_num }" class="Sign_Order" >결제</button> 
                  
                  <button type="button" class="btn btn-info btn-lg" onclick="show('${list.supply_num}')">결제불가</button>
                  </c:if>
                  </c:if>

               </td>
            
            </c:if>
         </tr>
         
      
                        
      
      </c:forEach>
   </table>

   </c:if>
   
      <!-- Modal 창 -->
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">×</span>
                  </button>
               </div>
               
               <form action="Sign_Order_Reset.do">
               <div class="modal-body">
                 &nbsp;&nbsp;&nbsp; 취소 사유 &nbsp;
                  
                  <select name="Sign_reason">
               <option value="enough">재고부족</option>
               <option value="waiting">입고대기</option>
            </select>
            <input type="text" id ="modal_num" name="supply_num" hidden="hidden">
                        
               </div>
               
               
               <div class="modal-footer">
                  <button class="btn btn-secondary" type="button" data-dismiss="modal">돌아가기</button>
                 <input type="submit" value="확인"/>
                 <!--  <a class="btn btn-primary" href="Sign_Order_Reset.do">확인</a> -->
               </div>
               </form>
               
            </div>
         </div>
      </div>
   
</body>
</html>