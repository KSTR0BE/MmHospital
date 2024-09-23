<%@page import="kr.or.ddit.nurse.vo.NurDiagnosisListVO"%>
<%@page import="kr.or.ddit.appointMent.vo.DiagnosisVO"%>
<%@page import="kr.or.ddit.appointMent.vo.AppointMentVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="../includes/headcss.jsp"%>
<%@include file="../includes/header.jsp"%>
<style>
h2{
	border-bottom: 3px solid lightgray;

}
#tbtb {
    margin: 40px;
    border: 4px double #00A796;
    border-radius: 10px;
    padding : 30px;
}
#modifyBtn {
    font-size : 14pt;
    width: 300px;
    height: 50px;
    border: 1px solid black;
    background-color: #00A796;
    align-content: center;
    color: white;
    border-radius: 10px;
}
#mypage{
    margin: 40px;
    border: 4px double #00A796;
    padding: 40px;
    display: flex;
    justify-content: center;
    border-radius: 10px;
}
#modify {
    text-align: center;
    margin: 50px;
    font-size: x-large;
    padding: 10px;
}
#table-box {
	margin: 10px;
    width: 100%;
    height: 500px;
    border: 4px double #00A796;
    overflow-y: scroll;
    font-size: 20px;
}
#search {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
table {
    border: 4px solid gray;
    border-radius: 20px;
}
th {
    background-color: lightgray;
    color: black;
}
th, tr, td{
    border: 2px solid gray;
    height: 10px;
}
tr, td{
    text-align: center;
}
.navigation-button {
    background-color: #00A796;
    color: white;
    border: none;
    padding: 10px;
    cursor: pointer;
    border-radius: 5px;
}
 .form-group {
            margin-top: 20px;
            text-align: center;
            
        }
#aa {
	 width: 30px;
	 height: 30px;

}
</style>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker.js/1.8.18/datepicker.min.js"></script>
<%
List<DiagnosisVO> dgList = (List<DiagnosisVO>)request.getAttribute("DgList");

String selectedMonth = request.getParameter("month");
if (selectedMonth == null) {
    selectedMonth = java.time.LocalDate.now().toString().substring(0, 7); 
}
List<DiagnosisVO> filteredList = new ArrayList<>();

if (selectedMonth != null && !selectedMonth.isEmpty()) {
    for (DiagnosisVO dgVO : dgList) {
        if (dgVO.getDg_dt().substring(0, 7).equals(selectedMonth)) {
            filteredList.add(dgVO);
        }
    }
} else {
    filteredList = dgList;
}

String displayedMonth = selectedMonth.replace("-", "년 ") + "월";
%>
<%
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
%>
<script type="text/javascript">
    alert(msg);
</script>
<%
    }
