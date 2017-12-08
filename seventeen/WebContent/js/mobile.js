/* 대메뉴 */
$(function() {
	$("#header h2, #header h3").click(function(){
		if($(".gnb").css("display")=="block") {
			$(".gnb:not(:animated)").slideUp("slow");
			$("#header h3").hide();
			$("#header h2").show();
		} else {
			$(".gnb").slideDown("slow");
			$("#header h3").show();
			$("#header h2").hide();
		};
	});
})