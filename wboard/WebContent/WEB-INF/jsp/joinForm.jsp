<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="layout/header.jsp"></jsp:include>
</head>
<body>

<div id="wrap" align="center">
		<h1>Join</h1>
		<form name="frm" method="post" action="join.do">
			<table>
				<tr class="form-group">
					<th>* ID</th>
					<td><input type="text" class="form-control" name="writer"></td>
				</tr>
				
				<tr class="form-group">
					<th>* NAME</th>
					<td><input type="text" class="form-control" name="name"></td>
				</tr>
				

				<tr class="form-group">
					<th>* PW</th>
					<td><input type="password" class="form-control" name="pw"></td>
				</tr>

				<tr class="form-group">
					<th>E-MAIL</th>
					<td><input type="text" class="form-control" name="email"></td>
				</tr>

				<tr class="form-group">
					<th>* PHONE</th>
					<td><input type="text" class="form-control" name="phone"></td>
				</tr>

			</table>
			<br>
			<br> <input type="submit" class="btn btn-default" value="Join"
			> <input type="reset" class="btn btn-default" 
				value="Reset">
		</form>
	</div>
</body>
</html>