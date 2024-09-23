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

 <div class="sub_vis">
     <img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/sub2_vis.jpg" />
 </div>


     <div class="content">

		 <div class="left">
			 <div class="sub_menu">
	 <h3>진료안내</h3>
	 <ul>
	 	<%
			if(av == null && dv == null && nsv == null){
		%>
	 	<li><a href="<%=request.getContextPath() %>/AppointInput.do">진료예약</a></li>
	 	<%
			}
	 	%>
		<li><a href="<%=request.getContextPath() %>/AppointChk.do">진료예약확인</a></li>
		<li  class="on"><a href="<%=request.getContextPath() %>/sub2/sub_2_1.jsp">진료시간표</a></li>
	 </ul>
 </div>
 <p><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/call.jpg"/></p>
 <p><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/res.jpg"/></p>		 </div>


		 <div class="right">
			 <div class="sub_lnb">
				 <h2>진료시간표</h2>
				 <ul>
					 <li><a href="<%=request.getContextPath() %>/home.do">홈</a></li>
					 <li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li><a href="<%=request.getContextPath() %>/AppointChk.do">진료안내</a></li>
					 <li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li class="on1"><a href="sub_2_1.jsp">진료시간표</a></li>
				 </ul>
			 </div>
		     <div class="sub_content">
				<div class="sub2_1">
					<div class="info"><div style="text-align:center"><span>토요일 진료는 순환진료</span>로 진행되오니 방문전 진료날짜를 미리 문의해주시기 바랍니다.</div>
                    <br/>
                    <br/>
					<h3></h3>
					<ul class="schedule_list">
 						<li>
							<table class='schedule_table'>
								<caption>진료안내</caption>
								<colgroup>
									<col style='width:23%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
								</colgroup>
								<thead>
									<tr>
										<th scope='col'>의료진</th>
										<th scope='col'>진료시간</th>
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
										<th scope='row' rowspan='2' class='name'>양승환 <em>병원장</em></th>
										<th scope='row'>오전</th>
										<td>수술</td>
										<td>수술</td>
										<td>수술</td>
										<td>수술</td>
										<td>수술</td>
										<td></td>
									</tr>
									<tr>
										<th scope='row'>오후</th>
										<td>수술</td>
										<td>수술</td>
										<td>수술</td>
										<td>수술</td>
										<td>수술</td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</li>					
                        <br/>
                        <!--<th>※ 정성운 원장 2/7(수)~2/8(목) 휴진입니다.</th>-->
                        <br/>
               <br>
                
					<h3>정형외과</h3>
					<ul class="schedule_list">
 						<li>
							<table class='schedule_table'>
								<caption>진료안내</caption>
								<colgroup>
									<col style='width:23%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
								</colgroup>
								<thead>
									<tr>
										<th scope='col'>의료진</th>
										<th scope='col'>진료시간</th>
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
										<th scope='row' rowspan='2' class='name'>임승환 <em>의사</em></th>
										<th scope='row'>오전</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'></span></td>
									</tr>
									<tr>
										<th scope='row'>오후</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'></span></td>
									</tr>
								</tbody>
							</table>
						</li>
 						<li>
							<table class='schedule_table'>
								<caption>진료안내</caption>
								<colgroup>
									<col style='width:23%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
								</colgroup>
								<thead>
									<tr>
										<th scope='col'>의료진</th>
										<th scope='col'>진료시간</th>
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
										<th scope='row' rowspan='2' class='name'>장 민 <em>의사</em></th>
										<th scope='row'>오전</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'></span></td>
									</tr>
									<tr>
										<th scope='row'>오후</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'></span></td>
									</tr>
								</tbody>
							</table>
						</li>
                        <!--<th>※ 홍세혁 원장 1/25(목)~1/26(금) 휴진입니다.</th>-->
					</ul>
					<h3>비뇨기과</h3>
					<ul class="schedule_list">
 						<li>
							<table class='schedule_table'>
								<caption>진료안내</caption>
								<colgroup>
									<col style='width:23%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
								</colgroup>
								<thead>
									<tr>
										<th scope='col'>의료진</th>
										<th scope='col'>진료시간</th>
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
										<th scope='row' rowspan='2' class='name'>이성훈 <em>의사</em></th>
										<th scope='row'>오전</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'></span></td>
									</tr>
									<tr>
										<th scope='row'>오후</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'></span></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</li>
					</ul>

					<h3>신경과</h3>
					<ul class="schedule_list">
 						<li>
							<table class='schedule_table'>
								<caption>진료안내</caption>
								<colgroup>
									<col style='width:23%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
								</colgroup>
								<thead>
									<tr>
										<th scope='col'>의료진</th>
										<th scope='col'>진료시간</th>
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
										<th scope='row' rowspan='2' class='name'>김성도 <em>의사</em></th>
										<th scope='row'>오전</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'></span></td>
										<td></td>
									</tr>
									<tr>
										<th scope='row'>오후</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'></span></td>
									</tr>
								</tbody>
							</table>
						</li>
						
						<li>
							<table class='schedule_table'>
								<caption>진료안내</caption>
								<colgroup>
									<col style='width:23%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
								</colgroup>
								<thead>
									<tr>
										<th scope='col'>의료진</th>
										<th scope='col'>진료시간</th>
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
										<th scope='row' rowspan='2' class='name'>최병관 <em>의사</em></th>
										<th scope='row'>오전</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'></span></td>
										<td></td>
									</tr>
									<tr>
										<th scope='row'>오후</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'></span></td>
									</tr>
								</tbody>
							</table>
						</li>
 						</ul>
                        <br>
                        <br>
                    <h3>정신과</h3>
					<ul class="schedule_list">
 						<li>
							<table class='schedule_table'>
								<caption>진료안내</caption>
								<colgroup>
									<col style='width:23%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
									<col style='width:11%'>
								</colgroup>
								<thead>
									<tr>
										<th scope='col'>의료진</th>
										<th scope='col'>진료시간</th>
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
										<th scope='row' rowspan='2' class='name'>주현주 <em>의사</em></th>
										<th scope='row'>오전</th>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'>진료</span></td>
										<td><span class='green'></span></td>
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
						</li>
						</li>
					</ul>
				</div>
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
	<!-- 	퀵메뉴 -->
	<%@include file="/includes/body.jsp" %>
</body>
<!-- 	footer 영역 -->
	 <%@include file="../includes/footer.jsp" %>

<!-- Mirrored from djtntn.com/sub/sub2/sub_2_1.php by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:25:05 GMT -->
</html>