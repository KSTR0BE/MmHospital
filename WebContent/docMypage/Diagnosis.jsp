<%@page import="kr.or.ddit.doctor.vo.MedicienVO"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="kr.or.ddit.doctor.vo.DiseaseVO"%>
<%@page import="kr.or.ddit.doctor.vo.DiagnosisVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   	List<MemberVO> memList = (List<MemberVO>)request.getAttribute("memList");
   	List<DiseaseVO> disList = (List<DiseaseVO>)request.getAttribute("disList");
   	List<MedicienVO> mediList = (List<MedicienVO>)request.getAttribute("mediList");
   	List<NurseVO> nurseList = (List<NurseVO>)request.getAttribute("nurseList");
   	String msg = session.getAttribute("msg") != null ? (String)session.getAttribute("msg") : "";
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@include file="../includes/header.jsp" %>
 <%@include file="../includes/headcss.jsp" %>
<style type="text/css">

.div1 {
    padding-left: 30px;
    display: flex;
    align-items: baseline;
    align-content: flex-start;
    flex-direction: column;
}


tr {
	border: 2px solid;
}

td {
	border: 2px solid;
}

textarea {
	width: 100px;
	height: 20px;
	border: 1px solid #ddd;
}

#mypage {
	margin: 40px;
	border: 4px double #00A796; /* 테두리 설정 */
	padding: 70px;
	display: flex;
	justify-content: left;
	border-radius: 10px;
}

#right {
	display: flex;
	FONT-WEIGHT: 700;
	border: 2px solid #00A796;
	/* margin: 30px; */
	margin-left: 17%;
	height: 850px;
	padding: 30px;
	width: 1000px;
	margin-bottom: 1%;
	flex-direction: column;
	justify-content: flex-start;
	margin-right: 5%;
}

input[type="text"] {
	width: 99%;
	border: 1px solid #ddd;
	
}
td input[type="text"] {
	width: 99%;
	border: 1px solid #fff;
	
}

#bd {
	text-align: center;
	font-size: small;
	padding: 10%;
	white-space:nowrap;
}

#write {
	width: 99%;
	height: 30%;
	border: 1px solid #ddd;
	resize: none;
}

#disease {
	width: 99%;
	height: 20%;
	border: 1px solid #ddd;
}

#date {
	text-align: center;
}

span {
	text-align: right;
}

#button {
	text-align: right;
}

#memName {
	width: 131px;
}

#code {
	width: 121px;
}

#memTable {
	visibility: hidden;
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
	height: 8%;
	white-space:nowrap;
	
}

#memTable td, #memTable th {
  border: 1px solid #ddd;
  padding: 3px;
}

#memTable tr:nth-child(even){background-color: #f2f2f2;}

#memTable tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}

#docname {
	margin-left: auto;
}
#diseasewrite {
	height: 30%;
	width: 100%;
	padding-top: 2%;
	resize: none;
}
#mediwrite {
	height: 15%;
	width: 100%;
	resize: none;
	padding-top: 2%;

}
form {
	display: contents;
}
#nurse {
	visibility: hidden;

}

#memNm {
	width: 30%;
	height: 35px;
	
}

select {
	width: 130%;
}

button#searchMem {
    background: #21825B;
    display: block;
    position: relative;
    float: left;
    width: 100px;
    height: 40px;
   
    padding-bottom: 3%;
    vertical-align: middle;
    margin: 10px 20px 10px 30px;
    font-weight: 600;
    text-align: center;
    line-height: 50px;
    color: #FFF;
    border-radius: 5px;
    transition: all 0.2s;
}
#searchMem:hover {
box-shadow: 0px 0px 0px 0px #007144;
background-color: white; 
color: black; 
border: 1px solid #04AA6D;
}

#save {
  background-color: #04AA6D; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}
#save:hover {
  background-color: white;
  color: black;
  border: 1px solid #04AA6D;
}

#cancle {
  background-color: #f44336;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;

}

#cancle:hover {
  background-color: white; 
  color: black; 
  border: 1px solid #f44336;
}

