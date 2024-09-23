<%@page import="kr.or.ddit.doctor.vo.AdmissionVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	List<AdmissionVO> amList = (List<AdmissionVO>)request.getAttribute("amList");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@include file="../includes/headcss.jsp" %>
</head>
<%@include file= "../includes/header.jsp" %>
<style>
#mypage{
	margin: 50px;
	border: 4px double #00A796; /* 테두리 설정 */
    padding: 100px;
    justify-content: center;
    border-radius: 10px;
    height: auto;
}
#full {
	display: flex;
	justify-content: space-between;
}
#img1 {
	background-color: lightgray;
	width: 25px;
	height: 25px;
	border-radius: 20px;
	padding: 5px 20px 5px 20px;
}
#hr{
	border-top: 3px solid lightgray;
	padding: 10px;
}
table {
	border: 4px solid gray;
	border-radius: 20px;
}
th {
	background-color: lightgray;
	color: black;
}
th, tr, td{
	border: 2px solid gray;
	height: 10px;
	
}
tr, td{
	text-align: center;
}

.input2{
	margin-left: 93%;
	width: 100px;
	height: 30px;
	border: 1px solid gray;
 	background-color: lightgray;
	border-radius: 5px;
 	align-content: center;
	text-align: center;
}
 </style>
 <body>
 <div id="mypage">
	<div id="full">
		<h2 id="hh">환자 입 퇴원 기록 전체조회</h2>
<%-- 		<img id="img1" alt="돋보기" src="<%=request.getContextPath()%>/resources/dist/images/main/돋보기.png"  --%>
<!-- 			onclick="location.href = '#'"> -->
	</div>
	<div>
		<form method="post">
			<input type="hidden" name ="docno" value="<%=dv.getDt_no()%>">
		</form>
	</div>
	<div style="padding: 5px; height: 5px;"></div>
	<div id="hr"></div>
	<table>
	 	<tr> 
	 		<th>번호</th>
	 		<th>환자 이름</th>
	 		<th>환자 주민번호</th>
	 		<th>진료내역</th>
	 		<th>처방내역</th>
	 		<th>호실</th>
	 		<th>입원 날짜</th>
	 		<th>퇴원 날짜</th>
	 	</tr>
	 	<%
	 		
	 		if(amList.size() == 0) {
	 	%>
	 		<tr> 
	 			<td colspan="8">환자 입 퇴원 기록이 없습니다.</td>
	 		</tr>
	 	<%		
	 		} else {
	 			for(int i = 0 ; i < amList.size(); i++) {
	 	%>
	 		<tr> 
	 			<td><%=i+1%></td>
	 			<td><%=amList.get(i).getMem_nm()%></td>
	 			<td><%=amList.get(i).getMem_reg()%></td>
	 			<td><%=amList.get(i).getDg_tit()%></td>
	 			<td><%=amList.get(i).getMd_nm()%></td>
	 			<td><%=amList.get(i).getAm_no()%>호</td>		
	 			<td><%=amList.get(i).getPt_et()%></td>		
	 			<td><%=amList.get(i).getPt_lv()%></td>		
	 		</tr>
	 	<% 
	 			}
	 		}
	 	%>
	</table> 
	<br> <br>
			<div id="div1">
			<a href="<%=request.getContextPath() %>/docMypage.do">
				<input type="button"  class="input2" name="docMypage" value="목록"
				style = "background-color: lightgray; "></a>
		</div>
 </div>
 



	<!-- 	footer 영역 -->
	 <%@include file="../includes/footer.jsp" %>

</body>

<!-- Mirrored from djtntn.com/sub/sub1/sub_1_1.php by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:23:42 GMT -->
</html>