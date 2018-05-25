<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="layout/header.jsp"></jsp:include>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="dropdown" style="text-align:right;">
		<button class="btn btn-default dropdown-toggle" type="button"
			id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
			MyMenu <span class="caret"></span>
		</button>
		

		<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu2">
			<li role="presentation"><a role="menuitem" tabindex="-1" href="myBoardForm.do?writer=${writer }">MyBoard</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1" href="myCommentForm.do?writer=${writer }">MyComment</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1" href="myMemberForm.do?writer=${writer }">MyAccount</a></li>
			<c:if test="${writer==admin}">
				<li role="presentation"><a role="menuitem" tabindex="-1" href="adminForm.do?writer=${writer }">Admin</a></li>
			</c:if>
			<li class="divider"></li>
			<li role="presentation"><a role="menuitem" tabindex="-1" href="logout.do">Logout</a></li>
		</ul>
	</div>
	<h3 align="center">${writer}`spage</h3>
	<br>
</body>
</html>