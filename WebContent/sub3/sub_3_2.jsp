<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.appointMent.vo.AppointMentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = session.getAttribute("msg") == null ?
				"" : (String)session.getAttribute("msg");

	session.removeAttribute("msg");
%>
<!doctype html>
<html lang="ko">
<!-- Head css,js 영역 -->
<head>
	 <%@include file="/includes/headcss.jsp" %>
<style>
#bo_list {
	border: solid gray 2px;
	border-radius:5px;
	margin: 20px;

}
th,tr,td{
	padding: 5px;
	border:solid gray 1px;
	border-collapse: collapse;
	vertical-align: top;
}
#month{
	padding: 20px;
	text-align: center;
	
}
.ap {
	color: #191970;
	border:solid gray 1px; 
	border-radius:30px; 
	background-color:#E0FFFF; 
	text-align:center;
	font-weight: bold;
}
.change {
	display: flex;
	justify-content: space-between;
}
</style>
</head>
<%
	List<AppointMentVO> apv = (List<AppointMentVO>)request.getAttribute("apcList");
%>
<input type="hidden" name="date" id="checkdate" value="" alt="예약 날짜"/>
<input type="hidden" name="week" id="checkweel" value="" alt="예약 주"/>




<!-- 헤더  -->
<!-- 병원소개 진료안내 등 메뉴창 -->
 <%@include file="/includes/header.jsp" %>
 
 
 
 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/dist/css/sub.css">

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
				<li class="on"><a href="<%=request.getContextPath() %>/AppointChk.do">진료예약확인</a></li>
				<li><a href="<%=request.getContextPath() %>/sub2/sub_2_1.jsp">진료시간표</a></li>

			</ul>
		</div>
		<p><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/call.jpg"/></p>
		<p>
			<img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/res.jpg" />
		</p>
	</div>


	<div class="right">
		<div class="sub_lnb">
			<h2>진료예약 확인</h2>
			<ul>
				<li><a href="<%=request.getContextPath() %>/home.do">홈</a></li>
				<li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png" /></li>
				<li><a href="<%=request.getContextPath() %>/AppointChk.do">진료안내</a></li>
				<li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png" /></li>
				<li class="on1"><a href="<%=request.getContextPath() %>/AppointChk.do">진료예약확인</a></li>
			</ul>
		</div>
		<div id="month">
			<h1><script>document.write(new Date().getMonth() + 1 + "월");</script></h1>
		</div>
		<div class="change">
			<div>
				<img alt="왼쪽 버튼" src="<%=request.getContextPath() %>/resources/dist/images/main/왼쪽.png" id="leftBtn">
			</div>
			<div>
				<img alt="오른쪽버튼" src="<%=request.getContextPath() %>/resources/dist/images/main/오른쪽.png" id="rightBtn">
			</div>
		</div>
		<div id="bo_list">
			<div class="over_table">
				<table width="100%" bgcolor="#cfcfcf" cellspacing="1" cellpadding="5">
					<thead>
						<tr bgcolor="#97C8B0" align="center">
							<th style="color: red">일</th>
							<th style="color: black">월</th>
							<th style="color: black">화</th>
							<th style="color: black">수</th>
							<th style="color: black">목</th>
							<th style="color: black">금</th>
							<th style="color: blue">토</th>
						</tr>
					</thead>
					<tbody id="calendarBody">
						<tr>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
						</tr>
						<tr>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
						</tr>
						<tr>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
						</tr>
						<tr>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
						</tr>
						<tr>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
							<td width="14%" height="100" bgcolor="#ffffff"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div style="height: 50px;">
</div>
<!-- 	퀵메뉴 -->
<%@include file="/includes/body.jsp" %>

