<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   MemberVO ms = (MemberVO) request.getAttribute("MEM");
%>

<%
   
%>

<%@include file="../includes/headcss.jsp"%>
<%@include file="../includes/header.jsp"%>
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
#join {
   display: flex;
   justify-content: center;
}
#sel {
   margin: 4px;
/*    position: relative; */
   border: 1px solid black;
}
#lg{
/*    position: relative; */
   display: flex;
/*    padding: 5px; */
}
#lolo {
   margin: 4px;

}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

   <div class="container">
      <form id="login-form" class="form-signin" method="post"
         action="/MmHospital/Mlogin.do">
         <br>
         <br>
         <br>
         <br>
         <div id="lg">
         <h3 id="lolo" class="form-signin-heading">일반회원 로그인   </h3>
         <select id = "sel" onchange ="f_sel(this)">
            <option value="0">선택</option>
            <option value="doctor">의사</option>
            <option value="nurse">간호사</option>
            <option value="admin">관리자</option>
         </select>   
         </div>
         <p>
            <label for="username" class="sr-only">ID</label> <input type="text"
               id="uId" name="uId" class="form-control" placeholder="ID" required
               autofocus />
         </p>
         <p>
            <label for="password" class="sr-only">PW</label> <input
               type="password" id="uPw" name="uPw" class="form-control"
               placeholder="PW" required />
         </p>


         <button type="button" id="loginBtn" onclick="Login()"
            class="btn btn-lg btn-primary btn-block">로그인</button>
      </form>
      <div id="join">
         <a href="/MmHospital/login/findId.do">아이디 찾기 </a>/
         <a href="/MmHospital/login/findPw.do">비밀번호 찾기 </a>/
         <a href="/MmHospital/join.do">회원가입</a>
<%--             <a href="<%=request.getContextPath()%>/login.do"> 관리자 로그인</a> --%>
      </div>
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
         location.href="<%=request.getContextPath()%>/login.do";
      }
   }
      
//    $(document).ready(function(){
//       $('#login_form').keyup(function(event){
//          if(event.which === 13) {
//             $('#loginBtn').click();
//          }
//       }   
//    });
   
   
   $('#uId, #uPw').keypress(function(event){
      if(event.which === 13) {
         event.preventDefault(); 
    	  $('#loginBtn').click();
      }
   });

$('#loginBtn').on('click', function() {
    let uId = document.querySelector('#uId').value;
    let uPw = document.querySelector('#uPw').value;
   
    if (uId === '' || uPw === '') {
        alert("아이디와 비밀번호를 모두 입력하세요.");
        return;
    }
   $.ajax ({
      type: "POST",
      url: "<%=request.getContextPath()%>/Mlogin.do",
      data : {uId: uId, uPw: uPw},
      success : function(response) {
         if(response === "success") {
            window.location.href = "<%=request.getContextPath()%>/home.do;"
         
      } else if(response === "error") {
         alert("아이디 또는 비밀번호가 일치하지 않습니다");
         window.location.href = "<%=request.getContextPath()%>/Mlogin.do;"
      }
   },
   error: function(xhr , status, error) {
      alert('서버 오류가 발생하였습니다. 잠시후 다시 이용해주세요');
   }
   });   
});


   
   
</script>
</body>

</html>