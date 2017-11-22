$(function(){
	$(document).keydown(function(e){
		key = (e) ? e.keyCode : event.keyCode;
	     
	    var t = document.activeElement;
	     
	    if (key == 116) {
	    	 window.location.href="Supply_initialization.do";
	    }
	});
});	