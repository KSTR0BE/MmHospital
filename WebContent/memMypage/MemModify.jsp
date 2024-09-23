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
<title>Insert title here</title>

<%@include file="../includes/headcss.jsp"%>
<%@include file="../includes/header.jsp"%>
<style>

td{
	padding : 5px;
}

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
		<br> <br> <br><br> <br><br> <br><br> <br><br>
			<h4>회원 정보수정</h4>

		</div>
		<br>
		<div id="modify">
			<form method="post" id="modForm">
				<input type="hidden" id="id" name="uId" value="<%=mv.getMem_id()%>">
				<input type="hidden" id="name" name="name" value="<%=mv.getMem_nm()%>">
				<input type="hidden" id="gender" name="gender" value="<%=mv.getMem_gn()%>">
				
				<div id = "tbtb">
					<table>
						<tr>
							<td>I D:</td>
							<td><%=mv.getMem_id()%></td>
						</tr>
						
						<tr>
							<td>P W:</td>
							<td><input type="password" id="pw" name="uPw"
								value="<%=mv.getMem_pw()%>" required
								pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%\^&\*\(\)_\+\|]).{8,}"
								style="width: 300px; height: 30px;"></td>
						</tr>
						<tr>
							<td>이름:</td>
							<td>
							<%=mv.getMem_nm()%></td>
						</tr>
						<tr>
							<td>성별:</td>
							<td>
							<%=mv.getMem_gn()%></td>
						</tr>
						<tr>
							<td>이메일 :</td>
							<td><input type="text" name="mem_mail" id="email"
								value="<%=mv.getMem_em()%>" required
								style="width: 300px; height: 30px;"></td>
						</tr>
						<tr>
							<td>연락처(-포함 입력) :</td>
							<td><input type="text" id="tel" name="mem_tel" required
								pattern="[0-9]{2,3}-\d{3,4}-[0-9]{4}"
								value="<%=mv.getMem_tel()%>" style="width: 300px; height: 30px;"></td>
						</tr>

						<tr>
							<div class="form-group">
								<td><label for="add1" class="control-label col-sm-2">
										우편번호 :<span class="rq"> </span>
								</label></td>
								<td><div class="col-sm-4">
										<input style="height: 30px;" type="text" class="form-control"
											id="postAddr" name="mem_zip" required>
									</div></td>
								<td><div class="col-sm-6" style="text-align: left;">
										<button type="button" id="addrBtn" class="btn btn-info btn-sm"
											style="margin: 5px; font-size: medium; width: 80px; height: 23px; background-color: #00A796; color: white;">
											주소검색</button>
									</div></td>
							</div>
						</tr>


						<tr>
							<td>주소 :</td>
							<td><input style="height: 30px;" type="text"
								class="form-control" id="addr1" name="addr1" required
								value="<%=mv.getMem_addr()%>"></td>
						</tr>

						<tr>
							<td>상세 주소 :</td>
							<td><input type="text" id="addr2" name="mem_addr2"
								value="<%=mv.getMem_addr2()%>" style="width: 300px; height: 30px;"></td>
						</tr>


					</table>
					</div>
					<div class="form-group">
						<div>
							<input type="button" id="modifyBtn" value="수정하기"
								style="font-size: large; width: 120px; height: 30px; background-color: #00A796; color: white;">
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
			location.href="<%=request.getContextPath()%>/MemberMypage.do";
		});
	
		$('#addrBtn').on('click', function() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					//	             document.getElementById('우리폼 영역의 우편번호 요소').value = data.zonecode;
					document.getElementById('postAddr').value = data.zonecode;
					//	             document.getElementById("우리폼 영역의 주소요소").value = data.roadAddress;
					document.querySelector("#addr1").value = data.roadAddress;
					//	             document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

				}
			}).open();
		});

		$(function() {
			var modifyBtn = $("#modifyBtn");
			var modForm = $("#modForm");

			modifyBtn.on("click", function() {
				var pw = $("#pw").val();
				var tel = $("#tel").val();
				var email = $("#email").val();

				if (pw == null || pw == "") {
					alert("비밀번호를 입력해주세요!");
					return false;
				}

				if (tel == null || tel == "") {
					alert("전화번호를 입력해주세요!");
					return false;
				}

				if (email == null || email == "") {
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