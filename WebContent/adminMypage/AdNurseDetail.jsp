<%@page import="kr.or.ddit.nurse.vo.NurseVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	NurseVO nsVO = (NurseVO)request.getAttribute("nsVO");

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
			<h4>간호사 상세정보</h4>
		</div>
		<br>
		<div id="modify">
				<div id = "tbtb">
					<table>
						<tr>
							<td>이름:&nbsp</td>
							<td><%=nsVO.getNs_nm()%></td>
						</tr>
						
						<tr>
							<td>주민번호:&nbsp</td>
							<td><%=nsVO.getNs_reg()%></td>
						</tr>
						<tr>
							<td>I D:&nbsp</td>
							<td><%=nsVO.getNs_id()%></td>
						</tr>
						<tr>
							<td>P W:&nbsp</td>
							<td><%=nsVO.getNs_pw()%></td>
						</tr>
						<tr>
							<td>이메일:&nbsp</td>
							<td><%=nsVO.getNs_em()%></td>
						</tr>
						<tr>
							<td>계정유무:&nbsp</td>
							<td id="change">
<% 						
							if(nsVO.getNs_yn().equals("Y")){
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
					</table>
				</div>
			<div class="form-group">
				<div>
					<input type="button" id="Btn" class="Btn" value="계정삭제" data-nsno="<%=nsVO.getNs_no()%>"
					style="font-size: large; width: 120px; height: 40px; background-color: #00A796; color: white;">
					<a href="<%=request.getContextPath() %>/adNurseList.do">
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

	let conf = confirm("탈퇴처리 하시겠습니까?");
	
	if(conf){
		
		 $.ajax({
			type: 'get', //get은생략가능
			url: '/MmHospital/adNurseUpdate.do?nsNo='+ $(this).data('nsno'),
			success: function(rst){
				let data = JSON.parse(rst);
				
				if(data.ns_yn === 'Y'){
					$('#change').text('탈퇴 계정');
				} else {
					$('#change').text('가입 계정');
				}
				
			},
			error: function(xhr) {
				alert(xhr.status);
			}
		});
		alert("정상적으로 탈퇴했습니다.");
		
	} else {
		alert("탈퇴 취소했습니다.");
	}
});

</script>
	<!-- 	footer 영역 -->
	 <%@include file="../includes/footer.jsp" %>
</html>