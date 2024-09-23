<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<!-- Head css,js 영역 -->
 <%@include file="../includes/headcss.jsp" %>
 <style>
 #med {
	/* 	margin : 50px; */
	padding: 70px;
	display: flex;
	justify-content: center;
}
.pnaa {
	display: flex;
	justify-content: center;
}
 .btn_green{
 width: 50px;
 }
 </style>
 <body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript"></script>
<!-- 헤더  -->
 <%@include file="../includes/header.jsp" %>
<!-- 병원소개 진료안내 등 메뉴창 -->
<link rel="stylesheet" type="text/css" href="/MmHospital/resources/dist/css/sub.css">
 <div class="sub_vis">
     <img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/sub7_vis.jpg" />
 </div>
     <div class="content">
		 <div class="left">
		
			 <div class="sub_menu">
				 <h3>Q&A</h3>
				 <ul>
					<li class="on"><a href="<%=request.getContextPath()%>/qna.do">자주묻는질문</a></li>
				</ul>
 			 </div>
 					<p><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/call.jpg"/></p>
					 <p><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/res.jpg"/></p>		
			
 		 </div>
		 <div class="right">
		 	
			 <div class="sub_lnb">
				 <h2>자주묻는질문</h2>
				 <ul>
					 <li><a href="<%=request.getContextPath() %>/home.do">홈</a></li>
					 <li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li><a href="<%=request.getContextPath() %>/qna.do">Q&A</a></li>
					 <li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li class="on1"><a href="<%=request.getContextPath() %>/qna.do">자주묻는질문</a></li>
				 </ul>
			 </div>
		<div id="med">
			<p>
				<img src="<%=request.getContextPath() %>/resources/dist/images/qna/약복용권장시간.jpg" />
				<img src="<%=request.getContextPath() %>/resources/dist/images/qna/약2.jpg" />
				<img src="<%=request.getContextPath() %>/resources/dist/images/qna/약3.jpg" />
				<img src="<%=request.getContextPath() %>/resources/dist/images/qna/약4.jpg" />
				<img src="<%=request.getContextPath() %>/resources/dist/images/qna/약5.jpg" />
				<img src="<%=request.getContextPath() %>/resources/dist/images/qna/약6.jpg" />
			</p>
		</div>
	</div>
</div>
</body>
<!-- 	footer 영역 -->
<%@include file="../includes/footer.jsp"%>
</html>