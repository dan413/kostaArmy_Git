$(function(){
	var group_level = $('#cadre_mmr option:selected').attr('id');
	$('#cadre_group').empty();
	$('#cadre_position').empty();
	if(group_level == '1'){
		$('#cadre_supergroup').attr("value","KOSTA사단 KOSTA연대 KOSTA대대");
		
		var group = ["본부중대", "1중대", "2중대", "3중대"];
		for(var i = 0; i < group.length; i++){
			var option = '<option>'+group[i]+'</option>';
			$('#cadre_group').append(option);
		}
		
		var position = ['중대장', '행정보급관'];
		for(var i = 0; i < position.length; i++){
			var position_option = '<option>'+position[i]+'</option>';
			$('#cadre_position').append(position_option);
		}
	}
	else if(group_level == '2'){
		$('#cadre_supergroup').attr("value","KOSTA사단 KOSTA연대");
		var group = 'KOSTA대대';
		var option = $('<option>'+group+'</option>');
		$('#cadre_group').append(option);
		
		var position = ['대대장', '군수과장', '인사과장', '작전과장'];
		for(var i = 0; i < position.length; i++){
			var position_option = '<option>'+position[i]+'</option>';
			$('#cadre_position').append(position_option);
		}
	}
});