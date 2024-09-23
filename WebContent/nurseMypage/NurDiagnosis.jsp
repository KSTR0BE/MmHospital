<%@page import="kr.or.ddit.nurse.vo.NurDiagnosisListVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NurDiagnosisListVO dig = (NurDiagnosisListVO)request.getAttribute("digVO");		
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@include file="../includes/header.jsp" %>
 <%@include file="../includes/headcss.jsp" %>
 
 <style type="text/css">
 
 h1 {
 	border-bottom: 2px solid gray;
 }
.div1 {
	padding-left: 30px;
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	align-items: flex-start;
}

tr {
	border: 2px solid;
}

td {
	border: 2px solid;
}

textarea {
	width: 100px;
	height: 20px;
	border: 1px solid #ddd;
}

#mypage {
	margin: 40px;
	border: 4px double #00A796; /* 테두리 설정 */
	padding: 70px;
	display: flex;
	justify-content: left;
	border-radius: 10px;
}

#right {
	font-size: 17px;
	margin: 100px;
	display: flex;
	FONT-WEIGHT: 700;
	border: 2px solid #00A796;
	/* margin: 30px; */
	margin-left: 21%;
	height: 850px;
	padding: 50px;
	width: 1000px;
	margin-bottom: 5%;
	flex-direction: column;
	justify-content: center;
/* 	margin-right: 50%; */
}

input[type="text"] {
	width: 99%;
	/*     height: 74%;  */
	border: 1px solid #ddd;
}

#bd {
	text-align: center;
	font-size: medium;
	padding: 10%;
}

#write {
	width: 99%;
	height: 30%;
	border: 1px solid #ddd;
}

#disease {
	width: 99%;
	height: 20%;
	border: 1px solid #ddd;
}



span {
	text-align: right;
}

#button {
	text-align: right;
}

#memName {
	width: 131px;
}

#code {
	width: 121px;
}

#memTable {
	visibility: hidden;
}

#docname {
	margin-left: auto;
}
#bd {
	font-size: 16px;

}
</style>
</head>
<body>
	<div id="right">
		<h1>진료확인서</h1>
		<br>
		<a id="docname">담당의사 <%=dig.getDt_nm()%></a>

		<br>
		<br>
		<table id="bd">
			<tr>
				<td style="background-color: lightgray;">환자명</td>
 				<td><%=dig.getMem_nm() %></td>
 				<td style="background-color: lightgray;">환자번호</td>
 				<td><%=dig.getMem_no() %></td>
 				<td style="background-color: lightgray;">성별</td>
 				<td><%=dig.getMem_gn() %></td>
 				
			</tr>
			<tr>
				<td style="background-color: lightgray;">주민등록번호</td>
				<td><%=dig.getMem_reg() %></td>
				<td style="background-color: lightgray;">주소</td>
				<td><%=dig.getMem_addr() %></td>
				<td style="background-color: lightgray;">전화번호</td>
				<td><%=dig.getMem_tel() %></td>
			</tr>
		
		</table>
		<br>
		<br>
		<br>
		병명
		<input type="text" id="diseasewrite" readonly
		style = "width:500px; height: 30px; font-size:15px;" value="<%=dig.getDg_tit()%>">
		<br>
		약 처방
		<input type="text" name="mediwrite" style = "width:500px; height: 30px; font-size:15px;" 
		readonly value="<%=dig.getMd_nm()%>"></textarea>
		
		<div id="date">
		<br>
		진단일 
		<br>
		<input type="text" readonly id="date2" style = "width:500px; height: 30px; font-size:15px;" value ="<%=dig.getDg_dt()%>">		
		</div>

		<br>
		치료 의견
		<textarea readonly id="write" style ="font-size:15px;"><%=dig.getDg_con()%></textarea>
		<br>
		
		
		</div>
		
<script type="text/javascript">

	$('#listBtn').on('click', function(){
		location.href = "<%=request.getContextPath() %>/patList.do";
	});

</script>		
</body>

<footer>
<%@include file="/includes/footer.jsp"%>
</footer>
</html>