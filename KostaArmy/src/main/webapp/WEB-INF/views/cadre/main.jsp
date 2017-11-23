<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../mainForm/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/table_custom.css" rel="stylesheet"/>
<script src="${pageContext.request.contextPath}/resources/js/jquery.cycle2.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/googleChart.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        
         var flag =  document.getElementById("flag").value;
         var cadre_group = document.getElementById("cadre_group").value;
          var All_total_Count = document.getElementById("All_total_Count").value*1;
           var All_out_Count = document.getElementById("All_out_Count").value*1;
           var center_total_Count = document.getElementById("center_total_Count").value*1;
           var center_out_Count = document.getElementById("center_out_Count").value*1;
           var one_total_Count = document.getElementById("one_total_Count").value*1;
           var one_out_Count = document.getElementById("one_out_Count").value*1;
           var two_total_Count = document.getElementById("two_total_Count").value*1;
           var two_out_Count = document.getElementById("two_out_Count").value*1;
           var three_total_Count = document.getElementById("three_total_Count").value*1;
           var three_out_Count = document.getElementById("three_out_Count").value*1;

       if(flag==1){
          
        var data = google.visualization.arrayToDataTable([
          ['Kosta 대대', '총 원', '출타인원'],
          ['총원', All_total_Count, All_out_Count],
          ['본부중대', center_total_Count, center_out_Count],
          ['1중대', one_total_Count, one_out_Count],
          ['2중대', two_total_Count, two_out_Count],
          ['3중대', three_total_Count, three_out_Count]
        ]);
    
        var options = {
          title: 'Kosta 대대 병력 현황'
        };

        var chart = new google.visualization.BarChart(document.getElementById('barchart'));

        chart.draw(data, options);
       }
       
       else if(flag==2){
             
        var data1 = google.visualization.arrayToDataTable([
           ['중대인원', '중대인원'],
           ['출타자', All_out_Count],
            ['잔류인원', All_total_Count-All_out_Count]
            
          ]);
        
        var options = {
                title: cadre_group + ' 병력 현황'
              };

              var chart = new google.visualization.PieChart(document.getElementById('piechart'));

              chart.draw(data1, options);
       }
       
      }
      
      
  
</script>

