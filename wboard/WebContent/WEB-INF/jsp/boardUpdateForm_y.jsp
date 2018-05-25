<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="layout/header.jsp"></jsp:include>
</head>
<body>

 <ul class="dropdown-menu" role="menu" align="right">
	<li><a href="myBoardForm.do?writer=${writer }">MyBoard</a></li>
	<li><a href="myCommentForm.do?writer=${writer }">MyComment</a></li>
	<li><a href="myMemberForm.do?writer=${writer }">MyAccount</a></li>
	<li><a href="adminForm.do?writer=${writer }">Admin</a></li>
	<li class="divider"></li>
	<li><a href="logout.do">Logout</a></li>
</ul>
	<div id="wrap" align="center">
		<h1>Update Board</h1>
		<form name="frm" method="post" action="boardUpdate_y.do"><input
				type="hidden" name="bId" value="${board.bId}"><input
				type="hidden" name="writer" value="${writer}">
			<table>
				<tr>
					<th>WRITER</th>
					<td>${writer } 
					</td>
				</tr>
				<tr>
					<th>TITLE</th>
					<td><input class="form-control" type="text" size="70" name="title"
						value="${board.title}"></td>
				</tr>
				<tr>
					<th>CONTENT</th>
					<td><textarea class="form-control" cols="70" rows="15" name="content">${board.content}</textarea></td>
				</tr>
			</table>
			<br>
			<br> <input type="submit" value="Update"
				> <input type="reset"
				value="Reset"> <input type="button" value="Board"
				onclick="location.href='board_y.do'">
		</form>
	</div>
</body>
</html>