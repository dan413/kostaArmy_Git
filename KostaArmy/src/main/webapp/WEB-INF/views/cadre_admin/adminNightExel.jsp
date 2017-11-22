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
	          	근 무 일 지 / ( 불 침 번 )
	        </li>
	      </ol>

			<table border="1">
			  <tr>
			    <th colspan="4"> 근 무 일 지</th>
			    <th colspan="2" style="float: right;">${nightDate}</th>
			  </tr>
			  <tr>
			    <td>당 직 사 관 </td>
			    <td colspan="2">${officerName}</td>
			    <td>당 직 부 사 관</td>
			    <td colspan="2">${officerSubName}</td>
			  </tr>
			  <tr>
			    <td colspan="6">불 침 번</td>
			  </tr>
			  <tr>
			    <td>시 간</td>
			    <td style="width: 20%;">이 름</td>
			    <td>서 명</td>
			    <td>시 간</td>
			    <td style="width: 20%;">이 름</td>
			    <td>서 명</td>
			  </tr>
			  <tr>
			    <td>22 : 00 ~ 23 : 30</td>
			    <td>${nightWitch1}</td>
			    <td></td>
			    <td>02 : 30 ~ 04 : 00</td>
			    <td>${nightWitch2}</td>
			    <td></td>
			  </tr>
			  <tr>
			    <td>23 : 30 ~ 01 : 00</td>
			    <td>${nightWitch3}</td>
			    <td></td>
			    <td>04 : 00 ~ 05 : 30</td>
			    <td>${nightWitch4}</td>
			    <td></td>
			  </tr>
			  <tr>
			    <td>01 : 00 ~ 02 : 30</td>
			    <td>${nightWitch5}</td>
			    <td></td>
			    <td>05 : 30 ~ 06 : 30</td>
			    <td>${nightWitch6}</td>
			    <td></td>
			  </tr>
			  <tr>
			    <td colspan="6">5 분 대기조</td>
			  </tr>
			  <tr>
			    <td>5 대기 조장</td>
			    <td colspan="2">${fiveMinuteCaptain}</td>
			    <td>5 대기 운전병</td>
			    <td colspan="2">${fiveMinuteDriver}</td>
			  </tr>
			  <tr>
			    <td>이 름</td>
			    <td colspan="2">서 명</td>
			    <td>이 름</td>
			    <td colspan="2">서 명</td>
			  </tr>
			  <tr>
			    <td>${fiveMinute1}</td>
			    <td colspan="2"></td>
			    <td>${fiveMinute2}</td>
			    <td colspan="2"></td>
			  </tr>
			  <tr>
			    <td>${fiveMinute3}</td>
			    <td colspan="2"></td>
			    <td>${fiveMinute4}</td>
			    <td colspan="2"></td>
			  </tr>
			  <tr>
			    <td >${fiveMinute5}</td>
			    <td colspan="2"></td>
			    <td >${fiveMinute6}</td>
			    <td colspan="2"></td>
			  </tr>
			  <tr>
			    <td >${fiveMinute7}</td>
			    <td colspan="2"></td>
			    <td >${fiveMinute8}</td>
			    <td colspan="2"></td>
			  </tr>
			  <tr>
			    <td colspan="6">비 고</td>
			  </tr>
			  <tr>
			    <td colspan="6">${note}</td>
			  </tr>
		</table>

</body>
</html>