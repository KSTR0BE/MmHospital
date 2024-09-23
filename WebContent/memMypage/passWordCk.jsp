<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/headcss.jsp"%>
<%@include file="../includes/header.jsp"%>

<%
	MemberVO ms = (MemberVO)request.getAttribute("MEM");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<link
	href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css"
	rel="stylesheet" crossorigin="anonymous" />

<title>로그인</title>
<style>
/* #join{ */
/* 	display: flex; */
/* 	justify-content: center; 
*/
/* } */
#lg {
	display: flex;
	/* 	display: space-between; */
	padding: 5px;
}

#sel {
	margin: 4px;
	float: right;
	border: 1px solid black;
}

#lolo {
	margin: 4px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

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

	<div class="container">
		<form class="form-signin" method="post"
			action="<%=request.getContextPath()%>/pwCheck.do">
			<br>
			<br>
			<br>
			<br>
			<div id="lg">
				<h3 id="lolo" class="form-signin-heading">비밀번호 확인</h3>
			</div>
			<p>
				<label for="password" class="sr-only">PW</label> 
				<input type="hidden" id="memId" name="memId" class= "form-control" value="<%=mv.getMem_id()%>">
				<input
					type="password" id="memPw" name="memPw" class="form-control"
					placeholder="PW" required />
			</p>
			<button id="chkBtn" class="btn btn-lg btn-primary btn-block">확인</button>
		</form>
	</div>
	
	
	<script type="text/javascript">

// 	$('#chkBtn').on('click',function(){
<%-- 		location.href="<%=request.getContextPath()%>/modify.do"; --%>
// 	});
	
	</script>
</body>
</html>