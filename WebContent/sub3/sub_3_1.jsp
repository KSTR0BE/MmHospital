<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <!-- Head css,js 영역 -->
    <%@include file="../includes/headcss.jsp" %>
 <style>
     #calendar {
      width: 300px;
      margin: 0 auto; /* Center the calendar horizontally */
      border-collapse: collapse; /* Remove borders between calendar cells */
    }


    /* Calendar table styling */
    #calendar th, #calendar td {
      text-align: center;
      padding: 5px;
      border: 1px solid #ddd;
    }

    /* Header row styling */
    #calendar th {
      background-color: #eee;
      font-weight: bold;
    }

    /* Selected date styling */
    .calendar .selected {
      background-color: #007bff;
      color: #fff;
      font-weight: bold;
    }

    /* Disabled date styling */
    .calendar .disabled {
      color: #ddd;
      cursor: default;
    }

    /* Hover effect on selectable dates */
    .date_data:hover {
      background-color: #e7e7e7;
    }

    /* Time list container styling */
    .time-list-container {
      margin-top: 20px;
      text-align: center;
    }
   .selected {
        background-color: #007bff; /* 선택된 날짜의 색상 */
        color: #fff; /* 텍스트 색상 */
        font-weight: bold; /* 굵은 텍스트 */
    }
    .date_data.clicked {
        background-color: #428bca; /* 클릭된 날짜의 색상 */
        color: #fff; /* 텍스트 색상 */
    }
    table {
        width: 300px;
        border: 2px solid #ddd; /* 테이블 테두리 스타일 지정 */
        box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1); /* 그림자 효과 추가 */
        font-family: Arial, sans-serif; /* 글꼴 설정 */
    }
 
 #box {
   margin: 10px;
   border: 4px #00A796; /* 테두리 설정 */
    padding: 10px;
    border-radius: 10px;
    
}

#submit {
    display: block;
    padding: 10px 20px;
    background-color: #00A796;
    border: none;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    transition: box-shadow 0.2s;
 	

}
  #calendar-navigation {
            text-align: center;
            margin-bottom: 10px;
        }
        #calendar-navigation button {
            margin: 0 10px;
        }
        #calendar-navigation span {
            font-size: 18px;
            font-weight: bold;
        }

.calendar-container, .doctor-form, .input-form, .class-form {
    margin: 20px auto;
    padding: 20px;
    border: 2px solid #00A796;
    border-radius: 5px;
    width: 90%;
    max-width: 600px;
}
.calendar-box, .input-in {
	display:flex;
}

 h1 {
            color: #1D5454; /* 텍스트 색상 */
            font-size: 30px; /* 폰트 크기 */
            font-weight: bold; /* 폰트 두께 */
            font-family: 'Arial', sans-serif; /* 폰트 종류 */
            margin-bottom: 20px; /* 아래쪽 여백 */
            border-radius: 10px; /* 둥근 모서리 */
         
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 */
            width: 35%;
        }
label {
	 color: #495057; /* 텍스트 색상 */
            font-size: 16px; /* 폰트 크기 */
            font-weight: bold; /* 폰트 두께 */
            font-family: 'Arial', sans-serif; /* 폰트 종류 */
            margin-bottom: 20px; /* 아래쪽 여백 */
            border-radius: 5px; /* 둥근 모서리 */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 */
}
 #calendar-navigation button {
        margin: 0 10px;
        padding: 5px 10px; /* 버튼 패딩 추가 */
        border: none;
        background-color: #00A796;
        color: white;
        border-radius: 5px; /* 둥근 모서리 */
        cursor: pointer; /* 커서 스타일 추가 */
        transition: background-color 0.3s; /* 배경색 전환 애니메이션 */
    }
 #calendar-navigation button:hover {
        background-color: #007b63; /* 호버 상태 배경색 */
    }

    #calendar-navigation span {
        font-size: 18px;
        font-weight: bold;
        color: #333; /* 텍스트 색상 */
    }
