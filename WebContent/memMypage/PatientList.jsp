<%@page import="kr.or.ddit.member.vo.PatientListVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--     회원 입퇴원내역조회 jsp 입니다 -->
<%
	List<PatientListVO> patList = (List<PatientListVO>)request.getAttribute("patList");

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
    height:500px;
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
	border: 2px solid gray;f
	height: 20px;
	
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
		<h2 id="hh">나의 입원내역 조회</h2>
	</div>
	<div>
		<form method="post">
			<input type="hidden" name ="memno" value="<%=mv.getMem_no()%>">
		</form>
	</div>
	<div style="padding: 5px; height: 5px;"></div>
	<div id="hr"></div>
		<table>
			<tr>
				<th>진료내역</th>
				<th>입원날짜</th>
				<th>퇴원날짜</th>
				<th>담당의사</th>
				<th>진료과목</th>
			</tr>
			<%
				if(patList.size() == 0) {
					
			%>
			<tr>
				<td colspan="6"> 입원 내역이 없습니다. </td>
			</tr>
			<%
				} else {
					for(int i =0; i<patList.size(); i++) {
						
				
			%>
			<tr>
				<td><a href="<%=request.getContextPath()%>/DignosisList.do?memNo=<%=mv.getMem_no()%>"><u><%=patList.get(i).getDg_tit() %></u></a></td>
				<td><%=patList.get(i).getPt_et() %> </td>
				<td><%=patList.get(i).getPt_lv() %></td>
				<td><%=patList.get(i).getDt_nm() %></td>
				<td><%=patList.get(i).getCl_nm() %></td>
			</tr>	

			<%
					}
				}
			%>
		</table>
		<br> <br>
			<div id="div1">
			<a href="<%=request.getContextPath() %>/MemberMypage.do">
				<input type="button"  class="input2" name="memberMypage" value="목록"
				style = "background-color: lightgray;"></a>
		</div>
	</div>


</body>
	
	<%@include file="../includes/footer.jsp" %>

</html>