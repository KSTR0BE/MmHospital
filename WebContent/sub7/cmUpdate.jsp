<%@page import="kr.or.ddit.commentt.vo.CommenttVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CommenttVO cv = (CommenttVO)request.getAttribute("cv");
%>
<!doctype html>
<html lang="ko">

<!-- Head css,js 영역 -->
 <%@include file="../includes/headcss.jsp" %>
   <style>
	textarea {
		resize : none;
	}
</style>

 <body>

<!-- 헤더  -->
<!-- 병원소개 진료안내 등 메뉴창 -->

 <%@include file="../includes/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/MmHospital/resources/dist/css/sub.css">

 <div class="sub_vis">
     <img src="/MmHospital/resources/dist/images/sub/sub1/sub7_vis.jpg" />
 </div>


     <div class="content">

		 <div class="left">
			 <div class="sub_menu">
	 <h3>게시판</h3>
	 <ul>
		 <li><a href="<%=request.getContextPath() %>/notice.do">공지사항</a></li>
		 <li class="on"><a href="<%=request.getContextPath() %>/suggestions.do">건의사항</a></li>
		 <li><a href="<%=request.getContextPath() %>/review.do">리뷰</a></li>
	 </ul>
 </div>
 <p><img src="/MmHospital/resources/dist/images/sub/sub1/res.jpg"/></p>		 </div>


		 <div class="right">
			 <div class="sub_lnb">
				 <h2>건의사항</h2>
				 <ul>
					  <li><a href="<%=request.getContextPath() %>/home.do">홈</a></li>
					 <li><img src="/MmHospital/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li><a href="<%=request.getContextPath() %>/notice.do">게시판</a></li>
					 <li><img src="/MmHospital/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li class="on1"><a href="<%=request.getContextPath() %>/suggestions.do">건의사항</a></li>
				 </ul>
			 </div>
		     <div class="sub_content">
				<div class="sub7_1">
					<!--<div class="info">글로벌튼튼병원에서 안내드립니다.</div>-->
					<div class="board_box">
						
			
			<form action="<%=request.getContextPath()%>/commentt/update.do" method="post">
				<input type="hidden" name="sgNo" value="<%=cv.getSgNo()%>">
				
				<div class="table_default">

							<div class="table_default">
							<table>
								<caption>게시판</caption>
								<colgroup>
									<col style="width:10%">
									<col style="width:42%">
									<col style="width:10%">
									<col style="width:14%">
									<col style="width:10%">
									<col style="width:14%">
								</colgroup>
								<thead>
								
									<tr>
										<th scope="col">답변</th>
										<td colspan="5"><textarea type="text" name="cmCon" value="<%=cv.getCmCon() %>" class="form-control" style="width:99%; height:200px"><%=cv.getCmCon() %></textarea></td>
									</tr>
									
									<tr>
										<th style="background-color:white"></th>
									</tr>									
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td>&emsp;&emsp;&emsp;&emsp;<button type="submit" class="button" style="width:50%; height:40px; background-color:#00A796; color:white">수정</button></td>
									</tr>	
									
								</thead>
								
							</table>
						</div>
				</div>
				</form>

					</div>
				</div>
			 </div>
		 </div>

	 </div>

	  <!-- 	footer 영역 -->
	 <%@include file="../includes/footer.jsp" %>

</body>

<!-- Mirrored from djtntn.com/sub/sub7/sub_7_1.php by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:38:38 GMT -->
</html>