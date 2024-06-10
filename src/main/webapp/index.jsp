<%@page import="java.util.List"%>
<%@page import="himedia.dao.EmaillistDaoOracleImpl"%>
<%@page import="himedia.dao.EmaillistDao"%>
<%@page import="java.sql.*" %>
<%@page import="himedia.vo.EmailVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메일링 리스트: 메인</title>
</head>
<body>
    <h1>메일링 리스트</h1>
    <h3>Model 1 방식</h3>

<%
// DB 접속 정보를 컨텍스트 파라미터로부터 받아오기
ServletContext context = getServletContext();
String dbuser = context.getInitParameter("dbuser");
String dbpass = context.getInitParameter("dbpass");
String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
    
EmaillistDao dao = new EmaillistDaoOracleImpl(dbuser, dbpass);
List<EmailVo> list = dao.getList();

for (EmailVo vo: list) {
%>
    <!-- 리스트 -->
    <!-- vo 객체의 getter를 이용, 리스트를 표시 -->
    <table border="1" cellpadding="5" cellspacing="2">
        <tr>
            <th>성</th>
            <td><%= vo.getLastName() %></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><%= vo.getFirstName() %></td>
        </tr>
        <tr>
            <th>이메일</th>
            <td><%= vo.getEmail() %></td>
        </tr>
        <tr>
            <td colspan="2">
                <!-- 삭제 버튼 -->
                <form action="<%= request.getContextPath() %>/delete.jsp" method="POST">
                    <!-- 삭제할 레코드의 이메일 값을 hidden input으로 전달 -->
                    <input type="hidden" name="email" value="<%= vo.getEmail() %>">
                    <input type="submit" value="삭제">
                </form>
            </td>
        </tr>
    </table>
    <br />
    <!-- /End -->
<%
}
%>
    <p>
        <!-- ContextPath를 받아와서 form.jsp에 링크 -->
        <a href="<%= request.getContextPath() %>/form.jsp">추가 이메일 등록</a>
    </p>
</body>
</html>
