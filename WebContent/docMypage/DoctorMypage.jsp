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
					<img alt="청진기" src="<%=request.getContextPath() %>/resources/dist/images/main/청진기.png">
				</div>
			</div>
			<div id="div1">
				<div class="div2">
					<a href="<%=request.getContextPath()%>/docpwCheck.do">
						<input type="button" class="input1" name="docctorUpdate" value="의사 정보 수정"></a><br /> 
				</div>
				<div class="div2">
					<a href="<%=request.getContextPath()%>/doctorApList.do"> 
						<input type="button" class="input1" name="doctorApList" value="담당 환자 예약확인"></a><br />
				</div>
				<div class="div2">
					<a href="<%=request.getContextPath()%>/DoctorDiagnosis.do">
						<input type="button" class="input1" name="doctorWrite" value="외래/입원 진료서 작성"></a>
				</div>
				<div class="div2">
					<a href="<%=request.getContextPath()%>/doctorDnList.do"> 
						<input type="button" class="input1" name="dotorDnList" value="환자 진료 기록 조회"></a><br />
				</div>
				<div class="div2">
					<a href="<%=request.getContextPath()%>/doctorAdList.do?dtNo=<%=dv.getDt_no() %>"> 
						<input type="button" class="input1" name="dotorDnList" value="환자 입퇴원 내역 조회"></a><br />
				</div>
			</div>
			<div id="img1">
				<img alt="관리지" src="<%=request.getContextPath() %>/resources/dist/images/main/의사.png">
			</div>
		</div>
	</div>
		
</body>
<footer>
<%@include file="/includes/footer.jsp"%>
</footer>
</html>