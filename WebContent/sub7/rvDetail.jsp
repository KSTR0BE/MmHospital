<%@page import="kr.or.ddit.comm.vo.AtchFileDetailVO"%>
<%@page import="kr.or.ddit.comm.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.review.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ReviewVO rv = (ReviewVO)request.getAttribute("rv");
	
	AtchFileVO atchFileVO = (AtchFileVO)request.getAttribute("atchFileVO");
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
						
	<script type="text/javascript">

		function agree_modify(val,no){
			location.href='sub_7_11024.html?db=notice&amp;c=list&amp;amode=agree&amp;page=1&amp;SK=&amp;SN=&amp;kind3=&amp;idx=&amp;no='+no+'&vals='+val;
		}

		function FindBBS(){
			var Form = document.getElementById('FindForm');
			if(Form.SN.value==''){alert('검색어를 입력하세요');Form.SN.focus();return false;}
			Form.submit();
			return false;
		}

		function MultiAll(box){
			var Form = document.getElementById('MultiForm');
			var bname = Form.elements[box];
			var blength = bname.length;
			if(!blength){
				bname.checked == true ? bname.checked = false : bname.checked = true;
			}
			else{
				for( var i = 0; i < blength; i++) {
					bname[i].checked == true ? bname[i].checked = false : bname[i].checked = true;
				}
			}
		}

		function nosize_window2(url,win,w,h){
			Fw = window.open(url,win,'status=no,scrollbars=no,resizable=no,left=0,top=0,width='+w+',height='+h);
			Fw.focus();
		}

	</script>
						
			<input type='hidden' name='idx' value=''>
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
										<th scope="col">제목</th>
										<td colspan="5">&emsp;<%=rv.getRvTit() %></td>
									</tr>
									
									<tr>
										<th scope="col">작성자</th>
										<td>&emsp;<%=rv.getRvNm() %></td>
										<th scope="col">등록일</th>
										<td>&emsp;<%=rv.getRvDt() %></td>
										<th scope="col">조회수</th>
										<td>&emsp;<%=rv.getRvHit() %></td>
									</tr>
									
									<tr>
										<th scope="col">첨부파일</th>
											<td colspan="5">
												<%
													if(atchFileVO != null){
														for(AtchFileDetailVO fileVO 
																: atchFileVO.getAtchFileDetailList()){
												%>
													&emsp;<a href="<%=request.getContextPath()%>/download.do?fileId=<%=fileVO.getAtchFileId() %>&fileSn=<%=fileVO.getFileSn() %>"><%=fileVO.getOrignlFileNm() %></a>
												<%			
														}
													}
												%>
											</td>
									</tr>
									
									<tr>
										<th scope="col">내용</th>
										<td colspan="5">&emsp;<%=rv.getRvCon() %></td>
									</tr>
									
								</thead>
								
							</table>
							
								<br>
									<div style="text-align:center;">
												<%
													if(atchFileVO != null){
														for(AtchFileDetailVO fileVO 
																: atchFileVO.getAtchFileDetailList()){
												%>
													&emsp;<img src="/MmHospital/upload_files/<%=fileVO.getStreFileNm() %>" width="50%" height="50%"/>
												<%			
														}
													}
												%>
									</div>
							
								<ul class="btns">
									<li>
									<%
										if(mv != null && rv.getMemNo().equals(mv.getMem_no())){
									%>
										<button class="btn_green" onclick="confirm_btn1()">수정</button>
										<button class="btn_green" onclick="confirm_btn()">삭제</button>
										
									<%
										}
									%>
										<button class="btn_green" onclick="confirm_btn2()">목록</button>
									</li>
								</ul>
						</div>
				</div>

	<script>
		
			function confirm_btn(){
				if(confirm("삭제하시겠습니까?")){
					location.href = "<%=request.getContextPath()%>/review/delete.do?rvNo=" + "<%=rv.getRvNo()%>";
				}
			}
			function confirm_btn1(){
				if(confirm("수정하시겠습니까?")){
					location.href = "<%=request.getContextPath()%>/review/update.do?rvNo=" + "<%=rv.getRvNo()%>";
				}
			}
			function confirm_btn2(){
				location.href = "<%=request.getContextPath()%>/review.do";
			}	
	
	</script>
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