<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   String uId = request.getParameter("userId");

   //JDBC
   //1. 연결할 DB가 설치되어 있어야 함 
   //2. 자바와 DB를 연결하기 위한 라이브러리 필요(ojdbc.jar)
   //3. Class.forName()을 이용해 드라이버 로딩
   Class.forName("oracle.jdbc.driver.OracleDriver");
   //4. DriverManager를 이용해 Connection객체 생성
   String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
   Connection conn = DriverManager.getConnection(url, "team1_202402M", "java");
   //5. sql구문 실행을 위한 Statement객체 생성
   Statement stmt = conn.createStatement();
   
   String sql = "select ns_id from nurse where"
         + " ns_id = '" + uId + "'";
   ResultSet rs = stmt.executeQuery(sql);
   
   //rs객체의 next()에서 반환하는 정보를 응답 결과 생성하기
   if(rs.next()) {
      //아이디 존재하므로 사용불가 응답 생성하기
%>
      {
         "rst":"fail",
         "msg":"사용불가"
      }
<%
   } else {
      //아이디 미존재하므로 사용가능 응답 생성하기
%>
      {
         "rst":"ok",
         "msg":"사용가능"
      }
<%
   }

   rs.close();
   stmt.close();
   conn.close();

%>