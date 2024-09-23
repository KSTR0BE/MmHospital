<%@page import="kr.or.ddit.member.vo.MemberAdListVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MemberAdListVO> memList = (List<MemberAdListVO>)request.getAttribute("memList");
	
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
	height: 25px;
	
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
mark {
	font: bold;
}
table td a:hover {
	color: blue;
}
</style>
<body>
 <div id="mypage">
	<div id="full">
		<h2 id="hh">입원환자 전체조회</h2>
	</div>
	<div style="padding: 5px; height: 5px;"></div>
	<div id="hr"></div>
		<table>
			<tr>
				<th>환자번호</th>
				<th>환자명</th>
				<th>진료내용</th>
				<th>호실</th>
				<th>담당간호사</th>
			</tr>
			<%
				if(memList.size() == 0) {
			%>
			
			<tr>
				<td colspan="6"> 입원내역이 없습니다. </td>
			</tr>
			<%
				} else {
					for(int i = 0; i<memList.size(); i++) {
				
			%>
			<tr>
				<td style="width:13%"><%=memList.get(i).getMem_no() %> </td>
				<td><a href="<%=request.getContextPath()%>/DignosisList.do?memNo=<%=memList.get(i).getMem_no()%>"><u><%=memList.get(i).getMem_nm() %></u></a> </td>
				<td><%=memList.get(i).getDg_tit() %> </td>
				<td><%=memList.get(i).getAm_no() %> </td>
				<td><%=memList.get(i).getNs_nm() %> </td>
			</tr>
			<%
					}
				}		
			%>
			
			
		</table>
		<br> <br>
			<div id="div1">
			<%
				if(nsv != null){
			%>
			<a href="<%=request.getContextPath() %>/nurMypage.do">
				<input type="button"  class="input2" name="NurseMypage" value="목록"
				style = "background-color: lightgray;"></a>
				<%
				}if(av != null){
				%>
				<a href="<%=request.getContextPath() %>/adminMypage.do">
				<input type="button"  class="input2" name="NurseMypage" value="목록"
				style = "background-color: lightgray;"></a>
				<%
				}
				%>
		</div>
	</div>
	
	

	
	
</body>

	<%@include file="../includes/footer.jsp" %>


</html>