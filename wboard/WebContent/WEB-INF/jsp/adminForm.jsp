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
		<form class="navbar-form navbar-center" action="adminSearch.do" method="post">
			<table align="right">
				<tr>
					<td><select name="mode" class="btn btn-default">
							<option value=1 selected="selected">ID</option>
							<option value=1>NAME</option>
							<option value=1>PHONE</option>
					</select></td>
					<td><input type="text" class="form-control" name="keyword"></td>
					<td><input type="submit" class="btn btn-default" value="Search"></td>
				</tr>
			</table>
		</form>
		<table class="table table-hover">
			<tr>
				<td colspan="5" style="border:white; text-align:right"><a
					href="boardWriteForm_y.do">Write Board</a></td>
			</tr>
			<tr>
				<th class="info"  align="center">NO.</th>
				<th class="info"  align="center">ID</th>
				<th class="info"  align="center">NAME</th>
				<th class="info" align="center">JOIN_DATE</th>
				<th class="info"  align="center">EMAIL</th>
				<th class="info"  align="center">PHONE</th>
				<th class="info"  align="center">BOARD</th>
				<th class="info"  align="center">COMMENT</th>
				<th class="info"></th>
			</tr>
			<c:forEach var="member" items="${memberList }">
				<tr class="record">
					<td>${member.mId }</td>
					<td><a href="adminMemberForm.do?writer=${member.writer }">
							${member.writer } </a></td>
					<td>${member.name }</td>
					<td><fmt:formatDate value="${member.joinDate }" /></td>
					<td>${member.email }</td>
					<td>${member.phone }</td>
					<td><a href="adminBoardForm.do?writer=${member.writer }">BOARD</a>
					<td><a href="adminCommentForm.do?writer=${member.writer }">COMMENT</a></td>
					<td><a href="deleteMember.do?mId=${member.mId }">DELETE</a></td>
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