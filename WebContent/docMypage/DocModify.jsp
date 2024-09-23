<%@page import="kr.or.ddit.doctor.vo.DoctorVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="../includes/headcss.jsp"%>
<%@include file="../includes/header.jsp"%>

<style>

#tbtb {
	margin: 40px;
	border: 4px double #00A796;
	border-radius: 10px;
	padding : 30px;
}
/* #modifyBtn { */
/* 	font-size : 15pt; */
/* 	width: 300px; */
/* 	height: 50px; */
/* 	border: 1px solid black; */
/* 	background-color: #00A796; */
/* 	align-content: center; */
/* 	color: white; */
/* 	border-radius: 10px; */
/* } */

#mypage{
	margin: 40px;
	border: 4px double #00A796; /* 테두리 설정 */
    padding: 100px;
    display: flex;
    justify-content: center;
    border-radius: 10px;
    
}
#he {
	margin: 10px;
	padding: 60px;
	text-align: center;
}

#hehe {
	color: red;
	font-size: large;
}

h4 {
	margin: 40px;
	font-size: xx-large;
}

#modify {
	text-align: center;
	margin: 50px;
	font-size: x-large;
	padding: 100px;
	border-left: 2px solid gray;
}

#reg {
	width: 200px
}
</style>
</head>
<body>
	<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null) {
	%>
	<script type="text/javascript">
		alert("회원 수정이 완료되었습니다!");
	</script>
	<%
		} else {
	}
	%>
	<div id="mypage">
		<div id="he">
		<br> <br> <br><br>
			<h4>회원정보 수정 <br>
				  (의사)</h4>
			<div id="hehe">* 는 필수입력</div>
		</div>
		<br>
		<div id="modify">
			<form method="post" id="modForm">
				<input type="hidden" id="id" name="uId" value="<%=dv.getDt_id()%>">
				<input type="hidden" id="name" name="name" value="<%=dv.getDt_nm()%>">
				<div id = "tbtb">
					<table>
						<tr>
							<td>I D:</td>
							<td><%=dv.getDt_id()%></td>
						</tr>
						<tr>
							<td>P W   * :</td>
							<td> <input type="password" id="pw" name="uPw"
								value="<%=dv.getDocPW()%>" required
								pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%\^&\*\(\)_\+\|]).{8,}"
								style="width: 200px; height: 30px;"></td>
						</tr>
						<tr>
							<td>이름:</td>
							<td><%=dv.getDt_nm()%></td>
						</tr>
						<tr>
							<td>이메일   * : </td>
							<td> <input type="text" id="dc_mail" name="dc_mail"
								value="<%=dv.getDt_em()%>" required
								style="width: 200px; height: 30px;"></td>
						</tr>



					</table>
				</div>
				<div class="form-group">
					<div>
						<input type="button" id="modifyBtn" value="수정하기"
							style="font-size: large; width: 120px; height: 30px; background-color: #00A796; color: white;">
						<span id="modifyspan"></span>
					
						<input type="button" id="ListBtn" value="목록"
							style="font-size: large; width: 120px; height: 30px; background-color: #00A796; color: white;">
						<span id="modifyspan"></span>
					</div>
				</div>
			</form>
		</div>
	</div>	
		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

		<script type="text/javascript">
		$('#ListBtn').on('click',function(){
			location.href="<%=request.getContextPath() %>/docMypage.do";
		});
		
		$('#addrBtn').on('click',function() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
//		             document.getElementById('우리폼 영역의 우편번호 요소').value = data.zonecode;
		            document.getElementById('postAddr').value = data.zonecode;
//		             document.getElementById("우리폼 영역의 주소요소").value = data.roadAddress;
		            document.querySelector("#addr1").value = data.roadAddress;
//		             document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
		            
		        }
		    }).open();
		});
		
		
			$(function() {
				var modifyBtn = $('#modifyBtn');
				var modForm = $('#modForm');

				modifyBtn.on("click", function() {
					var pw = $('#pw').val();
					var email = $('#dc_mail').val();

					if (pw == null || pw == "") {
						alert("비밀번호를 입력해주세요!");
						return false;
					}

					if (dc_mail == null || dc_mail == "") {
						alert("이메일을 입력해주세요!");
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