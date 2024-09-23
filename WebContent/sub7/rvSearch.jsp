<%@page import="kr.or.ddit.review.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<ReviewVO> rvList = (List<ReviewVO>)request.getAttribute("rvList");
%>
    
<!doctype html>
<html lang="ko">

<!-- Head css,js 영역 -->
 <%@include file="../includes/headcss.jsp" %>

 <body>

<!-- 헤더  -->
 <%@include file="../includes/header.jsp" %>
 
<!-- 병원소개 진료안내 등 메뉴창 -->

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
					 <li ><a href="<%=request.getContextPath() %>/suggestions.do">건의사항</a></li>
					 <li class="on"><a href="<%=request.getContextPath() %>/review.do">리뷰</a></li>
				 </ul>
 			 </div>
 			
					 <p><img src="/MmHospital/resources/dist/images/sub/sub1/res.jpg"/></p>		
			 
 		 </div>


		 <div class="right">
		 
			 <div class="sub_lnb">
				 <h2>리뷰</h2>
				 <ul>
					 <li><a href="<%=request.getContextPath() %>/home.do">홈</a></li>
					 <li><img src="/MmHospital/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li><a href="<%=request.getContextPath() %>/notice.do">게시판</a></li>
					 <li><img src="/MmHospital/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li class="on1"><a href="<%=request.getContextPath() %>/review.do">리뷰</a></li>
				 </ul>
			 </div>
			 
		     <div class="sub_content">
				<div class="sub7_1">
					<!--<div class="info">글로벌튼튼병원에서 안내드립니다.</div>-->
					<div class="board_box">

				<div class="table_default">

						<div class="table_default">
							<table>
								<caption>게시판</caption>
								<colgroup>
									<col style="width:10%">
									<col style="width:60%">
									<col style="width:15%">
									<col style="width:15%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">등록일</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
								
								  <%
									if(rvList.size() == 0){
								%>
									<tr align="center">
										<td colspan="4">검색 결과가 없습니다.</td>
									</tr>
								<%
									}else{
										for(ReviewVO rv : rvList){
								%>
								  <tr align="center" height="27">
									  <td><%=rv.getRvNo() %></td>
									  <td><%=rv.getRvTit() %></td>
									  <td><%=rv.getRvDt() %></td>
									  <td><%=rv.getRvHit() %></td>
								 </tr>
								<%
											}
										}
								%>

								</tbody>
							</table>
						</div>
						
				</div>

					</div>
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
}
</script>
<div id="quick_div">
	<img src="../../images/main/quick_menu_ic_n2.png" usemap="#quick_menu_ic" />
	<map name="quick_menu_ic">
  <area shape="rect" coords="0,432,134,566" href="http://pf.kakao.com/_Ygsxlxb" target="_blank" alt="" />
	    <area shape="rect" coords="0,298,134,432" href="https://blog.naver.com/djtntnblog" target="_blank" alt="" />
	    <area shape="rect" coords="0,164,134,298" href="../sub1/sub_1_5.html" target="" alt="" />
		<area shape="rect" coords="0,30,134,164" href="../sub2/sub_2_1.html" target="" alt="" />
	</map>
</div>
</body>

</html>