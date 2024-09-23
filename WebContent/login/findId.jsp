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
	

<title>아이디찾기</title>
<style>
#fi {
	display: flex;
}
#fifi{
	margin: 4px;
}
#findid{
	display: flex;
	justify-content: center;
}

    
    
    
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <form class="form-signin" method="post" action="<%=request.getContextPath() %>/login/findId.do" >
    <br><br><br><br>
     	<div id="fi">
        <h3 id="fifi" class="form-signin-heading">아이디 찾기</h3>
        <br>
        </div>
        <p>
            <label for="name" class="sr-only">이름</label>
                <input type="text" class="form-control" id="name" name="mem_name" placeholder="이름" required autofocus/>
        </p>
        <p>
        	  <label for="tel" class="sr-only">휴대폰번호</label>
                <input type="text" class="form-control" id="tel" name="mem_tel" placeholder="휴대폰 번호 (-포함 입력)" required/>
        </p>
        <button type="button" class="btn btn-lg btn-primary btn-block btn-secondary" onclick="findId()">확 인</button>
    </form>
    <div id="findid">
			<a href="/MmHospital/Mlogin.do">일반회원 로그인 </a>/
			<a href="/MmHospital/login/findPw.do">비밀번호 찾기 </a>
	</div>
</div>




<script>
	$(document).ready(function(){
		// 엔터 키를 눌렀을 때 findId 함수 호출
		$('#name, #tel').keypress(function(event){
			if(event.which === 13) {
				event.preventDefault(); // 폼 제출 방지
				findId(); // find함수 호출
			}
		});
	});
	
    function findId() {		// 입력값 가져오기
        var name = $('#name').val();
        var tel = $('#tel').val();
        
    	// 입력값 비어있는지 확인
    	if(name.trim() === ''|| tel.trim() === '') {
    		alert('이름과 핸드폰 번호를 입력해주세요.');
    		return
    	}
    	
        // 서블릿으로 AJAX 요청 보내기
        $.ajax({
            type: 'post',
            url: '/MmHospital/login/findId.do', // 아이디를 찾는 서블릿 경로
            data: {
                name: name,
                tel: tel
            },
            success: function(response) { // 서버로부터 받은 응답을 처리
            	if(response.trim() === "등록되지 않은 회원입니다."){
            		alert(response);
            } else{
            	alert('회원님의 아이디는 ' + response + ' 입니다.');
            	$('#name').val('');
        		$('#tel').val('');
            	}
            },
            error: function(xhr, status, error) { // 오류 발생 시 메시지 표시
            	alert('아이디를 찾을 수 없습니다.');
            }
        });
    }
</script>
</body>
</html>