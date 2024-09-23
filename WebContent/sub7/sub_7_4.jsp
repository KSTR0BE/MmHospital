<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<!-- Head css,js 영역 -->
 <%@include file="../includes/headcss.jsp" %>
 
 
 <body>
 <style>
.today_date { background:#D9F3D5};
.date_data {cursor:pointer;background:#E2F0FF;}
.date_data_on {background:#00a795 !important; color:#ffffff !important;cursor:pointer;}
</style>
<div class="revervation_pop" id="reservationPop">
	<div class="inner">
		<div class="top"><strong>진료예약</strong></div>
		<ul class="step">
			<li class="step1 select"><!-- 선택 완료 시 select 태그 추가 -->
				<div class="tit"><span>1</span>진료과 선택</div>
				<ul class="check">
					<li><input type="radio" name="step1_type" id="step1_type1" value="1" checked ><label for="step1_type1">척추센터</label></li>
					<li><input type="radio" name="step1_type" id="step1_type2" value="2"><label for="step1_type2">관절센터</label></li>
					<li><input type="radio" name="step1_type" id="step1_type3" value="3"><label for="step1_type3">내과센터</label></li>
                    <li><input type="radio" name="step1_type" id="step1_type10" value="10"><label for="step1_type10">뇌신경센터</label></li>
                    <li><input type="radio" name="step1_type" id="step1_type7" value="7"><label for="step1_type7">통증센터</label></li>
				</ul>
			</li>
			<li class="step2"><!-- 선택 완료 시 select 태그 추가 -->
				<div class="tit"><span>2</span>담당의사 선택</div>
				<ul class="select_list" id="doctorList">
<!-- ajax process 2012.09.14 21:03 -->
<li id='67' class='step2_doctor' id='67' medical='척추센터' dname='이원재 원장'>
						<input type='radio' name='step2_doctor' id='step2_doctor67' >
						<label for='step2_doctor67' class='btn_select' onclick=javascript:choice_doctor('67','척추센터','이원재원장');>선택</label>
						<div class='in_select'>
							<div class='photo'><img src='../../duri/staff/photo/t_p16986502171.jpg' alt='이원재 원장' width='90' height='106'></div>
							<div class='info'>
								<div class='txt1'>이원재<span> 원장</span></div>
								<div class='txt2'><span>진 료 과 :</span> 신경외과</div>
								<div class='txt3'>
									<span>진료분야 :</span>
									디스크질환 · 퇴행성 척추질환　척추협착증 · 전방전위증 · 척추 외상 · 척추측만증 · 급만성통증치료 · 최소침습 척추수술
								</div>
							</div>
						</div>
					</li><li id='29' class='step2_doctor' id='29' medical='척추센터' dname='양승환 병원장'>
						<input type='radio' name='step2_doctor' id='step2_doctor29' >
						<label for='step2_doctor29' class='btn_select' onclick=javascript:choice_doctor('29','척추센터','양승환병원장');>선택</label>
						<div class='in_select'>
							<div class='photo'><img src='../../duri/staff/photo/t_p15762256451.jpg' alt='양승환 병원장' width='90' height='106'></div>
							<div class='info'>
								<div class='txt1'>양승환<span> 병원장</span></div>
								<div class='txt2'><span>진 료 과 :</span> 신경외과</div>
								<div class='txt3'>
									<span>진료분야 :</span>
									디스크질환 · 퇴행성 척추질환 척추협착증 · 전방전위증 · 척추 외상 · 척추측만증 · 급만성통증치료 · 최소침습 척추수술
								</div>
							</div>
						</div>
					</li><li id='38' class='step2_doctor' id='38' medical='척추센터' dname='정성운 센터장'>
						<input type='radio' name='step2_doctor' id='step2_doctor38' >
						<label for='step2_doctor38' class='btn_select' onclick=javascript:choice_doctor('38','척추센터','정성운센터장');>선택</label>
						<div class='in_select'>
							<div class='photo'><img src='../../duri/staff/photo/t_p15762257691.jpg' alt='정성운 센터장' width='90' height='106'></div>
							<div class='info'>
								<div class='txt1'>정성운<span> 센터장</span></div>
								<div class='txt2'><span>진 료 과 :</span> 신경외과</div>
								<div class='txt3'>
									<span>진료분야 :</span>
									디스크질환 · 퇴행성 척추질환 척추협착증 · 전방전위증 · 척추 외상 · 척추측만증 · 급만성통증치료 · 최소침습 척추수술
								</div>
							</div>
						</div>
					</li>				</ul>
			</li>
			<li class="step3"><!-- 선택 완료 시 select 태그 추가 -->
				<div class="tit"><span>3</span>예약날짜 선택</div>
				<div class="bottom">
					<div class="calendar">
						<div class="line">
							<div class="nav"><a href="#" class="prev date_month_move" id="date_month_bm" year='2024' month='4'>이전</a><span id="date_ymd">2024.05</span><a href="#" class="next date_month_move" id="date_month_am" year='2024' month='6'>다음</a></div>
							<div class="table">
								<table>
									<caption>달력</caption>
									<colgroup>
										<col style="width:14.2857%">
										<col style="width:14.2857%">
										<col style="width:14.2857%">
										<col style="width:14.2857%">
										<col style="width:14.2857%">
										<col style="width:14.2857%">
										<col style="width:14.2857%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" class="sun">일</th>
											<th scope="col">월</th>
											<th scope="col">화</th>
											<th scope="col">수</th>
											<th scope="col">목</th>
											<th scope="col">금</th>
											<th scope="col" class="sat">토</th>
										</tr>
									</thead>
									<tbody id="table_tbody">
<tr><td class='sun cell' style=' color:#ce1717;' 3>&nbsp;</td><td class='cell' style=' ' 3>&nbsp;</td><td class='cell lastcell' style=' ' 3>&nbsp;</td><td class='cell lastcell' style=' ' 3>1</td><td class='cell lastcell' style=' ' 3>2</td><td class='cell lastcell' style='background:#D9F3D5; ' 3>3</td><td class='cell lastcell' style=' color:#396ec5;' 3>4</td></tr><tr><td class='sun cell' style=' color:#ce1717;' 3>5</td><td class='cell date_data' year='2024' month='5' day='6' style=' cursor:pointer;' 2>6</td><td class='cell lastcell date_data' year='2024' month='5' day='7' style=' cursor:pointer;' 2>7</td><td class='cell lastcell date_data' year='2024' month='5' day='8' style=' cursor:pointer;' 2>8</td><td class='cell lastcell date_data' year='2024' month='5' day='9' style=' cursor:pointer;' 2>9</td><td class='cell lastcell date_data' year='2024' month='5' day='10' style=' cursor:pointer;' 2>10</td><td class='cell lastcell' style=' color:#396ec5;' 3>11</td></tr><tr><td class='sun cell' style=' color:#ce1717;' 3>12</td><td class='cell date_data' year='2024' month='5' day='13' style=' cursor:pointer;' 2>13</td><td class='cell lastcell date_data' year='2024' month='5' day='14' style=' cursor:pointer;' 2>14</td><td class='cell lastcell date_data' year='2024' month='5' day='15' style=' cursor:pointer;' 2>15</td><td class='cell lastcell date_data' year='2024' month='5' day='16' style=' cursor:pointer;' 2>16</td><td class='cell lastcell date_data' year='2024' month='5' day='17' style=' cursor:pointer;' 2>17</td><td class='cell lastcell' style=' color:#396ec5;' 3>18</td></tr><tr><td class='sun cell' style=' color:#ce1717;' 3>19</td><td class='cell date_data' year='2024' month='5' day='20' style=' cursor:pointer;' 2>20</td><td class='cell lastcell date_data' year='2024' month='5' day='21' style=' cursor:pointer;' 2>21</td><td class='cell lastcell date_data' year='2024' month='5' day='22' style=' cursor:pointer;' 2>22</td><td class='cell lastcell date_data' year='2024' month='5' day='23' style=' cursor:pointer;' 2>23</td><td class='cell lastcell date_data' year='2024' month='5' day='24' style=' cursor:pointer;' 2>24</td><td class='cell lastcell' style=' color:#396ec5;' 3>25</td></tr><tr><td class='sun cell' style=' color:#ce1717;' 3>26</td><td class='cell date_data' year='2024' month='5' day='27' style=' cursor:pointer;' 2>27</td><td class='cell lastcell date_data' year='2024' month='5' day='28' style=' cursor:pointer;' 2>28</td><td class='cell lastcell date_data' year='2024' month='5' day='29' style=' cursor:pointer;' 2>29</td><td class='cell lastcell date_data' year='2024' month='5' day='30' style=' cursor:pointer;' 2>30</td><td class='cell lastcell date_data' year='2024' month='5' day='31' style=' cursor:pointer;' 2>31</td><td class='cell lastcell' style=' color:#396ec5;' 3>&nbsp;</td></tr><tr><td class='sun cell' style=' color:#ce1717;' 3>&nbsp;</td><td class='cell' style=' ' 3>&nbsp;</td><td class='cell lastcell' style=' ' 3>&nbsp;</td><td class='cell lastcell' style=' ' 3>&nbsp;</td><td class='cell lastcell' style=' ' 3>&nbsp;</td><td class='cell lastcell' style=' ' 3>&nbsp;</td><td class='cell lastcell' style=' color:#396ec5;' 3>&nbsp;</td></tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="info">온라인 예약이 접수되면 전문 상담사와 통화 후 진료예약이 확정됩니다.<br>예약시간 변경 및 취소는 전화로만 가능합니다.<br><span>042-220-2300</span></div>
					</div>

					<div class="time">
						<div class="in_tit">시간</div>
						<ul id="init_time">
							<li><a href="#">09:30</a></li>
							<li><a href="#">10:00</a></li>
							<li><a href="#">10:30</a></li>
							<li><a href="#">11:00</a></li>
							<li><a href="#">11:30</a></li>
							<li><a href="#">14:00</a></li>
							<li><a href="#">14:30</a></li>
							<li class="check"><a href="#">15:00</a></li>
							<li><a href="#">15:30</a></li>
							<li><a href="#">16:00</a></li>
						</ul>
					</div>

				</div>
			</li>
			<li class="step4"><!-- 선택 완료 시 select 태그 추가 -->
				<div class="tit"><span>4</span>예약정보 확인</div>
				<div class="bottom">
					<div class="table">
						<table>
							<caption>예약정보</caption>
							<colgroup>
								<col style="width:76px">
								<col style="width:110px">
								<col style="width:140px">
								<col style="width:102px">
								<col style="width:124px">
								<col style="width:206px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">진료과</th>
									<th scope="col">담당의사</th>
									<th scope="col">예약날짜/시간</th>
									<th scope="col">환자 이름</th>
									<th scope="col">생년월일</th>
									<th scope="col">연락처</th>
								</tr>
							</thead>
							<tbody>
								<tr>
								<form name="appForm" method="post">
									<td><span id="medical_text"></span></td>
									<td><span id="dno_text"></span> <span id="dname_text"></span></td>
									<td><span id="SelectDate_text"></span><br><span id="stime_text"></span></td>
									<td><input type="text" value="" class="size_m" id="rName" name="rName" placeholder="환자이름"></td>
									<td><input type="text" value="" class="size_l" id="rSsn" name="rSsn" maxlength="6" placeholder="생년월일"></td>
									<td>
										<input type="text" id="hp1" name="hp1" value="" class="size_s" maxlength="3" placeholder="010"> -
										<input type="text" id="hp2" name="hp2" value="" class="size_s" maxlength="4" placeholder="0000"> -
										<input type="text" id="hp3" name="hp3" value="" class="size_s" maxlength="4" placeholder="0000">
										<div class="agree">개인정보취금방침 <span class="cs_form"><input type="checkbox" name="agree" id="agree"><label for="agree">동의함</label></span></div>
									</td>
									<input type="hidden" name="medical" id="medical" />
									<input type="hidden" name="dno" id="dno" />
									<input type="hidden" name="dname" id="dname" />
									<input type="hidden" name="stime" id="stime"/>
									<input type="hidden" name="SelectDate" id="SelectDate">
									<input type="hidden" name="sdate" id="sdate"/>
								</form>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn"><a href="javascript:submitReserve()" id="reserve_btn">진료예약 신청</a></div>
				</div>
			</li>
		</ul>
		<a href="javascript:reservationPop.close();" class="btn_close"><img src="../../images/sub/sub2/2/btn_close.png" alt="닫기"></a>
	</div>
</div><!-- //revervation_pop -->

<script>
	var $rPop = $('#reservationPop');
	var reservationPop ={
		open : function(e){
			//$('html').css({'overflow':'hidden'});
			$rPop.show();
			//e.preventDefault();
		},
		close : function(e){
			//$('html').css({'overflow':'auto'});
			$rPop.hide();
		}
	}

	$("input[name=step1_type]").change(function(e){
		console.log($(this).val());
		var no = $(this).val();
		$.ajax({
			type : "post",
			url : "/ajax/ajax_online.php",
			dataType : "html",
			data : {"cmd":"selected_1","no":no},
			success : function(data){
				$("#doctorList").html(data);
				$("#medical_text").html();
				$("#dno_text").html();
				$("#dname_text").html();
				$("#SelectDate_text, #stime_text").html();
				$("#medical").attr("value","");
				$("#dname").attr("value","");
				$("#SelectDate, #sdate, #stime").attr("value","");
			}
		});
	});

	$(".profile_open").click(function(e){
		var no = $(this).attr("idx");
		$.ajax({
			type : "post",
			url : "/ajax/ajax_proc.php",
			dataType : "text",
			data : {"no":no},
			success : function(data){
				$("#profile").html(data);
				$("#profile").show();
			}
		});

	});
function choice_doctor(id,medical,dname){		//의사 클릭시

	var no = id;
	var medical = medical;
	var dname = dname;
	$(".date_month_move").attr("staff",no);
	$("#medical").attr("value",medical);
	$("#medical_text").text(medical);
	$("#dno").attr("value",no);
	$("#dname").attr("value",dname);
	$("#dname_text").text(dname);

	console.log(no);
	console.log(medical);
	console.log(dname);

	$.ajax({
		type : "post",
		url : "/ajax/ajax_online_date.php",
		dateType : "text",
		data : {"cmd":"date_search","staff":no},
		success : function(data){
			console.log(data);
			var da = data.split("@");
			var da1 = da[0].split("../../index.html");
			var da2 = da[1].split("../../index.html");
			$("#date_month_bm").attr({"year":da1[0],"month":da1[1]});
			$("#date_month_am").attr({"year":da2[0],"month":da2[1]});
			$("#date_ymd").html(da[2]);
			$("#table_tbody").html(da[3]);
			$("#checkdate").attr("value",da[4]);
			$("#checkweek").attr("value",da[5]);
			$("#SelectDate, #sdate, #stime").attr("value","");
		}
	});
}
$(document).on('click',".date_data",function(e){

	$(this).parent().parent().find('.date_data').removeClass('date_data_on');

	$(this).addClass("date_data_on");

	var dno		= $("#dno").attr("value");
	if(!dno){
		alert("담당의사를 먼저 선택 하세요.");
		return false;
	}
	var year	= $(this).attr("year");
	var month	= $(this).attr("month");
	var day		= $(this).attr("day");
	$("#SelectDate").attr("value",year+"년 "+month+"월 "+day+"일");
	$("#sdate").attr("value",year+"-"+month+"-"+day);
	var date2	= year+"-"+month+"-"+day;
	if(dno){
		$.ajax({
			type: "post",
			url: "/ajax/ajax_booking2.php",
			dataType: "text",
			data: {"staff":dno, "date":date2},
			success : function(data){
				console.log(data);
//					$("#booking").html(data);
				var da = data.split("@");
				$("#init_time").html(da[0]);
				$("#init_time").append(da[1]);
			}
		});
	}else{
		$("#booking option").remove();
	}
});
function ajaxBooking3(staff, date){
	return $.ajax({
		type: "post",
		url: "/ajax/ajax_booking2.php",
		dataType: "text",
		data: {"staff":staff, "date":date}
	});
}
$(document).on('click',".date_month_move",function(e){	//이전달/다음달 클릭시
	var dno		= $("#dno").attr("value");
	if(!dno){
		alert("담당의사를 먼저 선택 하세요.");
		return false;
	}
	var year	= $(this).attr("year");
	var month	= $(this).attr("month");
	var staff	= $(this).attr("staff");
	$.ajax({
		type : "post",
		url : "/ajax/ajax_online_date.php",
		dateType : "text",
		data : {"cmd":"date_search","year":year,"month":month,"staff":staff},
		success : function(data){
			console.log(data);
			var da = data.split("@");
			var da1 = da[0].split("../../index.html");
			var da2 = da[1].split("../../index.html");
			$("#date_month_bm").attr({"year":da1[0],"month":da1[1]});
			$("#date_month_am").attr({"year":da2[0],"month":da2[1]});
			$("#date_ymd").html(da[2]);
			$("#table_tbody").html(da[3]);
			$("#checkdate").attr("value",da[4]);
			$("#checkweek").attr("value",da[5]);
		}
	});
});

$(document).on('click',".ct",function(e){
	var choice_time = $(this).attr("choice_time");

	//e.parent().find('.check').removeClass('check');

	//e.parent().addClass("check");

	$(this).parent().parent().find(".check").removeClass("check");
	$(this).parent().attr("class","check");
	$("#stime").val(choice_time);
	console.log($("#SelectDate").val());
	$("#SelectDate_text").html($("#SelectDate").val());
	console.log($("#stime").val());
	$("#stime_text").html($("#stime").val());

	$("#reserve_btn").css("background","url('../../images/sub/sub2/2/btn3.png')");


});
function submitReserve()
{
	var f = document.appForm;
	if(f.agree.checked == false)
	{
		alert("개인정보 취급 방침에 동의 해 주세요");
		f.agree.focus();
		return false;
	}
	if(f.SelectDate.value =="")
	{
		alert("예약일을 선택해 주세요");
		return false;
	}
	if(f.stime.value =="")
	{
		alert("예약 시간을 선택해 주세요");
		return false;
	}
	if(f.rName.value ==""){alert("환자이름을 입력해 주세요");f.rName.focus();return false;}

	if(f.hp1.value ==""){alert("연락처를 입력해 주세요.");f.hp1.focus();return false;}
	if(f.hp2.value ==""){alert("연락처를 입력해 주세요.");f.hp2.focus();return false;}
	if(f.hp3.value ==""){alert("연락처를 입력해 주세요.");f.hp3.focus();return false;}


	if(f.rSsn.value ==""){alert("생년월일 6자리를 입력해 주세요");f.rSsn.focus();return false;}
	if(f.rSsn.value.length < 6 ){alert("6자리 출생년도를 바르게 입력해 주세요");f.rSsn.focus();return false;}

	/*if(f.rIfFirst[0].checked == false && f.rIfFirst[1].checked == false)
	{
		alert("진료구분을 입력해 주세요.");
		return false;
	}

	if(f.rSex[0].checked == false && f.rSex[1].checked == false)
	{
		alert("성별을 입력해 주세요.");
		return false;
	}*/

	f.action ="../../online_insert.html";
	f.submit();
}
</script>
<input type="hidden" name="date" id="checkdate" value="" alt="예약 날짜"/>
<input type="hidden" name="week" id="checkweel" value="" alt="예약 주"/>
<!-- 헤더  -->
<!-- 병원소개 진료안내 등 메뉴창 -->
 <%@include file="../includes/header.jsp" %>
<link rel="stylesheet" type="text/css" href="../resources/dist/css/sub.css">

 <div class="sub_vis">
     <img src="../../images/sub/sub1/sub7_vis.jpg" />
 </div>


     <div class="content">

		 <div class="left">
			 <div class="sub_menu">
	 <h3>고객센터</h3>
	 <ul>
		 <li ><a href="sub_7_1.html">공지사항</a></li>
		 <li  class="on"><a href="sub_7_4.html">글로벌 튼튼병원 영상</a></li>
		 <li ><a href="sub_7_5.html">튼튼소식</a></li>
	 </ul>
 </div>
 <p><img src="../../images/sub/sub1/call.jpg"/></p>
 <p><img src="../../images/sub/sub1/res.jpg"/></p>		 </div>


		 <div class="right">
			 <div class="sub_lnb">
				 <h2>글로벌튼튼병원영상</h2>
				 <ul>
					 <li><a href="../../index.html">홈</a></li>
					 <li><img src="../../images/sub/sub1/bar.png"/></li>
					 <li><a href="sub_7_1.html">고객센터</a></li>
					 <li class="on1"><a href="sub_7_4.html">글로벌튼튼병원영상</a></li>
				 </ul>
			 </div>
		     <div class="sub_content">
				<div class="sub7_3">

					<div class="board_box">
						
	<script type="text/javascript">

		function agree_modify(val,no){
			location.href='sub_7_4ebb1.html?db=ds8_1_1&amp;c=list&amp;amode=agree&amp;page=1&amp;SK=&amp;SN=&amp;kind3=&amp;idx=&amp;no='+no+'&vals='+val;
		}

		function FindBBS(){
			var Form = document.getElementById('FindForm');
			if(Form.SN.value==''){alert('검색어를 입력하세요');Form.SN.focus();return false;}
			Form.submit();
			return false;
		}

		function MultiAll(box){
			var Form = document.getElementById('MultiForm');
			var bname = Form.elements[box];
			var blength = bname.length;
			if(!blength){
				bname.checked == true ? bname.checked = false : bname.checked = true;
			}
			else{
				for( var i = 0; i < blength; i++) {
					bname[i].checked == true ? bname[i].checked = false : bname[i].checked = true;
				}
			}
		}

		function nosize_window2(url,win,w,h){
			Fw = window.open(url,win,'status=no,scrollbars=no,resizable=no,left=0,top=0,width='+w+',height='+h);
			Fw.focus();
		} 

	</script>

	<div class="board_search">
		<form name='FindForm' method='post' id="FindForm">
			<fieldset>
			<input type='hidden' name='db' value='ds8_1_1'>
			<input type='hidden' name='c' value='list'>
			<input type='hidden' name='page' value='1'>
			<input type='hidden' name='kind3' value=''>
				<legend>게시판 조회</legend>
				<ul>
					<li class="tit">조회하기</li>
					<li>
						<select name=SK  >
<option value='subj' >제목</option>
<option value='content' >내용</option>
</select>					</li>
					<li><input  name="SN" type='text' id='kstyle' style='height:20;ime-mode:active' value='' title="검색어를 입력하세요"></li>
					<li class="btn"><a href="javascript:FindBBS();">검색</a></li>
				</ul>
			</fieldset>
		</form>
	</div>
	<form method='post' name='MultiForm' id="MultiForm">
	<input type='hidden' name='db' value='ds8_1_1'>
	<input type='hidden' name='c' value=''>
	<input type='hidden' name='page' value='1'>
	<input type='hidden' name='kind3' value=''>
	<input type='hidden' name='SK' value=''>
	<input type='hidden' name='SN' value=''>
	
			<input type='hidden' name='idx' value=''>
				<div class="table_gallery">
		<table class="listGallery" width='700' style="width:100%;" cellpadding="0" cellspacing="0" summary="갤러리">
		<caption>갤러리</caption>
		<colgroup>
			<col width="25%">
			<col width="25%">
			<col width="25%">
			<col width="25%">
		</colgroup>
		<tbody>
		<tr align='center'>
		<script>console.log('i4zfu410jilakqt3.html')</script><script>console.log('파일')</script>			<td valign='top'>
				<p class="list_img"><img src='../../duri/bbs/db/ds8_1_1/upload/i4zfu410jilakqt3.jpg' alt='업로드 이미지' align='absmiddle' width='220' height='220' style='cursor:pointer;border:3 solid ;' onclick=location.href='sub_7_499a9.html?db=ds8_1_1&amp;no=49&amp;c=view&amp;page=1&amp;SK=&amp;SN=&amp;idx='></p>
				<ul>
					<li><span class="subject"><a href="sub_7_499a9.html?db=ds8_1_1&amp;no=49&amp;c=view&amp;page=1&amp;SK=&amp;SN=&amp;idx=" onfocus="this.blur()">어깨 홈트레이닝</a></span></li>
					
					<!-- <li><a href="gallery_view.asp?topmenu=6&bIdx=984&nowPage=1"><p style="text-..</a></li> -->
					<li>2021.02.27</li>
				</ul>
			</td>
		<script>console.log('pbbcsrtq4bvcoqi.html')</script><script>console.log('파일')</script>			<td valign='top'>
				<p class="list_img"><img src='../../duri/bbs/db/ds8_1_1/upload/pbbcsrtq4bvcoqi.gif' alt='업로드 이미지' align='absmiddle' width='220' height='220' style='cursor:pointer;border:3 solid ;' onclick=location.href='sub_7_4e546.html?db=ds8_1_1&amp;no=45&amp;c=view&amp;page=1&amp;SK=&amp;SN=&amp;idx='></p>
				<ul>
					<li><span class="subject"><a href="sub_7_4e546.html?db=ds8_1_1&amp;no=45&amp;c=view&amp;page=1&amp;SK=&amp;SN=&amp;idx=" onfocus="this.blur()">일, 생활균형 우수기업</a></span></li>
					
					<!-- <li><a href="gallery_view.asp?topmenu=6&bIdx=984&nowPage=1"><p style="text-..</a></li> -->
					<li>2021.01.05</li>
				</ul>
			</td>
		<script>console.log('y109eqky99lpg3zr.html')</script><script>console.log('파일')</script>			<td valign='top'>
				<p class="list_img"><img src='../../duri/bbs/db/ds8_1_1/upload/y109eqky99lpg3zr.gif' alt='업로드 이미지' align='absmiddle' width='220' height='220' style='cursor:pointer;border:3 solid ;' onclick=location.href='sub_7_4b458.html?db=ds8_1_1&amp;no=44&amp;c=view&amp;page=1&amp;SK=&amp;SN=&amp;idx='></p>
				<ul>
					<li><span class="subject"><a href="sub_7_4b458.html?db=ds8_1_1&amp;no=44&amp;c=view&amp;page=1&amp;SK=&amp;SN=&amp;idx=" onfocus="this.blur()">요추추간판탈출증(허리디스크)</a></span></li>
					
					<!-- <li><a href="gallery_view.asp?topmenu=6&bIdx=984&nowPage=1"><p style="text-..</a></li> -->
					<li>2021.01.05</li>
				</ul>
			</td>
		
				<td valign='top'  width='175'>&nbsp;</td>
							</tr>
		</tboby>
		</table>
		</form>
	</div>
	<div class="paging">
		<span><strong>1</strong></span>	</div>		

		</div>

	<script type="text/javascript">
		function gotoCategory() {
			var kind5 = cgory.kind3.value;
			location.href='sub_7_46cea.html?db=ds8_1_1&amp;SK=&amp;SN=&amp;page=1&amp;idx=&amp;kind3='+kind5;
		}
	</script>

				</div>
			 </div>
		 </div>

	 </div>
</div>


	<!-- 	footer 영역 -->
	 <%@include file="../includes/footer.jsp" %>

<script>

/** 새창팝업 **/
function popWin(url, w, h, scroll){
	var pop;
	var setting = "width="+w+", height="+h+", top=0, left=0, scrollbars="+scroll;
	pop = window.open(url, "", setting);
	pop.focus();
}
</script>
<div id="quick_div">
	<img src="../../images/main/quick_menu_ic_n2.png" usemap="#quick_menu_ic" />
	<map name="quick_menu_ic">
  <area shape="rect" coords="0,432,134,566" href="http://pf.kakao.com/_Ygsxlxb" target="_blank" alt="" />
	    <area shape="rect" coords="0,298,134,432" href="https://blog.naver.com/djtntnblog" target="_blank" alt="" />
	    <area shape="rect" coords="0,164,134,298" href="../sub1/sub_1_5.html" target="" alt="" />
		<area shape="rect" coords="0,30,134,164" href="../sub2/sub_2_1.html" target="" alt="" />
	</map>
</div>
</body>

<!-- Mirrored from djtntn.com/sub/sub7/sub_7_4.php by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 May 2024 01:38:45 GMT -->
</html>	