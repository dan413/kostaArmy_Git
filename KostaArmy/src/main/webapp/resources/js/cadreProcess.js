$(function(){
   
   $('.modal').on('hidden.bs.modal', function (e) {
       console.log('modal close');
      $('#label_passwordState').text('');
     $(this).find('form')[0].reset()
   });

   $('#cadre_mmr').change(function(){
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
   
   $('#btn_changePassword').click(function(){
      $('#ChangePasswordModal').modal('show');
      var current_flag = false;
      var new_flag = false;
      $('#currentPassword').keyup(function(){
         var cadre_number = $('#cadre_number').val();
         var currentPassword = $('#currentPassword').val();
         $.ajax({
            type: 'POST',
            url: 'passwordValid.do',
            data:{
               cadre_number: cadre_number,
               currentPassword: currentPassword
            },
            success: function(result){
               switch(result){
               case '0':
                  $('#label_passwordState').attr("class", "label label-success");
                  $('#label_passwordState').text('현재 비밀번호 확인');
                  current_flag = true;
                  break;
               case '1':
                  $('#label_passwordState').attr("class", "label label-danger");
                  $('#label_passwordState').text('현재 비밀번호가 일치하지 않습니다.');
                  current_flag = false;
                  break;
               }
            }
         });
      });
      
      $('#NewPassword').keyup(function(){
         var NewPassword = $('#NewPassword').val();
         var NewPassword_compare = $('#NewPassword_compare').val();
         if(current_flag == true){
            if(NewPassword == NewPassword_compare && (NewPassword.length >= 6 && NewPassword_compare.length >= 6)){
               $('#label_passwordState').attr("class", "label label-success");
               $('#label_passwordState').text('비밀번호가 일치합니다.');
               new_flag = true;
            }
            else{
               $('#label_passwordState').attr("class", "label label-danger");
               $('#label_passwordState').text('변경할 비밀번호가 일치하지 않습니다.');
               new_flag = false;
            }
         }
         else if(current_flag == false && $('#NewPassword').text().length == 0){
            $('#message').html('현재 비밀번호가 일치해야합니다.');
            $('#messageType').css('background-color', 'red');
            $('#messageModal').modal("show");
            $('#NewPassword').val('');
         }
         
      });
      
      $('#NewPassword_compare').keyup(function(){
         var NewPassword = $('#NewPassword').val();
         var NewPassword_compare = $('#NewPassword_compare').val();
         if(current_flag == true){
            if(NewPassword == NewPassword_compare && (NewPassword.length >= 6 && NewPassword_compare.length >= 6)){
               $('#label_passwordState').attr("class", "label label-success");
               $('#label_passwordState').text('비밀번호가 일치합니다.');
               new_flag = true;
            }
            else{
               $('#label_passwordState').attr("class", "label label-danger");
               $('#label_passwordState').text('변경할 비밀번호가 일치하지 않습니다.');
               new_flag = false;
            }
         }
         else if(current_flag == false && $('#NewPassword_compare').text().length == 0){
            $('#message').html('현재 비밀번호가 일치해야합니다.');
            $('#messageType').css('background-color', 'red');
            $('#messageModal').modal("show");
            $('#NewPassword_compare').val('');
         }
      });
      
      $('#btn_pwChangeComplete').click(function(){
         if(new_flag == true && current_flag == true){
            var cadre_number = $('#cadre_number').val();
            var NewPassword = $('#NewPassword').val();
            $.ajax({
               type: 'POST',
               url: 'changePassword.do',
               data:{
                  cadre_number: cadre_number,
                  NewPassword: NewPassword
               },
               success: function(result){
                  if(result == 0){
                     $('#ChangePasswordModal').modal('hide');
                     $('#message').html('비밀번호가 변경되었습니다.');
                     $('#messageType').css('background-color', '#CEF279');
                     $('#messageModal').modal("show");
                  }
                  else{
                     $('#message').html('비밀번호변경에 실패했습니다.');
                     $('#messageType').css('background-color', 'red');
                     $('#messageModal').modal("show");
                  }
               }
            });
         }
         else{
            $('#message').html('비밀번호를 확인해주세요.');
            $('#messageType').css('background-color', 'red');
            $('#messageModal').modal("show");
         }
      });
   });
   
   $(document).on('click', '.btn_discharge', function(){
      var cadre_number = $(this).attr('id');
      $('#message').html('전역처리를 하시겠습니까?');
      $('#messageType').css('background-color', '#CEF279');
      $('#messageModal').modal("show");
      $('#btn_gotoNextPage').click(function(){
         $('#messageModal').modal("hide");
         $.ajax({
            type: 'POST',
            url: 'CadredischargeProcess.do',
            data:{
               cadre_number: cadre_number
            },
            success : function(result){
               if(result == '0'){
                  location.reload();
               }
            }
         });
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

