<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="layout/header.jsp"></jsp:include>

<script type="text/javascript">
	function ReplyOpen(cid){
		if(cid >= 0){
			window.name="commentWR";
			/* var myWindow = window.open("addCommentWrite_y.do?cId="+cid,
                    "replyComment", "width=570, height=350, resizable = no, scrollbars = no"); */
            var trtag='<tr><td align="center" width="70%" colspan="2">COMMENT</td><td align="center" width="20%">WRITER</td>	<td align="center" width="10%"></td></tr>';
		    
			window.document.write("<form id='frm' action='addCommentWrite_y.do' method='post'>	<input type='hidden' name='bId' value='${board.bId}'> <input type='hidden' name='writer' value='${writer}'>	<table width='600px' style='margin: 0 auto;' class='table table-hover'>"+trtag+"<tr><td align='center'><input class='form-control' type='hidden' style='width: 95%' type='text' name='cId' value='"+cid+"'></td><td align='center'><input class='form-control' style='width:100%;' type='text' name='comment'></td>	<td align='center'>${writer }</td>	<td align='center'><input class='btn btn-default' onclick='document.getElementById('frm').submit(); window.opener.location.reload(); window.close();' type='submit' value='등록'></td></tr></table></form> ");

		}
	}

</script>
</head>
<body>
	<h4 align="right">
		<a href="logout.do">Logout</a>
	</h4>
	<div id="wrap" align="center">
		<h1>${board.bId }`Board</h1>
		<table class="table table-bordered">
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
				<td colspan="3">${board.content }</td>


			</tr>
		</table>
		<input type="button" class="btn btn-default" value="Modify"
			onclick="location.href='boardUpdateForm_y.do?bId=${board.bId}'">
		<input type="button" class="btn btn-default" value="Delelte"
			onclick="location.href='boardDelete_y.do?bId=${board.bId}'">
		<input type="button" class="btn btn-default" value="Board"
			onclick="location.href='board_y.do'"> <input type="button"
			class="btn btn-default" value="WriteBoard"
			onclick="location.href='boardWriteForm_y.do'">


		<form action="commentWrite_y.do" method="post"
			style="margin-top: 100px;" name="commentWR">
			<input type="hidden" name="bId" value="${board.bId}"> <input
				type="hidden" name="writer" value="${writer}">
			<table width="900px" class="table table-hover">
				<tr>
					<td align="center" width="10%">COMMENT NUMBER</td>
					<td align="center" width="60%">COMMENT</td>
					<td align="center" width="20%">WRITER</td>
					<td align="center" width="10%"></td>
				</tr>
				<tr>
					<td align="center">
						<!-- <input class="form-control"
						style="width: 95%" type="hidden" name="cId">  -->
					</td>
					<td align="center"><input class="form-control"
						style="width: 95%" type="text" name="comment"></td>
					<td align="center">${writer }</td>
					<td align="center"><input class="btn btn-default"
						type="submit" value="ENTER"></td>
				</tr>
				<!-- <tr class="addCW" style="display: none;">
					<td colspan="4"><input class="form-control" style="width: 95%"
						type="text" name="cId"> <input class="form-control"
						style="width: 95%" type="text" name="comment"> <input
						class="btn btn-default" type="submit" value="ENTER"></td>
				</tr> -->
				<c:forEach items="${commentList }" var="comment" varStatus="status">
					<tr>
						<td colspan="2">
							<c:if test="${comment.groupLv > 0}">
                            &nbsp;&nbsp;&nbsp;&nbsp; <!-- 답변일경우 앞에 공백을 준다. -->
							</c:if> ${status.count }:${comment.comment }  
							<input id="replyComment" name="replyComment" style="width: 55px; float: right;" class="btn btn-default"	onclick="ReplyOpen(${comment.cId})" value="답변"></td>
						<td>${comment.writer }</td>
						<td align="center"><a
							href="commentDelete_y.do?cId=${comment.cId }&bId=${board.bId}&writer=${comment.writer }">
								DELETE</a></td>
					</tr>

				</c:forEach>
			</table>
		</form>
		<%-- <form action="addCommentWrite_y.do" method="post">
			<input type="hidden" name="bId" value="${board.bId}"> <input
				type="hidden" name="writer" value="${writer}">
			<table width="900px" class="table table-hover">
				<tr>
					<td align="center" width="10%">COMMENT NUMBER</td>
					<td align="center" width="60%">COMMENT</td>
					<td align="center" width="20%">WRITER</td>
					<td align="center" width="10%"></td>
				</tr>
				<tr>
					<td align="center"><input class="form-control"
						style="width: 95%" type="text" name="cId"></td>
					<td align="center"><input class="form-control"
						style="width: 95%" type="text" name="comment"></td>
					<td align="center">${writer }</td>
					<td align="center"><input class="btn btn-default"
						type="submit" value="ENTER"></td>
				</tr>
			</table>
		</form> --%>

	</div>



</body>
</html>