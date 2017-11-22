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
	          	근 무 일 지 / ( 초 소 )
	        </li>
	      </ol>

			<table class="table" border="1">
				<tr>
					<th colspan="4">근 무 일 지</th>
					<td colspan="2" style="float: right;">${today}</td>
				</tr>
				<tr>
					<td>당 직 사 관</td>
					<td colspan="2">${officerName}</td>
					<td>당 직 부 사 관</td>
					<td colspan="2">${officerSubName}</td>
				</tr>
				<tr>
					<td colspan="5">초 소 근 무</td>
				</tr>
				<tr>
					<td>시 간</td>
					<td>이 름</td>
					<td style="width: 10%;">서 명</td>
					<td>시 간</td>
					<td>이 름</td>
					<td style="width: 10%;">서 명</td>
				</tr>
				<tr>
					<td rowspan="2">22 : 00 ~ 24 : 00</td>
					<td>${nightWitch1}</td>
					<td></td>
					<td rowspan="2">10 : 00 ~ 12 : 00</td>
					<td>${nightWitch2}</td>
					<td></td>
				</tr>
				<tr>
					<td>${nightWitch3}</td>
					<td></td>
					<td>${nightWitch4}</td>
					<td></td>
				</tr>
				<tr>
					<td rowspan="2">24 : 00 ~ 02 : 00</td>
					<td>${nightWitch5}</td>
					<td></td>
					<td rowspan="2">12 : 00 ~ 14 : 00</td>
					<td>${nightWitch6}</td>
					<td></td>
				</tr>
				<tr>
					<td>${nightWitch7}</td>
					<td></td>
					<td>${nightWitch8}</td>
					<td></td>
				</tr>
				<tr>
					<td rowspan="2">02 : 00 ~ 04 : 00</td>
					<td>${nightWitch9}</td>
					<td></td>
					<td rowspan="2">14 : 00 ~ 16 : 00</td>
					<td>${nightWitch10}</td>
					<td></td>
				</tr>
				<tr>
					<td>${nightWitch11}</td>
					<td></td>
					<td>${nightWitch12}</td>
					<td></td>
				</tr>
				<tr>
					<td rowspan="2">04 : 00 ~ 06 : 00</td>
					<td>${nightWitch13}</td>
					<td></td>
					<td rowspan="2">16 : 00 ~ 18 : 00</td>
					<td>${nightWitch14}</td>
					<td></td>
				</tr>
				<tr>
					<td>${nightWitch15}</td>
					<td></td>
					<td>${nightWitch16}</td>
					<td></td>
				</tr>
				<tr>
					<td rowspan="2">06 : 00 ~ 08 : 00</td>
					<td>${nightWitch17}</td>
					<td></td>
					<td rowspan="2">18 : 00 ~ 20 : 00</td>
					<td>${nightWitch18}</td>
					<td></td>
				</tr>
				<tr>
					<td>${nightWitch19}</td>
					<td></td>
					<td>${nightWitch20}</td>
					<td></td>
				</tr>
				<tr>
					<td rowspan="2">08 : 00 ~ 10 : 00</td>
					<td>${nightWitch21}</td>
					<td></td>
					<td rowspan="2">20 : 00 ~ 22 : 00</td>
					<td>${nightWitch22}</td>
					<td></td>
				</tr>
				<tr>
					<td>${nightWitch23}</td>
					<td></td>
					<td>${nightWitch24}</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="6">${memo}</td>
				</tr>
			</table>

</body>
</html>