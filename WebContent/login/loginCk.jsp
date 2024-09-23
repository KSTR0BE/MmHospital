<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String uId = request.getParameter("userId"); // set해준 userId를 getparameter로 받아오기
	// uId 라는 객체 생성
	
	//JDBC
	
	//1. 연결할 DB가 설치되어 있어야 함
	//2. 자바와 DB를 연결하기 위한 라이브러리 필요(ojdbc.jar)
	//3. Class.forName()을 이용해 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//4. DriverManager를 이용해 Connection 객체 생성
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url, "team1_202402M", "java");
	//5. sql구문 실행을 위한 Statement 객체 생성
	Statement stmt = conn.createStatement();

	//stmt 객체로 db 접근하자
	String sql= "	select mem_id from member  	" +
			"		where mem_id = '" + uId + "'";
// 	select mem_id from member
// 	where mem_id = '요청받은 정보를 대입'
	ResultSet rs =  stmt.executeQuery(sql);

// 	if(rs.equals("")) {

//rs객체의 next()에서 반환하는 정보를 조건으로 응답 결과 생성하기
	if(rs.next()) {
		// 아이디와 비밀번호가 일치하므로 ok 응답 생성하기
// 		{"key":"value"}
		
%>
		{
			"rst" : "fail" ,
			"msg" : "사용불가"
		}
<%
// 	}else if(rs.next() == rs.equals("")) {
// 		// 아이디가 존재하지 않으므로 사용가능 응답 생성하기 -> json의 형태로 작성할 것 임

// <!-- 	{ -->
// <!-- 		"rst" : "notok", -->
// <!-- 		"msg" : "공백열이 포함되었습니다 다시 입력하세요" -->
// <!-- 	} -->

	}else {
	// 아이디와 비밀번호가 일치하지않음 -> fail	
	
%>
		{
			"rst" : "ok" ,
			"msg" : "사용가능"
		}
<%	
	}
	rs.close();
	stmt.close();
	conn.close();
%>
