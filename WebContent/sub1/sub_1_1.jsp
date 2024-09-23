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
#sp1{
	font-size: 18pt;
}
#sp2{
	font-size: 18pt;
	color: #51C1B4;
}
</style>
<!-- 헤더  -->
<!-- 병원소개 진료안내 등 메뉴창 -->

 <%@include file="../includes/header.jsp" %>
 
 
<link rel="stylesheet" type="text/css" href="../resources/dist/css/sub.css">

 <div class="sub_vis">
     <img src="../resources/dist/images/sub/sub1/sub1_vis.png" />
 </div>


     <div class="content">

		 <div class="left">
			 <div class="sub_menu">
	 <h3>병원소개</h3>
	 <ul>
		 <li  class="on"><a href="../sub1/sub_1_1.jsp">병원장인사말</a></li>
		 <li ><a href="../sub1/sub_1_2.jsp">의료진소개</a></li>
		 <li ><a href="../sub1/sub_1_5.jsp">찾아오시는길</a></li>
	 </ul>
 </div>
 <p><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/call.jpg"/></p>
 <p><img src="../resources/dist/images/sub/sub1/res.jpg"/></p>		 </div>


		 <div class="right">
			 <div class="sub_lnb">
				 <h2>병원장인사말</h2>
				 <ul>
					 <li><a href="<%=request.getContextPath() %>/home.do">홈</a></li>
					 <li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li><a href="sub_1_1.jsp">병원소개</a></li>
					 <li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li class="on1"><a href="sub_1_1.jsp">병원장인사말</a></li>
				 </ul>
			 </div>
		     <div class="sub_content">
				<div class="sub1_1">
					<div class="tit">안녕하십니까<br><span>MM튼튼병원 병원장 양승환</span>입니다.</div>
					<div class="txt1">
						언제나 환자분들과의 신뢰를 최우선으로 환자중심에서 생각하고 진료할 수 있도록 노력하고 있습니다.<br>
						환자분들의 아픔과 어려움에 대해 공감할 줄 아는 마음과 각 분야 전문의,<br>
						그리고 최첨단 장비를 이용해 일시적인 통증치료가 아닌 질병의 원인을 찾아낼 수 있도록 노력하는 병원이 되겠습니다.
						<img alt="양승환" src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/양승환.png" style="width:70%;height:600px;opacity:0.8">
					</div>
				</div>
			</div>	
				
			<div class="sub1_1" style="height:500px">
				<div class="sub_content">	
					<dl class="txt2">
						<dt><span id="sp1">MM튼튼병원의 자랑인 건강검진센터는</span> </dt>
						<dd>
							모든 질환은 증상이 나타나기 전에 검진을 받아 진행되고 있는 질환이 있다면 조기에 발견하고 합병증을 최소화하기 위해<br>
							신속하고 체계적인 진료를 받을 수 있도록 각 전문의가 협진하며 MRI, CT, 초음파 및 혈액검사를<br>
							검사당일 확인 가능하도록 <span>One Day One Stop</span>시스템으로 진행됩니다.
						</dd>
						<dt><span id="sp2">짧은 시간동안 괄목할만한 성장의 배경에는</span> </dt>
						<dd>
							우수한 의료진과 최신 진단기기의 도입, 전직원의 노력 등이 아우러져서 환자분들의 신뢰도가 높아져 믿고 찾을 수 있도록 만든<br>
							것이라고 생각합니다. 이에 여기서 만족하지 않고 더욱 연구하는 병원, 더욱 치료결과가 좋은 병원을 만들기 위해 의료진들도 더욱<br>
							부단한 노력과 경쟁을 마다하지 않겠습니다. 병원을 찾는 모든 분들이 만족하고 치료 결과에 대해 감동받을 수 있는 병원이 될 수 있도록<br>
							모든 직원들은 최선을 다하겠습니다.					
						</dd>
					</dl>
				</div>
				</div>
				
		 </div>

	 </div>

	<!-- 	footer 영역 -->
	 <%@include file="../includes/footer.jsp" %>

<script>

/** 새창팝업 **/
function popWin(url, w, h, scroll){
	var pop;
	var setting = "width="+w+", height="+h+", top=0, left=0, scrollbars="+scroll;
	pop = window.open(url, "", setting);
	pop.focus();
};
</script>
	<!-- 	퀵메뉴 -->
	<%@include file="/includes/body.jsp" %>
</body>

<!-- Mirrored from djtntn.com/sub/sub1/sub_1_1.php by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:23:42 GMT -->
</html>