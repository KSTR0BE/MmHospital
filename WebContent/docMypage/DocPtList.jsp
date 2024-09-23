<%@page import="kr.or.ddit.doctor.vo.DiagnosisVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	List<DiagnosisVO> dnList = (List<DiagnosisVO>)request.getAttribute("dnList");

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
 </style>
 <body>
 <div id="mypage">
	<div id="full">
		<h2 id="hh">환자 진료기록 전체조회</h2>
		<img id="img1" alt="돋보기" src="<%=request.getContextPath()%>/resources/dist/images/main/돋보기.png" 
			onclick="location.href = '<%=request.getContextPath()%>/상세페이지 경로지정'">
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
	 		<th>진료기록 날짜</th>
	 	</tr>
	 	<%
	 		
	 		if(dnList.size() == 0) {
	 	%>
	 		<tr> 
	 			<td colspan="6">환자 진료기록이 없습니다.</td>
	 		</tr>
	 	<%		
	 		} else {
	 			for(DiagnosisVO dnVO: dnList) {
	 	%>
	 		<tr> 
	 			<td><%=dnVO.getDg_no()%></td>
	 			<td><a href="#"><%=dnVO.getMem_nm()%></a></td>
	 			<td><%=dnVO.getMem_reg()%></td>
	 			<td><%=dnVO.getDg_tit()%></td>
	 			<td><%=dnVO.getMd_nm()%></td>
	 			<td><%=dnVO.getDg_dt()%></td>		
	 		</tr>
	 	<% 
	 			}
	 		}
	 	%>
	</table> 
 </div>
 



	<!-- 	footer 영역 -->
	 <%@include file="../includes/footer.jsp" %>

</body>

<!-- Mirrored from djtntn.com/sub/sub1/sub_1_1.php by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:23:42 GMT -->
</html>