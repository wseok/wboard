<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="layout/header.jsp"></jsp:include>
</head>
<body>

	<div id="wrap" align="center">
		<h1>Board List</h1>
		<form action="search_n.do" method="post">
			<table align="right">
				<tr>
					<td><select name="mode" class="btn btn-default">
							<option value=1 selected="selected">TITLE</option>
							<option value=1>CONTENTS</option>
							<option value=1>WRITER</option>
					</select></td>
					<td><input type="text" name="keyword"></td>
					<td><input type="submit" value="Serch"></td>
				</tr>
			</table>
		</form>
		<table class="table table-hover">
			<tr>
				<td colspan="5" stlye="border:white; text-align:right"><a
					href="boardWriteForm_n.do">Write Board</a></td>
			</tr>
			<tr>
				<th>NO.</th>
				<th>TITLE</th>
				<th>WRITER</th>
				<th>DATE</th>
				<th>HIT</th>
			</tr>
			<c:forEach var="board" items="${boardList }">
				<tr class="record">
					<td>${board.bId }</td>
					<td><a href="boardView_n.do?bId=${board.bId }">
							${board.title } </a></td>
					<td>${board.writer }</td>
					<td><fmt:formatDate value="${board.regDate }" /></td>
					<td>${board.hit }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="wrap" align="center">
		<ul class="pagination">
			
			<c:if test="${start != 1 && start > 0}">
				<li><a href="board_y.do?page=${start-1 }">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${start }" end="${end }" var="i">
				<c:choose>
					<c:when test="${i == current }">
						<li class="active"><a href="#">${i}</a></li>
					</c:when>
					<c:when test="${i == 0 }">
						<li class="disabled"><a href="#">1</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="board_y.do?page=${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${end != last }">
				<li><a href="board_y.do?page=${end+1 }">&raquo;</a></li>		
			</c:if>
		</ul>
	</div>
</body>
</html>