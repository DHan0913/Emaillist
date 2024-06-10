<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
// 데이터베이스 접속 정보 확인
ServletContext context = getServletContext();
String dbuser = context.getInitParameter("dbuser");
String dbpass = context.getInitParameter("dbpass");

// 폼 입력 데이터
String noToDelete = request.getParameter("no"); // 삭제할 no 값

String dburl = "jdbc:oracle:thin:@localhost:1521:xe";

try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpass);
     PreparedStatement pstmt = conn.prepareStatement("DELETE FROM emaillist WHERE no = ?")) {
    
    // 데이터 바인딩
    pstmt.setString(1, noToDelete); // 첫 번째 ? 자리에 noToDelete 값을 설정

    int deletedCount = pstmt.executeUpdate(); // 영향 받은 레코드 카운트

    if (deletedCount >= 1) { // DELETE 성공
        // 다른 페이지로 리다이렉트 : 3xx
        response.sendRedirect(request.getContextPath());
    } else {
        %>
        <h1>Error</h1>
        <p>데이터 삭제 중 오류가 발생했습니다. 해당 번호의 데이터가 존재하지 않습니다.</p>
        <%
    }
} catch (Exception e) {
    e.printStackTrace(); // 예외를 콘솔에 출력
    %>
    <h1>Error</h1>
    <p>데이터 삭제 중 오류가 발생했습니다.</p>
    <%
}
%>