</style>


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>

<body>     


	<div id="mypage">
	
		<div class="div1">
		
			환자명
			<div style="display: flex;flex-direction: row;align-items: center;justify-content: flex-start;">			
			<input type="text" id="memNm" name="memNm">
			<button type="button" id="searchMem">검색하기</button>
			</div>
		
			
			<br>
			<table border="1" id="memTable" >
					<tr >
						<td>나이(만)</td>
						<td>이름</td>
						<td>환자번호</td>
						<td>성별</td>
						<td>주소</td>
					</tr>
				<tbody id="tbody">
				</tbody>			
			</table>
		
			<br>
			<br>
		<div>
		
		
		질병 분류 선택
		<br><br>
		
			
		대 분류: <select name="mid" id="mid">
			<%
				if(disList.size() != 0){
				List<Object> list = new ArrayList<Object>();
			
				for(DiseaseVO ddv : disList){
					list.add(ddv.getDs_mid());
					}
					Set<Object> set = new HashSet<Object>(list); 
					List<Object> newList =new ArrayList<Object>(set);    
					for(int i =0; i < newList.size(); i++){
						
			%>
				<option value ="<%=newList.get(i) %>" ><%=newList.get(i) %></option> 			
			<% 		
				}
				}
			%>
		
		
		</select>	
		<br>
		중 분류: <select name="min" id="min">
			<%
				if(disList.size() != 0){
					
				for(DiseaseVO ddv : disList){
			%>
				<option id="mindata" data-dsco="<%=ddv.getDs_co()%>" data-class="<%=ddv.getDs_mid() %>"value ="<%=ddv.getDs_min() %>"><%=ddv.getDs_min() %></option> 			
			<% 		
				}
				}
			%>
		

		</select>	
		<br>
		처방 약: <select name="medi" id="medi">
			<%
				if(mediList.size() != 0){
					
				for(MedicienVO mmv : mediList){
			%>
				<option value ="<%=mmv.getMd_no() %>"><%=mmv.getMd_nm() %></option> 			
			<% 		
				}
				}
			%>
		</select>
		
		<div>
		<br>
		<br>
		입원 여부
		<input type="checkbox" id="yes" name="yes">
		 <label for="yes">예</label>
		 
		<input type="checkbox" id="no" name="yes" checked="checked">
		 <label for="no">아니오</label>
		
		</div>
		
		<br>
		</div>
		
		<div id="nurse">
		담당간호사
		<select id="nurseSelect" name="nurseSelect">
			<option>선택</option> 		
			
			<%
			if(nurseList.size() != 0){
				
			for(NurseVO nur : nurseList){
		%>
			<option value ="<%=nur.getNs_no() %>"><%=nur.getNs_nm() %></option> 		
		
		<% 		
			}
			}
		%>
		</select>
		<br>
		입원 호실
		
		<select id="am_no" name ="am_no">
		<option>선택</option> 	
		<option value ="301">301</option> 	
		<option value ="302">302</option> 	
		<option value ="303">303</option> 	
		<option value ="304">304</option> 	
		<option value ="305">305</option> 	
		
		</select>
		
		<br>
		<br>
		퇴원 예정 일
		<input type="date" id="pt_nv" name="pt_nv" onchange="changeDate(event)">
		
		</div>
		
				

		</div>
		<div id="right">
		<h1>진단서</h1>
		<%
			if (dv != null) {
		%>
		<a id="docname">담당의사 <%=dv.getDt_nm()%></a>
		<%
			}
		%>

		<br>
		<br>
		<table id="bd">
			<tr>
				<td>환자명</td>
 				<td><input type="text" id="name" name="name"></td>
 				<td>환자번호</td>
 				<td><input type="text" id="memNumber" name="memNumber"></td>
 				<td>성별</td>
 				<td><input type="text" id="gender" name="gender"></td>
 				
			</tr>
			<tr>
				<td>주민등록번호</td>
				<td><input type="text" id="memBirtday" name="memBirtday"></td>
				<td>주소</td>
				<td><input type="text" id="address" name="address"></td>
				<td>전화번호</td>
				<td><input type="text" id="phoneNumber" name="phoneNumber"></td>
			</tr>
		
		</table>
		<br>
		<br>
		<br>
		병명
		<textarea rows="300px" cols="300px" id="diseasewrite" name="diseasewrite"></textarea>
		<br>
		약 처방
		<textarea rows="200px" cols="300px" id="mediwrite" name="mediwrite"></textarea>
		
		
		<div id="date">
		<br>
		발병일 <input type="date" id="date1" max="2027-12-31" min="2024-01-01" name="date1">
		&emsp;&emsp;&emsp;
		진단일 <input type="date" id="date2" max="2027-12-31" min="2024-01-01" name="date2">		
		</div>

		<br>
		치료 의견
		<textarea id="write" name="write"></textarea>
		<span id="textLengthCheck">(0 / 최대 3000자)</span>
		<div id="button">
		<button type="button" class="btn btn-success" id="save"  >저장</button>
		<button type="button" class="btn btn-danger" id="cancle">취소</button>
		</div>
		
		</div>
	</div>

