<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../mainForm/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/messageAlram.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>강한육군 대한민국 KostaArmy</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
   
     <div class="content-wrapper">
		<div class="content_part">

			<div style="width:40%; padding-left: 3%;  padding-top: 1%; float: left;">
				<div class="card mb-3" style="width: 100%; height: 800px; ">
					<div class="card-header" style="font-size:30px; text-align:center;">
					<h4><b>검 색</b></h4>
					<input class="form-control input-sg" type="text" id="keyword_addr" placeholder="ex)군번/계급/부서/이름" style="width:70%;">
					<button class="btn btn-danger" id="btn_keyword_addr" >검색</button>
					<button class="btn btn-danger" id="btn_All_addr" >전체</button>
					
					</div>
					
					<div class="card-body">
						<table class="table table-hover">
							<tr style="background-color: #D5D5D5;">
								<th style="width: 25%;">군 번</th>
								<th style="width: 15%;">계 급</th>
								<th style="width: 15%;">부 서</th>
								<th colspan="2">이 름</th>
							</tr>
							<tbody id="AddrListAll"/>
						</table>
					</div>
				</div>
			</div>
			<div style="width:59%; padding-right: 3%; padding-top: 1%; float: right;">
			<button class="btn btn-default" id="btn_MsgReceivedList"  style="width: 33%; height:70px;font-size:25px; border:none;"><b>받은 메시지함</b></button>
			<button class="btn btn-default" id="btn_MsgSentList" style="width: 33%; height:70px; font-size:25px;border:none;"><b>보낸 메시지함</b></button>
			<se:authorize ifAnyGranted="ROLE_MASTER_SERGEANT, ROLE_SUPPLY_CAPTAIN, ROLE_MANAGE_CAPTAIN, ROLE_MISSION_CAPTAIN">
			<button class="btn btn-default" id="btn_MsgWorkList" style="width: 33%; height:70px; font-size:25px;border:none; float: right;"><b>업무 메시지함</b></button>
			</se:authorize>
			</div>
			<div style="width:59%; padding-right: 3%; padding-top: 1%; float: right;">
				<div class="card mb-3" style="width: 100%; height:710px;">
					<div class="card-header" style="font-size: 30px;height:70px; text-align: center;">
						<b>목 록</b>
					</div>
					<div class="card-body">
					 	<div id="msgReceivedListBody" style="display: none; height: 600px; overflow-y: auto;">
					 		<table class="table table-hover" style="text-align:center;">
						 		<tr>
					 				<td style="width:5%; font-size:20px;"><b>No.</b></td>
					 				<td style="width:15%; font-size:20px;"><b>날 짜</b></td>
					 				<td style="width:20%; font-size:20px;"><b>보낸 사람</b></td>
					 				<td style="width:30%; font-size:20px;"><b>내 용</b></td>
					 				<td style="width:10%; font-size:20px;"><b>상대 확인</b></td>
					 			</tr>
					 			<c:set var="num1" value="1"/>
						 		<c:set var="readflag1" value="1"/>
							    <c:forEach items="${ received_list }" var="r_list" varStatus="status">
									<tr>
										<td style="width:5%;">${num1}</td>
										<td style="width:15%;">${ r_list.msg_date }</td>
										<td style="width:20%;">${r_list.cadre_mmr } ${ r_list.cadre_name}
											<input id="nameDetail_${r_list.msg_no}" type="hidden" value="${r_list.cadre_mmr } ${ r_list.cadre_name}">
										</td>
										<td style="width:30%;"><a data-toggle="modal" data-target="#Msgdetail_To" style="text-decoration: none; cursor: pointer;" onclick="listDetailFunction(${r_list.msg_no},${readflag1})">${ r_list.msg_content }</a></td>
										<td style="width:10%;">
											<div id="msg_read_${r_list.msg_no}">
												<c:if test="${ r_list.msg_flag==0}">
													읽음
												</c:if>
												<c:if test="${ r_list.msg_flag==1}">
													읽지 않음
												</c:if>
											</div>
										</td>
									</tr>
								<c:set var="num1" value="${num1+1}"/>
								</c:forEach>
							</table>  
					 	</div>
							  
				 		<div id="msgSentListBody" style="display: none; height: 600px; overflow-y: auto;">	  
							<table class="table table-hover" style="text-align:center;">
						  		<tr>
					 				<td style="width:5%; font-size:20px;"><b>No.</b></td>
					 				<td style="width:15%; font-size:20px;"><b>날 짜</b></td>
					 				<td style="width:20%; font-size:20px;"><b>받는 사람</b></td>
					 				<td style="width:30%; font-size:20px;"><b>내 용</b></td>
					 				<td style="width:10%; font-size:20px;"><b>확 인</b></td>
					 			</tr>
						  		<c:set var="num2" value="1"/>
						  		<c:set var="readflag2" value="2"/>
						    	<c:forEach items="${ sent_list }" var="s_list" varStatus="status">
									<tr>
										<td style="width:5%;">${num2}</td>
										<td style="width:15%;">${ s_list.msg_date }</td>
										<td style="width:20%;">${s_list.cadre_mmr } ${ s_list.cadre_name}
											<input id="nameDetail_${s_list.msg_no}" type="hidden" value="${s_list.cadre_mmr } ${ s_list.cadre_name}">
										</td>
										<td style="width:30%;"><a data-toggle="modal" data-target="#Msgdetail_From" onclick="listDetailFunction(${s_list.msg_no},${readflag2})" style="text-decoration: none; cursor: pointer;">${s_list.msg_content }</a></td>
										<td style="width:10%;">
											<c:if test="${ s_list.msg_flag==0}">
												읽음
											</c:if>
											<c:if test="${ s_list.msg_flag==1}">
												읽지 않음
											</c:if>
										</td>
									</tr>
								<c:set var="num2" value="${num2+1}"/>
								</c:forEach>
							</table>  
						</div>
						
						<div id="msgWokrListBody" style="display: none; height: 600px; overflow-y: auto;">	  
							<table class="table table-hover" style="text-align:center;">
						  		<c:set var="num3" value="1"/>
						  		<c:set var="readflag3" value="3"/>
						  		<tr>
					 				<td style="width:5%; font-size:20px;"><b>No.</b></td>
					 				<td style="width:15%; font-size:20px;"><b>날 짜</b></td>
					 				<td style="width:20%; font-size:20px;"><b>보낸 사람</b></td>
					 				<td style="width:30%; font-size:20px;"><b>업무 내용</b></td>
					 				<td style="width:10%; font-size:20px;"><b>확 인</b></td>
					 			</tr>
						    	<c:forEach items="${ work_list }" var="w_list" varStatus="status">
									<tr>
										<td style="width:5%;">${num3}</td>
										<td style="width:15%;">${ w_list.msg_date }</td>
										<td style="width:20%;">${ w_list.msg_from_number }</td>
										<td style="width:30%;"><a data-toggle="modal" data-target="#Msgdetail_To" onclick="listDetailFunction(${w_list.msg_no},${readflag3})" style="text-decoration: none; cursor: pointer;">${w_list.msg_content }</a></td>
										<td style="width:10%;">
											<div id="msg_read_${w_list.msg_no}">
												<c:if test="${ w_list.msg_flag==0}">
													읽음
												</c:if>
												<c:if test="${ w_list.msg_flag==1}">
													읽지 않음
												</c:if>
											</div>
										</td>
									</tr>
								<c:set var="num3" value="${num3+1}"/>
								</c:forEach>
							</table>  
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>

	<!-- 쪽지 쓰기 모달 -->

	<div class="modal" id="MsgSendFormModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content" style="margin-top: 30%; width: 700px; height: 500px;" >
					<div class="modal-header" id="messageType">
					<h5 class="modal-title">쪽지 작성</h5>
						<button type="submit" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
					</div>
					
					<div class="modal-body" id="messageContent">
						<table class="table table-bordered">
							<tr><td><b>받는사람</b></td></tr>
							<tr>
								<td> 
									<div>
										<p id="modal_msg_to_id"></p>
										<input type="hidden" id="modal_msg_to_number">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<textarea class="form-control" style="width:100%; height:200px;" id="modal_msg_content"  name="msg_content"></textarea>
								</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" value="보내기" id="modal_btn_msg_send" data-dismiss="modal" style="color:#1E33BF;">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상세보기 모달 -->
	
	<div class="modal" id="Msgdetail_To" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content" style="margin-top: 30%; width: 700px; height: 500px;" >
					<div class="modal-header" id="messageType">
					<h5 class="modal-title">상세보기</h5>
						<button type="submit" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
					</div>
					
					<div class="modal-body" id="messageContent">
						<table class="table table-bordered">
						
							<tr><td><b>보낸사람</b></td></tr>
							<tbody id="msg_content_From"/>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							id="btn_gotoNextPage">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상세보기 모달 -->
	
	<div class="modal" id="Msgdetail_From" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content" style="margin-top: 30%; width: 700px; height: 500px;" >
					<div class="modal-header" id="messageType">
					<h5 class="modal-title">상세보기</h5>
						<button type="submit" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
					</div>
					
					<div class="modal-body" id="messageContent">
						<table class="table table-bordered">
						
							<tr><td><b>받는사람</b></td></tr>
							<tbody id="msg_content_To"/>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							id="btn_gotoNextPage">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>



 

