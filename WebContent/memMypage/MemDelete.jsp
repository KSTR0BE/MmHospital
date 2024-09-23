<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	MemberVO ms = (MemberVO)request.getAttribute("MEM");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

<%@include file="../includes/headcss.jsp"%>
<%@include file="../includes/header.jsp"%>
<style>

#tbtb {
	margin: 40px;
	border: 4px double #00A796;
	border-radius: 10px;
	padding : 30px;
}
#deleteBtn {
	font-size : 15pt;
	width: 300px;
	height: 50px;
	border: 1px solid black;
	background-color: #00A796;
	align-content: center;
	color: white;
	border-radius: 10px;
}
#backBtn{
	font-size: 15pt;
	width: 300px;
	height: 50px;
	border: 1px solid black;
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
</head>
<body>

<!-- 	회원 탈퇴 성공시 메시지 출력 -->
	<% 
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
%>
    <script type="text/javascript">
        alert("<%= msg %>");
    </script>
<%
    }
%>
	<div id="mypage">
		<div id="he">
		<br> <br> <br><br> <br><br> 
			<h4>회원 탈퇴</h4>
		</div>
		<br>
		<div id="modify">
			<form method="post" action="${pageContext.request.contextPath}/delete.do" id="modForm">
				<input type="hidden" id="id" name="uId" value="<%=mv.getMem_id()%>">
				<input type="hidden" id="name" name="name" value="<%=mv.getMem_nm()%>">
				
				<div id = "tbtb">
					<table>
						<tr>
							<td>I D:</td>
							<td><%=mv.getMem_id()%></td>
						</tr>
						<tr>
							<td>이름:</td>
							<td>
							<%=mv.getMem_nm()%></td>
						</tr>
						<tr>
							<td>P W:</td>
							<td><input type="password" id="pw" name="uPw"
								pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%\^&\*\(\)_\+\|]).{8,}"
								style="width: 300px; height: 30px;"></td>
						</tr>
						
					</table>
					</div>
					<div class="form-group">
						<div>
							<input type="submit" id="deleteBtn" value="탈퇴하기"
								style="font-size: large; width: 120px; height: 30px; background-color: gray; color: white;">
							<span id="deletespan"></span>
							<input type="button" id="backBtn" value="돌아가기" onclick="window.location.href='/MmHospital/MemberMypage.do'"
								style="font-size: large; width: 120px; height: 30px; background-color: #00A796; color: white;">
							<span id="backspan"></span>	
						</div>
					</div>
			</form>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script type="text/javascript">
		$(function() {
			var deleteBtn = $("#deleteBtn");
			var modForm = $("#modForm");

			deleteBtn.on("click", function() {
				var pw = $("#pw").val();

				if (pw == null || pw == "") {
					alert("비밀번호를 입력해주세요!");
					return false;
				}

				modForm.submit();
			});
		});
	</script>


</body>

<footer>
<%@include file="/includes/footer.jsp"%>
</footer>
</html>