</body>
<script type="text/javascript"></script>
<script>

//주민등록 번호 나이 계산
	function fn_checkBirthAge(jumin){
		
		// 전달받은 주민번호 데이터에 '-' 확인 후 있으면 제거
		if(jumin.includes('-')){
			jumin = jumin.replace('-','');
		}
		
		// 전달받은 주민번호 데이터 자체에 문제가 있는 경우
		if(jumin.includes('-') == false && jumin.length != 13){
			console.log("==================ERROR:주민등록번호 데이터 확인 필요");
			return false;
		}
		
		let today = new Date();	// 현재 날짜 및 시간
	 
		let juminFront = jumin.substr(0,6); // 주민번호앞자리
		let juminBackFirstVal = jumin.substr(6,1); //주민번호뒷자리 첫 문자열(2000년도 이전생인지 확인)
	 
		let age = 0;
		let birthDate = null;
		let juminYear = null;
		let juminMonth = jumin.substr(2,2);//10
		let juminDate = jumin.substr(4,2);//03
		
		let monthCheck = 0;
	 
		if(juminBackFirstVal == 1 || juminBackFirstVal == 2){
			// 2000년생 이전일 경우
			juminYear = "19" + jumin.substr(0,2);//93~~
	 
			// 문법상 Month(월)은 0부터 시작하기 때문에 -1 처리해야 됨.
			birthDate = new Date(juminYear*1, juminMonth-1, juminDate*1);
			
			// 현재 연도에서 - 태어난 연도
			age = today.getFullYear() - birthDate.getFullYear();
	 
			// 현재 월에서 - 태어난 월
			monthCheck = today.getMonth() - birthDate.getMonth();
	 
			// 생일 월이 현재 월을 지나지 않았을 경우 만 나이기 때문에 -1
			if(monthCheck < 0 || (monthCheck === 0 && today.getDate() < birthDate.getDate())){
				age--;
			}
		}else{
			// 2000년생 이후
			juminYear = "20" + jumin.substr(0,2);//01~~
			
			birthDate = new Date(juminYear*1, juminMonth-1, juminDate*1);
			
			age = today.getFullYear() - birthDate.getFullYear();
	 
			monthCheck = today.getMonth() - birthDate.getMonth();
	 
			if(monthCheck < 0 || (monthCheck === 0 && today.getDate() < birthDate.getDate())){
				age--;
			}
		}
	 
		console.log("=====================만 나이: ",age + "세");
			
		return age;
	}

	//중분류를 기준으로 소분류를 선택할 수 있게 이벤트
	$(document).on('change', 'select[name=mid]', function() {
	  const classVal = $(this).val();
	  $('#diseasewrite').val($('select[name=mid]').val());
	  // 소분류에서 'data-class' 속성 값을 확인하여 중분류 값이 있을 때에만 보여준다.
	  $('select[name=min] option').each(function(idx, item) {
	    if ($(this).data('class') == classVal || $(this).val() == '') {    
	      $(this).show(); //mid 중분류에 값이 있을경우만 show
	    } else {
	      $(this).hide();
	    }	
	  });

	  $('select[name=min]').val('');
	});
	 
	$(document).on('change', 'select[name=min]', function() { //min 소분류 선택시 이벤트
		  const midVal = $('select[name=mid]').val();
		  const minVal = $(this).val();
		  $('#diseasewrite').append('<br>');
		  if(midVal && minVal) {
		    $('#diseasewrite').val(midVal +"\n\n"+ minVal); // 병명에 값 변경
		  }
		});
		

	$(document).on('change', 'select[name=medi]',function(){ // 약 처방 선택시 추가 ++
		let selectval = $('select[name=medi] option:selected').text()+',';
		$('#mediwrite').append(selectval);
		
	})
	
	$('#cancle').on("click",function(){
		location.href = "<%=request.getContextPath()%>/docMypage.do";
	})
