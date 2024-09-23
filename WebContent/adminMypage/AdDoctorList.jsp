<%@page import="kr.or.ddit.doctor.vo.DoctorVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	List<DoctorVO> dcList = (List<DoctorVO>)request.getAttribute("dcList");

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
 	<h2 id="hh">의사 계정 관리</h2>
	<div style="padding: 5px; height: 5px;"></div>
	<div id="hr"></div>
	<table>
	 	<tr> 
	 		<th>번호</th>
	 		<th>전공과</th>
	 		<th>이름</th>
	 		<th>주민번호</th>
	 		<th>아이디</th>
	 		<th>비밀번호</th>
	 		<th>탈퇴여부</th>
	 	</tr>
	 	<%
	 		if(dcList.size() == 0) {
	 	%>
	 		<tr> 
	 			<td colspan="7">존재하는 의사계정이 없습니다.</td>
	 		</tr>
	 	<%		
	 		} else {
	 			for(int i = 0 ; i < dcList.size(); i++){
	 	%>
	 		<tr> 
	 			<td><%=dcList.get(i).getDt_no()%></td>
	 			<td><%=dcList.get(i).getCl_nm()%></td>	
	 			<td><u><a href="<%=request.getContextPath() %>/adDoctorDetail.do?dtNo=<%=dcList.get(i).getDt_no() %>"><%=dcList.get(i).getDt_nm()%></a></u></td>
	 			<td><%=dcList.get(i).getDt_reg()%></td>	
	 			<td><%=dcList.get(i).getDt_id()%></td>
	 			<td><%=dcList.get(i).getDt_pw()%></td>	
	 			<td>
<% 						
					if(dcList.get(i).getDt_yn().equals("Y")){
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
			<a href="<%=request.getContextPath() %>/adDoctorInsert.do">
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