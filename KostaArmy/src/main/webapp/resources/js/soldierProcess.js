$(function(){
	var soldier_flag = false;
   $('#btn_addSoldier').click(function(){
      $('#AddSoldierModal').modal("show");
      $('#text_soldier_number').keyup(function(){
    	  $.ajax({
    		 type: 'POST',
    		 url: 'patternSoldierNum.do',
    		 data: {
    			 soldier_number :  $('#text_soldier_number').val()
    		 },
    		 success: function(result){
    			 if(result == 0){
    				 $('#text_soldier_number').css("border-radius", "5px");
    				 $('#text_soldier_number').css("border", "2px solid red");
    				 soldier_flag = false;
    			 }
    			 else{
    				 $('#text_soldier_number').css("border-radius", "5px");
    				 $('#text_soldier_number').css("border", "2px solid green");
    				 soldier_flag = true;
    			 }
    		 }
    	  });
      });
      $('#btn_addSoldierPro').unbind('click');
      $('#btn_addSoldierPro').click(function(){
    	 if(!soldier_flag){
    		 $('#message').html('군번형식에 일치하지 않습니다.');
             $('#messageType').css('background-color', 'red');
             $('#messageModal').modal("show");
             return;
    	 }
         var soldier_number = $('#text_soldier_number').val();
         var soldier_name = $('#text_soldier_name').val();
         var soldier_mmr = $('#select_soldier_mmr option:selected').text();
         var soldier_group = $('#select_soldier_group option:selected').text();
         var soldier_inputDate = $('#text_soldier_inputDate').val();
         var soldier_outputDate = $('#text_soldier_outputDate').val();
         if(soldier_inputDate == null || soldier_inputDate == "" || soldier_outputDate == null || soldier_outputDate == ""){
        	 $('#message').html('입대일과 전역일을 확인해주세요.');
             $('#messageType').css('background-color', 'red');
             $('#messageModal').modal("show");
             return;
         }
         if(soldier_number.length <= 0 || soldier_name.length <= 0){
        	 $('#message').html('정보를 모두 입력해주세요.');
             $('#messageType').css('background-color', 'red');
             $('#messageModal').modal("show");
             return;
         }
         $('#AddSoldierModal').modal("hide");
         $('#message').html('병사를 등록하시겠습니까?');
         $('#messageType').css('background-color', '#CEF279');
         $('#messageModal').modal("show");
         $('#btn_gotoNextPage').unbind('click');
         $('#btn_gotoNextPage').click(function(){
            $.ajax({
               type: 'POST',
               url: 'addNewSoldier.do',
               data: {
                  soldier_number: soldier_number,
                  soldier_name: soldier_name,
                  soldier_mmr: soldier_mmr,
                  soldier_group: soldier_group,
                  soldier_inputDate: soldier_inputDate,
                  soldier_outputDate: soldier_outputDate
               },
               success: function(result){
                  if(result =='0'){
                     window.location.href='soldierList.do';
                  }
               }
            });
         });
      });
   });
   
   $(document).on('click', '.btn_discharge', function(){
      var soldier_number = $(this).attr('id');
      $('#message').html('전역처리를 하시겠습니까?');
      $('#messageType').css('background-color', '#CEF279');
      $('#messageModal').modal("show");
      $('#btn_gotoNextPage').click(function(){
         $('#messageModal').modal("hide");
         $.ajax({
            type: 'POST',
            url: 'dischargeProcess.do',
            data:{
               soldier_number: soldier_number
            },
            success : function(result){
               if(result == '0'){
                  location.reload();
               }
            }
         });
      });
   });
   
   
   $('.modal').on('hidden.bs.modal', function (e) {
       console.log('modal close');
     $(this).find('form')[0].reset()
   });
 
   
   $('#text_soldier_regidentNum').keyup(function(){
	   $.ajax({
	 		 type: 'POST',
	 		 url: 'patternSoldierRegidentNum.do',
	 		 data: {
	 			 soldier_regidentNum :  $('#text_soldier_regidentNum').val()
	 		 },
	 		 success: function(result){
	 			 if(result == 0){
	 				 valid_regidentNum = false;
	 				 $('#valid_soldier_regidentNum').attr("class", "label label-danger");
	 				 $('#valid_soldier_regidentNum').text('형식불일치');
	 			 }
	 			 else{
	 				 valid_regidentNum = true;
	 				 $('#valid_soldier_regidentNum').attr("class", "label label-success");
	 				 $('#valid_soldier_regidentNum').text('사용가능');
	 			 }
	 		 }
	 	  });
   });
   
   $('#text_soldier_phone').keyup(function(){
	   $.ajax({
	 		 type: 'POST',
	 		 url: 'patternSoldierPhone.do',
	 		 data: {
	 			 soldier_phone :  $('#text_soldier_phone').val()
	 		 },
	 		 success: function(result){
	 			 if(result == 0){
	 				 valid_phone = false;
	 				 $('#valid_soldier_phone').attr("class", "label label-danger");
	 				 $('#valid_soldier_phone').text('형식불일치');
	 			 }
	 			 else{
	 				 valid_phone = true;
	 				 $('#valid_soldier_phone').attr("class", "label label-success");
	 				 $('#valid_soldier_phone').text('사용가능');
	 			 }
	 		 }
	 	  });
   });
   
});

function handleFileSelect() {
   var files = document.getElementById('btn_addImage').files[0]; // 파일 객체
   var reader = new FileReader();
   // 파일정보 수집
   reader.onload = (function(theFile) {
      return function(e) {
         $('#picture_scape').attr('src', e.target.result);
      };
   })(files);
   reader.readAsDataURL(files);
}