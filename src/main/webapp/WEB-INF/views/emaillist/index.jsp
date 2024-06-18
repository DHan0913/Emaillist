<%@ page import="himedia.vo.EmailVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일링 리스트:메인</title>
<link type="text/css" 
	rel="stylesheet" 
	href="<c:url value = "/css/list.css" />" />
<script>
function delete_item(event, frm) {
	event.preventDefault();
	
	let choice = confirm("메일을 삭제하시겠습니까?");
	if (choice) {
		frm.submit();
	}
}
</script>
</head>
<body>
	<h1>메일링 리스트</h1>
	<h3>Model 2 방식</h3>
	<!-- 리스트 -->
	<c:forEach items="${list }" var="vo" varStatus="status">
	<!-- vo 객체의 getter를 이용, 리스트를 표시 -->
	<table border="1" cellpadding="5" cellspacing="2">
		<tr>
			<th>성</th>
			<td>${vo.lastName }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${vo.firstName }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${vo.email } </td>
		</tr>
		<tr class="toolbar">
			<td colspan="2">
			<form method="POST"
				action="<c:url value = "/emaillist/delete.jsp" />"
				onsubmit="delete_item(event, this)">
				<input type="hidden"
					name="a" value="delete" />
				<input type="hidden" 
					name="no" 
					value="${vo.no }">
				<button type="submit">삭제</button>	
			</form>
			</td>
		</tr>
	</table>
	</c:forEach>
	<br />

	<!-- /End -->
	<p>
	<!-- ContextPath를 받아와서 form.jsp에 링크 -->
		<a href="<c:url value = "/el?a=form" />">추가 이메일 등록</a>
	</p>

</body>
</html>