<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<NoticeVO> ntList = (List<NoticeVO>)request.getAttribute("ntList");

	int str = (int)request.getAttribute("str");
	int sPage = (int)request.getAttribute("sPage");
	int ePage = (int)request.getAttribute("ePage");
	int cPage = (int)request.getAttribute("cPage");
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
					 <li  class="on"><a href="<%=request.getContextPath() %>/notice.do">공지사항</a></li>
					 <li ><a href="<%=request.getContextPath() %>/suggestions.do">건의사항</a></li>
					 <li ><a href="<%=request.getContextPath() %>/review.do">리뷰</a></li>
				 </ul>
 			 </div>
 			
					 <p><img src="/MmHospital/resources/dist/images/sub/sub1/res.jpg"/></p>		
			 
 		 </div>


		 <div class="right">
		 
			 <div class="sub_lnb">
				 <h2>공지사항</h2>
				 <ul>
					 <li><a href="<%=request.getContextPath() %>/home.do">홈</a></li>
					 <li><img src="/MmHospital/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li><a href="<%=request.getContextPath() %>/notice.do">게시판</a></li>
					 <li><img src="/MmHospital/resources/dist/images/sub/sub1/bar.png"/></li>
					 <li class="on1"><a href="<%=request.getContextPath() %>/notice.do">공지사항</a></li>
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
										for(int i = 0 ; i < ntList.size(); i++){
								%>
									<tr align="center" height="27">
									  <td><%=str + i %></td>
									  <td><%=ntList.get(i).getNtTit() %></td>
									  <td><%=ntList.get(i).getNtDt() %></td>
									  <td><%=ntList.get(i).getNtHit() %></td>
								 </tr>
								<%			
										}
								%>

								</tbody>
							</table>
						</div>
						<%
						if(ntList.size() != 0){
						%>
						<div id="pageArea" style="justify-content: center; display:flex;">
								<!-- page 영역 -->
									<ul class="pager">
										<ul class="btns">
							 			<li class="prev"><a href="#" class="btn_green" style="width:50px;"><<<</a></li>
							 			</ul>
									</ul>
										
									<ul class="pagination pager" style="display:flex;">
									
									<%
									for(int i = sPage; i <=ePage; i++) {
										if(cPage== i){
									%>
										<ul class="btns" style="background-color:#00A796">
							  			<li class="active"><a href="#" class="btn_green" style="width:30px; background-color: white; color: #00A796"><%=i %></a></li>
							  			</ul>
							  		<%
							  			} else {
									%>
										<ul class="btns">
							  			<li><a href="#" class="btn_green" style="width:30px; background-color: white; color: #00A796"><%=i %></a></li>
							  			</ul>
							  		<%
							  			}	//if-else end
									}	//for end
									%>
									</ul>
									
									<ul class="pager">
										<ul class="btns">
							 			<li class="next"><a href="#" class="btn_green" style="width:50px; ">>>></a></li>
							 			</ul>
									</ul>
						</div>
						<%
							}
						%>
						</div>

					</div>
				</div>
			 </div>
		 </div>

	 </div>

	  <!-- 	footer 영역 -->
	 <%@include file="../includes/footer.jsp" %>

<script>

		$('.pagination li').on('click',function(){
			location.href = "<%=request.getContextPath()%>/notice/search.do?page=" + $(this).text();
		});
		
		
		$('.next').on('click',function(){
			//현재 위치의 마지막 페이지 정보 +1 >> 메인서블릿으로 전달예정
		//		alert($('.pagination').children().last() .text());
			let page = parseInt($('.pagination').children().last().text()) + 1;
			
			//전달하려는 페이지 정보가 totalPage보다 클 때, 페이지 정보 넘기지 않음
			if(<%=request.getAttribute("ttPage")%> < page) return; //함수종료로 아래코드 실행하지 않음	
			
			location.href = "<%=request.getContextPath()%>/notice/search.do?page=" + page;
			
		});
		
		$('.prev').on('click',function(){
			//현재 위치의 첫 페이지 정보 - 1
			let page = $('.pagination').children().first().text() -1;
			//전달하려는 페이지 정보가 0보다 작거나 같을 때 
			if(0 >= page) return; //함수종료로 아래 코드 실행하지 않음 
			
			location.href = "<%=request.getContextPath()%>/notice/search.do?page=" + page;
			
		});
		
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