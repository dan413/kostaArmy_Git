function searchFunction() {//추가버튼 눌럿을때

	var selection = $('#selection').val();
	var keyvalue = $('#keyvalue').val();
	$.ajax({
		type : "POST",
		url : "searchListFunction.do",
		data : {
			selection :  selection,
			keyvalue :  keyvalue,
		},
		success : function(result) {
			if(result == "") return;
	         $('#search').html("");
	         var parsed = JSON.parse(result);
	         var result = parsed.result;
	         for (var i = 0; i < result.length; i++) {
	            var str = '<tr id="'+result[i][1].value +' '+result[i][2].value+'" draggable="true" ondragstart="onDragStart(event)" onmouseout="change2(this)" onmouseover="change1(this)" >'
				+'<td>'+result[i][1].value +' '+ result[i][2].value+' </td></tr>'
	                  
	            $('#search').append(str);
	         }
			
		}, error : function(msg, error) {
			alert(error);
		}
	});
	
}