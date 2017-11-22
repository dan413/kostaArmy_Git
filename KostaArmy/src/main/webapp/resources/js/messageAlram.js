
function submitFunction(data) {
	
	 var mmr = $('#mmr_'+data).val();
	 var number = $('#number_'+data).val();
	 var dept = $('#dept_'+data).val();
	 var name = $('#name_'+data).val();
	 
	 
	 $('#modal_msg_to_id').html("");
	 $('#modal_msg_content').html("");
	 $('#modal_msg_to_id').text(mmr+" "+name);
	 document.getElementById('modal_msg_to_number').value = number;
}

function listDetailFunction(data,flag) {
	
	var msg_no = data
	var readflag = flag
	
	if(readflag == 1){
		 var name = $('#nameDetail_'+msg_no).val();
		$.ajax({
	
			method : 'POST',
			url : 'getDetailView.do',
			data : {
				msg_no : msg_no,
				readflag : readflag
			},
			success : function(data) {
				if(data == "") return;
		         var parsed = JSON.parse(data);
		         var result = parsed.result;
		         $('#msg_content_From').html("");
		         $('#msg_read_'+msg_no).html("");
		         var str = '<tr><td>'+name+'</td></tr>'
					+'<tr><td height="200px">'+result[0][2].value+'</td></tr>';
		        $('#msg_read_'+msg_no).append('읽음');
				$('#msg_content_From').append(str);
			}, error : function(msg, error) {
				alert(error);
			}
		});
	}else if(readflag == 2){
		var name = $('#nameDetail_'+msg_no).val();
		$.ajax({
			method : 'POST',
			url : 'getDetailView.do',
			data : {
				msg_no : msg_no,
				readflag : readflag
			},
			success : function(data) {
				if(data == "") return;
		         var parsed = JSON.parse(data);
		         var result = parsed.result;
		         $('#msg_content_To').html("");
		         var str = '<tr><td>'+name+'</td></tr>'
					+'<tr><td height="200px">'+result[0][2].value+'</td></tr>';
	
				$('#msg_content_To').append(str);
			}, error : function(msg, error) {
				alert(error);
			}
		});
	}else if(readflag == 3){
		$.ajax({
			
			method : 'POST',
			url : 'getDetailView.do',
			data : {
				msg_no : msg_no,
				readflag : readflag
			},
			success : function(data) {
				if(data == "") return;
		         var parsed = JSON.parse(data);
		         var result = parsed.result;
		         $('#msg_content_From').html("");
		         $('#msg_read_'+msg_no).html("");
		         var str = '<tr><td>'+result[0][4].value+'</td></tr>'
					+'<tr><td height="200px">'+result[0][2].value+'</td></tr>';
		        $('#msg_read_'+msg_no).append('읽음');
				$('#msg_content_From').append(str);
			}, error : function(msg, error) {
				alert(error);
			}
		});
	}else return;
}
		


$(function(){
	
	/*쪽지함 페이지에서 선택적으로 Div영역 보여주기*/ 
	$('#btn_MsgReceivedList').click(function(){
		document.getElementById("msgReceivedListBody").style.display="block";
		
		document.getElementById("msgSentListBody").style.display="none";
		
		document.getElementById("msgWokrListBody").style.display="none";
	});
	
	$('#btn_MsgSentList').click(function(){
		document.getElementById("msgSentListBody").style.display="block";
		
		document.getElementById("msgReceivedListBody").style.display="none";
		
		document.getElementById("msgWokrListBody").style.display="none";
	});
	
	$('#btn_MsgWorkList').click(function(){
		document.getElementById("msgWokrListBody").style.display="block";
		
		document.getElementById("msgReceivedListBody").style.display="none";
		
		document.getElementById("msgSentListBody").style.display="none";
		
		
	});
	
	
	
	/* 모달창메세지보내기  이벤트처리*/
	
	$('#modal_btn_msg_send').click(function(){
		
		var msg_to_number = $('#modal_msg_to_number').val();
		var msg_content =  $('#modal_msg_content').val();
		
		$.ajax({
			method : 'POST',
			url : 'message_send.do',
			data : {
				msg_to_number : msg_to_number,
				msg_content : msg_content
			},
			success:function(result){
				location.href="messagePage.do";
			}, error : function(msg, error) {
				alert(error);
			}
		});		
	});
	
	/* Address List All Calling*/
	
	$('#btn_All_addr').click(function(){
		
		$.ajax({
			method: 'POST',
			url:'Address_AllList.do',
			data:{
			},
			success:function(data){
				if(data == "") return;
				$('#AddrListAll').html("");
				
				var parsed = JSON.parse(data);
		        var result = parsed.result;
				for(var i = 0; i < result.length; i++){
					var str ='<tr><td>'+result[i][0].value+'</td><td>'+result[i][1].value+'</td><td>'+result[i][2].value+'</td><td>'+result[i][3].value+'</td><td>'
					+'<a class="btn btn-success" data-toggle="modal" data-target="#MsgSendFormModal" onclick="submitFunction('+i+');" style="float: right;">'
					+'보 내 기<input id="mmr_'+i+'" type="hidden" value="'+result[i][1].value+'">'
					+'<input id="dept_'+i+'" type="hidden" value="'+result[i][2].value+'"><input id="name_'+i+'" type="hidden" value="'+result[i][3].value+'">'
					+'<input id="number_'+i+'" type="hidden" value="'+result[i][0].value+'"></a></td></tr>'
					$('#AddrListAll').append(str);
				}
			}
		});
	});
	
	
	/*Address keyword search*/
	$('#btn_keyword_addr').click(function(){
		var keyword = $('#keyword_addr').val();
		if(keyword == null || keyword ==""){
			alert("검색어를 입력하세요.");
			return;
		} else {
			$.ajax({
				
				method:'POST',
				url : 'CadreAddressKeyword_search.do',
				data: {
					
					keyword : $('#keyword_addr').val()
				},
				
				success:function(data){
					
					if(data == []){$('#AddrListAll').text("검색결과가 없습니다.").css(color,red);}
					$('#AddrListAll').html("");
					
					var parsed = JSON.parse(data);
			        var result = parsed.result;
					for(var i = 0; i < result.length; i++){
						
						var str ='<tr><td>'+result[i][0].value+'</td><td>'+result[i][1].value+'</td><td>'+result[i][2].value+'</td><td>'+result[i][3].value+'</td><td>'
						+'<a class="btn btn-success" data-toggle="modal" data-target="#MsgSendFormModal" onclick="submitFunction('+i+');" style="float: right;">'
						+'보 내 기<input id="mmr_'+i+'" type="hidden" value="'+result[i][1].value+'">'
						+'<input id="dept_'+i+'" type="hidden" value="'+result[i][2].value+'"><input id="name_'+i+'" type="hidden" value="'+result[i][3].value+'">'
						+'<input id="number_'+i+'" type="hidden" value="'+result[i][0].value+'"></a></td></tr>'
						$('#AddrListAll').append(str);
					}	
				}
			});
		}	
	});

	/*모달창 초기화*/
	$('.modal').on('hidden.bs.modal', function (e) {
	    console.log('modal close');
	  $(this).find('form')[0].reset()
	});
});