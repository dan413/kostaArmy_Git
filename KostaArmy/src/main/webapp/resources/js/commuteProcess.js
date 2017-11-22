$(function(){
	$('#btn_commute').click(function(){
		$('#commuteModal').modal('show');
		//출근 버튼
		$('#btn_commute_start').unbind('click');
		$('#btn_commute_start').click(function(){
			$('#message').html("출근처리 하시겠습니까? ");
			$('#messageModal').modal("show");
			$('#btn_gotoNextPage').unbind('click');
			$('#btn_gotoNextPage').click(function(){
				$.ajax({
					type: 'POST',
					url: 'start_commute.do',
					success: function(result){
						$('#start_date').text(result);
						$('#btn_commute_start').prop('disabled', true);
						$('#btn_commute_start').attr('disabled', 'disabled');
						return;
					}
				});
			});
			
		});
		//퇴근 버튼
		$('#btn_commute_end').unbind('click');
		$('#btn_commute_end').click(function(){
			$('#message').html("퇴근처리 하시겠습니까? ");
			$('#messageModal').modal("show");
			$('#btn_gotoNextPage').unbind('click');
			$('#btn_gotoNextPage').click(function(){
				$.ajax({
					type: 'POST',
					url: 'end_commute.do',
					success: function(result){
						$('#end_date').text(result);
						$('#btn_commute_end').prop('disabled', true);
						$('#btn_commute_end').attr('disabled', 'disabled');
						return;
					}
				});
			});
		});
		
		//초과 근무 버튼
		$('#btn_commute_over').unbind('click');
		$('#btn_commute_over').click(function(){
			$('#message').html("초과근무를 신청하시겠습니까? ");
			$('#messageModal').modal("show");
			$('#btn_gotoNextPage').unbind('click');
			$('#btn_gotoNextPage').click(function(){
				var date = new Date();
				var hour = date.getHours();
				if(hour < 18){
					alert("지금은 초과근무를 신청할 수 없습니다.");
					return;
				}
				$.ajax({
					type: 'POST',
					url: 'over_commute.do',
					success: function(result){
						$('#over_date').text(result);
						$('#btn_commute_over').prop('disabled', true);
						$('#btn_commute_over').attr('disabled', 'disabled');
						return;
					}
				});
			});
		});
	});
	

});