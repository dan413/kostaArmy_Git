$(function(){
	$.ajax({
		type: 'POST',
		url : 'alramMsg.do',
		success: function(count){
			$('#count').html("");
			$('#count').append(count);
		}
	});
});
