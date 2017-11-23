<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='${pageContext.request.contextPath }/resources/js/moment.min.js'></script>
<script src='${pageContext.request.contextPath }/resources/js/fullcalendar.js'></script>
<link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/fullcalendar.css' />
<link rel='stylesheet' href='${pageContext.request.contextPath }/resources/css/fullcalendar.min.css' />
<link href="${pageContext.request.contextPath}/resources/css/table_custom.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/googleChart.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	var normal = ${center_count_by_normal +  one_count_by_normal + two_count_by_normal + three_count_by_normal};
    	var sunday =${center_count_by_sunday +  one_count_by_sunday + two_count_by_sunday + three_count_by_sunday};
    	var hospital = ${center_count_by_hospital +  one_count_by_hospital + two_count_by_hospital + three_count_by_hospital };
    	var away =${center_count_by_away + one_count_by_away + two_count_by_away + three_count_by_away };
    	var now = ${All_total_Count - All_out_Count};
        var data1 = google.visualization.arrayToDataTable([
           ['대대인원', '대대인원'],
           ['현재원', now],
           ['휴가', normal],
            ['외박', sunday],
            ['입실', hospital],
            ['파견', away]
          ]);
        
        var options = {
                title:' 병력 현황'
              };

              var chart = new google.visualization.PieChart(document.getElementById('piechart'));

              chart.draw(data1, options);
       
      }
  
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강한육군 대한민국 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
    <div class="content-wrapper">
      <div class="content_part"
         style="padding-left: 20px; padding-right: 20px; margin-top: 20px">
         <div class="supplyList_part">
            <div class="container">
               <div class="datagrid" style="overflow: hidden; height: 670px;">
                  <table style="font-size: 1.2em; height: 665px;">
                     <thead>
                        <tr>
                           <th colspan="6"
                              style="font-size: xx-large; font-weight: bolder;">
                             ${dTime } ${cadre_group } 유동병력현황</th>
                        </tr>
                     </thead>
                     <tr>
                        <td style="width: 12%;"></td>
                        <td style="width: 16%;">본부중대</td>
                        <td style="width: 16%;">1중대</td>
                        <td style="width: 16%;">2중대</td>
                        <td style="width: 16%;">3중대</td>
                        <td style="width: 16%;">Kosta대대</td>
                     </tr>
                     <tr>
                        <td>총원</td>
                        <td>${center_total_Count}</td>
                        <td>${one_total_Count}</td>
                        <td>${two_total_Count}</td>
                        <td>${three_total_Count}</td>
                        <td>${All_total_Count}</td>
                     </tr>
                     <tr>
                        <td>휴가</td>
                        <td>${center_count_by_normal}</td>
                        <td>${one_count_by_normal}</td>
                        <td>${two_count_by_normal}</td>
                        <td>${three_count_by_normal}</td>
                        <td>${center_count_by_normal +  one_count_by_normal + two_count_by_normal + three_count_by_normal}</td>
                     </tr>
                     <tr>
                        <td>외박</td>
                        <td>${center_count_by_sunday }</td>
                        <td>${one_count_by_sunday }</td>
                        <td>${two_count_by_sunday }</td>
                        <td>${three_count_by_sunday }</td>
                        <td>${center_count_by_sunday +  one_count_by_sunday + two_count_by_sunday + three_count_by_sunday}</td>
                     </tr>
                     <tr>
                        <td>입실</td>
                        <td>${center_count_by_hospital }</td>
                        <td>${one_count_by_hospital }</td>
                        <td>${two_count_by_hospital }</td>
                        <td>${three_count_by_hospital}</td>
                        <td>${center_count_by_hospital+  one_count_by_hospital + two_count_by_hospital + three_count_by_hospital }</td>
                     </tr>
                     <tr>
                        <td>파견</td>
                        <td>${center_count_by_away}</td>
                        <td>${one_count_by_away }</td>
                        <td>${two_count_by_away }</td>
                        <td>${three_count_by_away }</td>
                        <td>${center_count_by_away+  one_count_by_away + two_count_by_away + three_count_by_away }</td>
                     </tr>
                     <tr>
                        <td>현재원</td>
                        <td>${center_total_Count - center_out_Count }</td>
                        <td>${one_total_Count - one_out_Count }</td>
                        <td>${two_total_Count - two_out_Count }</td>
                        <td>${three_total_Count - three_out_Count }</td>
                        <td>${All_total_Count - All_out_Count }</td>
                     </tr>
                  </table>
               </div>
   
            </div>
         </div>
         <div class="supplyBasket_part">

               <div class="datagrid" style="overflow: hidden;">
                  <table>
                     <thead>
                        <tr>
                           <th style="font-size: xx-large; font-weight: bolder;">병력 그래프</th>
                        </tr>
                     </thead>
                  </table>
               </div>
               <div class="datagrid" style="height: 600px; overflow-y: auto;">
                  <table class="table">
                     <tr>
                        <td>
                        <div class="progress" style="width: 100%;">
                           <div class="progress-bar progress-bar-info"
                              role="progressbar" aria-valuenow="${All_total_Count}" aria-valuemin="0"
                              aria-valuemax="${All_total_Count}" style="width: 100%;">
                           </div> 
                        </div>
                        </td>
                        <td style="width: 25%;">
                           총원 : ${All_total_Count}
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <div class="progress" style="width: 100%;">
                              <div class="progress-bar progress-bar-danger"
                                 role="progressbar" aria-valuenow="${center_count_by_normal +  one_count_by_normal + two_count_by_normal + three_count_by_normal }" aria-valuemin="0"
                                 aria-valuemax="${All_total_Count}" style="width: ${(center_count_by_normal +  one_count_by_normal + two_count_by_normal + three_count_by_normal) / All_total_Count * 100}%;">
                              </div> 
                           </div>
                        </td>
                        <td>
                           휴가 : ${center_count_by_normal +  one_count_by_normal + two_count_by_normal + three_count_by_normal} / ${All_total_Count}
                        </td>
                     </tr>   
                     <tr>
                        <td>
                           <div class="progress" style="width: 100%;">
                              <div class="progress-bar progress-bar-good"
                                 role="progressbar" aria-valuenow="${center_count_by_sunday +  one_count_by_sunday + two_count_by_sunday + three_count_by_sunday }" aria-valuemin="0"
                                 aria-valuemax="${All_total_Count}" style="width: ${(center_count_by_sunday +  one_count_by_sunday + two_count_by_sunday + three_count_by_sunday) / All_total_Count * 100}%;">
                              </div> 
                           </div>
                        </td>
                        <td>
                           외박 : ${center_count_by_sunday +  one_count_by_sunday + two_count_by_sunday + three_count_by_sunday} / ${All_total_Count}
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <div class="progress" style="width: 100%;">
                              <div class="progress-bar progress-bar-warning"
                                 role="progressbar" aria-valuenow="${center_count_by_hospital+  one_count_by_hospital + two_count_by_hospital + three_count_by_hospital }" aria-valuemin="0"
                                 aria-valuemax="${All_total_Count}" style="width: ${(center_count_by_hospital+  one_count_by_hospital + two_count_by_hospital + three_count_by_hospital) / All_total_Count * 100}%;">
                              </div> 
                           </div>
                        </td>
                        <td>
                           입실 : ${center_count_by_hospital+  one_count_by_hospital + two_count_by_hospital + three_count_by_hospital } / ${All_total_Count}
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <div class="progress" style="width: 100%;">
                              <div class="progress-bar progress-bar-away"
                                 role="progressbar" aria-valuenow="${center_count_by_away+  one_count_by_away + two_count_by_away + three_count_by_away }" aria-valuemin="0"
                                 aria-valuemax="${All_total_Count}" style="width: ${(center_count_by_away+  one_count_by_away + two_count_by_away + three_count_by_away) / All_total_Count * 100}%;">
                              </div> 
                           </div>
                        </td>
                        <td>
                           파견 : ${center_count_by_away+  one_count_by_away + two_count_by_away + three_count_by_away } / ${All_total_Count}
                        </td>
                     </tr>
                     <tr>
                        <td>
                        <div class="progress" style="width: 100%;">
                           <div class="progress-bar progress-bar"
                              role="progressbar" aria-valuenow="${All_total_Count - All_out_Count}" aria-valuemin="0"
                              aria-valuemax="${All_total_Count}" style="width: ${(All_total_Count - All_out_Count) / All_total_Count * 100}%;">
                           </div> 
                        </div>
                        </td>
                        <td>
                           현재원 : ${All_total_Count - All_out_Count} / ${All_total_Count}
                        </td>
                     </tr>
                     </table>
                    <table style="width: 100%;">
					<tr>
						<td>
						<div id="piechart" style="width: 100%; height: 348px; background-color: #f6f6f6;"></div>
						</td>
					</tr>
					</table>
               
            </div>   
            
         </div>
      </div>
   </div>
</body>
</html>