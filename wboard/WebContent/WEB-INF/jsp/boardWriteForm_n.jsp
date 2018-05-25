<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="layout/header.jsp"></jsp:include>
<script src="sha256.js"></script>
<script type="text/javascript">
	window.onload=function(){
		var form = document.getElementById('form');
		form.onsubmit = function(){
			var filename = document.getElementById('filename').value;
			alert(filename);
			alert(SHA256(filename));
			document.getElementById('filename').value = SHA256(filename);
			return true;
		}
	}
</script>
</head>
<body>

	<div id="wrap" align="center">
		<h1>Write Board</h1>
		<form name="frm" method="post" action="boardWrite_n.do">
		
			<table class="table table-bordered">
				<tr>
					<th>* WRITER</th>
					<td><input class="form-control" type="text" name="writer"> </td>
				</tr>
				<tr>
					<th>* TITLE</th>
					<td><input class="form-control" type="text" size="70" name="title"> </td>
				</tr>
				
				<tr>
					<th>CONTENT</th>
					<td><textarea class="form-control" cols="70" rows="15" name="content"> </textarea>
					</td>
				</tr>

			</table>
			<br> <br> <input type="submit" class="btn btn-default"value="Write"> <input
				class="btn btn-default" type="reset" value="Reset"> <input type="button" class="btn btn-default" value="Board"
				onclick="location.href='board_y.do'">
		</form>
	</div>
</body>
</html>