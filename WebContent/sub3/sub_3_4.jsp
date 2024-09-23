<%@page import="kr.or.ddit.appointMent.vo.AppointMentVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
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


#modifyBtn {
	font-size : 15pt;
	width: 300px;
	height: 50px;
	border: 1px solid black;
	background-color: #00A796;
	align-content: center;
	color: white;
	border-radius: 10px;
}

#mypage{
	margin: 30px;
	border: 4px double #00A796; /* 테두리 설정 */
    padding: 30px;
    display: flex;
    justify-content: center;
    border-radius: 10px;
    
}


#modify {
	text-align: center;
	margin: 50px;
	font-size: x-large;
	padding: 50px;
	
}
  /* 폼 스타일링 */
        #modify {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }
        
        #modify h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        #tbtb {
            margin-bottom: 20px;
        }

        #tbtb table {
            width: 100%;
            border-collapse: collapse;
        }

        #tbtb td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        #tbtb tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #tbtb tr:last-child td {
            border-bottom: none;
        }

        .form-group {
            text-align: center;
            margin-top: 20px;
        }

        .form-group input[type="button"] {
            font-size: large;
            width: 120px;
            height: 40px;
            background-color: #00A796;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-group input[type="button"]:hover {
            background-color: #007b63;
        }


</style>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker.js/1.8.18/datepicker.min.js"></script>
	<div id="mypage">
		
		<div id="modify">
				<h3>예약 정보가 없습니다</h3>
			<form method="post" id="modForm">
				<div id = "tbtb">
					<table>
						<tr>
							<td>예약 번호:<br><br></td>
							<td><br><br></td>
						</tr>
						<tr>
							<td>예약자명:<br><br></td>
							<td><br><br></td>
						</tr>
						<tr>
							<td>성별:<br><br></td>
							<td><br><br></td>
						</tr>
						<tr>
							<td>담당의사:<br><br></td>
							<td><br><br></td>
						</tr>
						<tr>
							<td>예약 날짜:<br><br></td>
							<td><br><br></td>
						</tr>
						<tr>
							<td>예약 시간:<br><br></td>
							<td><br><br></td>
						</tr>

					</table>
					<div class="form-group">
						<div>
							<input type="button" onclick="location='<%=request.getContextPath()%>/AppointInput.do'" id="appointBtn" value="예약하기"
								style="font-size: large; width: 120px; height: 30px; background-color: #00A796; color: white;">
						</div>
						<div>
							<input type="button" onclick="location='<%=request.getContextPath()%>/MemberMypage.do'" id="backBtn" value="뒤로가기"
								style="font-size: large; width: 120px; height: 30px; background-color: #00A796; color: white;">
						</div>		
					</div>
				</div>
			</form>
		</div>
	</div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</body>
<script>
	alert("예약정보가 없습니다.");

</script>
<footer>
<%@include file="/includes/footer.jsp"%>
</footer>
</html>