<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">

<!-- Mirrored from djtntn.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:19:05 GMT -->
<head>
  <meta charset="utf-8">
  <meta name="Author" content="글로벌튼튼병원">
  <meta name="Keywords" content="대전 동구 중리네거리 위치, 척추센터, 관절센터, 내과센터, 건강검진센터">
  <meta name="description" content="대전 동구 중리네거리 위치, 척추센터, 관절센터, 내과센터, 건강검진센터">
  <title>MM튼튼병원</title>
  <link rel="stylesheet" type="text/css" href="resources/dist/css/jquery.bxslider.css">
  <link rel="stylesheet" type="text/css" href="resources/dist/css/common.css"> <!-- 메인 -->
  <link rel="stylesheet" type="text/css" href="resources/dist/css/gnb.css"> <!-- 헤드 -->
  <link rel="stylesheet" type="text/css" href="resources/dist/css/main.css"> <!-- 풋터 -->
  <script src="resources/dist/js/jquery-3.1.1.min.js"></script>
  <script src="resources/dist/js/script.js"></script>
 </head>

 <body>
 <style>




.today_date { background:#D9F3D5};
.date_data {cursor:pointer;background:#E2F0FF;}
.date_data_on {background:#00a795 !important; color:#ffffff !important;cursor:pointer;}
</style> 


<!-- 헤더  -->
<%@include file="includes/header.jsp" %>





	<div class="main_vis">
		<ul class="bxslider">
			<li class="slider1">
				<a href="index.jsp"><span class="btn_n vis1"></span></a>
			</li>
			<li class="slider2">
				<a href="index.jsp"><span class="btn_n vis2"></span></a>
			</li>
			<li class="slider3">
				<a href="index.jsp"><span class="btn_n vis3"></span></a>
			</li>
			<li class="slider6">
				<a href="index.jsp"><span class="btn_n vis6"></span></a>
			</li>
			<li class="slider4">
				<a href="index.jsp"><span class="btn_n vis4"></span></a>
			</li>
			<li class="slider5">
				<a href="index.jsp"><span class="btn_n vis5"></span></a>
			</li>

		</ul>
	</div>

     <div class="top_banner">
		 <ul>
			<li><a href="./sub1/sub_1_2.jsp"><img src="resources/dist/images/main/bn_btn1.png" alt="진료안내" /></a></li>
			<%
				if(av != null || dv != null || nsv != null){
			%>
			<li><img src="resources/dist/images/main/bn_btn3.png" alt="진료예약" /></li>
			<%
				}
			%>
			<%
				if(av == null && dv == null && nsv == null){
			%>
			<li><a href="<%=request.getContextPath() %>/AppointInput.do"><img src="resources/dist/images/main/bn_btn3.png" alt="진료예약" /></a></li>
			<%
				}
			%>
			<li><a href="./sub1/sub_1_5.jsp"><img src="resources/dist/images/main/bn_btn4.png" alt="오시는 길" /></a></li>
			<li><a href="<%=request.getContextPath()%>/notice.do"><img src="resources/dist/images/main/bn_btn5.png" alt="튼튼소식" /></a></li>
		 </ul>
	 </div>

	 <div id="content">
	     <div class="content_wrap">
			 <ul>
			 	<li>
					 <div class="cont_img">
					
						 <img src="resources/dist/images/main/cont_vis4.jpg">
					 </div>
					 <div class="cont_txt">
						 <dl>
							 <dt>정형외과</dt>
							 <dd>몸을 구성하는 뼈, 혈관, 신경, 힘줄, 근육, 인대 등에 발생하는 질환이나 외상을 치료하는 진료과입니다.</dd>
						 </dl>
					 </div>
				 </li>
				 <li>
					 <div class="cont_img">
						 <img src="resources/dist/images/main/cont_vis5.jpg">
					 </div>
					 <div class="cont_txt">
						 <dl>
							 <dt>비뇨기과</dt>
							 <dd> 콩팥(신장), 요관, 방광, 요도 등 요로계 장기들과 음경, 고환, 정관 및 전립선 등 남성생식과 관련된 장기를 다루는 진료과입니다.</dd>
						 </dl>
					 </div>
				 </li>
				 <li>
					 <div class="cont_img">
						 <img src="resources/dist/images/main/cont_vis3.jpg">
					 </div>
					 <div class="cont_txt">
						 <dl>
							 <dt>신경과</dt>
							 <dd>뇌, 척수, 말초신경, 근육 등에 발생하는 신경계통의 질환들을 진단하고 치료하는 진료과입니다.</dd>
						 </dl>
					 </div>
				 </li>
				 <li style="background: #FFF">
					 <div class="cont_img">
						 <img src="resources/dist/images/main/cont_vis8.jpg">
					 </div>
					 <div class="cont_txt">
						 <dl>
							 <dt>정신과</dt>
							 <dd>다양한 정신질환을 진료 경험이 풍부한 전문의와의 상담, 전문 심리검사를 시행하여 정확한 진단을 해주는 진료과입니다.</dd>
<!-- 							 <dd><a href="index.jsp"><img src="resources/dist/images/main/banner_enter.png"></a></dd> -->
						 </dl>
					 </div>
				 </li>
				 <div class="clear"></div>
				 <li>
					 <div class="cont_img">
						 <img src="resources/dist/images/main/cont_vis7.jpg">
					 </div>
					 <div class="cont_txt">
						 <dl>
							 <dt>튼튼소식</dt>
							 <dd>튼튼병원 소식을 전해드립니다.</dd>
							 <dd><a href="<%=request.getContextPath()%>/notice.do"><img src="resources/dist/images/main/banner_enter.png"></a></dd>
						 </dl>
					 </div>
				 <li>
					 <div class="cont_img" style="width: 300px; height: 210px; overflow: hidden;">
						 <img src="resources/dist/images/main/DT마스코트.png" style="width: 300px; height: auto;">
					 </div>
					 <div class="cont_txt">
						 <dl>
							 <dt>튼튼이</dt>
							 <dd>튼튼병원의 마.스.코.트!!!</dd>
						 </dl>
					 </div>
				 </li>
				 <li>
					 <div class="cont_img" style="width: 300px; height: 210px; overflow: hidden;">
						 <img src="resources/dist/images/main/친절의사.png" style="width: 300px; height: 250px;">
					 </div>
					 <div class="cont_txt">
						 <dl>
							 <dt>김성도 의사</dt>
							 <dd>이번달 친절 의사★<br>
							 	신경과 진료는 바로 저!!<br>
							 	성도에게 맡겨주세요~!
							 </dd>
						 </dl>
					 </div>
				 </li>
				 				 <li>
					 <div class="cont_img">
						 <img src="resources/dist/images/main/info3.jpg">
					 </div>
				 </li>
			 </ul>
		 </div>
	 </div>
	 <div class="bottom_banner">
		<div class="inner">
			<div class="tit">협력병원</div>
			<div class="bannerslide" id="sites">
				<div class="slide_hidden">
					<ul class="in_list">
						<li><img src="resources/dist/images/main/partner/cooperate01.png" alt="충남대학교병원" /></li>
						<li><img src="resources/dist/images/main/partner/cooperate02.png" alt="서울대학교병원" /></li>
						<li><img src="resources/dist/images/main/partner/cooperate03.png" alt="삼성서울병원" /></li>
						<li><img src="resources/dist/images/main/partner/cooperate04.png" alt="가톨릭대학교 서울성모병원" /></li>
						<li><img src="resources/dist/images/main/partner/cooperate05.png" alt="서울아산병원" /></li>
						<li><img src="resources/dist/images/main/partner/cooperate06.png" alt="세브란스병원" /></li>
						<li><img src="resources/dist/images/main/partner/cooperate07.png" alt="고려대학교안암병원" /></li>
						<li><img src="resources/dist/images/main/partner/cooperate08.png" alt="건국대학교병원" /></li>
						<li><img src="resources/dist/images/main/partner/cooperate09.png" alt="이대목동병원" /></li>
					</ul>
				</div>
				<a class="btn_left"><img src="resources/dist/images/main/site_left.png" alt="왼쪽"></a>
				<a class="btn_right"><img src="resources/dist/images/main/site_right.png" alt="오른쪽"></a>
			</div>
		</div>
		
	 </div>



<!-- jQuery library -->
<!-- <script src="resources/dist/js/jquery.bxslider.min.js"></script> -->
<script src="<%=request.getContextPath() %>/resources/dist/js/jquery.bxslider.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/dist/js/rollingBanner.js"></script>
<script>
	$(window).on('load', function(){

		$('.bxslider').bxSlider({
			mode: 'horizontal',
			moveSlides: 1,
			infiniteLoop: true,
			speed: 2000,
			auto: true,
			autoControls: true,
			touchEnabled : false,
			stopAutoOnClick: true,
			pager:false,
			controls: true
		});

		//센터별 슬라이드
		var sliders = new Array();
		var config = {
			mode: 'horizontal',
			moveSlides: 1,
			infiniteLoop: true,
			speed: 800,
			auto: true,
			autoControls: true,
			stopAutoOnClick: true,
			pager: false
		};
		$('.cont_slider .doctor').each(function(i, slider){
			sliders[i] = $(slider).bxSlider(config);
		});
		$('#centerChange').on('change', function(){
			$('.cont_slider > li').removeClass('current').eq($(this).val()).addClass('current');
			$.each(sliders, function(i, slider) {
				slider.reloadSlider(config);
			});
		});

		$('#sites').rollingBanner({
			speed : 40,
			direction : 'left',
			left : $('#sites .btn_left'),
			right : $('#sites .btn_right')
		});
	});

</script>
<script>
function reservation(){
	var obj = document.form;
	if(!obj.name.value || obj.name.value == ""){
			alert("이름을 입력하세요.");
			obj.name.focus();
			return false;
		}
		if(!obj.tel.value || obj.tel.value == ""){
			alert("연락처를 입력하세요.");
			obj.tel.focus();
			return false;
		}
		if(!obj.gubun.value || obj.gubun.value == ""){
			alert("진료과목을 선택하세요.");
			obj.medical.focus();
			return false;
		}
		//alert(obj.gubun.value);
		obj.submit();
}
</script>
	 <div id="footer">
		 <div class="footer_wrap">
			 <div class="f_logo"><img src="resources/dist/images/main/logo1.png"></div>
			 <div class="r_footer">
			     <div class="footer_top">
					 <ul>
						 <li><a href="sub1/sub_1_1.jsp">병원소개</a></li>
						 <li>ㅣ</li>
						 <li><a href="#">이용약관</a></li>
						 <li>ㅣ</li>
						 <li><a href="#">개인정보취급방침</a></li>
						 <li>ㅣ</li>
						 <li>대표번호  042-222-8201</li>
					 </ul>
					 <!--
					 <span><a href="https://blog.naver.com/djtntnblog" target="_blank"><img src="/images/main/blog.jpg"></a></span>
					 <span><a href="http://pf.kakao.com/_Ygsxlxb" target="_blank"><img src="/images/main/kakao.jpg"></a></span>
					 -->
				 </div>
				 <div class="footer_bottom">
					 <ul>
						 <li>MM튼튼병원ㅣTEL) 042-222-8201ㅣ사업자번호ㅣ306-82-05291 대전광역시 중구 계룡로 846, 3-4층 / 중리네거리ㅣ<br>Copyright © MM Teun Teun Hospital All right reserved.</li>
					 </ul>
				 </div>
			 </div>

		 </div>
     </div>

<script>

/** 새창팝업 **/
function popWin(url, w, h, scroll){
	var pop;
	var setting = "width="+w+", height="+h+", top=0, left=0, scrollbars="+scroll;
	pop = window.open(url, "", setting);
	pop.focus();
}
</script>
<div id="quick_div">
	<img src="resources/dist/images/main/quick_menu_ic_n2.png" usemap="#quick_menu_ic" />
	<map name="quick_menu_ic">
	    <area shape="rect" coords="0,164,134,298" href="./sub1/sub_1_5.jsp" target="" alt="" />
		<area shape="rect" coords="0,30,134,164" href="./sub2/sub_2_1.jsp" target="" alt="" />
	</map>
</div>
	<!-- 	회원탈퇴 완료 알림 스크립트 -->
<%
	String msg =request.getParameter("msg");
	if(msg != null && msg.equals("success")){
%>
<script type="text/javascript">
	alert("회원탈퇴가 완료되었습니다.");
</script>
<% 
	}
%>	
</body>

<!-- Mirrored from djtntn.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:20:12 GMT -->
</html>