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
#join  {
 	margin: 70px; 
	border: 4px double #00A796; /* 테두리 설정 */
 	padding: 100px; 
	display: flex;
	justify-content: center; 

	border-radius: 10px;
}

h2 {
	margin: 40px;
	font-size: xx-large;
	border-bottom: 2px solid gray; 
	border-top: 2px solid gray; 
}
#he {
	margin: 10px;
	padding: 60px;
	text-align: center;
	
}
#req {
	color: red;
}

#joinjoin{
	margin: 60px;
	padding: 50px;
	border-left: 2px solid gray;
}

.reqreq {
	font-size: small;
	color : blue;
 
}

</style>

<body>
	<div id="join">
		<div id="he" style="margin-left: 10px;">
			<h2>회원가입</h2>
			<hr>
			<div id="req">* 는 필수입력</div>
		</div>
		<div id="joinjoin">
			<form action="/join.do" method="post" onsubmit="valid(event)">
				<div>
					<label for="id"> 아이디 <span class="rq"> *</span></label>
					<div>
						<input type="text" class="form-control" id="id" name="mem_id"
							placeholder="Enter id" required
							pattern="[a-zA-Z][a-zA-Z0-9]{5,8}"
							style="width: 500px; height: 30px;">
					</div>
						<span class="reqreq">영문 + 숫자 혼용 6~8자 이어야 합니다</span>
					<div style="text-align: left;">
						<button type="button" class="btn btn-success btn-sm" id="idChk">중복검사</button>
						<span id="disp"></span>
					</div> <br>
					<div>
						<label for="pass">비밀번호 <span class="rq"> *</span>
						</label>
						<div>
							<input type="password" class="form-control" id="pass"
								name="mem_pw" required placeholder="비밀번호"
								pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%\^&\*\(\)_\+\|]).{8,}"
								style="width: 500px; height: 30px;">
								
						</div>
						<label for="pass">비밀번호 확인<span class="rq"> </span>
						</label>
						<div>
							<input type="password" class="form-control" id="pass2"
								name="mem_pw" required placeholder="비밀번호 확인"
								pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%\^&\*\(\)_\+\|]).{8,}"
								style="width: 500px; height: 30px;">
						</div>
							<font id ="chkNotice" size="2"></font>
							<span class="reqreq">대문자, 소문자, 숫자, 특수문자(!,@,#,$,%,^,&,*,(,),;) 4가지 조합으로 8자 이상이어야 합니다</span>
					</div> <br>

					<div>
						<label for="name" class="control-label">이름 <span
							class="rq"> *</span></label>
						<div>
							<input type="text" class="form-control" id="name" name="mem_nm"
								required pattern="[가-힣]{2,8}"
								style="width: 500px; height: 30px;">
						</div>
					</div> <br>
					
					<div>
						<label for="name" class="control-label">성별 <span
							class="rq"> *</span></label> 남<input type="radio" class="form-control"
							id="gn_male" name="mem_gn" value="M"> 여<input
							type="radio" class="form-control" id="gn_female" name="mem_gn"
							value="F">

					</div><br>

					<div class="form-group">
						<label for="bir" class="control-label"> 주민번호 * </label>
						<div>
							<input type="text"  id="reg" name="mem_reg"
								placeholder="000000" required 
								style="width: 100px; height: 30px;">-
							<input type="password"  name="mem_reg2"  
								placeholder="0000000" required 
								style="width: 100px; height: 30px;">
							
						</div>
					</div> <br>

					<div class="form-group">
						<label for="hp" class="control-label">연락처(-포함 입력) <span>
								*</span>
						</label>
						<div>
							<input type="text" class="form-control" id="tel" name="mem_tel"
								placeholder="010-0000-0000" required
								pattern="[0-9]{2,3}-\d{3,4}-[0-9]{4}"
								style="width: 500px; height: 30px;">
						</div>
					</div> <br>

					<div class="form-group">
						<label for="mail" class="control-label col-sm-2">이메일 *</label>
						<div class="col-sm-4">
							<input type="email" class="form-control" id="mail" name="mem_em" 
								style="border:  1px solid lightgray; width: 500px; height: 30px;">
						</div> <br>

						<div class="form-group">
							<label for="add1" class="control-label col-sm-2">우편번호<span
								class="rq"> *</span></label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="postAddr"
									name="mem_add" required style="width: 500px; height: 30px;" readonly>
							</div>
							<div class="col-sm-6" style="text-align: left;">
								<button type="button" id="addrBtn" class="btn btn-info btn-sm">주소검색</button>
							</div>
						</div>

						<div class="form-group">
							<label for="addr1" class="control-label col-sm-2">주소<span
								class="rq"> *</span></label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="addr1"
									name="mem_addr" readonly required
									style="width: 500px; height: 30px;">
								<!-- 				readonly -> 입력못하게 만드는 것 -->
							</div>
						</div>


						<div class="form-group">
							<label for="addr2" class="control-label col-sm-2">상세주소<span
								class="rq"> *</span></label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="addr2"
									name="mem_addr2" style="width: 500px; height: 30px;" required>
								<!-- 					required -> 폼에 * -> 필수입력 칸을 만들어 놓은 것 -->
							</div>
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<button class="btn btn-default" id="joinBtn"
							style="font-size: large; width: 120px; height: 30px; background-color: #00A796; color: white;">
							가입하기</button>
							<span id="joinspan"></span>
						</div>
					</div>
			</form>
		</div>
	</div>
	</div>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


	<script>
	
	

// 	rrn: function(str) {
// 		let originStr = str;
// 		let rrnStr;
// 		let maskingStr;
// 		let strLength;
		
// 		if(this.checkNull(originStr) == true) {
// 			return originStr;
// 		}
// 		rrnStr = originStr.match(/(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4]{1}[0-9]{6}\b/gi);
// 		if(this.checkNull(rrnStr) == false) {
// 			strLength = rrnStr.toString().split('-').length;
// 			maskingStr = originStr.toString().replace(rrnStr, rrnStr.toString().replace(/(-?)([1-4]{1})([0-9]{6})\b/gi,"$1$2******"));
// 		}else {
// 			rrnStr = originStr.match(/\d{13}/gi);
// 			if(this.checkNull(rrnStr) == false) {
// 				strLength = rrnStr.toString.split('-').length;
// 				maskingStr = originStr.toString().replace(rrnStr, rrnStr.toString().replace(/([0-9]{6}$/gi,"******"));
// 			}else{
// 				return originStr;
// 			}
// 		}			
// 		return maskingStr;
// 	}
	
	
$(function(){
	$('#pass').keyup(function(){
		$('#chkNotice').html('');
		if($('#pass').val().length < 8 ) {
			$('#chkNotice').html('특수문자를 포함한 8자 이상으로 작성해주세요<br>');
			$('#chkNotice').attr('color','red');
		}
	});
	$('#pass2').keyup(function(){
		if($('#pass').val() != $('#pass2').val()) {
			$('#chkNotice').html('비밀번호가 일치하지 않습니다.<br>');
			$('#chkNotice').attr('color','red');
		}else if($('#pass').val() == $('#pass2').val()) {
			$('#chkNotice').html('비밀번호 일치 <br>');
			$('#chkNotice').attr('color','red');
		} else {
			$('#chkNotice').html('비밀번호를 입력해주세요');
			$('#chkNotice').attr('color','red');
		}
	});
	
});	

function valid(e) {
	
	e.preventDefault();
	
	let idVal1 = $('#id').val();
	let idPw = $('#pass').val();
	
	let data = $('form').serialize();
	
	console.log(data);
	
	$.ajax({
		type: 'post',
		url: '<%=request.getContextPath()%>/join.do',
		data: data,
		success: function(response){
// 			console.log(response);
			console.log("회원가입 됨");
			$('#joinspan').text('회원가입이 성공적으로 완료되었습니다.').css('color', 'green');
			alert('회원가입이 성공적으로 완료되었습니다.');
			location.href='<%=request.getContextPath()%>/Mlogin.do';
		},
		error: function(xhr){
			$('#joinspan').text('회원가입에 실패하였습니다. 다시 시도해주세요.').css('color', 'red');
			alert(xhr.status);
		}
	});
	
}


//우편번호 검색 API
$('#addrBtn').on('click',function() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
//             document.getElementById('우리폼 영역의 우편번호 요소').value = data.zonecode;
            document.getElementById('postAddr').value = data.zonecode;
//             document.getElementById("우리폼 영역의 주소요소").value = data.roadAddress;
            document.querySelector("#addr1").value = data.roadAddress;
//             document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
        }
    }).open();
});


