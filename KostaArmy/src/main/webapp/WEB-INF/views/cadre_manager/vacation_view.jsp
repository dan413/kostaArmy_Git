<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/fullcalendar.css' />
<link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/fullcalendar.min.css' />
<script src='${pageContext.request.contextPath }/resources/js/moment.min.js'></script>
<script src='${pageContext.request.contextPath }/resources/js/fullcalendar.js'></script> 

<script type='text/javascript'>

   $(document).ready(function() {
      
      var date = new Date();   
      
      var text = '${jsonObject}';
      var obj = JSON.parse(text);
      var events_array = [];
      
      for(var i in obj.list){
         var vacation_object = {
               title: obj.list[i].vacation_name,   
               start: obj.list[i].vacation_start1,
               end: obj.list[i].vacation_end1
         };
         events_array.push(vacation_object);
      }
      
      
      var calendar = $('#calendar').fullCalendar({
         
         header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
         },
         
         selectable: true,
         selectHelper: false,
         editable: false,
         events: events_array
      });
      
      
   });
</script>


<style type='text/css'>
    #calendar {
      width: 700px;
      margin: 0 auto;
      }

</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
   
   <!-- ------------------------------------------------------------------------------------------ -->
   <div class="content-wrapper">
      <div class="content_part">

       <div class="supply_title" style="margin-top:30px;">
				<h3 align="center">${cadre_group } 휴 가 신 청 현 황</h3>
		</div>
		<br>
        <hr>
       
        
        <c:if test="${Sign_property == 'a'}">
        <br>
        	<h5 align="center">- 결 제 대 기 중 -</h5>
        </c:if>
        <c:if test="${Sign_property =='b'}">
        <br>
        	<center>
	        	<h5 align="center">- 결 제 승 인 -</h5>
	        	<a href="ok_bySergeant.do?vacation_group=${cadre_group}">
	        		<span class="btn btn-default">확 인</span>
	        	</a>
        	</center>
        </c:if>
        <c:if test="${Sign_property == 'c'}">
        	-승인 거절-<br>
        	<a href="reset_bySergeant.do?vacation_group=${cadre_group}">확인</a>
        </c:if> 

   	</div>
	</div>
 
</body>
</html>