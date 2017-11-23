$(function() {
	$(document).on('click', '.btn_soldieraddVacation', function() {
		var soldier = $(this).attr('id').split('/');
		var soldier_number = soldier[0];
		var soldier_name = soldier[1];
		var soldier_mmr = soldier[2];
		var soldier_group = soldier[3];
		$('#vacationModal').modal('show');
		$('#btn_completeVacation').click(function(){
			var vacation_kind = $('#vacation_list option:selected').val();
			var vacation_start = $('#vacation_start').val();
			var vacation_end = $('#vacation_end').val();
			if(!vacation_start || !vacation_end){
				$('#vacationModal').modal('hide');
				$('#message').html('휴가 날짜를 제대로 입력하세요.');
				$('#messageType').css('background-color', 'red');
				$('#messageModal').modal("show");
				return;
			}
			var startArray = vacation_start.split('-');
			var endArray = vacation_end.split('-');
			
			var start_date = new Date(startArray[0], startArray[1], startArray[2]);
			var end_date = new Date(endArray[0], endArray[1], endArray[2]);
			
			if(start_date.getTime() > end_date.getTime()){
				$('#vacationModal').modal('hide');
				$('#message').html('휴가 날짜를 제대로 입력하세요.');
				$('#messageType').css('background-color', 'red');
				$('#messageModal').modal("show");
				return;
			}
			$.ajax({
				type:'POST',
				url:'vacation_apply_Bymodal.do',
				data:{
					vacation_number: soldier_number,
					vacation_name: soldier_name,
					vacation_mmr: soldier_mmr,
					vacation_group: soldier_group,
					vacation_kind: vacation_kind,
					vacation_start: vacation_start,
					vacation_end: vacation_end
				},
				success: function(result){
					if(result == '0'){
						location.reload();
						$('#vacationModal').modal('hide');
						
					}
				}
			});
		});
	});
	
	$(document).on('click', '.btn_cadreaddVacation', function() {
		var cadre = $(this).attr('id').split('/');
		var cadre_number = cadre[0];
		var cadre_name = cadre[1];
		var cadre_mmr = cadre[2];
		var cadre_group = cadre[3];
		$('#vacationModal').modal('show');
		
		$('#btn_completeVacation').click(function(){
			var vacation_kind = $('#vacation_list option:selected').val();
			var vacation_start = $('#vacation_start').val();
			var vacation_end = $('#vacation_end').val();
			if(!vacation_start || !vacation_end){
				$('#vacationModal').modal('hide');
				$('#message').html('휴가 날짜를 제대로 입력하세요.');
				$('#messageType').css('background-color', 'red');
				$('#messageModal').modal("show");
				return;
			}
			var startArray = vacation_start.split('-');
			var endArray = vacation_end.split('-');
			var start_date = new Date(startArray[0], startArray[1], startArray[2]);
			var end_date = new Date(endArray[0], endArray[1], endArray[2]);
			
			if(start_date.getTime() > end_date.getTime()){
				$('#vacationModal').modal('hide');
				$('#message').html('휴가 날짜를 제대로 입력하세요.');
				$('#messageType').css('background-color', 'red');
				$('#messageModal').modal("show");
				return;
			}
			
			$.ajax({
				type:'POST',
				url:'vacation_apply_Bymodal.do',
				data:{
					vacation_number: cadre_number,
					vacation_name: cadre_name,
					vacation_mmr: cadre_mmr,
					vacation_group: cadre_group,
					vacation_kind: vacation_kind,
					vacation_start: vacation_start,
					vacation_end: vacation_end
				},
				success: function(result){
					if(result == '0'){
						location.reload();
						$('#vacationModal').modal('hide');
					}
				}
			});
			
		});
	});
	
	$('#btn_sendVacationInfo').click(function(){
		var cadre_group = $('#btn_sendVacationInfo').attr('name');
		$('#message').html('휴가신청을 마치고 결제를 올리시겠습니까?');
	    $('#messageType').css('background-color', '#CEF279');
	    $('#messageModal').modal("show");
	    $('#btn_gotoNextPage').click(function(){
	    	$.ajax({
	    		type: 'POST',
	    		url: 'vacation_apply_toCaptain.do',
	    		data:{
	    			cadre_group: cadre_group
	    		},
	    		success: function(result){
	    			if(result == '0'){
	    				window.location.href="soldierOutSide.do";
	    			}
	    		}
	    	});
	    });
	});
	
	$('.modal').on('hidden.bs.modal', function (e) {
	  $(this).find('form')[0].reset();
	});
});