.modal_btn {
    display: block;
    margin: 40px auto;
    padding: 10px 20px;
    background-color: royalblue;
    border: none;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    transition: box-shadow 0.2s;
}
.modal_btn:hover {
    box-shadow: 3px 4px 11px 0px #00000040;
}

.close_btn {
    display: block;
    padding: 10px 20px;
    background-color: royalblue;
    border: none;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    transition: box-shadow 0.2s;
}
/* 모달창의 배경을 만든다 */
.modal__background{
display: none;
  position: fixed;
  top:0; left: 0; bottom: 0; right: 0;
  background: rgba(0, 0, 0, 0.8);
}
 
/* 모달창 영역을 꾸민다 */
.modal__box{
display: none;
  position: absolute;
  top: calc(50vh - 100px); left: calc(50vw - 200px);
  background-color: white;
  display: flex; justify-content: center;
  align-items: center;
  border-radius: 10px;
  width: 400px;
  height: 200px;
}
.btn {

   display: flex;
}
.aa {
	margin: 20px;
}  

    </style>
</head>
<body>
<%
   MemberVO ms = (MemberVO)request.getAttribute("MEM");
%>
    <!-- 헤더 -->
    <!-- 병원소개 진료안내 등 메뉴창 -->
    <%@include file="../includes/header.jsp" %>
    


 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/dist/css/sub.css">

<div class="sub_vis">
     <img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/sub2_vis.jpg" />
 </div>


