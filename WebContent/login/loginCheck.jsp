<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String uId = request.getParameter("uId");
	String uPw = request.getParameter("uPw");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url,"team1_202402M","java");
	Statement stmt = conn.createStatement();
	
	String sql = " select mem_id from member " +
					"where mem_id = '" +uId +"'"
					+ " and mem_pw = '" + uPw + "'";
	
	
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next()) {
		
	
	
%>
	{
		"rst" = "ok"
	}
<%


}else {
%>
	{
		"rst" = "sorry"
	}


<%
}
	rs.close();
	conn.close();
	stmt.close();


%>
