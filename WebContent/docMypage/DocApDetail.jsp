<%@page import="kr.or.ddit.appointMent.vo.AppointMentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	AppointMentVO apVO = (AppointMentVO)request.getAttribute("apVO");

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
#tbtb {
	margin: 40px;
	border: 4px double #00A796;
	border-radius: 10px;
	padding : 30px;
}
.Btn {
	font-size : 15pt;
	width: 300px;
	height: 50px;
	border: 1px solid gray;
	background-color: #00A796;
	align-content: center;
	color: white;
	border-radius: 10px;
}
#he {
	margin : 50px;
	text-align: center;
}
#mypage{
	margin: 40px;
	border: 4px double #00A796; /* 테두리 설정 */
    padding: 100px;
    display: flex;
    justify-content: center;
    border-radius: 10px;
    
}

#hehe {
	color: red;
	font-size: large;
}

h4 {
	margin: 40px;
	font-size: xx-large;
	border-bottom: 2px solid gray;
}

#modify {
	text-align: center;
	margin: 50px;
	font-size: x-large;
	padding: 50px;
	border-left: 2px solid gray;
}

#reg {
	width: 200px
}
 </style>
 <body>
	<div id="mypage">
		<div id="he">
		<br> <br> <br><br> <br><br> <br><br> <br><br>
			<h4>환자 예약정보</h4>
		</div>
		<br>
		<div id="modify">
				<div id = "tbtb">
					<table>
						<tr>
							<td>이름:&nbsp</td>
							<td><%=apVO.getMemNm()%></td>
						</tr>
						<tr>
							<td>예약 날짜:&nbsp</td>
							<td><%=apVO.getApDt()%></td>
						</tr>
						<tr>
							<td>예약 시간:&nbsp</td>
							<td><%=apVO.getApTm()%></td>
						</tr>
						<tr>
							<td>예약 현황:&nbsp</td>
							<td id="change">
<% 						
							if(apVO.getApYn().equals("N")){
%>
								예약 취소
<% 	
							} else {
%>								
								예약 중
<%
							}
%>						
							</td>
						</tr>
					</table>
				</div>
			<div class="form-group">
				<div>
					<input type="button" id="Btn" class="Btn" value="예약취소" data-apno="<%=apVO.getApNo()%>"
					style="font-size: large; width: 120px; height: 40px; background-color: #00A796; color: white;">
					<a href="<%=request.getContextPath() %>/doctorApList.do">
					<input type="button" class="Btn" value="목록"
						style="font-size: large; width: 120px; height: 40px; background-color: #00A796; color: white;">
						</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
$('#Btn').on('click',function(){

	let conf = confirm("예약취소 하시겠습니까?");
	
	if(conf){
		
		 $.ajax({
			type: 'get', //get은생략가능
			url: '/MmHospital/doctorApUpdate.do?apNo='+ $(this).data('apno'),
			success: function(rst){
				let data = JSON.parse(rst);
				
				if(data.ap_yn === 'N'){
					$('#change').text('예약 취소');
				} else {
					$('#change').text('예약 중');
				}
				
			},
			error: function(xhr) {
				alert(xhr.status);
			}
		});
		alert("정상적으로 취소했습니다.");
		
	} else {
		alert("삭제를 취소하였습니다.");
	}
});

</script>
	<!-- 	footer 영역 -->
	 <%@include file="../includes/footer.jsp" %>
</html>