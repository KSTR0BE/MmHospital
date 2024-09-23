<%@page import="kr.or.ddit.doctor.vo.DiagnosisVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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







<title>환자진료 기록 검색</title>
<style>
.button-container{
	display: flex;
	gap 0;   /* 요소를 컨테이너 양쪽 끝에 배치 */
}
.button-container button {
	flex: 1;     /* 버튼의 너비를 동일하게 설정*/
	border: 1px solid black;    /* 버튼 테두리를 검은색으로 설정 */ 
	border-radius: 0; /* 버튼 가장자리를 직사각형으로 설정 */
}
#but{
	margin: 10px 0;
}
#gap{
	margin-top: 15px; /* 버튼 컨테이너와 p요소 사이의 간격을 설정 */
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>


<div class="container">
	<table class="table table-bordered">
        
        <tbody>
            <% 
            List<DiagnosisVO> records = (List<DiagnosisVO>) request.getAttribute("records");
            if(records != null) {
                for (DiagnosisVO record : records) {
            %>
            <tr>
    			<td><%= record.getDg_no() %></td>
    			<td><%= record.getMem_nm() %></td>
    			<td><%= record.getDg_tit() %></td>
    			<td><%= record.getDg_con() %></td>
    			<td><%= record.getDg_dt() %></td>
    			<td><%= record.getMd_no() %></td>
    			<td><%= record.getDs_no() %></td>
    			<td><%= record.getCl_no() %></td>
    			<td><%= record.getDt_no() %></td>
    			<td><%= record.getPt_no() %></td>
			</tr>
			<%
        				} 
    				}
			%>
        </tbody>
    </table>

	<form class="form-signin" method="post" action="<%=request.getContextPath()%>/DnDetail.do">
	<br><br><br><br>

	<div id="dt">
	
	<h3 id="dtdt" class="form-signin-heading" style="text-align: center;">환자진료 기록  검색</h3>
	<label class="control-label row-sm-1" style="font-size: 0.8em; margin-top: 20px; color: red; display: block; text-align: center;">* 환자번호 또는 이름 중 하나를 선택</label>
	
	</div>
	
	
	<div id="but">
	<div class="button-container">
	<button type="button" class="btn btn-lg btn-secondary" id="patientNumberButton">환자번호</button>
	<button type="button" class="btn btn-lg btn-secondary" id="nameButton">이      름</button>
	</div>
	
	<div id="gap"></div>  <!-- 간격을 위한 추가 div -->
	
	<p>
		<label for="inputField" class="sr-only">입력란</label>
		<input type="text" class="form-control" id="inputField" name="inputField" placeholder="" required disabled/>
	</p>
	</div>
	
	
	<button type="button" id="searchBtn" class="btn btn-lg btn-primary btn-block">검색</button>
	
	<label class="control-label row-sm-1" style="font-size: 0.6em; margin-top: 10px;">* 예시) 환자번호: 36 / 이름: 장민</label>
</form>
<div id="searchResults">
	
	</div>
</div>


