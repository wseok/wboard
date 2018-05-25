<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery -->
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">
#wrap{
	width: 50%;
    margin: 0 auto;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
    //$("a").click(function(e){
        //e.stopPropagation();
      	//$(this).addClass('active');
      	//$(this).tab('show');
      	//$(this).parent().addClass('active');
        
    //});
   
	  	  	//$(function() { //페이지 전환후 active유지
		    	  $('a[data-toggle="tab"]').on('click',function(e){
		    		e.stopPropagation();
		    		  localStorage.setItem('lastTab',$(this).attr('href'));  
		    		//localStorage.setItem('lastTab',tab);  
		    	  });
		    	
		    	  var lastTab = localStorage.getItem('lastTab');
		    	  //alert(lastTab);
		    	  if(lastTab){
		    		$('[href="' + lastTab + '"]').parent().addClass('active');
		    	  }
		   //});
    
});
</script>
<title>WBoard</title>
</head>
<body>
	<div id="header">
		<nav class="navbar navbar-default">
			<div >
			    <div class="navbar-header">
			      <a class="navbar-brand" href="main.do" data-toggle="tab">
			        Spring 게시판 입니다.
			      </a>
			    </div>
			  </div>
			<div class="container-fluid">
				<ul id="menus" class="nav navbar-nav navbar-right">
					<li><a href="loginForm.do" role="tab" data-toggle="tab">Login</a></li>
					<li><a href="myPage.do" role="tab" data-toggle="tab">Mypage</a></li>
					<li><a href="joinForm.do" role="tab" data-toggle="tab">Join</a></li>
					<li><a href="board_n.do" role="tab" data-toggle="tab">Board</a></li>
				</ul>			
			</div>
		</nav>
	</div>
</body>
</html>