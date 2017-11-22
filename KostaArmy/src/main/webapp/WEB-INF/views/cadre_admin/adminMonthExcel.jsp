<%@ page language="java" contentType=" application/vnd.openxmlformats-officedocument.spreadsheetml.sheet; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강한육군 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
   <!-- Navigation-->
   
   
      <!-- ============================================================================================================================== -->
      <!-- ============================================================================================================================== -->
      <!-- ============================================================================================================================== -->
      <!-- ============================================================================================================================== -->
      <!-- ============================================================================================================================== -->
	<div class="content-wrapper">
		<div class="content_part">
			<ol class="breadcrumb">
	        	<li class="breadcrumb-item">
	          		월 간 종 합
	        	</li>
			</ol>
			<table class="table table-bordered">
				<tr align="center" style="background-color: #F6FFCC; font-size:15px;">
					<td>
					</td>
					<td>
						기  간
					</td>
					<td>
						월 요 일 
					</td>
					<td>
						화 요 일
					</td>
					<td>
						수 요 일
					</td>
					<td>
						목 요 일
					</td>
					<td>
						금 요 일
					</td>
					<td>
						토 요 일
					</td>
					<td>
						일 요 일
					</td>
				</tr>
				<c:forEach var="list" items="${list }">
					<tr align="center">
						<td>
							${list.w_num} 주차
						</td>
						<td>
							${list.weekly }
						</td>
						<td>
							${list.w_monday }
						</td>
						<td>
							${list.w_tuesday }
						</td>
						<td>
							${list.w_wednesday }
						</td>
						<td>
							${list.w_thursday }
						</td>
						<td>
							${list.w_friday }
						</td>
						<td>
							${list.w_saturday }
						</td>
						<td>
							${list.w_sunday }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- ========================================================= -->
	


</body>
</html>