<script>
$(document).ready(function() {
	$("#patientNumberButton").click(function() {
		$(this).addClass("btn-primary").removeClass("btn-secondary");
		$("#nameButton").removeClass("btn-primary").addClass("btn-secondary");
		$("#inputField").attr("placeholder", "환자번호를 입력하세요.").prop("disabled",false);
		$("#inputField").data("type", "number"); // 입력 필드에 데이터 속성 추가
	});

	$("#nameButton").click(function() {
		$(this).addClass("btn-primary").removeClass("btn-secondary");
		$("#patientNumberButton").removeClass("btn-primary").addClass("btn-secondary")
		$("#inputField").attr("placeholder", "이름을 입력하세요").prop("disabled",false);
		$("#inputField").data("type", "text"); // 입력 필드에 데이터 속성 추가
	});
	
	/* 엔터 키 눌렀을 때 검색 수행 */
	$("#inputField").keypress(function(event){
		if(event.which === 13){
			event.preventDefault(); /* 폼 제출 방지 */
			$("#searchBtn").click();   /* 검색 버튼 클릭 이벤트 발생 */
		}
	});
	
		
	$("#searchBtn").click(function(){
		/* 검색버튼을 클릭하면 검색 결과를 가져오는 Ajax 요청을 보냄 */
		var searchType = $("#patientNumberButton").hasClass("btn-primary") ? "mem_no" : "mem_name";
		var inputField = $("#inputField").val().trim();
		var inputType = $("#inputField").data("type");
		
		if (inputField.trim() === "") {
	        alert("검색어를 입력하세요.");
	        return;
	    }
	    if (inputType === "number" && !/^\d+$/.test(inputField)){
	    	alert("잘못입력하셨습니다. 환자번호는 숫자만 입력해주세요.");
	    	return;
	    }
	    if (inputType === "text" && /\d/.test(inputField)) {
            alert("잘못입력하셨습니다. 이름은 문자로 입력해주세요.");
            return;
        }
	    
		$.ajax({
			type:"POST",
			url: "<%=request.getContextPath()%>/DnDetail.do",
			data: {inputField: inputField, searchType: searchType},
			success: function (data){
			/* 서버에서 반환된 JSON 데이터를 파싱하여 테이블에 추가*/
			var result = JSON.parse(data);
			console.log("result => " + result);
			if (result.length > 0) {
				var tableContent = "<div id='searchResultTable'><hr style='margin-top:20px; margin-bottom:30px;'><h4 style='font-size:24px; text-align: center;'>검색 결과</h4><table class='table table-bordered table-striped' style='margin-top: 20px; width: 100%;'>";
		        tableContent += "<thead class='thead-dark'><tr><th style='background-color: lightgray; white-space: nowrap; font-weight: bold;'>진료 번호</th><th style='background-color: lightgray; white-space: nowrap; font-weight: bold;'>환자 이름</th><th style='background-color: lightgray; white-space: nowrap; font-weight: bold;'>진료 제목</th><th style='background-color: lightgray; white-space: nowrap; font-weight: bold;'>진료 내용</th><th style='background-color: lightgray; white-space: nowrap; font-weight: bold;'>진료 날짜</th><th style='background-color: lightgray; white-space: nowrap; font-weight: bold;'>약 이름</th><th style='background-color: lightgray; white-space: nowrap; font-weight: bold;'>과목 이름</th><th style='background-color: lightgray; white-space: nowrap; font-weight: bold;'>의사 이름</th></tr></thead>";
		        tableContent += "<tbody>";
		        result.forEach(function(item) {
		        	var dg_dt = item.dg_dt;
                    /*  dg_dt가 문자열인 경우에만 replace 함수를 사용하여 날짜 형식을 변환 */
                    if (typeof dg_dt === 'string') {
                        dg_dt = new Date(dg_dt.replace(/-/g, '/'));
                    }
                    var formattedDate = dg_dt instanceof Date && !isNaN(dg_dt) ? dg_dt.toLocaleDateString() : dg_dt.year + '-' + dg_dt.month + '-' + dg_dt.day ; // 날짜 형식이 유효한지 확인 후 변환
		            tableContent += "<tr><td>" + item.dg_no + "</td><td>" + item.mem_nm + "</td><td>" + item.dg_tit + "</td><td>" +item.dg_con +"</td><td>" + formattedDate +"</td><td>" +item.md_nm +"</td><td>" +item.cl_nm +"</td><td>" +item.dt_nm +"</td></tr>";
		        });
		        tableContent += "</tbody></table></div>";
                $("#searchResults").html(tableContent);
            } else {
                $("#searchResults").html("<hr style='margin-top:20px; margin-bottom:30px;'><h4 style='font-size:20px; text-align:center;'>검색 결과가 없습니다.</h4>");
            }
				/* 검색후 입력란을 초기화 */
				$("#inputField").val('');
				console.log("넘어오는 json>>", result);
// 				$("#searchResults").html(data);
				
				
			},
			error: function(error){
				console.log(error);
				$("#searchResults").html("검색 중 오류가 발생했습니다.");
			}
			
		});
		
	});
	
});
</script>

</body>
</html>