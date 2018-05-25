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
			MyMenu <span class="caret"></span>
		</button>


		<ul class="dropdown-menu dropdown-menu-right" role="menu"
			aria-labelledby="dropdownMenu2">
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="myBoardForm.do?writer=${writer }">MyBoard</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="myCommentForm.do?writer=${writer }">MyComment</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="myMemberForm.do?writer=${writer }">MyAccount</a></li>
			<c:if test="${writer==admin }">
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="adminForm.do?writer=${writer }">Admin</a></li>
			</c:if>
			<li class="divider"></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="logout.do">Logout</a></li>
		</ul>
	</div>
	<br>
	<div id="wrap" align="center">
		<h1>MyAccount</h1>
		<form name="frm" method="post" action="myJoin.do">
			<input type="hidden" name="writer" value=${member.writer }> <input
				type="hidden" name="mId" value=${member.mId }> <input
				type="hidden" name="joinDate"
				<fmt:formatDate value="${member.joinDate }" pattern="yyyy-MM-dd" />>
			<table>
				<tr>
					<th>* ID</th>
					<td>${member.writer }(수정 불가능 )</td>
				</tr>

				<tr>
					<th>* NAME</th>
					<td><input type="text" class="form-control" name="name"
						value=${member.name }></td>
				</tr>


				<tr>
					<th>* PW</th>
					<td><input type="password" class="form-control" name="pw"></td>
				</tr>

				<tr>
					<th>E-MAIL</th>
					<td><input type="text" name="email" class="form-control"
						value=${member.email }></td>
				</tr>

				<tr>
					<th>* PHONE</th>
					<td><input type="text" name="phone" class="form-control"
						value=${member.phone }></td>
				</tr>

			</table>
			<br> <input type="submit" class="btn btn-default" value="Modify">
			<input class="btn btn-default" type="reset" value="Reset"> <input
				type="button" value="Mypage" class="btn btn-default"
				onclick="location.href='myPage.do'">
		</form>
	</div>
</body>
</html>