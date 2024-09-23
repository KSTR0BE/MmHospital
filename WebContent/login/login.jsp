<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file="../includes/headcss.jsp"%>
	<%@include file="../includes/header.jsp"%>
    
<%
	String msg = session.getAttribute("msg") == null ?
				"" : (String)session.getAttribute("msg");

	session.removeAttribute("msg");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
#lg{
	display: flex;
/* 	display: space-between; */
	padding: 5px;
	}
#sel{
	margin: 4px;
	float: right;
	border: 1px solid black;
}
#lolo {
	margin: 4px;
}	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

	<div class="container">
		<form class="form-signin" method="post" action="<%=request.getContextPath() %>/login.do">
		<br><br><br><br>
			<div id="lg">
			<h3 id="lolo" class="form-signin-heading">관리자 로그인   </h3>
			<select id = "sel" onchange ="f_sel(this)">
				<option value="0">선택</option>
				<option value="doctor">의사</option>
				<option value="nurse">간호사</option>
				<option value="member">일반회원</option>
			</select>	
			</div>
			<p>
				<label for="username" class="sr-only">ID</label> 
				<input type="text" id="memId" name="memId" class="form-control"
					placeholder="ID" required autofocus/>
			</p>
			<p>
				<label for="password" class="sr-only">PW</label> 
				<input type="password" id="memPw" name="memPw" class="form-control"
					placeholder="PW" required/>
			</p>
			<button id="adminBtn" class="btn btn-lg btn-primary btn-block">관리자 로그인</button>
		</form>
		
<!-- 		<div id="join"> -->
<%-- 			<a href="<%=request.getContextPath() %>/Mlogin.do"> 일반 회원 로그인</a>/ --%>
<%-- 			<a href="<%=request.getContextPath() %>/Dlogin.do"> 의사 로그인</a>/ --%>
<%-- 			<a href="<%=request.getContextPath() %>/Nlogin.do"> 간호사 로그인</a> --%>
<!-- 		</div> -->
	</div>
	
	
	

	<script>

	function f_sel(p_this) {
		console.log(p_this.options)
		let arr =[];
		if(p_this.options[1].selected) {
			location.href="<%=request.getContextPath()%>/Dlogin.do";
		}
		if(p_this.options[2].selected) {
			location.href="<%=request.getContextPath()%>/Nlogin.do";
		}
		if(p_this.options[3].selected) {
			location.href="<%=request.getContextPath()%>/Mlogin.do";
		}
	}
	
	
	
	
	</script>
</body>
</html>