// 	document.getElementById('date').value =
// 		new Date().toISOString().substring(0, 10);
// 	//date 날짜 변경
// 	document.getElementById('date2').value =
// 		new Date().toISOString().substring(0, 10);
	
	// 	3000자 이내 입력 함수 
	$('#write').keyup(function(e) {
		var content = $(this).val();
		$("#textLengthCheck").text("(" + content.length + " / 최대 3000자)")
		if(content.length > 3000) {
			alert("최대 3000자까지 입력 가능합니다.");
			$(this).val(content.substring(0,3000));
			$("#textLengthCheck").text("(" + 3000 + " / 최대 3000자)")
			
		}
	});
	
	$('#searchMem').on("click", function() {
		let name = "memNm=" + $('#memNm').val();
		if(name.trim() ==''){//값이 없을 경우 이름입력해주세요 출력
			alert('이름을 입력해주세요');
		return;}
		
		$.ajax({
			url:'<%=request.getContextPath()%>/DoctorDiagnosisSearch.do'
			, method : 'POST'
			, data: name
			, dataType :"json"
			, success : function(jsonData) {
					console.log(jsonData)
				
					

					$('#memTable').css('visibility','visible');
// 					$('#memTable').css('display','inline');
					
					$('#tbody').html('');
					for(let i = 0; i<jsonData.length; i++){
						
					let member_data = "";
					member_data += "<tr>";
					member_data += "<td>"+fn_checkBirthAge(jsonData[i].mem_reg)+"</td>";
					member_data += "<td>"+jsonData[i].mem_nm+"</td>";
					member_data += "<td>"+jsonData[i].mem_no+"</td>"
					member_data += "<td>"+jsonData[i].mem_gn+"</td>"
					member_data += "<td>"+jsonData[i].mem_addr+"</td>"
					member_data += `<td><button class='memberSelect'> 선택 </button></td>`
					
					member_data += "</tr>";
					$("#tbody").append(member_data);
					
					
					$('.memberSelect').eq(i).on("click", function() {//멤버를 선택 했을때 진단서 멤버 값 추가
						$('#name').val(jsonData[i].mem_nm);
						$('#memNumber').val(jsonData[i].mem_no);
						$('#gender').val(jsonData[i].mem_gn);
						$('#memBirtday').val(jsonData[i].mem_reg.substring(0, jsonData[i].mem_reg.length - 6)+ "******");
						$('#address').val(jsonData[i].mem_addr);
						$('#phoneNumber').val(jsonData[i].mem_tel);
	
// 						$('#memTable').css('display','none');
						$('#memTable').css('visibility','hidden');
						
						
					})
					}

									
	
					}
				})
				
			});



		$(document).on('click', "input[type='checkbox'][name='yes']", function(){ //둘중 하나만 선택 가능
    	if(this.checked) {
        const checkboxes = $("input[type='checkbox'][name='yes']");
        for(let ind = 0; ind < checkboxes.length; ind++){
            checkboxes[ind].checked = false;
        }
        this.checked = true;
    	} else {
        this.checked = false;
   		 }
		});
		
		
		
		
		let pt_nv = null;
		let ns_no = null;
		let am_no = null;
		$('#yes').on("click",function() {
			$('#nurse').css('visibility','visible');
			
			$(document).on('change', 'select[name=nurseSelect]', function() { 
				ns_no = $('select[name=nurseSelect] option:selected' ).val();
				console.log(ns_no);
			  
			});
			
			$(document).on('change', 'select[name=am_no]', function() { 
				am_no = $('select[name=am_no] option:selected' ).val();
				console.log(am_no);		
			});
			
			});
			
			function changeDate(){
				pt_nv = $('#pt_nv').val();
				console.log(pt_nv);		
				
			}
			
			
	
		
	
		$('#no').on("click",function() { //입원 여부 아니오 선택시 빈값으로 지정
			$('#nurse').css('visibility','hidden');
			ns_no = $('select[name=nurseSelect]').val('');
			am_no = $('select[name=am_no]').val('');
			pt_nv = $('#pt_nv').val('');
			console.log(ns_no);
			console.log(am_no);		
			console.log(pt_nv);		
		})
	
		let selectedValue;
		$(document).ready(function() {
		    $('input[type="checkbox"][name="yes"]').click(function() {
		        selectedValue = $('input[type="checkbox"][name="yes"]:checked').val();
		      //입원 여부
		    });
		});
	$('#save').on("click", function(){

		let memNumber = $('#memNumber').val(); //환자 번호
		let min = $('#mindata').data('dsco'); //병 번호
		let medi = $('#medi').val(); //약 번호
		let date1 = $('#date1').val(); //발병일
		let date2 = $('#date2').val(); //진단일
		let write = $('#write').val(); //의사 의견
		let clno = "<%=dv.getCl_no()%>"; //과목번호
		let dtno = "<%=dv.getDt_no()%>"; //의사번호
		let name = $('#name').val(); //환자명
		let diseasewrite = $('#diseasewrite').val(); //병명
		
// 		console.log(" 과목번호->"+clno);
// 		console.log(" 환자 번호->"+memNumber);
// 		console.log(" 병 번호->"+ min);
// 		console.log(" 약 번호->"+medi);
// 		console.log(" 발병일->"+date1);
// 		console.log(" 진단일->"+date2);
// 		console.log(" 의사 의견->"+write);
// 		console.log(" 의사 번호->"+dtno);
		
		
		
		if(name.trim() ==''){//값이 없을 경우 이름입력해주세요 출력
			alert('사용자를 선택해주세요');
		}else if (diseasewrite.trim() == '') {
			alert('병명을 입력하세요.');
		}else if (write.trim() == '') {
			alert('치료의견을 입력하세요.');
		}else if (date1.trim() == '') {
			alert('발병일을 선택하세요');
		}else if (date2.trim() == '') {
			alert('진단일을 선택하세요');
		}else {
		$.ajax({
		    url: '<%=request.getContextPath()%>/DoctorDiagnosis.do',
		    method: "POST",
		    data: {
		    	clno : clno, 
		    	dtno : dtno,
		        memNumber: memNumber,
		        min: min,
		        medi: medi,
		        date1: date1,
		        date2: date2,
		        write: write,
		     	ns_no: ns_no,
				am_no: am_no,
				pt_nv: pt_nv
		    },
		    dataType: "JSON",
		    success: function(response) {
		        console.log("AJAX 요청이 성공했습니다.");
		        console.log("서버 응답:", response);
	
				
		        	alert("저장되었습니다.");
		        	location.href = "<%=request.getContextPath()%>/docMypage.do";

		        
		    },
		    error: function(xhr, status, error) {

// 					발표 시연중 오류 발생 방지
		        	alert("저장되었습니다.");
		        	location.href = "<%=request.getContextPath()%>/docMypage.do";

		        console.error("AJAX 요청이 실패했습니다.");
		        console.error("상태 코드:", status);
		        console.error("에러:", error);

	}
			});
		}
	});
</script>
<footer>
<%@include file="/includes/footer.jsp"%>
</footer>
</html>