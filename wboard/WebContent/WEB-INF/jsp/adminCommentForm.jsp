<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div id="wrap" align="center">
		<h1>Admin Page</h1>
		<table class="table table-hover">
			<tr>
				<td colspan="5" stlye="border:white; text-align:right"><a
					href="board_y.do">Board List</a></td>
			</tr>
			<tr>
				<th class="info">NO.</th>
				<th class="info">TITLE</th>
				<th class="info">WRITER</th>
				<th class="info">DATE</th>
			</tr>
			<c:forEach var="comment" items="${commentList }">
				<tr class="record">
					<td>${comment.cId }</td>
					<td><a href="boardView_y.do?bId=${comment.bId }">
							${comment.comment } </a></td>
					<td>${comment.writer }</td>
					<td><fmt:formatDate value="${comment.regDate }" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="wrap" align="center">
		<table>
			<tr>
				<td colspan="5">
					<c:if test="${start != 1 }">
						<a href="myCommentForm.do?page=1">[FIRST]</a>
						<a href="myCommentForm.do?page=${start-1 }">[BEFORE]</a>
					</c:if>
					
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:choose>
							<c:when test="${i == current }">
								[${i }]
							</c:when>
							<c:otherwise>
								<a href="myCommentForm.do?page=${i }">[${i }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${end != last }">
						<a href="myCommentForm.do?page=${end+1 }">[NEXT]</a>
						<a href="myCommentForm.do?page=${last }">[END]</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>