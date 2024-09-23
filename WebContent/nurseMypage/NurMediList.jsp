<%@page import="kr.or.ddit.nurse.vo.NurseMediListVO"%>
<%@page import="kr.or.ddit.nurse.controller.NurseMediList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<NurseMediListVO> medList = (List<NurseMediListVO>)request.getAttribute("medList");

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
	background-color: lightblue;
	color: black;
	font-weight: bold;
}
th, tr, td{
	border: 2px solid gray;
	height: 30px;
	
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
		<h2 id="hh">입원환자 처방조회</h2>
	</div>
	<div style="padding: 5px; height: 5px;"></div>
	<div id="hr"></div>
		<table>
			<tr>
				<th>번호</th>
				<th>환자명</th>
				<th>진료내용</th>
				<th>호실</th>
				<th>담당간호사</th>
				<th>담당의사</th>
				<th>진료과목</th>
				<th>처방약</th>
			</tr>
			<%
				if(medList.size() == 0 ) {
			%>
			<tr>
				<td colspan="8">입원내역이없습니다.</td>
			</tr>	
			<%
				} else {
					for(int i = 0; i<medList.size(); i++) {
				
			%>
			<tr>
				<td><%=medList.get(i).getAm_rn() %></td>
				<td><%=medList.get(i).getMem_nm() %></td>
				<td><%=medList.get(i).getDg_tit() %></td>
				<td><%=medList.get(i).getAm_no() %>호</td>
				<td><%=medList.get(i).getNs_nm() %></td>
				<td><%=medList.get(i).getDt_nm() %></td>
				<td><%=medList.get(i).getCl_nm() %></td>
				<td><%=medList.get(i).getMd_nm() %></td>
			</tr>
			<%
					}
				}
			%>
			
			</table>
			<br> <br>
			<div id="div1">
			<a href="<%=request.getContextPath() %>/nurMypage.do">
				<input type="button"  class="input2" name="NurseMypage" value="목록"
				style = "background-color: lightgray;"></a>
		</div>
	</div>
	


</body>
	<%@include file="../includes/footer.jsp" %>
</html>