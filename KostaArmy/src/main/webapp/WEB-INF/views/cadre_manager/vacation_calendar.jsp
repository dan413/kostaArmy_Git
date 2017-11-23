<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../mainForm/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/ko.js"></script>
<link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/fullcalendar.css' />
<link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/fullcalendar.min.css' />
<link href="${pageContext.request.contextPath}/resources/css/table_custom.css?ver=1" rel="stylesheet">
<script src='${pageContext.request.contextPath }/resources/js/moment.min.js'></script>
<script src='${pageContext.request.contextPath }/resources/js/print2.js'></script>
<script src='${pageContext.request.contextPath }/resources/js/fullcalendar.js'></script> 

<script type='text/javascript'>

   $(document).ready(function() {
      
      var date = new Date();   
      var m_search_table = '${part}';
      var text = '${jsonObject}';
      var obj = JSON.parse(text);
      var events_array = [];
      
      if(m_search_table == 'manager_soldier'){
    	  
     	 for(var i in obj.list){
       	  var vacation_object = {
          	     title: obj.list[i].soldier_name,   
         	      start: obj.list[i].soldier_s_vacation1,
         	      end: obj.list[i].soldier_e_vacation1
         	};
     	    events_array.push(vacation_object);
    	  }
      }
      
      else{
    	  for(var i in obj.list){
    	         var vacation_object = {
    	               title: obj.list[i].cadre_name,   
    	               start: obj.list[i].cadre_s_vacation1,
    	               end: obj.list[i].cadre_e_vacation1
    	         };
    	         events_array.push(vacation_object);
    	      }
      }
      
      
      var calendar = $('#calendar').fullCalendar({
    	  defaultDate : '${fullcal}',
    	  lang : "ko",
          editable : false,
          eventLimit : false,
          header : {
             left : "",
             center : "title",
             right : "prev, next"
          },
          monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
          monthNamesShort:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
          dayNames:["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
          dayNamesShort:["일","월","화","수","목","금","토"],
        /*  header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
         }, */
         
         selectable: true,
        /*  selectHelper: false,
         editable: false, */
         events: events_array
      });
      
      
   });
</script>


<style type='text/css'>
    #calendar {
      width: 700px;
      margin: 0 auto;
      }
.fc-sat {
   color: blue;
}

.fc-sun {
   color: red;
}
.fc-other-month {
color: #BBBBBB;
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
			<div class="container">
				<div id="print_page">
					<div class="datagrid" style="overflow: hidden;">
						<table>
							<thead>
								<tr>
									<th style="font-size: xx-large; font-weight: bolder;">출 타 종 합</th>
								</tr>
							</thead>
						</table>
					</div>
					<form action="Vacation_Calendar_result.do" method="post"
						align="center">
						<input type="radio" name="m_search_table" value="manager_soldier"
							checked="checked">&nbsp;병 사 <input type="radio"
							name="m_search_table" value="manager_cadre">&nbsp;간 부 <input
							type="submit" class="btn btn-default" value="검색">
						<a onclick="pageprint()">
	                                    <input type="button" class="btn btn-default" value="인 쇄">
	                    </a>
					</form>
					<div id="print_page"> <!-- 프린트 영역 --> 
						<div style="border: 2px solid black; border-radius: 10px;">
						<div id='calendar' style="width:80%; padding-top: 5%; padding-bottom: 5%;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>