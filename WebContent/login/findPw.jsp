<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  	<%@include file="../includes/headcss.jsp"%>
	<%@include file="../includes/header.jsp"%>
	
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
	

<title>비밀번호찾기</title>
<style>
#fp {
	display: flex;'
}
#fpfp{
	margin: 4px;
}
#findpw{
	display: flex;
	justify-content: center;
}
    
    
    
    
    
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <form class="form-signin" method="post" action="<%=request.getContextPath() %>/login/findPw.do" >
    <br><br><br><br>
    		<div id="fp">
    		<h3 id="fpfp" class="form-signin-heading">비밀번호 찾기</h3>
    		<br>
    		</div>
    		<p>
            	<label for="uId" class="sr-only">아이디</label>
                <input type="text" class="form-control" id="uId" name="mem_id" placeholder="ID" required autofocus/>
            </p>
            <p>
            	<label for="reg" class="sr-only">주민등록번호</label>
                <input type="password" class="form-control" id="reg" name="mem_reg" placeholder="주민등록번호(-포함)" required/>
            </p>
                <label for="name" class="control-label row-sm-1" style="font-size: 0.8em;">* 임시 비밀번호가 생성됩니다.</label>
                <button type="button" class="btn btn-lg btn-primary btn-block btn-secondary" onclick="findPw()">확 인</button>
    </form>
    <div id="findpw">
    		<a href="/MmHospital/Mlogin.do">일반회원 로그인 </a>/
			<a href="/MmHospital/login/findId.do">아이디 찾기 </a>
    </div>
 </div>



<script>
	$(document).ready(function(){
		// 인터 키를 눌렀을 때 findPw 함수 호출
		$('#uId, #reg').keypress(function(event){
			if(event.which === 13){
				event.preventDefault(); // 폼 제출 방지
				findPw(); // findPw함수 호출
			}
		});
	});
    function findPw() {		// 입력값 가져오기
        var uId = $('#uId').val();
        var reg = $('#reg').val();
        
    	// 입력값 비어있는지 확인
    	if(uId.trim() === ''|| reg.trim() === '') {
    		alert('아이디와 주민번호를 입력해주세요.');
    		return
    	}
    	
        // 서블릿으로 AJAX 요청 보내기
        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath() %>/login/findPw.do', // 비밀번호를 찾는 서블릿 경로
            data: {
                uId: uId,
                reg: reg
            },
            success: function(response) { // 서버로부터 받은 비밀번호를 표시
            	if(response === "등록되지 않은 회원입니다."){
            		alert(response);
            	}else if(response === "주민등록번호가 일치하지 않습니다.") {
	            	alert(response);
            	} else{
            		alert('회원님의 임시 비밀번호는' + response + '입니다');
            		$('#uId').val('');
            		$('#reg').val('');
            	}
            }
            
        });
    }
</script>
</body>
</html>