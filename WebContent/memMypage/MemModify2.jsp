<%@page import="kr.or.ddit.member.vo.MemberVO"%>
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
#he {
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
	margin: 100px;
	font-size: x-large;
	border: 3px solid black; /* 테두리 설정 */
	padding: 100px;
}


#reg {
	width: 200px 
}
</style>
</head>
<body>

	<div id="he">
		<h4>회원정보 수정</h4>

		<div id="hehe">* 는 필수입력</div>
	</div>
	<br>
	<div id="modify">
		<form action="<%=request.getContextPath()%>/modify.do"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="uId" value="<%=mv.getMem_id()%>">
			<div>
				<table>
					<tr>
						<td>I D:</td>
						<td><%=mv.getMem_id()%></td>
					</tr>
					<tr>
						<td>P W:</td>
						<td><input type="password" name="uPw"
							value="<%=mv.getMem_pw()%>" 
							required pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%\^&\*\(\)_\+\|]).{8,}"
							style="width: 200px; height: 30px;" ></td>
					</tr>
					<tr>
						<td>이름:</td>
						<td><%=mv.getMem_nm()%></td>
					</tr>
					<tr>
						<td>성별:</td>
						<td><%=mv.getMem_gn()%></td>
					</tr>
					<tr>
						<td>이메일 :</td>
						<td><input type="text" name="mem_mail"
							value="<%=mv.getMem_em()%>"
							required
							style="width: 200px; height: 30px;" ></td>
					</tr>
					<tr>
						<td>연락처(-포함 입력) :</td>
						<td><input type="text" id="id" name="mem_tel"
							required pattern="[0-9]{2,3}-\d{3,4}-[0-9]{4}"
							value="<%=mv.getMem_tel()%>"  style="width: 200px; height: 30px;"></td>
					</tr>

					<tr>
						<div class="form-group">
							<td><label for="add1" class="control-label col-sm-2">우편번호<span
								class="rq"> *</span></label></td>
							<td><div class="col-sm-4">
								<input style=" height: 30px;" type="text" class="form-control" id="postAddr"
									name="mem_zip" required>
							</div></td>
							<td><div class="col-sm-6" style="text-align: left;">
								<button type="button" id="addrBtn" class="btn btn-info btn-sm"
								style=" margin: 5px; font-size: medium; width: 80px; height: 23px; background-color: #00A796; color:white;">
								주소검색</button>
							</div></td>
						</div>
					</tr>
					
					
					<tr>
						<td>주소 :</td>
						<td><input style=" height: 30px;" type="text" class="form-control"  id="addr1"
							name="addr1" required value="<%=mv.getMem_addr()%>"></td>
					</tr>
					
					<tr>
						<td>상세 주소 :</td>
						<td><input type="text" id="addr2" name="mem_addr2" value="<%=mv.getMem_addr2()%>"> </td>
					</tr>


				</table>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<input type="submit" class="btn btn-default" id="modifyBtn" value="수정하기"
							style="font-size: large; width: 120px; height: 30px; background-color: #00A796; color:white;">
						<span id="modifyspan"></span>
			</div>
		</div>
		</form>
	</div>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script>
		$('#addrBtn').on('click', function() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					//             document.getElementById('우리폼 영역의 우편번호 요소').value = data.zonecode;
					document.getElementById('postAddr').value = data.zonecode;
					//             document.getElementById("우리폼 영역의 주소요소").value = data.roadAddress;
					document.querySelector("#addr1").value = data.roadAddress;
					//             document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

				}
			}).open();
		});
		
		
// 		$('#modifyBtn').on('click',function(){
			
			
// 		});
		
		
	</script>


</body>
</html>