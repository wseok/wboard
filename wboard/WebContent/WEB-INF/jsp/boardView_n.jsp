<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="layout/header.jsp"></jsp:include>
</head>
<body>

	<div id="wrap" align="center">
		<h1>${board.bId }` Board</h1>
		<table class="table table-bordered" >
			<tr>
				<th>WRITER</th>
				<td colspan="3">${board.writer}</td>
			
			</tr>
			<tr>
				<th>DATE</th>
				<td><fmt:formatDate value="${board.regDate}" /></td>
				<th>HIT</th>
				<td>${board.hit }</td>
			</tr>
			<tr>
				<th>TITLE</th>
				<td colspan="3">${board.title }</td>
			</tr>
			<tr>
				<th>CONTENTS</th>
				<td colspan="3" >${board.content }</td>
				
			</tr>
		</table>
		 <input type="button" value="Modify"
			class="btn btn-default" onclick="location.href='boardUpdateForm_n.do?bId=${board.bId}'">
		<input type="button" value="Delete"
			class="btn btn-default" onclick="location.href='boardDelete_n.do?bId=${board.bId}'">
		<input type="button" value="Board"
			class="btn btn-default" onclick="location.href='board_n.do'"> <input type="button"
			value="WriteBoard" class="btn btn-default" onclick="location.href='boardWriteForm_n.do'">


		<form style="margin-top:100px">
			<input type="hidden" name="boardNum" value="${board.bId}" >
			<table width="900px" class="table table-hover">
				<tr>
					<td align="center" width="70%">COMMENT</td>
					<td align="center" width="30%">WRITER</td>
					
				</tr>
				<c:forEach items="${commentList }" var="comment">
					<tr>
						<td>${comment.cId }:${comment.comment }</td>
						<td>${comment.writer }</td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>

</body>
</html>