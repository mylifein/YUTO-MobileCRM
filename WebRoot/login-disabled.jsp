<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"
	trimDirectiveWhitespaces="true" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false" %>  
  <% 
	pageContext.setAttribute("path", request.getContextPath());
%>  
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- <link href="css/styles.css" rel="stylesheet" type="text/css"> -->
<title>login</title>
<script type="text/javascript">
       	  
      function login(){
    	 if(checkInput()){
         var username = $("input[name='username']")[0].value;
         var password = $("input[name='password']")[0].value;
         
         $.ajax({
             url:"user/login.do",
             type: "post",
             //获取某个文本框的值
             //data: "id=" + id + "&name=" + $("#name").val(),
             data: "username=" + username + "&password=" + password,
            // 或者(注意：若参数为中文时，以下这种传参不会造成后台接收到的是乱码)
             
             success: function (data) {
	           	  var mag = "${sessionScope.userName}";	           
	           	   if(data=="200"){
            		   //window.location.href="${path}/CusSearch.jsp";
            		  // session.removeAttribute("masg"); 
            		  // $("#formSubmit").submit();
            		  alert("登陆成功");
            		  $("#formSubmit").submit();
            	  }else{
            		  alert("用户名或密码错误");
            	  }   
            
             }, 
             error: function (returnValue) {
                 alert("对不起！数据加载失败！");
             }
         })
    	 }else{
    		 return false;
    	 }
         
        
       } 
            
      function checkInput(){
    	  //判断用户名
    	  if($("input[name=username]").val() == null || $("input[name=username]").val() == ""){
    		  alert("用户名不能为空");
    		  $("input[name=username]").focus();
    		  return false;
    	  }
    	  //判断密码
    	  if($("input[name=password]").val() == null || $("input[name=password]").val() == ""){
    		  alert("用户名密码不能为空");
    		  $("input[name=password]").focus();
    		  return false;
    	  }
    	  return true;
      }      
      </script>
</head>
<body>
	<header>
		<nav class="navbar navbar-inverse">
			<div class="container">
				<div class="navbar-header">
					<a href="#" class="navbar-brand">SAP CRM</a>
				</div>
			</div>
		</nav>
	</header>
	<div class="content container" style="margin-top: 150px;">
		<div class="row">
			<div class="col-sm-offset-2 col-sm-8 col-md-offset-3 col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">登录</h2>
					</div>
					<div class="panel-body">
						<form action="user/homePage.do" method="post" id="formSubmit">
							<div class="form-group">
								<label for="username">用户名</label>
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-user"></span></span> <input
										class="form-control" type="text" name="username" id="username"
										required>
								</div>
							</div>
							<div class="form-group">
								<label for="password">密码</label>
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span> <input
										class="form-control" type="password" name="password"
										id="password" required>
								</div>
							</div>
							<input class="btn btn-default pull-right btn-success"
								type="button" value="登录" onclick="login()" />
						</form>
					</div>
					<div class="panel-footer">
						
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>