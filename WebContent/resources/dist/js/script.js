var popup = {
	open : function(item){
		$('.popList').show();
		$(item).show();
	},
	close : function(){
		$('.popList').hide();
		$('.popList .item').hide();
	}
}

$(document).ready(function(){
	var $win = $(window);
	var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
	var btm = $(window).height() + top;

    /*사용자 설정 값 시작*/
    var speed          = "fast";     // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
    var easing         = 'swing'; // 따라다니는 방법 기본 두가지 linear, swing
    var $layer         = $('#quick_div'); // 레이어 셀렉팅
    var layerTopOffset = 0;   // 레이어 높이 상한선, 단위:px
    $layer.css('position', 'absolute');
    /*사용자 설정 값 끝*/

    // 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
    if (top > 0 )
        $win.scrollTop(layerTopOffset+top);
    else
        $win.scrollTop(0);

    //스크롤이벤트가 발생하면
    $(window).scroll(function(){
		
		yPosition = $win.scrollTop() + 137;

		if ($(location).attr('pathname') == "/" || $(location).attr('pathname') == "/index.php")
		{
			if(yPosition > 1056){
				yPosition = 1056;
			}
			
		}else{
			if (yPosition < 137)
			{
				yPosition = 137;
			}	
		}
		
        $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
    });

	$('#gnb .menu > li').on({
		'mouseenter' : function(){
			$(this).children('ul').stop().slideDown(300);
		},
		'mouseleave' : function(){
			$(this).children('ul').stop().slideUp(200);
		}
	});

	/*
	yPosition = $win.scrollTop() + 235;
        
	if ($(location).attr('pathname') == "/" || $(location).attr('pathname') == "/index.php")
	{
		if (yPosition < 1043)
		{
			yPosition = 1043;
		}		
	}else{
		if (yPosition < 458)
		{
			yPosition = 458;
		}		
	}
	
	$layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
	*/
});