$('#idChk').on('click',function(){
	
	let userId = $('#id').val();
	
	
	$.ajax({
		url:'<%=request.getContextPath()%>/login/loginCk.jsp',
		data : 'userId=' + userId,
		success  : function(rst) {
			let pass = JSON.parse(rst);
			console.log(pass.msg);
			
			if(pass.rst == "ok") {
				
				$('#disp').text(pass.msg).css('color','blue');
				
			}else if(pass.rst =="notok") {
				$('#disp').text(pass.msg).css('color','red');
			}else {
				$('#disp').text(pass.msg).css('color','red');
			}
		},
		
		error : function(xhr) {
			alert(xhr.status);
		}
		
	});
	
});





$('#joinBtn').on('click', function() {
    // 필수 입력 값 검사
    if (!validateForm()) {
        // 필수 입력 값이 비어있을 경우, 사용자에게 메시지를 표시하고 함수를 종료합니다.
        alert('모든 필수 입력 항목을 작성해주세요.');
        return;
    }
    // 서버로 데이터 전송
//     sendData();
});

// 필수 입력 값 검사 함수
function validateForm() {
    // 각 필수 입력 항목을 검사하여 값이 비어있으면 false 반환
    if ($('#id').val() === '' || $('#pass').val() 
    		=== '' || $('#name').val() 
    		=== '' || $('#gn_male').prop('checked') 
    		=== false && $('#gn_female').prop('checked') 
    		=== false || $('#reg').val() === '' || $('#tel').val() 
    		=== '' || $('#postAddr').val() === '' || $('#addr1').val() === '' || $('#addr2').val() === '') {
        return false;
    }
    return true;
}

// 서버로 데이터 전송 함수
function sendData() {
    let data = $('form').serialize();
    $.ajax({
        type: 'post',
        url: '<%=request.getContextPath()%>/join.do',
				data : data,
				success : function(response) {
					if (response === 'success') {
						console.log("회원가입 성공");
// 						$('#joinspan').text('회원가입이 성공적으로 완료되었습니다.').css(
// 								'color', 'green');
						alret("회원가입이 성공적으로 완료되었습니다.");
					} else {
						console.log("회원가입 실패");
						$('#joinspan').text('회원가입에 실패하였습니다. 다시 시도해주세요.').css(
								'color', 'red');
					}
				},
				error : function(xhr) {
					console.log(xhr.status);
					$('#joinspan').text('서버 오류로 회원가입에 실패하였습니다. 다시 시도해주세요.')
							.css('color', 'red');
				}
			});
		}
	</script>

</body>

 <footer> 
 	<%@include file="/includes/footer.jsp"%> 
 </footer> 

</html>