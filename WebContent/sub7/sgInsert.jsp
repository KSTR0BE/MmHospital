<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			<%
				if(mv != null){
			%>
			<form action="<%=request.getContextPath()%>/suggestions/insert.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="memNo" value="<%=mv.getMem_no()%>">
				<input type="hidden" name="sgNm" value="<%=mv.getMem_nm()%>">
			<%
				}if(dv != null){
			%>
			<form action="<%=request.getContextPath()%>/suggestions/insertd.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="dtNo" value="<%=dv.getDt_no()%>">
				<input type="hidden" name="sgNm" value="<%=dv.getDt_nm()%> 의사">
			<%
				}
			%>
				
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
										<td colspan="5"><input type="text" name="sgTit" class="form-control" style="width:99%; height:35px"/></td>
									</tr>
									
									<tr>
										<th scope="col">내용</th>
										<td colspan="5"><textarea type="text" name="sgCon" class="form-control" style="width:99%; height:200px"></textarea></td>
									</tr>
									
									<tr>
										<th scope="col">첨부파일</th>
										<td><input type="file" name="atchFile" multiple="multiple" class="form-control"/></td>
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
										<td>
										<button type="submit" class="button" style="width:40%; height:40px; background-color:#00A796; color:white">등록</button>&nbsp;<button onclick="sg_cc()" style="width:40%; height:40px; background-color:#00A796; color:white">취소</button>
										</td>
									</tr>	
									
								</thead>
								
							</table>
						</div>
				</div>
				</form>

	<script type="text/javascript">
		function gotoCategory() {
		   var kind5 = cgory.kind3.value;
		  location.href='sub_7_10192.html?db=notice&amp;SK=&amp;SN=&amp;page=1&amp;idx=&amp;kind3='+kind5;
		}
	</script>
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

function sg_cc(){
	location.href = "<%=request.getContextPath()%>/suggestions.do";
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

<!-- Mirrored from djtntn.com/sub/sub7/sub_7_1.php by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:38:38 GMT -->
</html>