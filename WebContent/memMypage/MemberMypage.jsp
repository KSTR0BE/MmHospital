<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file= "../includes/header.jsp" %>
 <%@include file="../includes/headcss.jsp" %>
<style>
#mypage{
	margin: 50px;
	border: 4px double #00A796; /* 테두리 설정 */
    padding: 100px;
    justify-content: center;
    border-radius: 10px;
    
}
#full{
	display: flex;
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
.input2{
	font-size: 12pt;
 	color: white;
}
#div3{
	margin-left: 85%;
	width: 100px;
	height: 30px;
	border: 1px solid black;
 	background-color: gray;
	border-radius: 10px;
 	align-content: center;
	text-align: center;
}

</style>
<body>

	<div id="mypage">
		<div id="full">
			<div id="img1">
				<div class="img2">
					<img alt="병원" src="<%=request.getContextPath() %>/resources/dist/images/main/병원.png">
				</div>
				<div class="img2">
					<img alt="두통" src="<%=request.getContextPath() %>/resources/dist/images/main/두통.png">
				</div>
			</div>
			<div id="div1">
				<div class="div2">
					<a href="<%=request.getContextPath() %>/pwCheck.do">
						<input type="button" class="input1" name="memberUpdate" value="회원정보 수정"></a><br /> 
				</div>
				<div class="div2">
					<a href="<%=request.getContextPath() %>/AppointRecord.do"> 
						<input type="button" class="input1" name="memberRecord" value="예약 정보 확인"></a><br />
				</div>
				<div class="div2">
					<a href="<%=request.getContextPath() %>/AppointData.do"> 
						<input type="button" class="input1" name="AppintData" value="회원 진료기록 조회"></a><br />
				</div>
<!-- 				<div class="div2"> -->
<%-- 					<a href="<%=request.getContextPath() %>/memMypage/MemModify.jsp"> --%>
<!-- 						<input type="button" class="input1" name="나중에 지정할 것" value="회원 결제 내역 조회"></a><br />  -->
<!-- 				</div> -->
				<div class="div2">
					<a href="<%=request.getContextPath() %>/PatientList.do"> 
						<input type="button" class="input1" name="나중에 지정할 것" value="회원 입퇴원 내역 조회"></a><br />
				</div>
			</div>
			<div id="img1">
				<img alt="회원" src="<%=request.getContextPath() %>/resources/dist/images/main/회원.png">
			</div>
		</div>
		<div id="div3">
			<a href="<%=request.getContextPath() %>/delete.do">
				<input type="button"  class="input2" name="memberDelete" value="회원탈퇴"
				style = "background-color: gray; color: white;"></a>
		</div>
	</div>

		
</body>
<!-- 	footer 영역 -->
	 <%@include file="/includes/footer.jsp" %>
</html>