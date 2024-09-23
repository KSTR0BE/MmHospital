<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    display: flex;
    justify-content: center;
    border-radius: 10px;
    
}
.input1 {
	font-size : 15pt;
	width: 300px;
	height: 50px;
	border: 1px solid black;
	background-color: #00A796;
	align-content: center;
	color: white;
	border-radius: 10px;
	
}
#div1 {
	margin-left: 150px;
	padding: 30px;
}
#img1 {
	margin-left: 50px;
	padding: 30px;
}
.div2{
	padding: 35px;
}
.img2{
	padding: 30px;
}

</style>
<body>
	<div id="mypage">
		<div id="img1">
			<div class="img2">
				<img alt="병원" src="<%=request.getContextPath() %>/resources/dist/images/main/병원.png">
			</div>
			<div class="img2">
				<img alt="톱니" src="<%=request.getContextPath() %>/resources/dist/images/main/톱니.png">
			</div>
		</div>
		<div id="div1">
			<div class="div2">
				<a href="<%=request.getContextPath() %>/adMemberList.do">
					<input type="button" class="input1" name="memberList" value="일반 회원 계정 관리"></a><br /> 
			</div>
			<div class="div2">
				<a href="<%=request.getContextPath() %>/adDoctorList.do"> 
					<input type="button" class="input1" name="doctorList" value="의사 계정 관리"></a><br />
			</div>
			<div class="div2">
				<a href="<%=request.getContextPath() %>/adNurseList.do">
					<input type="button" class="input1" name="nurseList" value="간호사 계정 관리"></a><br /> 
			</div>
			<div class="div2">
				<a href="<%=request.getContextPath() %>/patList.do">
					<input type="button" class="input1" name="patientList" value="입원환자 목록"></a><br /> 
			</div>
		</div>
		<div id="img1">
			<img alt="관리자" src="<%=request.getContextPath() %>/resources/dist/images/main/관리자.png">
		</div>
	</div>

</body>
<!-- 	footer 영역 -->
	 <%@include file="/includes/footer.jsp" %>
</html>