<title>강한육군 대한민국 KostaArmy</title>

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">


      <!-- ============================================================================================================================== -->
      <!-- ============================================================================================================================== -->
      <!-- ============================================================================================================================== -->
      <!-- ============================================================================================================================== -->
      <!-- ============================================================================================================================== -->

   <div class="content-wrapper"> 
      <div class="content_part">
      	<div style="padding-right: 1%; padding-top: 1%; padding-left: 1%; border-radius: 20px; float:left;">
      		<div style="border: 3px solid #474747; width:25%; float:left; background-color: #000; border-radius: 20px; height:400px;">
      			<img
					src="${pageContext.request.contextPath}/resources/images/jisang.jpg"
					style="width: 100%; height: 100%; border-radius: 20px;">
      		</div>
			<div class="cycle-slideshow" data-cycle-timeout="5000" style="border-radius: 20px; border: 3px solid #474747; width:73%; float:right;">
				<img
					src="${pageContext.request.contextPath}/resources/images/milta1.jpg"
					style="width: 100%; height: 395px; border-radius: 20px;">
				<img
					src="${pageContext.request.contextPath}/resources/images/milta2.jpg"
					style="width: 100%; height: 395px; border-radius: 20px;">
				<img
					src="${pageContext.request.contextPath}/resources/images/milta3.jpg"
					style="width: 100%; height: 395px; border-radius: 20px;">
				<img
					src="${pageContext.request.contextPath}/resources/images/milta4.jpg"
					style="width: 100%; height: 395px; border-radius: 20px;">
				<img
					src="${pageContext.request.contextPath}/resources/images/milta5.jpg"
					style="width: 100%; height: 395px; border-radius: 20px;">
			</div>
		</div>
		<div style="width:60%; padding-right: 1%; padding-left: 1%; float: left;">
			<div class="datagrid" style="overflow-y: hidden; height: 470px;">
				<table>
					<thead style="font-size: 25px;">
						<tr>
							<th colspan="6">공 지 사 항</th>
						</tr>
					</thead>
					<tr style="background-color: #BDBDBD;">
						<td style="width:50px;">글번호</td>
						<td style="width:50px;">부서</td>
						<td style="width:250px;">제목</td>
						<td style="width:60px;">작성자</td>
						<td style="width:50px;">조회수</td>
						<td style="width:50px;">작성일</td>
					</tr>
					<c:forEach var="list" items="${list }">
								<tr align="center">
									<td>${list.num }</td>
									<td>${ list.dept }</td>
									<td style="overflow: hidden; text-overflow: ellipsis;"><a style="text-decoration: none; cursor: pointer; color:#000;"
										href="detail_notice.do?num=${ list.num }&pageNo=${map.paging.curPage}">${ list.title }</a></td>
									<td>${ list.writer }</td>
									<td>${ list.hit }</td>
									<td><fmt:formatDate value="${list.idate}"
											pattern="yyyy-MM-dd" /></td>
								</tr>
					</c:forEach>
				</table>
			</div>
		</div>
				
		<div style="width:40%; padding-right: 1%; padding-left: 1%; float: right;">
			<div class="datagrid" style="overflow-y: hidden; height: 470px;">
				<table>
                    <thead style="font-size: 25px;">
                       <tr>
                          <th colspan="3">${group } 총원 현황</th>
                       </tr>
                    </thead>
                    
                    <tr>
                       <td colspan="3" style="background-color: #f6f6f6;">
                       
                       
                       <se:authorize ifAnyGranted="ROLE_MANAGE_CAPTAIN, ROLE_SUPPLY_CAPTAIN">
                       <div id="barchart" style="width: 100%; height: 365px; background-color: #f6f6f6;">
                       </div>
                       </se:authorize>
                       <se:authorize access="hasRole('ROLE_MASTER_SERGEANT')">
                       <div id="piechart" style="width: 100%; height: 365px; background-color: #f6f6f6;">
                       
                       </div>
                       </se:authorize>
                       
                       <input type="text" id="cadre_group" hidden="hidden" value="${group }"/>
                       <input type="text" id="flag" hidden="hidden" value="${count_map.flag }"/>
                       <input type="text" id="All_total_Count" hidden="hidden" value="${count_map.All_total_Count }"/>
                       <input type="text" id="All_out_Count" hidden="hidden" value="${count_map.All_out_Count }"/>
                       <input type="text" id="center_total_Count" hidden="hidden" value="${count_map.center_total_Count }">
                       <input type="text" id="center_out_Count" hidden="hidden" value="${count_map.center_out_Count }">
                       <input type="text" id="one_total_Count" hidden="hidden" value="${count_map.one_total_Count }">
                       <input type="text" id="one_out_Count" hidden="hidden" value="${count_map.one_out_Count }">
                       <input type="text" id="two_total_Count" hidden="hidden" value="${count_map.two_total_Count }">
                       <input type="text" id="two_out_Count" hidden="hidden" value="${count_map.two_out_Count }">
                       <input type="text" id="three_total_Count" hidden="hidden" value="${count_map.three_total_Count }">
                       <input type="text" id="three_out_Count" hidden="hidden" value="${count_map.three_out_Count }">
                       
                       
                       
                    </tr>
                    	<tr style="font-size: 0.9em; background-color: #EAEAEA; border: 1px solid #fff;">            
                      		 <td>총     원 : ${count_map.All_total_Count } </td>
                      		 <td> 잔류인원 : ${count_map.All_total_Count -count_map.All_out_Count }</td>
                      		 <td> 출 타 자 : ${count_map.All_out_Count }</td>
                       </tr>
                 </table>
			</div>
		</div>
	</div>


       
   <!-- ========================================================= -->
</body>
</html>