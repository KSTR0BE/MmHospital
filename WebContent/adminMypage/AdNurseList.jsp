<%@page import="kr.or.ddit.nurse.vo.NurseVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	List<NurseVO> nsList = (List<NurseVO>)request.getAttribute("nsList");

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
	border: 2px solid gray;
	height: 10px;
	
}
tr, td{
	text-align: center;
}
.input2{
	width: 100px;
	height: 30px;
	border: 1px solid gray;
 	background-color: lightgray;
	border-radius: 5px;
 	align-content: center;
	text-align: center;
}
#div1{
	display: flex;
	justify-content: space-between;
}
table td a:hover {
	color: blue;
}
 </style>
 <body>
 <div id="mypage">
 <h2 id="hh">간호사 계정 관리</h2>
	<div style="padding: 5px; height: 5px;"></div>
	<div id="hr"></div>
	<table>
	 	<tr> 
	 		<th>번호</th>
	 		<th>이름</th>
	 		<th>주민번호</th>
	 		<th>아이디</th>
	 		<th>비밀번호</th>
	 		<th>탈퇴여부</th>
	 	</tr>
	 	<%
	 		if(nsList.size() == 0) {
	 	%>
	 		<tr> 
	 			<td colspan="6">존재하는 간호사계정이 없습니다.</td>
	 		</tr>
	 	<%		
	 		} else {
	 			for(int i = 0 ; i < nsList.size(); i++) {
	 	%>
	 		<tr> 
	 			<td><%=nsList.get(i).getNs_no()%></td>
	 			<td><u><a href="<%=request.getContextPath() %>/adNurseDetail.do?nsNo=<%=nsList.get(i).getNs_no() %>"><%=nsList.get(i).getNs_nm()%></a></u></td>
	 			<td><%=nsList.get(i).getNs_reg()%></td>	
	 			<td><%=nsList.get(i).getNs_id()%></td>
	 			<td><%=nsList.get(i).getNs_pw()%></td>	
	 			<td>
<%
	 			if(nsList.get(i).getNs_yn().equals("Y")){
%>
	 				탈퇴계정 
<% 
	 			} else {
%>	 				
					가입계정
<%	 				
	 			}
%>
	 			
	 			
	 			</td>	
	 		</tr>
	 	<% 
	 			}
	 		}
	 	%>
	</table>
	<br> <br>
	<div id="div1">
		<div>
			<a href="<%=request.getContextPath() %>/adNurseInsert.do">
				<input type="button"  class="input2" name="AdminMypage" value="추가"
				style = "background-color: lightgray;"></a>	
		</div>
		<div>
			<a href="<%=request.getContextPath() %>/adminMypage.do">
				<input type="button"  class="input2" name="AdminMypage" value="목록"
				style = "background-color: lightgray;"></a>
		</div>		
	</div>
 </div>
 



</body>
<!-- 	footer 영역 -->
<%@include file="../includes/footer.jsp" %>
</html>