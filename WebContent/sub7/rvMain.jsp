<%@page import="kr.or.ddit.review.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReviewVO> rvList = (List<ReviewVO>)request.getAttribute("rvList");

	int str = (int)request.getAttribute("str");
	int sPage = (int)request.getAttribute("sPage");
	int ePage = (int)request.getAttribute("ePage");
	int cPage = (int)request.getAttribute("cPage");

	String msg = session.getAttribute("msg") == null ?
			"" : (String)session.getAttribute("msg");
	
	session.removeAttribute("msg");	
%>
<!doctype html>
<html lang="ko">

<!-- Head css,js 영역 -->
 <%@include file="../includes/headcss.jsp" %>

 <body>

<!-- 헤더  -->
<!-- 병원소개 진료안내 등 메뉴창 -->

 <%@include file="../includes/header.jsp" %>
 
 <%@include file="/includes/body.jsp" %>
 
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
		 <li><a href="<%=request.getContextPath() %>/suggestions.do">건의사항</a></li>
		 <li class="on"><a href="<%=request.getContextPath() %>/review.do">리뷰</a></li>
	 </ul>
 </div>
 <p><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/call.jpg"/></p>
 <p><img src="/MmHospital/resources/dist/images/sub/sub1/res.jpg"/></p>		 </div>


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
						
						<form action="<%=request.getContextPath()%>/review.do" method="get">

						<div class="board_search">
							<table>
								<caption>게시판</caption>
								<colgroup>
									<col style="width:10%">
									<col style="width:42%">
								</colgroup>
								<thead>
								
									<tr>
										<th scope="col">제목</th>
										<td><input type="text" name="rvTit" class="form-control" style="width:90%"/></td>
										<td><button type="submit" class="button" style="width:13%; height:40px">검색</button></td>
									</tr>
									
								</thead>
								
							</table>
						</div>
						
					</form>
					
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
										for(int i = 0 ; i < rvList.size(); i++){
								%>
									<tr align="center" height="27">
									  <td><%=str + i %></td>
									  <td><a href="<%=request.getContextPath() %>/review/detail.do?rvNo=<%=rvList.get(i).getRvNo() %>"><%=rvList.get(i).getRvTit() %></a></td>
									  <td><%=rvList.get(i).getRvDt() %></td>
									  <td><%=rvList.get(i).getRvHit() %></td>
								 </tr>
								<%			
										}
								%>
								
								</tbody>
							</table>
							<%
								if(mv != null){
							%>
							<ul class="btns">
								<li>
									<a href="<%=request.getContextPath() %>/review/insert.do" class="btn_green">등록</a>
								</li>
							</ul>
							<%
								}
							%>
						</div>
						
						<%
							if(rvList.size() != 0){
						%>		
						<div id="pageArea" style="justify-content: center; display:flex;">
										<!-- page 영역 -->
											<ul class="pager">
												<ul class="btns">
									 			<li class="prev"><a href="#" class="btn_green" style="width:50px;"><</a></li>
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
									 			<li class="next"><a href="#" class="btn_green" style="width:50px;">></a></li>
									 			</ul>
											</ul>
								</div>
							<%
								}
							%>
						</div>
				
						
			<%
				if(msg.equals("성공")){
			%>
				<script>
				alert("완료되었습니다.");
				</script>
			<%
				}
			%>
						</div>

					</div>
				</div>
			 </div>
			</div>

	  <!-- 	footer 영역 -->
	 <%@include file="../includes/footer.jsp" %>

<script>

		$('.pagination li').on('click',function(){
			location.href = "<%=request.getContextPath()%>/review.do?page=" + $(this).text();
		});
		
		
		$('.next').on('click',function(){
			//현재 위치의 마지막 페이지 정보 +1 >> 메인서블릿으로 전달예정
		//		alert($('.pagination').children().last() .text());
			let page = parseInt($('.pagination').children().last().text()) + 1;
			
			//전달하려는 페이지 정보가 totalPage보다 클 때, 페이지 정보 넘기지 않음
			if(<%=request.getAttribute("ttPage")%> < page) return; //함수종료로 아래코드 실행하지 않음	
			
			location.href = "<%=request.getContextPath()%>/review.do?page=" + page;
			
		});
		
		$('.prev').on('click',function(){
			//현재 위치의 첫 페이지 정보 - 1
			let page = $('.pagination').children().first().text() -1;
			//전달하려는 페이지 정보가 0보다 작거나 같을 때 
			if(0 >= page) return; //함수종료로 아래 코드 실행하지 않음 
			
			location.href = "<%=request.getContextPath()%>/review.do?page=" + page;
			
		});

</script>
</body>

<!-- Mirrored from djtntn.com/sub/sub7/sub_7_1.php by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:38:38 GMT -->
</html>