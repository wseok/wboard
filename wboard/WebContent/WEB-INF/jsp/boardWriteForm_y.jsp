<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="layout/header.jsp"></jsp:include>

<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
			<li class="divider"></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="logout.do">Logout</a></li>
		</ul>
	</div>
	<div id="wrap" align="center">
		<h1>Write Board</h1>
		<form name="frm" method="post" action="boardWrite_y.do">
			
			<input
				type="hidden" name="writer" value="${writer}">
			<table class="table table-bordered">
				<tr>
					<th>* WRITER</th>
					<td>${writer } * 수정불가능
					</td>
				</tr>
				<tr>
					<th>* TITLE</th>
					<td><input class="form-control" type="text" size="70"
						name="title"></td>
				</tr>
				
				<tr>
					<th>CONTENT</th>
					<td><textarea class="form-control" cols="70" rows="15"
							name="content"> </textarea></td>
				</tr>

			</table>
			<br> <br> <input type="submit" class="btn btn-default"
				value="Write"> <input type="reset" class="btn btn-default"
				value="Reset"> <input type="button" class="btn btn-default"
				value="Board" onclick="location.href='board_y.do'">
		</form>
	</div>

</body>
</html>