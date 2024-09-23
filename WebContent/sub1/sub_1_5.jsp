<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<!-- Head css,js 영역 -->
 <%@include file="../includes/headcss.jsp" %>
 
 
 <body>
 <style>
.today_date { background:#D9F3D5};
.date_data {cursor:pointer;background:#E2F0FF;}
.date_data_on {background:#00a795 !important; color:#ffffff !important;cursor:pointer;}
</style>


 <!-- 헤더  -->
<!-- 병원소개 진료안내 등 메뉴창 -->
 <%@include file="../includes/header.jsp" %>
<link rel="stylesheet" type="text/css" href="../resources/dist/css/sub.css">
<script type="text/javascript" src="../../../openapi.map.naver.com/openapi/v3/maps263e.js?clientId=(메롱);submodules=geocoder"></script>

 <div class="sub_vis">
      <img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/sub1_vis.png" />
 </div>


     <div class="content">

		 <div class="left">
			 <div class="sub_menu">
	 <h3>병원소개</h3>
	 <ul>
		 <li ><a href="sub_1_1.jsp">병원장인사말</a></li>
		 <li ><a href="sub_1_2.jsp">의료진소개</a></li>
		 <li  class="on"><a href="sub_1_5.jsp">찾아오시는길</a></li>
	 </ul>
 </div>
  <p><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/call.jpg"/></p>
 <p><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/res.jpg"/></p>		 </div>


		 <div class="right">
			 <div class="sub_lnb">
				 <h2>찾아오시는길</h2>
				 <ul>
					 <li><a href="<%=request.getContextPath() %>/home.do">홈</a></li>
					 <li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li><a href="sub_1_1.jsp">병원소개</a></li>
					 <li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li class="on1"><a href="sub_1_5.jsp">찾아오시는길</a></li>
				 </ul>
			 </div>

			 <div class="sub_content">
				<div class="sub1_5">
					<div class="sub_map"id="map" style="width:100%;height:500px;"></div>
					<div class="location">
						<ul class="top">
							<li><img src="/MmHospital/resources/dist/images/main/logo.png" alt="mm튼튼병원" ></li>
							<li><span>주소</span> 대전광역시 중구 계룡로 846, 3-4층 / 서대전네거리역 4번 출구에서 393m</li>
							<li><span>대표번호</span> 042-220-8201</li>
						</ul>
						<ul class="bottom">
							<li class="info1">
								<div class="in_left">버스를 이용하실 때</div>
								<div class="in_right">
									<ul>
										<li><span>101번, 103번, 315번, 618번, 614번</span>서대전네거리역4번출구, 서대전네거리역5번출구 정류장 하차</li>
										<li><span>103번, 603번, 618번</span>중도일보 정류장 하차</li>
										<li><span>101번, 103번, 315번, 618번, 614번, 622번</span>중도일보 정류장 하차 </li>
									</ul>
								</div>
							</li>
							<li class="info2">
								<div class="in_left">주차안내</div>
								<div class="in_right">
									진료를 받거나 입원 환자의 보호자인 경우 <span>일정시간 동안 주차장을 무료</span>로 이용할 수 있습니다.<br>
									차내 귀중품 도난 및 개인의 부주의로 인한 차량 손상에 대해서는 본원은 책임지지 않습니다. <br>
									안전사고 예방을 위하여 주차장 관리자의 지시에 협조해주시기 바랍니다.
								</div>
							</li>
						</ul>
					</div>
				</div>
			 </div>
		 </div> 
	
	 </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=(메롱)"></script>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(36.3250154, 127.4088838),
			level: 3
		};
		
		var map = new kakao.maps.Map(container, options);
		
		var markerPosition  = new kakao.maps.LatLng(36.3250154, 127.4088838); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
</script>


	<!-- 	footer 영역 -->
	 <%@include file="../includes/footer.jsp" %>

<script>

/** 새창팝업 **/
function popWin(url, w, h, scroll){
	var pop;
	var setting = "width="+w+", height="+h+", top=0, left=0, scrollbars="+scroll;
	pop = window.open(url, "", setting);
	pop.focus();
}
</script>

	<!-- 	퀵메뉴 -->
	<%@include file="/includes/body.jsp" %>

</body>

<!-- Mirrored from djtntn.com/sub/sub1/sub_1_5.php by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:24:30 GMT -->
</html>