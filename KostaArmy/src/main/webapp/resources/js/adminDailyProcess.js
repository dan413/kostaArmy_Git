function dailyUpdateForm(type) {//수정 눌럿을때
	document.getElementById("dailyData1_"+type).style.display="none";
	document.getElementById("dailyUpdate1_"+type).style.display="block";
	document.getElementById("dailyData2_"+type).style.display="none";
	document.getElementById("dailyUpdate2_"+type).style.display="block";
	document.getElementById("dailyData3_"+type).style.display="none";
	document.getElementById("dailyUpdate3_"+type).style.display="block";
}

$(document).ready(function(){
	dailyListFunction('listAll');
});

function submitFunction() {//추가버튼 눌럿을때
	
	var dailyContent = $('#dailyContent').val();
	var dailyMemo = $('#dailyMemo').val();
	var dailyTime = $('#dailyTime').val();
	var cadre_group = $('#cadre_group').val();
	$.ajax({
		type : "POST",
		url : "AdminSubmit.do",
		data : {
			cadre_group :  cadre_group,
			dailyContent :  dailyContent,
			dailyMemo :  dailyMemo,
			dailyTime :  dailyTime
		},
		success : function(result) {
			dailyListFunction('listAll');
			
		}, error : function(msg, error) {
			alert(error);
		}
	});
	$('#dailyContent').val('');
	$('#dailyMemo').val('');
	$('#dailyTime').val('');
	
}
function dailyListFunction(type) {//리스트 출력
	   $.ajax({
	      type : "POST",
	      url : "DailyListFunction.do",
	      data : {
	         listType : type
	      },
	      success : function(data) {
	         
	         if(data == "") return;
	         $('#dailyList').html("");
	         var parsed = JSON.parse(data);
	         var result = parsed.result;
	         for (var i = 0; i < result.length; i++) {
	            var str = '<tr><td style="width: 10%; background-color: #EAEAEA;">시 간</td><td style="background-color: #EAEAEA;"><div id="dailyData1_'+result[i][0].value+'">'+result[i][3].value
	            +'<a class="btn btn-default" onclick="dailyDeleteFunction('+result[i][0].value+');" style="float: right;">삭 제</a>'
	            +'<a class="btn btn-default" onclick="dailyUpdateForm('+result[i][0].value+');" style="float: right;">수 정</a></div>'
	            +'<div id="dailyUpdate1_'+result[i][0].value+'" style="background-color: #EAEAEA; display:none;"><input id="dailyUpdateTime_'+result[i][0].value+'" class="form-control" type="text" placeholder="시간을 입력 하세요" style="width: 25%;">'
	            +'<a class="btn btn-default pull-right" onclick="dailyUpdateFunction('+result[i][0].value+');" style="float: right;">수정완료</a>'
	            +'</div></td></tr>'
	            +'<tr height="80"><td>내 용</td><td><div id="dailyData2_'+result[i][0].value+'">'+result[i][1].value+'</div><div id="dailyUpdate2_'+result[i][0].value+'" style="display:none;"><textarea id="dailyUpdateContent_'+result[i][0].value+'" class="form-control" placeholder="내용 입력 하세요" maxlength="500" style="width:100%; height: 80px;"></textarea></div></td></tr>'
	            +'<tr><td>비 고</td><td><div id="dailyData3_'+result[i][0].value+'">'+result[i][2].value+'</div><div id="dailyUpdate3_'+result[i][0].value+'" style="display:none;"><input id="dailyUpdateMemo_'+result[i][0].value+'" type="text" class="form-control" placeholder="비 고" style="width: 70%; float: left;"></div></td></tr>'
	            
	                  
	            $('#dailyList').append(str);
	         }
	      }
	   });
}
	

function dailyDeleteFunction(type) {//삭제 버튼 눌렀을때
	var dailyID = type;
	 $.ajax({
		type : "POST",
		url : "DailyDeleteFunction.do",
		data : {
			dailyID :  dailyID
		},
		success : function(data) {
			dailyListFunction('listAll');
		}
	}); 
}


function dailyExelFunction() {//엑셀 저장 버튼 눌럿을때
	var today = $('#today').val();
	$('#dailyList').html("");
	location.href="AdminDailyExel.do?today="+today; 
}


function dailyUpdateFunction(type) {
	var dailyID = type;
	var dailyContent = $('#dailyUpdateContent_'+type+'').val();
	var dailyMemo = $('#dailyUpdateMemo_'+type+'').val();
	var dailyTime = $('#dailyUpdateTime_'+type+'').val();
	
	 $.ajax({
		type : "POST",
		url : "DailyUpdateFunction.do",
		data : {
			dailyID :  dailyID,
			dailyContent : dailyContent,
			dailyMemo : dailyMemo,
			dailyTime : dailyTime
		},
		success : function(data) {
			dailyListFunction('listAll');
		}, error : function(msg, error) {
			alert(error);
		}
	}); 
}
