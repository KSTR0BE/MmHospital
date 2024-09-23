<%@page import="kr.or.ddit.nurse.vo.NurseVO"%>
<%@page import="kr.or.ddit.doctor.vo.DoctorVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.admin.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		   AdminVO av = (AdminVO)session.getAttribute("USER");
		   MemberVO mv = (MemberVO)session.getAttribute("MEM");
		   DoctorVO dv = (DoctorVO)session.getAttribute("DOC");	
		   NurseVO nsv = (NurseVO)session.getAttribute("NUR");		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MM튼튼병원</title>
<style>
#my{
	margin-left: 435px;
}

</style>
</head>
<body>
 <div class="wrap">
     <div id="header">
	     <div class="header_top">
			 <div class="logo"><a href="<%=request.getContextPath() %>/home.do"><img src="/MmHospital/resources/dist/images/main/logo.png"></a></div>
			 <div class="tel">
			  <ul class="nav navbar-nav navbar-right">
		
	        	<%
	      		if(mv == null && av == null && dv == null && nsv == null){
	      		%>
				  <li><a href="<%=request.getContextPath() %>/Mlogin.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
				<%
	      			}
	      		 %>
	        	<%
	        	if(mv != null) {
	        	%>
	        	<div>
	       		   <li> 
	       		   	환영합니다&nbsp;&nbsp;<%=mv.getMem_nm() %>님&emsp;&nbsp;&nbsp;&nbsp;
	       		   <a href="<%=request.getContextPath() %>/logout.do"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a>
	       		   </li>
	       		
	       		</div>
	       		<%
	        		}
	        	%> 
	       		
	        	<%		
	        	if(av != null) {
	        	%>	
	        		<div>
	       		   <li>
	       		  	&nbsp;&nbsp;<%=av.getAdNm() %>&nbsp;관리자님&emsp;&nbsp;&nbsp;&nbsp; 
	       		   <a href="<%=request.getContextPath() %>/logout.do"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a>
	       		   </li>
	       		
	       		</div>
	        		
	        	<%
	        		}
	        	%>
	        	
	        	<%		
	        	if(dv != null) {
	        	%>	
	        		<div>
	       		   <li>
	       		  	 &nbsp;&nbsp;<%=dv.getDt_nm() %>&nbsp;의사님&emsp;&nbsp;&nbsp;&nbsp; 
	       		   <a href="<%=request.getContextPath() %>/logout.do"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a>
	       		   </li>
	       		
	       		</div>
	        		
	        	<%
	        		}
	        	%>
	        	<%
	        		if(nsv != null){
	        	%>	
	        		<div>
	       		   <li>
	       		 	  &nbsp;&nbsp;<%=nsv.getNs_nm() %>&nbsp;간호사님&emsp;&nbsp;&nbsp;&nbsp; 
	       		   <a href="<%=request.getContextPath() %>/logout.do"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a>
	       		   </li>
	       		
	       		</div>
	       		
	       		<%
	        	}
	       		%> 
			  </ul>
			  </div>
		 </div>

		 <!--gnb-->
		 <div id="gnb">
			 <ul class="menu">
				<li><a href="/MmHospital/sub1/sub_1_1.jsp">병원소개</a>
					<ul>
						<li><a href="/MmHospital/sub1/sub_1_1.jsp">병원장인사말</a></li>
						<li><a href="/MmHospital/sub1/sub_1_2.jsp">의료진소개</a></li>
						<li><a href="/MmHospital/sub1/sub_1_5.jsp">찾아오시는길</a></li>
					</ul>
				</li>

				<li><a href="<%=request.getContextPath() %>/AppointChk.do">진료안내</a>
					<ul>
						<%
							if(av == null && dv == null && nsv == null){
						%>
						<li><a href="<%=request.getContextPath() %>/AppointInput.do">진료예약</a></li>
						<%
							}
						%>
						<li><a href="<%=request.getContextPath() %>/AppointChk.do">진료예약확인</a></li>
						<li><a href="<%=request.getContextPath() %>/sub2/sub_2_1.jsp">진료시간표</a></li>
					</ul>
				</li>
				
<!-- 				게시판 -->
				<li><a href="<%=request.getContextPath() %>/notice.do">게시판</a>
					<ul>
						<li><a href="<%=request.getContextPath() %>/notice.do">공지사항</a></li>
						<li><a href="<%=request.getContextPath() %>/suggestions.do">건의사항</a></li>
						<li><a href="<%=request.getContextPath() %>/review.do">리뷰</a></li>
					</ul>
				</li>
				
				<li><a href="<%=request.getContextPath() %>/qna.do">Q&A</a>
					<ul>
						<li><a href="<%=request.getContextPath() %>/qna.do">자주묻는질문</a></li>
					</ul>
				</li>
				
	        	<%
	        	if(mv != null) {
	        	%>

	       		   <li id="my"> 
	       		   <a href="<%=request.getContextPath() %>/MemberMypage.do">마이페이지</a>
	       		   </li>
	       		
	       		<%
	        		}
	        	%> 
	       		
	        	<%		
	        	if(av != null) {
	        	%>	

	       		   <li id="my"> 
	       		   <a href="<%=request.getContextPath() %>/adminMypage.do">마이페이지</a> 
	       		   </li>
	       		
	        	<%
	        		}
	        	%>
	        	
	        	<%		
	        	if(dv != null) {
	        	%>	

	       		   <li id="my"> 
	       		   <a href="<%=request.getContextPath() %>/docMypage.do">마이페이지</a> 
	       		   </li>
	       		
	        	<%
	        		}
	        	%>
	        	<%
	        		if(nsv != null){
	        	%>	

	       		   <li id="my"> 
	       		   <a href="<%=request.getContextPath() %>/nurMypage.do">마이페이지</a> 
	       		   </li>
	       		
	       		<%
	        	}
	       		%> 
				
			</ul>
		 </div>
		 <!--//gnb-->
	 </div>
</div>     
</body>
</html>