<div class="content">

	<div class="left">
		<div class="sub_menu">
			<h3>진료안내</h3>
			<ul>
				<%
					if(av == null && dv == null && nsv == null){
				%>
				<li class="on"><a href="<%=request.getContextPath() %>/AppointInput.do">진료예약</a></li>
				<%
					}
				%>
				<li><a href="<%=request.getContextPath() %>/AppointChk.do">진료예약확인</a></li>
				<li><a href="<%=request.getContextPath() %>/sub2/sub_2_1.jsp">진료시간표</a></li>
			</ul>
		</div>
			 <p><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/call.jpg"/></p>
			<p><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/res.jpg" /></p>
	</div>


	<div class="right">
		<div class="sub_lnb">
			<h2>진료예약</h2>
			<ul>
				<li><a href="<%=request.getContextPath() %>/home.do">홈</a></li>
				<li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png" /></li>
				<li><a href="<%=request.getContextPath() %>/AppointChk.do">진료안내</a></li>
				<li><img src="<%=request.getContextPath() %>/resources/dist/images/sub/sub1/bar.png" /></li>
				<li class="on1"><a href="<%=request.getContextPath() %>/AppointInput.do">진료예약</a></li>
			</ul>
		</div>
            <div id="box">
           
     		 <div class="calendar-container">
                    <h1>1.날짜 선택</h1>
					<div class="calendar-box">
						<div id="calendar-navigation">
							<button id="prevMonth">이전달</button>
							<span id="currentMonthYear"></span>
							<button id="nextMonth">다음달</button>
							<div id="calendar"></div>
						</div>
						<div class="blank" style= width:100px;></div>
						<div class="time-list-container" id="timeList">
							<select class="time-list">
								<option value="9">9:00</option>
								<option value="10">10:00</option>
								<option value="11">11:00</option>
								<option value="12">12:00</option>
								<option value="14">14:00</option>
								<option value="15">15:00</option>
								<option value="16">16:00</option>
							</select>
						</div>
					</div>


				</div>
                 
                  <div class="class-form">
                     <h1>2.진료과 선택</h1>
                     <label for="cl_no">진료과 선택:</label>
                      <select id="cl_no"name="cl_no">
                        <option value="0">--선택해주세요--</option>
                        <option value="1">정형외과</option>
                        <option value="2">비뇨기과</option>
                        <option value="3">신경과</option>
                        <option value="4">정신과</option>
                     </select>
                  </div>
			
					<div class="doctor-form">
						<h1>3.의사 선택</h1>
						<label for="doctor">의사 선택:</label>
						 <select id="doctor" name="doctor">
							<!-- 의사 리스트가 여기에 동적으로 업데이트됩니다. -->
						</select>
					</div>

					<div class= "input-form">
					<h1>4.예약 신청</h1>
					<div class="input-in">
					<table>
					<tr>
                          	<td> 이름:</td>
                           <td><input type="text" name="memName" class="text" value=""></td>
					</tr>
                     <tr>  
                        	 <td>  전화번호:</td>
                           <td><input type="text" name="memTel" class="text" value=""></td>
                      </tr>
					</table>
                       
                         <%
                     if(mv != null){
                     %>
                        <input type="hidden" name="memNo" value="<%=mv.getMem_no()%>">
                     <%
                     }
                     %>
                     <%
                        if(mv != null){
                     %>
						<div class=blank style="width: 200px;"></div>
						<main>
							<section>
								<button type="button" class="modal_btn" id="modal">예약하기</button>
							</section>
						</main>

						<%
							}
						%>
					</div>
                   </div>
                   <!--모달 팝업-->
				<div class="modal__background">
					<div class="modal__box" style="flex-direction: column;">
						<div class="aa">
							<h3 style=" font-size: 20px;font-weight: bold;"><%=ms.getMem_nm() %> 님</h3>
							<h3>정말 예약하시겠습니까?</h3>
					
						</div> 
						
						<div class= btn>
							<button class="btn btn_warning" id="submit">예약 하기</button>
							 <button type="button" class="close_btn">닫기</button>
						</div>
					
					
					</div>
				</div>

			</div>
               
               </div>
        </div>


	<!-- 	퀵메뉴 -->
	<%@include file="/includes/body.jsp" %>

    <!-- footer 영역 -->
    <%@include file="../includes/footer.jsp" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
   			var currentYear = 2024;  // 초기 연도 설정
   			 var currentMonth = 5;    // 초기 월 설정 (1월: 1, 2월: 2, ..., 12월: 12)
        	// 달력을 생성하는 함수
        	
        	function updateMonthYear() {
            var monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
            document.getElementById("currentMonthYear").innerText = currentYear + "년 " + monthNames[currentMonth - 1];
        }
        function createCalendar(year, month) {
            var calendarElement = document.getElementById("calendar");
            var currentDate = new Date(year, month - 1, 1); // month는 0부터 시작하므로 -1
            var nextMonthDate = new Date(year, month, 0);

            var html = "<table><thead><tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr></thead><tbody>";

            html += "<tr>";
            for (var i = 0; i < currentDate.getDay(); i++) {
                html += "<td></td>";
            }

            while (currentDate <= nextMonthDate) {
                if (currentDate.getDay() === 0) {
                    html += "</tr><tr>";
                }
                
                html += "<td class='date_data' year='" + year + "' month='" + month + "' day='" + currentDate.getDate() + "'>" + currentDate.getDate() + "</td>";
                currentDate.setDate(currentDate.getDate() + 1);
            }

            for (var i = currentDate.getDay(); i < 7; i++) {
                html += "<td></td>";
            }

            html += "</tr></tbody></table>";

            calendarElement.innerHTML = html;

            // 날짜 클릭 이벤트 핸들러 추가
            addDateClickEvent();
        }
        // 날짜 클릭 이벤트 핸들러
        function addDateClickEvent() {
            $(".date_data").click(function() {
                var dayOfWeek = new Date($(this).attr("year"), $(this).attr("month") - 1, $(this).attr("day")).getDay();

              
                 var selectedDate = new Date($(this).attr("year"), $(this).attr("month") - 1, $(this).attr("day"));
                 var currentDate = new Date(); 

                 if (selectedDate < currentDate) {
                     // Disable if it's a past date
                     $(this).addClass("disabled");
                     return;
                 }

                
                // 클릭된 날짜에 .clicked 클래스 추가
                $(".date_data").removeClass("clicked");
                $(this).addClass("clicked");
                // 시간 선택 목록 생성 및 표시
                var timeList = createTimeList();
                $(".time-list-container").html(timeList);
            });
        }
     
        // 이전달 버튼 클릭 이벤트 핸들러
        $("#prevMonth").click(function() {
            if (currentMonth === 1) {
                currentYear--;
                currentMonth = 12;
            } else {
                currentMonth--;
            }
            updateMonthYear();
            createCalendar(currentYear, currentMonth);
        });

        // 다음달 버튼 클릭 이벤트 핸들러
        $("#nextMonth").click(function() {
            if (currentMonth === 12) {
                currentYear++;
                currentMonth = 1;
            } else {
                currentMonth++;
            }
            updateMonthYear();
            createCalendar(currentYear, currentMonth);
        });

        // 페이지 로드 시 초기 달력 생성
        $(document).ready(function() {
        	 updateMonthYear();
            createCalendar(currentYear, currentMonth);
        });
   
        
        $(function(){
            var submit = $("#submit");
            var insertForm = $("#insertForm");

            submit.on("click", function(event){
                event.preventDefault(); // 기본 제출 동작 중지

                var name = $("input[name='memName']").val();
                var memTel = $("input[name='memTel']").val();
                var doctor = $("#doctor").val();
                var cl_no = $('#cl_no').val();
            	var memNo = $("input[name='memNo']").val();
            
                if(name == null || name == ""){
                    alert("이름을 입력해주세요!");
                    return false;
                }
                if(memTel == null || memTel == ""){
                    alert("전화번호를 입력해주세요!");
                    return false;
                }
                if(cl_no == null || cl_no == ""){
                    alert("진료과를 선택해주세요!");
                    return false;
                }
                if(doctor == null || doctor == ""){
                    alert("담당의사를 선택해주세요!");
                    return false;
                }

                // 선택된 날짜와 시간 가져오기
                var selectedDate = $(".clicked").attr("year") + "-" + $(".clicked").attr("month") + "-" + $(".clicked").attr("day");
                var selectedTime = $(".time-list").val();

                // AJAX를 사용하여 서버로 선택된 날짜와 시간, 그리고 이름과 전화번호 전송
                
                $.ajax({
                    type: "POST",
                    url: "<%=request.getContextPath()%>/AppointInput.do", // 서버 URL 설정
                    data: { 
                        selectedDate: selectedDate, // 선택된 날짜
                        selectedTime: selectedTime, // 선택된 시간
                        doctor: doctor,
                        memNo: memNo
                    },
                    success: function(response) {
                        // 성공적으로 서버에서 응답을 받았을 때 처리할 작업
                        console.log("서버 응답: " + response);
//                         alert("예약 성공");
                        location.href = "<%=request.getContextPath()%>/AppointChk.do";
                    },
                    error: function(xhr, status, error) {
                        // 서버 요청이 실패했을 때 처리할 작업
                        console.error("서버 요청 실패:", status, error);
                        alert("예약 실패! 다시 시도해주세요.");
                    }
                });
            });
        });
     
            $("#cl_no").on("change", function() {
                var cl_no = $(this).val();
                
                $.ajax({
                    type: "GET",
                    url: "<%=request.getContextPath()%>/GetDoctor.do",
                    data: {
                        cl_no: cl_no
                    },
                    success: function(response) {
                        console.log("서버 응답: " + response);
                        $("#doctor").html(response); // 서버에서 받은 HTML 코드로 의사 목록 업데이트
                    },
                    error: function(xhr, status, error) {
                        console.error("서버 요청 실패:", status, error);
                    }
                });
            });
            
            const modal = document.querySelector('.modal__background');
            const modalOpen = document.querySelector('.modal_btn');
            const modalClose = document.querySelector('.close_btn');

            //열기 버튼을 눌렀을 때 모달팝업이 열림
            modalOpen.addEventListener('click',function(){
                //display 속성을 block로 변경
                modal.style.display = 'block';
            });
            //닫기 버튼을 눌렀을 때 모달팝업이 닫힘
            modalClose.addEventListener('click',function(){
               //display 속성을 none으로 변경
                modal.style.display = 'none';
            });
            
          
    </script>

    <script>
        /** 새창팝업 **/
        function popWin(url, w, h, scroll){
            var pop;
            var setting = "width="+w+", height="+h+", top=0, left=0, scrollbars="+scroll;
            pop = window.open(url, "", setting);
            pop.focus();
        }
    </script>

</body>
</html>