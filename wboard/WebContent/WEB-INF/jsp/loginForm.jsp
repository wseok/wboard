<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="layout/header.jsp"></jsp:include>
</head>
<body>

	<div id="wrap" align="center">
		<h1>Login</h1>
		<form name="frm" method="post" action="login.do">
			<table>
				<tr class="form-group">
					<th>* ID</th>
					<td><input type="text" class="form-control" name="writer"><br></td>
					
				</tr>
				<tr class="form-group">
					<th>* PW</th>
					<td><input type="password" class="form-control" name="pw"></td>
				</tr>
			</table>
			<br> <br> <input type="submit" class="btn btn-default" value="Login"> <input
				class="btn btn-default" type="reset" value="Reset"> <input type="button" class="btn btn-default" 
				value="Join" onclick="location.href='joinForm.do'"> <input
				type="button" value="Board" class="btn btn-default" onclick="location.href='board_n.do'">
		</form>
	</div>
</body>
</html>