<!-- 	footer 영역 -->
<%@include file="/includes/footer.jsp" %>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
///////////////////달력함수/////////////////////////
   
   var currentMonth = new Date().getMonth();
   
   $(document).ready(function(){
       // 왼쪽 버튼 클릭 시 이벤트
       $("#leftBtn").click(function(){
           currentMonth--;
           if (currentMonth < 0) {
               currentMonth = 11;
           }
           updateMonth();
       });
   
       // 오른쪽 버튼 클릭 시 이벤트
       $("#rightBtn").click(function(){
           currentMonth++;
           if (currentMonth > 11) {
               currentMonth = 0;
           }
           updateMonth();
       });
   });
   
   //달력 월수 바꾸는 함수
   function updateMonth() {
       var monthElement = $("#month");
       var currentYear = new Date().getFullYear(); // 현재 연도 가져오기
       var daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate(); // 해당 월의 일 수 가져오기
       var firstDayOfWeek = new Date(currentYear, currentMonth, 1).getDay(); // 해당 월의 첫째 날의 요일 가져오기 (0: 일요일, 1: 월요일, ..., 6: 토요일)

       monthElement.html("<h1>" + (currentMonth + 1) + "월</h1>");
       updateCalendar(daysInMonth, firstDayOfWeek); // 달력 업데이트
   }


   //현재 날짜를 가져오는 함수
   function getCurrentDate() {
       return new Date();
   }
   
   // 현재 달을 가져오는 함수
   function getCurrentMonth() {
       return getCurrentDate().getMonth();
   }
   
   // 현재 달의 첫째 날의 요일을 가져오는 함수 (0: 일요일, 1: 월요일, ..., 6: 토요일)
   function getFirstDayOfWeekOfMonth() {
       var currentDate = getCurrentDate();
       currentDate.setDate(1); // 현재 달의 첫째 날로 설정
       return currentDate.getDay();
   }
   
   // 현재 달의 마지막 날짜를 가져오는 함수
   function getLastDayOfMonth() {
       var currentDate = getCurrentDate();
       var currentMonth = getCurrentMonth();
       currentDate.setMonth(currentMonth + 1); // 다음 달로 이동
       currentDate.setDate(0); // 다음 달의 첫째 날의 전 날로 이동 (현재 달의 마지막 날)
       return currentDate.getDate();
   };
   
   // 페이지 로드 시 날짜 업데이트
   window.onload = function() {
       updateCalendar(getLastDayOfMonth(), getFirstDayOfWeekOfMonth());
   };
   
   
   //td 요소에서 날짜를 업데이트하고 클릭 이벤트를 추가하는 함수
   function updateCalendar(daysInMonth, firstDayOfWeek) { 
       // td 요소들을 모두 선택
       var tds = document.querySelectorAll("td");
   
       // 현재 달의 첫째 날의 요일을 가져옴
//        var firstDayOfWeek = getFirstDayOfWeekOfMonth();
   
       // 현재 달의 마지막 날짜를 가져옴
       var lastDayOfMonth = daysInMonth;
   
       // 날짜 업데이트 시작 인덱스 설정
       var startIndex = firstDayOfWeek;
   
       // 날짜 업데이트
       var date = 1;
       for (var i = 0; i < tds.length; i++) {
           // 현재 달의 첫째 날 이후부터 날짜 업데이트
           if (i >= startIndex && date <= lastDayOfMonth) {
               tds[i].innerText = date;
    			
               // 클릭 이벤트 추가
               tds[i].addEventListener("click", function() {
                   // 여기에 예약 사이트로 이동하는 코드를 추가
                   <%
							if(av == null && dv == null && nsv == null){
					%>
                   window.location.href = "<%=request.getContextPath()%>/AppointInput.do";
                   <%
							}
					%>
               });
               date++;
           } else {
               tds[i].innerText = ""; // 현재 달이 아닌 경우에는 비움
           }
       };
       
       <%
         for(int i = 0; i < apv.size(); i++){
            AppointMentVO amVO = apv.get(i);
            String month = amVO.getApDt().split(" ")[0].split("-")[1];
            String day = amVO.getApDt().split(" ")[0].split("-")[2];
            String time = amVO.getApTm();
      %>
            $(function(){
               var name = "<%=amVO.getMemNm()%>";
               var time = "<%=time%>";
               var month = "<%=Integer.parseInt(month)%>";
               var day = "<%=day%>";
               if(month == (currentMonth+1)){
                  $("#calendarBody td:contains("+day+")").append("<p class='ap'>"+name+"("+time+")</p>");
               }
            });
      <%
         }
      %>
   };
   
   <%
  	if(msg.equals("성공")){
  %>
  		alert("<%=mv.getMem_nm()%>님 예약 완료되었습니다.");
  <%
  		}if(msg.equals("실패")){
  %>
  		alert("이미 예약된 시간입니다.");
  <%
  		}if(msg.equals("예약존재")){
  %>
 		 alert("이미 예약정보가 존재합니다.");
 <%
  		}
 %>
   
</script>
</body>

<!-- Mirrored from djtntn.com/sub/sub1/sub_1_1.php by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:23:42 GMT -->
</html>