%>
<div id="mypage">
    <div id="modify">
        <h2>진료 기록</h2>
        <br>
        <div id="search">
            <button type="button" class="navigation-button" onclick="navigateMonth(-1)">이전달</button>
            <span style="margin: 0 20px; font-size: 16pt;"><%= displayedMonth %></span>
            <button type="button" class="navigation-button" onclick="navigateMonth(1)">다음달</button>
            <form action="<%=request.getContextPath()%>/AppointDataSearch.do" method="get" id="monthForm">
                <input type="hidden" name="month" value="<%= selectedMonth %>" id="selectedMonth"/>
            </form>
        </div>
        <div>
		<form method="post">
			<input type="hidden" name ="memno" value="<%=mv.getMem_no()%>">
		</form>
	</div>
        <div id="table-box">
            <table>
                <tr>
                    <th>진료 제목</th>
                    <th>진료 내용</th>
                    <th>처방 약</th>
                    <th>병 명</th>
                    <th>진료 과목</th>
                    <th>담당 의사</th>
                    <th>진료 날짜</th>
                    <th>진료 확인서</th>
                </tr>
                <%
                    if (filteredList.size() == 0) {
                %>
                <tr>
                    <td colspan="7">진료기록 없음</td>
                </tr>
                <%
                    } else {
                        for (DiagnosisVO dgVO : filteredList) {
                %>
                <tr>
                    <td><%=dgVO.getDg_tit()%></td>
                    <td><%=dgVO.getDg_con()%></td>
                    <td><%=dgVO.getMd_nm()%></td>
                    <td><%=dgVO.getDs_min()%></td>
                    <td><%=dgVO.getCl_nm()%></td>
                    <td><%=dgVO.getDt_nm()%></td>
                    <td><%=dgVO.getDg_dt().substring(0,10) %></td>
                    <td><a href="<%=request.getContextPath()%>/DignosisList.do?memNo=<%=mv.getMem_no()%>"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMwAAADACAMAAAB/Pny7AAAAaVBMVEX///8AAAD8/Pzw8PD39/d7e3v09PTNzc3Z2dnq6uofHx/j4+PBwcG1tbWpqamcnJyDg4NfX19kZGSRkZFqamp1dXVXV1cWFhaioqIsLCwQEBBPT0+7u7uJiYlvb28kJCQ/Pz9ISEgzMzNmJyVOAAAJiUlEQVR4nO1da7eiOgzVAhbk4RtFPQr+/x959ZwB6pgWaHaVOevuD3fd5cy0hKbJTpqGyaQ/4mA/tcJxGw6Y5g2YhVs7SX6wkt6nJWjgSZYoD6yT6NNSfMOXAVeUB7Zy9mlJJpNwMUfIct87m0/vHS87YUR5oDp8VNfkFrQsP9ivks/JsrghRXmg+PqQKCI/omW5o/qIlQ4dSPKN96uaWLiSZTr9Eu+VZcZ2kyas3mrVYqey3KV5o8sJ125lmU5z+S5ZZD7kuY77a1GWxXU/yPad3mQGZF+nX+TBIkuSRH7j/j/ZIsiLnv+4PL9DlrCfp1wtkjD2/CfDJHwvDuWh34Yr3rA23rXHg2zlXQ7dCHeJ5K7HIHPnVkB0x5NVFnU6CuGl3co6d2yhRdnxAAOC4O5A++pUGrEyz37bxkOGi4KO/eeSqPnmmLK4DNbyeGcWZ6fdeVyIzLT5j6vUZtDEGBLNF66kkaYNU9qGiV5WGYa9OTLQRkK2ZvCP0GSoT04M9GxjmHLDsjtRZhh658IIJAZDmjA1W0gDcUvx4U1kIFWD7DENT28GjnBvI/RKdoXogV9pJ9gixlehj/hzkPH0L9op0ARaa5XXsP05W2qlwe6aVCsLYL/UiLQEA5pN027PHOoFtJ7sCHxlky/NJBU4VA91AXmAmyPWsEE819CFsQXurWkWZn+AzdAg1XjPHWqCSBMUrlxkHjU8rUQtjc5fumHnGlsDMmiRJrx0lG+I6dlAdjOj1RimxX9DowiQDerRWrx3Fp4LmtIOSy9ooIkvn2LkMEnPuNPihJzwiGBoB3Lolfroh4d3mH+hqPqMppyAdEBEa5nqLmtxA5SplqRFO/H1TJIB5lpZhTbmRfkCj2acbL4h6PBc2TFpm3/acGercSYN6Ia7K2kns2pXPKyUn5mTtbOSu6bi6hkdYbY231e31JI5WQtaH5hqLMioTGH+T4fOOBIdkwqR8SyMT7rjoFFeWSk/r4BkjSTqW96m8SpizGOjZTN1zhKZEkopGjDnsQ6S9bUZUzUxWGIjaDLm5E1BMouGYnpKPgUddZKuhkc2KdU9Luo/VRzqEX32QB6fsFIB5ElZswaqddiiSXRI8duCMyLJxk/1c3tt9uEGP7UXZKzOGXFGDbiu/1Qqv+HTAWQOjWMwI2K8Y8PAWudfOCinSCmGy7EykhhvXpNM0f52Qjz9XwipOIBjziiKVNTGXlk2GF1WEKHNGUVmbrXetpLOkangBpTx4fByynOV9V5Xtgzi2V9A2eaSMR5VJJfXf9ga5gv7wSlQPo7z2iiC1Kx0+1MGePRXUGpxZIxHrXTjZtqf3NQgktEHw59Re7DWKa/9ycn+n5DFxgxhKL9VW0fFMru5LEIm7Bh0lhqu9ilKqAN59heQETtDGNPKxJAZDCCTGoypPrpnSDVjaPSvsmZUTEH4GauquU5QNQ5zxnhGBtASQeDBtgIqoOEwAOoEoOFmbQr1hnj2F6C5WV/W7KRkl7I+efc/04IyKE0809rmo4OCALq0nXOQSqXNqEiT88J0ICNNDqXtnQNwYJzJHABnHjI700Qvyro5OEcnjx85m1NQenuqvXDUKgKsGqQFmWzmDCioEZsH95Xk7QXNnGPKMnN8Ju2F922uWZmGeRD0AvJMgxefn6m1bhy+WryBVjTytIkXn5PnM3nDklVZAcf0CuiDYd4UHqW5++YFPR3Y58iDgDNVEljwZqDLc5dNiJSocwbAII3k/8wzzc7T5qdJcdsmJq+1cm8F0HUA7UaMVKKOSznTpZrclxWTZz5K7ZdUFG1tGGgQ6OKZE5ec+3SFlnIeoxQKwio0EvI+GP/YlK5quigvqU3Wwaqa6FsB/PNsTUm78tzNbRQYpZHkwgAcmaYlg2ol/Z+/EqC8pua6BuJwPqEr2tWMjB+miwzXb4k6fLyzP0TVBF37Nb0+vSfh43imqMgJL5BEg6b1h4tzzG9orgZi8gx0TY6rpCwd3eJu6mhKwOduOqrQSga73ESWsUyBpb8qNG8OFy5pbrbtHZxl6q624jLAoebC6Q2extApQQGszNPdpMbenzPcoEOm5qlk4DcgVyfaaQLNJS1sCQjNne/YAXPmnu7S4bTETfKAbprpEpYw8w2NubAZU5ovfc+DutusXRe4NELfC+QEWRvNpZkGyGzJJNY3A7kB9o3X2cwKp8+PPI2+mUIhuVxAew9YwRdQGsMN9zsXYC2Od+7TAAoqjY49P3AMGO4z/urZUHgJ3DeJqe/MKbOcyU87eiYpABIBsTC9watd65l417d92wNACy3MbdZuw82n2AxskgqUZlaZp5oPu+Nmbv7kXprOF9n/6unMrq8oUBpTL50/uEh9C70awgutW1YDuYAuUFNxW8h4pvWjYhaHi64OdiYAuUDSy/qUy0yG0cusfhTL9KtiSPIA0Hue+77VU7DJ0kSGYRjH9//IJM02AaQvMlCapBow77w85flqleencohD6QCOC4hh/VqdAGjT+pBcxwDeP+gOP/4laQyR5z8ojebO/juxA6aHo+rT4gTAaM3/AhpbKyyBFS7i3D+ucgNkJD2JWSQLAGTOZiJCY+7OPbCHRLME8qGTPNHms80A396LjJmOXigSz5hrfqM099WpOKLc0m+rZPtJC/zNyt4N9l+gfALA1KvXAHgL1Dv7XJaDP60zL5+zh5bSOGm4nVyqAfmWa7V+qe2zlCZw0m0tzpbrqk+2tVwtU+pwz1IaJBdQ4clsc6lMM1fbzUH7YbORSXNHJNNssbxU8ycuur+Wq0deQBrPWy1tGpQLvEA8Ppwh5TnNssMhy7L0LGUYR905NUvviYwIDE/3B33/vq33dGChAfhd0ozIeyJgKY2D/jcI2HrPEXz7kcCouAAb4/OeHPwqaWzjG2hlCgy20ozTQv8u72m7NrCbPFj8qrWxZjYj5QJ2+fmRcgFbCz1Kf2Mde45TGlsuMEpNs46kx8kFLKUZp7/5nwuMd21sbdpYI2k773kZpRWwlQZZQQyEnabtD79Jmlsyzn1jJw27k4AbWHpPdFccEOykKca5NJZcwEUHNghspKnGqWcTO2nGGds8YOE93bTHhGD42kA/yQnGYGlgXy1ygaHSlJ9+YCMG+htOQ3H30HznSwdeBz7nGMYFqk8/bgcGRdLjTAaoGLA2zjrL4NB/bdw0yMZi0ZcLjDPY/As912akJxx/o580Dr724wR9pIG2xXSJPv4G/ulvZ+jmAiM9dyLRtTYnR5+YdgOzND9fmfsPrNd/HCOeWzQAAAAASUVORK5CYII=" id="aa"> </a></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
        <div class="form-group">
						
						<div>
							<input type="button" onclick="location='<%=request.getContextPath()%>/MemberMypage.do'" id="backBtn" value="뒤로가기"
								style="font-size: large; width: 120px; height: 30px; background-color: #00A796; color: white;">
						</div>		
					</div>
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function navigateMonth(offset) {
    const monthInput = document.getElementById('selectedMonth');
    const currentMonth = new Date(monthInput.value + '-01');
    currentMonth.setMonth(currentMonth.getMonth() + offset);
    const newMonth = currentMonth.toISOString().substring(0, 7);
    monthInput.value = newMonth;
    document.getElementById('monthForm').submit();
}
</script>
</body>
<footer>
<%@include file="/includes/footer.jsp"%>
</footer>
</html>
