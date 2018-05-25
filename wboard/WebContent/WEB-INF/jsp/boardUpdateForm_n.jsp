<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="layout/header.jsp"></jsp:include>
</head>
<body>
<h4 align="right"><a href="loginForm.do">Login</a>
<a href="myPage.do">Mypage</a>
<a href="joinForm.do">Join</a>
<a href="board_n.do">Board</a></h4>
	<div id="wrap" align="center">
		<h1>Update Board</h1>
		<form name="frm" method="post" action="boardUpdate_n.do"><input
				type="hidden" name="bId" value="${board.bId}">
			<table>
				<tr>
					<th>WRITER</th>
					<td>${board.writer} </td>
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
			<br> <input type="submit" value="Update"> <input type="reset"
				value="Reset"> <input type="button" value="Board"
				onclick="location.href='board_n.do'">
		</form>
	</div>
</body>
</html>