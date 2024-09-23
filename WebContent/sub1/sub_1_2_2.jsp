<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<!-- Mirrored from djtntn.com/sub/sub1/sub_1_2_2.php by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:45:55 GMT -->

<!-- Head css,js 영역 -->
 <%@include file="../includes/headcss.jsp" %>

 
 <body>
 <style>
.today_date { background:#D9F3D5};
.date_data {cursor:pointer;background:#E2F0FF;}
.date_data_on {background:#00a795 !important; color:#ffffff !important;cursor:pointer;}
</style>
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
		 <li ><a href="sub_1_1.jsp">병원장인사말</a></li>
		 <li  class="on"><a href="sub_1_2.jsp">의료진소개</a></li>
		 <li ><a href="sub_1_5.jsp">찾아오시는길</a></li>
	 </ul>
 </div>
  <p><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/call.jpg"/></p>
 <p><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/res.jpg"/></p>		 </div>


		 <div class="right">
			 <div class="sub_lnb">
				 <h2>의료진소개</h2>
				 <ul>
					 <li><a href="<%=request.getContextPath() %>/home.do">홈</a></li>
					 <li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li><a href="sub_1_1.jsp">병원소개</a></li>
					 <li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li class="on1"><a href="sub_1_2.jsp">의료진소개</a></li>
				 </ul>
			 </div>
			 <div class="sub_content">
				<div class="sub1_2">
					<ul class="tabmenu_202303">
						<li><a href="sub_1_2.jsp">병원장</a></li>
						<li class="on"><a href="sub_1_2_2.jsp">정형외과</a></li>
						<li><a href="sub_1_2_3.jsp">비뇨기과</a></li>
						<li><a href="sub_1_2_4.jsp">신경과</a></li>
						<li><a href="sub_1_2_5.jsp">정신과</a></li>
					</ul>
					<div class="tabcontent">
						<ul class="list">


		<li class='item'>
			<div class='photo'><img src='<%=request.getContextPath() %>/resources/dist/photo/임승환.png' alt='임승환'></div>
			<div class='detail'>
				<div class='txt1'>정형외과</div>
				<div class='txt2'>임승환 <span>의사</span></div>
							<ul class='btn'>
								<!--<li><a href='javascript:reservationPop.open();' class='btn2'>예약하기</a></li>-->
							</ul>
							<dl class='txt3'>
								<dt>전문진료분야</dt>
								<dd>무릎, 어깨, 발과 발목, 팔꿈치, 손목, 엉덩이관절, 골반, 척추</dd>
								<dd>
									<table class='schedule_table'>
										<caption>진료안내</caption>
										<colgroup>
											<col style='width:14.2857%'>
											<col style='width:14.2857%'>
											<col style='width:14.2857%'>
											<col style='width:14.2857%'>
											<col style='width:14.2857%'>
											<col style='width:14.2857%'>
											<col style='width:14.2857%'>
										</colgroup>
										<thead>
											<tr>
												<th scope='col'>요일</th>
												<th scope='col'>월</th>
												<th scope='col'>화</th>
												<th scope='col'>수</th>
												<th scope='col'>목</th>
												<th scope='col'>금</th>
												<th scope='col'>토</th>
											</tr>
										</thead>
										<tbody>
											<tr>
										<th scope='row'>오전</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class="red"></span></td>
									</tr>
									<tr>
										<th scope='row'>오후</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td></td>
									</tr>
										</tbody>
									</table>
								</dd>
							</dl>
						</div>
					</li>


		<li class='item'>
			<div class='photo'><img src='<%=request.getContextPath() %>/resources/dist/photo/장민.png' alt='장민'></div>
			<div class='detail'>
				<div class='txt1'>정형외과</div>
				<div class='txt2'>장 민 <span>의사</span></div>
							<ul class='btn'>
								<!--<li><a href='javascript:reservationPop.open();' class='btn2'>예약하기</a></li>-->
							</ul>
							<dl class='txt3'>
								<dt>전문진료분야</dt>
								<dd>무릎, 어깨, 발과 발목, 팔꿈치, 손목, 엉덩이관절, 골반, 척추</dd>
								<dd>
									<table class='schedule_table'>
										<caption>진료안내</caption>
										<colgroup>
											<col style='width:14.2857%'>
											<col style='width:14.2857%'>
											<col style='width:14.2857%'>
											<col style='width:14.2857%'>
											<col style='width:14.2857%'>
											<col style='width:14.2857%'>
											<col style='width:14.2857%'>
										</colgroup>
										<thead>
											<tr>
												<th scope='col'>요일</th>
												<th scope='col'>월</th>
												<th scope='col'>화</th>
												<th scope='col'>수</th>
												<th scope='col'>목</th>
												<th scope='col'>금</th>
												<th scope='col'>토</th>
											</tr>
										</thead>
										<tbody>
											<tr>
										<th scope='row'>오전</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class="red"></span></td>
									</tr>
									<tr>
										<th scope='row'>오후</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td></td>
									</tr>
										</tbody>
									</table>
								</dd>
							</dl>
						</div>
					</li>


						</ul>
					</div>
				</div>
			 </div>
		 </div>
	 </div>
<div class="popList">
	<ul class="inner">
		<li class="item" id="profileView">
			<div class="tit">의료진 프로필</div>
			<div class="info">
				<div class="top">
					<div class="txt1">신경외과 전문의</div>
					<div class="txt2">양승환 <span>병원장</span></div>
					<div class="txt3">척추센터 Spine Center</div>
				</div>
				<ul class="bottom">
					<li>충남대학교 의과대학 졸업</li>
					<li>충남대학교의학전문대학원 외래조교수</li>
					<li>신경외과 전문의 및 신경외과 박사</li>
					<li>대한신경외과학회 정회원</li>
					<li>대한척추신경외과학회 종신회원</li>
					<li>대한신경통증학회 정회원</li>
					<li>대한노인신경외과학회 정회원</li>
					<li>대한최소침습척추수술연구회 정회원</li>
				</ul>
			</div>
			<a href="javascript:profile.close();" class="btn_close"><img src="../../images/sub/btn_close.png" alt="닫기"></a>
		</li>
	</ul>
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
<%@include file="../includes/body.jsp" %>
</body>

<!-- Mirrored from djtntn.com/sub/sub1/sub_1_2_2.php by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:46:14 GMT -->
</html>