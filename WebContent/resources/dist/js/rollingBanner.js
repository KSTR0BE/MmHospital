/**
 * rollingBanner 0.2
 * http://www.yamah.co.kr
 *
 * Copyright (C) 2017 yamah.co.kr
 */

(function($){
	$.fn.rollingBanner = function(opt){

		var $this = this,
              $listBox = $this.find('.in_list'),
              $list = $listBox.children('li'),
              thisWidth = $this.width(),
              listWidth = $listBox.width(),
			  move = 0,
              listHalf,
			  listmove;
		
		// 초기 세팅
		opt = $.extend({
			speed : 50,
			direction : 'left',
			left : $this.children('.btn_left'),
			right : $this.children('.btn_right')
		}, opt);
		
		var direction = opt.direction;
		
		var slide = {
			init : function(){
				$list.each(function(i){
					$listBox.append($list.eq(i).clone()) //리스트 그대로 복사해서 뒤에 붙인다
				});
				listHalf = $listBox.innerWidth() / 2; //복사로 인해 리스트의 사이즈가 두배로 되었기 때문에 나누기를 해준다
				slide.play();
				slide.controls();
			},
			controls : function(){
				$this.children('.slide_hidden').on({
					'mouseenter' : function(){
						slide.pause();	
					},
					'mouseleave' : function(){
						slide.play();
					}
				});
				opt.left.on('mouseenter', function(){
					direction = 'left';
					slide.play();
				});
				opt.right.on('mouseenter', function(){
					direction = 'right';
					slide.play();
				});
			},
			move : function(){
				if(direction == 'left'){
					$listBox.css({'left':move--});
					if (Math.abs(move) >= listHalf) { // 현재 값이 리스트의 절반값 보다 크거나 같은 겨우 0으로 초기화
						move = 0
					}
				}else if(direction == 'right'){
					$listBox.css({'left':move++}); 
                    if (move >= 0) {//현재 값이 0보다 크거나 같은 경우 리스트 사이즈의 반값 만큼 당겨준다
                       move = -listHalf
                    }
				}
			},
			play : function(){
				slide.pause();
                listmove = setInterval(slide.move, opt.speed)
			},
			pause : function(){
				clearInterval(listmove);
			}
		}
		
		if(thisWidth < listWidth){ // 리스트박스의 사이즈가 출력박스보다 큰 경우만 실행
			slide.init();
		}
	}	
})(jQuery);

