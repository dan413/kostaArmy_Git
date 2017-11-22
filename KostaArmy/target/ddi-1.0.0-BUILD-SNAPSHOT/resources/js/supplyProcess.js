$(function(){

	var basket_supply_nums = new Array();
	var basket_supply_orders = new Array();
	$(document).on('click','.btn_AddSupplyBasket',function(){
		var supply = $(this).attr('id').split('/');
		var osupply_num = supply[0];
		var osupply_name = supply[1];
		var osupply_flag = supply[2];
		var textbox = "#osupply_order_"+osupply_num;
		var osupply_order = $(textbox).val();
		if(osupply_order.length <= 0){
			$('#message').html('수량을 제대로 입력해주세요.');
			$('#messageType').css('background-color', '#FF5A5A');
			$('#messageModal').modal("show");
			return;
		}
		var count = eval(osupply_order);
		if(count <= 0){
			$('#message').html('수량을 제대로 입력해주세요.');
			$('#messageType').css('background-color', '#FF5A5A');
			$('#messageModal').modal("show");
			return;
		}
		$(this).prop('disabled',true);
		$(this).attr('disabled','disabled');
		basket_supply_nums.push(osupply_num);
		basket_supply_orders.push(osupply_order);
		$.ajax({
			type: 'POST',
			url: "insertBasketSupply.do",
			data:{
				osupply_num: osupply_num,
				osupply_name: osupply_name,
				osupply_order: osupply_order,
				osupply_flag: osupply_flag
			},
			success: function(result){
				$('#basket_table').html('<table class="table table-hover" id="basket_table"><tr align="center" style="background-color: #F6FFCC;"><td width="90px">일련번호</td><td width="90px">분류</td><td width="90px">이름</td><td width="90px">신청개수</td><td width="90px">etc</td></tr>');
				var parsed = JSON.parse(result);
				var data = parsed.result;
				for(var i = 0; i < data.length; i++){
					var str = "<tr align='center'><td width='90px'>"+data[i][0].value+"</td><td width='90px'>"+data[i][1].value+"</td><td width='90px'>"+data[i][2].value+"</td><td width='90px'>"+data[i][3].value+"</td>" +
							"<td width='90px'><input type='button' class='btn btn-warning btn_deleteSupply' id='"+data[i][0].value+"' value='신청취소'></td></tr>";
					$('#basket_table').append(str);
				}
				$('#basket_table').append("</table>");
			}
		});
		$(textbox).val("");
	});
	
	$(document).on('click','.btn_deleteSupply',function(){
		var osupply_num = $(this).attr('id');
		var text = 'btn_'+osupply_num;
		$("input[name="+text+"]").prop('disabled',false);
		$("input[name="+text+"]").removeAttr('disabled');
		for(var i = 0; i < basket_supply_nums.length; i++){
			if(basket_supply_nums[i] == osupply_num){
				delete basket_supply_nums[i];
				delete basket_supply_orders[i];
			}
		}
		$.ajax({
			type: 'POST',
			url: 'deleteBasketSupply.do',
			data: {
				osupply_num: osupply_num
			},
			success: function(result){
				$('#basket_table').html('<table class="table table-hover" id="basket_table"><tr align="center" style="background-color: #F6FFCC;"><td width="90px">일련번호</td><td width="90px">분류</td><td width="90px">이름</td><td width="90px">신청개수</td><td width="90px">etc</td></tr>');
				var parsed = JSON.parse(result);
				var data = parsed.result;
				for(var i = 0; i < data.length; i++){
					var str = "<tr align='center'><td width='90px'>"+data[i][0].value+"</td><td width='90px'>"+data[i][1].value+"</td><td width='90px'>"+data[i][2].value+"</td><td width='90px'>"+data[i][3].value+"</td>" +
							"<td width='90px'><input type='button' class='btn btn-warning btn_deleteSupply' id='"+data[i][0].value+"' value='신청취소'></td></tr>";
					$('#basket_table').append(str);
				}
				$('#basket_table').append("</table>");
			}
		});
	});
	
	$('#btn_SupplyComplete').click(function(){
		jQuery.ajaxSettings.traditional = true;
		$.ajax({
			type: 'POST',
			url: 'SupplyCompleteAdd.do',
			data: {
				basket_supply_nums: basket_supply_nums,
				basket_supply_orders: basket_supply_orders
			},
			success: function(result){
				if(result == "0"){
					$('#message').html('신청한 품목이 없습니다.');
					$('#messageType').css('background-color', '#FF5A5A');
					$('#messageModal').modal("show");
					return;
				}
				window.location.href="getCurrentApplyList.do";
			}
		});
	});
	
	$('#btn_goHome').click(function(){
		window.location.href="Supply_initialization.do";
	});
	
	$(document).on('click','.btn_SupplyAgree',function(){
		var supply = $(this).attr('id').split('/');
		var supply_num = supply[0];
		$.ajax({
			type: 'POST',
			url: 'sign_order.do',
			data:{
				supply_num: supply_num
			},
			success: function(result){
				location.reload();
			}
		});
	});
	
	
	$('#btn_supplySuccess').click(function(){
		$('#message').html('모두 수령 확인하시겠습니까?');
		$('#messageType').css('background-color', '#CEF279');
		$('#messageModal').modal("show");
		$('#btn_gotoNextPage').click(function(){
			$.ajax({
				type: 'POST',
				url: 'completeOrder.do',
				success: function(result){
					location.reload();
				}
			});
		});
	});
	
	$(document).on('click', '.btn_SupplyDisAgree', function(){
		var supply = $(this).attr('id').split('/');
		var supply_num = supply[0];
		$('#SupplyCancelModal').modal("show");
		$('#btn_SupplyCancelComplete').click(function(){
			var Sign_reason = $('#reason_select option:selected').text();
			$.ajax({
				type: 'POST',
				url: 'Sign_Order_Reset.do',
				data:{
					supply_num: supply_num,
					Sign_reason: Sign_reason
				},
				success: function(result){
					location.reload();
				}
			});
		});
	});
	
	$('#btn_receiptSearch').click(function(){
		var date_search = $('#testDatepicker').val();
		$.ajax({
			type: 'POST',
			url: 'dateSearch.do',
			data: {
				date_search: date_search
			},
			success: function(result){
				location.reload();
			}
		});
	});
});

