<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="layout/header.jsp"></jsp:include>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="dropdown" style="text-align: right;">
		<button class="btn btn-default dropdown-toggle" type="button"
			id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
			AdminMenu <span class="caret"></span>
		</button>


		<ul class="dropdown-menu dropdown-menu-right" role="menu"
			aria-labelledby="dropdownMenu2">
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="myBoardForm.do?writer=${writer }">MyBoard</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="myCommentForm.do?writer=${writer }">MyComment</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="myMemberForm.do?writer=${writer }">MyAccount</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="adminForm.do?writer=${writer }">Admin</a></li>
			<li class="divider"></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="logout.do">Logout</a></li>
		</ul>
	</div>
	<h3 align="right">${writer}`spage</h3>
	<br>
	<div id="wrap" align="center">
		<h1>AdminAccount</h1>
		<input type="hidden" name="writer" value=${member.writer }> <input
			type="hidden" name="mId" value=${member.mId }> <input
			type="hidden" name="joinDate"
			<fmt:formatDate value="${member.joinDate }"
							pattern="yyyy-MM-dd" />>
		<table>
			<tr>
				<th>* ID</th>
				<td class="form-control">${member.writer }( Do not modify! )</td>
			</tr>

			<tr>
				<th>* NAME</th>
				<td class="form-control">${member.name }</td>
			</tr>

			<tr>
				<th>E-MAIL</th>
				<td class="form-control">${member.email }</td>
			</tr>

			<tr>
				<th>* PHONE</th>
				<td class="form-control">${member.phone }</td>
			</tr>

		</table>
		<br>
		<input type="button" value="ADMIN" class="btn btn-default"
			onclick="location.href='adminForm.do?writer=${member.writer}'">
	</div>
</body>
</html>