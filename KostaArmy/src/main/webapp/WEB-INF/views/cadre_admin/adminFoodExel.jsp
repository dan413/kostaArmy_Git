<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<ol class="breadcrumb">
	        <li class="breadcrumb-item">
	          	급 양 관 리
	        </li>
	      </ol>

			<table class="table table-hover" border="1">
					<tr align="center" >
						<td rowspan="2" style="background-color: #F6FFCC; font-size:25px;" width="300px"><br>급 양 관 리</td>
						<td rowspan="2" style="background-color: #F6FFCC; font-size:25px;" width="300px"><br>감 독 관 </td>
						<td style="font-size:20px;">행 정 보 급 관</td>
						<td style="font-size:20px;">
						${supplyName}
						</td>
					</tr>
					<tr align="center" >
						<td style="font-size:20px;">당 직 사 관</td>
						<td style="font-size:20px;">
						${officerName}
						</td>
					</tr>
					
					<tr align="center">
						<td style="font-size:20px;">
							날    짜 
						</td>
						<td colspan="3">
						${today}
						</td>
					</tr>
					<tr align="center">
						<td style="font-size:20px;">
							조    식 
						</td>
						<td colspan="3">
						${breakFast}
						</td>
					</tr>
					<tr align="center">
						<td style="font-size:20px;">
							중    식 
						</td>
						<td colspan="3">
						${lunch}
						</td>
					</tr>
					<tr align="center">
						<td style="font-size:20px;">
							석    식 
						</td>
						<td colspan="3">
						${dinner}
						</td>
					</tr>
					<tr align="center">
						<td style="font-size:20px">
							증    식 
						</td>
						<td colspan="3">
							${supplyFood}
						</td>
					</tr>
				</table>

</body>
</html>