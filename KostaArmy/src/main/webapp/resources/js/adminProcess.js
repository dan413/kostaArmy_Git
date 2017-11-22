$(function(){
	
	$('#btn_adminTower').click(function(){
		document.getElementById("adminNight").style.display="none";
		document.getElementById("adminTower").style.display="block";
	});
	
	$('#btn_adminNight').click(function(){
		document.getElementById("adminTower").style.display="none";
		document.getElementById("adminNight").style.display="block";
	});
	
});

function updateWeek(type) {//월간에서 수정 눌럿을때
	   document.getElementById("weeklyDate_"+type).style.display="none";
	   document.getElementById("weeklyUpdate_"+type).style.display="block";
	   document.getElementById("weeklyDate1_"+type).style.display="none";
	   document.getElementById("weeklyUpdate1_"+type).style.display="block";
	   document.getElementById("weeklyDate2_"+type).style.display="none";
	   document.getElementById("weeklyUpdate2_"+type).style.display="block";
	   document.getElementById("weeklyDate3_"+type).style.display="none";
	   document.getElementById("weeklyUpdate3_"+type).style.display="block";
	   document.getElementById("weeklyDate4_"+type).style.display="none";
	   document.getElementById("weeklyUpdate4_"+type).style.display="block";
	   document.getElementById("weeklyDate5_"+type).style.display="none";
	   document.getElementById("weeklyUpdate5_"+type).style.display="block";
	   document.getElementById("weeklyDate6_"+type).style.display="none";
	   document.getElementById("weeklyUpdate6_"+type).style.display="block";
	   document.getElementById("weeklyDate7_"+type).style.display="none";
	   document.getElementById("weeklyUpdate7_"+type).style.display="block";
	   document.getElementById("weeklyDate8_"+type).style.display="none";
	   document.getElementById("weeklyUpdate8_"+type).style.display="block";   
}

function update_s_week(result) {//월간에서 수정완료버튼 눌럿을때
	   var w_num = $('#w_num_'+result).val();
	   var weekly = $('#weekly_'+result).val();
	   var w_monday = $('#w_monday_'+result).val();
	   var w_tuesday = $('#w_tuesday_'+result).val();
	   var w_wednesday = $('#w_wednesday_'+result).val();
	   var w_thursday = $('#w_thursday_'+result).val();
	   var w_friday = $('#w_friday_'+result).val();
	   var w_saturday = $('#w_saturday_'+result).val();
	   var w_sunday = $('#w_sunday_'+result).val();
	   
	   $.ajax({
	      type : "POST",
	      url : "weekUpdate.do",
	      data : {
	         w_num :  w_num,
	         weekly :  weekly,
	         w_monday :  w_monday,
	         w_tuesday : w_tuesday,
	         w_wednesday : w_wednesday,
	         w_thursday : w_thursday,
	         w_friday : w_friday,
	         w_saturday : w_saturday,
	         w_sunday : w_sunday
	      },
	      success : function(data) {
	         location.href="weekPlan.do";
	         
	      }, error : function(msg, error) {
	         alert(error);
	      }
	   });
}
