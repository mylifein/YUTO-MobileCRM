<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"
	trimDirectiveWhitespaces="true" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false" %>  
  <% 
	pageContext.setAttribute("path", request.getContextPath());
%>  
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>YUTO-MobileCRM | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="./js/bootstrap-admin/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./js/bootstrap-admin/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="./js/bootstrap-admin/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
 <!-- jQuery 2.2.3 -->
<script src="./js/bootstrap-admin/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="./js/bootstrap-admin/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="./js/bootstrap-admin/plugins/iCheck/icheck.min.js"></script>
 <script type="text/javascript">
       	  
      function login(){
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
    	   
       } 
            
         
</script> 
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="#"><b>YUTO-Mobile</b>CRM</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">开始登陆CRM移动端系统</p>

    <form action="user/homePage.do" method="post" id="formSubmit" >
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Admin" id="username" name="username"  required>
        <span class="glyphicon glyphicon-user form-control-feedback" ></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" id="password" name="password" required>
        <span class="glyphicon glyphicon-lock form-control-feedback" ></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="button" class="btn btn-primary btn-block btn-flat" onclick="login()">登陆</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
     
    </div>
    <!-- /.social-auth-links -->

    <a href="#">忘记密码？</a><br>
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script> 
</body>
</html>
