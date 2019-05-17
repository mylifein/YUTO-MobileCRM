<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"
	trimDirectiveWhitespaces="true" language="java"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>YUTO-Mobile CRM</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="${path}/js/bootstrap-admin/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- jvectormap -->
<link rel="stylesheet"
	href="${path}/js/bootstrap-admin/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${path}/js/bootstrap-admin/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${path}/js/bootstrap-admin/dist/css/skins/_all-skins.min.css">
<script
		src="${path}/js/bootstrap-admin/plugins/jQuery/jquery-2.2.3.min.js"></script>	

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
        <style type="text/css">
            #displayList tr:hover{
                background-color:#708090
            }
        </style>
   		 <script>
   		 var isModify = false ;
   		 var modifyRows ;
        function Test(){  
            var rows=document.getElementById("listData").rows;  
            if(rows.length>0){  
                for(var i=1;i<rows.length;i++){  
                    (function(i){  
                    var temp=rows[i].cells[0].innerHTML; 
                    var mark=rows[i].cells[1].innerHTML;
                    var obj=rows[i];  
                    obj.onclick=function(){           
                        var businessMan = document.getElementById("chargeSman");
                        var clerkMark = document.getElementById("clerkMark");
                        var backHomepage = document.getElementById("returnButton");   
                        businessMan.value = temp;
                        clerkMark.value = mark;
                        backHomepage.click();                    
                                              
                                             };  
                    } )(i)  
                }  
            }  
        }  
/*        function submitSearch(){
            var clerkName = document.getElementById("clerkName").value;
            var cusNo = document.getElementById("cusNo").value;
            ajax
            
        }*/
       function loadClerk(){
        	 var employeeName = document.getElementById("employeeName").value;
             var employeeMark = document.getElementById("employeeMark").value;
            
            $.ajax({
                url:"${path}/cus/searchClerk.do",
                type:"post",
                data:"employeeName=" + employeeName + "&employeeMark="+employeeMark,
                success: function(data){
                	
                	var search = JSON.parse(data);
                	var list = search.clerkList; //员工搜索结果
                	console.log("datas:"+search.clerkList); 
                	var innerHtml="";
                	var i;       	
   
                	for(i = 0; i < list.length;i++){
                	/* 	console.log(list[i].employeeName);
                		console.log(list[i].employeeMark); */
                		innerHtml = innerHtml + "<tr><td>" + list[i].employeeName + "</td>"
                					+ "<td>" + list[i].employeeMark + "</td> </tr>"              					
                	}
              		document.getElementById("displayList").innerHTML = innerHtml;	
              		Test();
                },
                error: function(returnValue){
                	alert("搜索不存在！");
                }
            })
        }
       	
       	function goBack(){
        	window.history.back()
        } 
       	
       	function checkForm(form){
       		var postCode = document.getElementById("postCode").value;
       		var regExp = /^\d{6}$/;
       		if(form.cusAbbr.value == ''){
       			alert("客户简称不能为空！");
       			form.cusAbbr.focus();
       			return false;
       		}
       		if(form.cusClass.value == ''){
       			alert("客户类别不能为空！");
       			form.cusClass.focus();
       			return false;
       		}    
     		if(form.cusDistrict.value == ''){
       			alert("地区不能为空");
       			form.cusDistrict.focus();
       			return false;
       		} 
       		if(form.cusTelephone.value == ''){
       			alert("客户电话不能为空！");
       			form.cusTelephone.focus();
       			return false;
       		}
			if(form.cusClass.value == "A"){
				if(form.cusName.value == ""){
					alert("客户中文名称不能为空！");
					form.cusName.focus();
					return false;
					
				}
				if(form.domesticAddr.value== ""){
					alert("国内联系地址不能为空！");
					form.domesticAddr.focus();
					return false;
				}
			}
			if(form.cusClass.value == "B"){
				if(form.cusEnName.value == ""){
					alert("客户英文名称不能为空！");
					form.cusEnName.focus();
					return false;
					
				}
				if(form.foreignAddr.value== ""){
					alert("国外联系地址不能为空！");
					form.foreignAddr.focus();
					return false;
				}
			}
			
			if(document.getElementById("contactsTable").rows.length == 1){
				alert("客户联系人不能为空！");
				document.getElementById("createContactBtn").focus();
				return false;
			}
       		if(!regExp.test(postCode)){
       			alert("邮政编码格式必须为6位数字！");
       			document.getElementById("postCode").focus();
       			return false;
       		}
       		return true;
       	}
       	
       	$(function(){
           	$("#cusClass").change(function(){
           		var type = $(this).find("option:selected").val();
           		if(type == "A"){
           			document.getElementById("cnName").style.cssText = "border:solid 1px red";
           			document.getElementById("domesticAddress").style.cssText = "border:solid 1px red";
           			$("#enName").removeAttr("style"); 
           			$("#foreign").removeAttr("style"); 
           		}
           		if(type == "B"){
           			document.getElementById("enName").style.cssText = "border:solid 1px red";
           			document.getElementById("foreign").style.cssText = "border:solid 1px red";
           			$("#cnName").removeAttr("style"); 
           			$("#domesticAddress").removeAttr("style"); 
           		}
           		if(type == ""){
           			$("#cnName").removeAttr("style"); 
           			$("#domesticAddress").removeAttr("style");
           			$("#enName").removeAttr("style"); 
           			$("#foreign").removeAttr("style");
           			
           		}
           		
           	})	
       	})
       	function confirmInfo(){
       		if(checkContacts()){
    		var surname = document.getElementById("surname").value ;
       		var firstName = document.getElementById("firstName").value ;
       		var bornDate = document.getElementById("bornDate").value ;
       		var duty = document.getElementById("duty").value ;
       		var department = document.getElementById("department").value ;
       		var mobileNumber = document.getElementById("mobileNumber").value ;
       		var email = document.getElementById("email").value ;
       		var qqInfo = document.getElementById("qqInfo").value ;
       		var weChat = document.getElementById("weChat").value ;
       		var contactsTable = document.getElementById("contactsTable") ;
       		if(isModify){
       			var row = document.getElementById("trNum" + modifyRows) ;
       			var modifyIndex = row.rowIndex ;
       			contactsTable.rows[modifyIndex].cells[1].innerHTML = surname + firstName ;
       			contactsTable.rows[modifyIndex].cells[2].innerHTML = mobileNumber ;
       			contactsTable.rows[modifyIndex].cells[3].innerHTML = duty ;
       			contactsTable.rows[modifyIndex].cells[4].innerHTML = email ;
       			var contactDiv = document.getElementById("contact" + modifyRows) ;		//找到联系人表单区域元素 
           		var contactInputs = contactDiv.getElementsByTagName("input") ;		   //获得联系人区域下的所有input 元素
           		contactInputs[0].value = surname ;
           		contactInputs[1].value = firstName ;
           		contactInputs[2].value = bornDate ;
           		contactInputs[3].value = duty ;
           		contactInputs[4].value = department ;
           		contactInputs[5].value = mobileNumber ;
           		contactInputs[6].value = email ;
           		contactInputs[7].value = qqInfo ;
           		contactInputs[8].value = weChat ;
       			
       		}else{
           		var currentRows = contactsTable.rows.length ;  //获得当前tr 行数
                		
           		var sequence = currentRows - 1 ;			//获得数组当前序列
           		var newTr = contactsTable.insertRow(currentRows); 	
           		var insertRowsNum = newTr.rowIndex.toString();
           		newTr.id = "trNum" + insertRowsNum ; 
           		var parameterNum = insertRowsNum - 1 ;
           		
           		var newTd1 = newTr.insertCell();
        
           		newTd1.innerHTML = "<a><span class ='fa fa-pencil' onclick=\"modifyContacts('" + insertRowsNum +  "') \"></span></a> <a><span class ='fa fa-trash' onclick= \" deleteContacts('" + insertRowsNum + "')\" ></span></a>";
           		var newTd2 = newTr.insertCell();
           		newTd2.innerHTML = surname + firstName ;
           		var newTd3 = newTr.insertCell();
           		newTd3.innerHTML = mobileNumber ;
           		var newTd4 = newTr.insertCell();
           		newTd4.innerHTML = duty ;
           		var newTd5 = newTr.insertCell();
           		newTd5.innerHTML = email ;
           		var contactsArea = document.getElementById("contactsArea") ; 			//获得联系人提交表单区域
           		
           	 	contactsArea.innerHTML = contactsArea.innerHTML + "<div id = 'contact" + insertRowsNum + "'> " 
           								 + "<input type= 'hidden' name='contacts[" + parameterNum + "].surname' value='" + surname + "' >"
           								 + "<input type= 'hidden' name='contacts[" + parameterNum + "].firstName' value='" + firstName + "' >"
           								 + "<input type= 'hidden' name='contacts[" + parameterNum + "].bornDate' value='" + bornDate + "' >"
           								 + "<input type= 'hidden' name='contacts[" + parameterNum + "].duty' value='" + duty + "' >"
           								 + "<input type= 'hidden' name='contacts[" + parameterNum + "].department' value='" + department + "' >"
           								 + "<input type= 'hidden' name='contacts[" + parameterNum + "].mobileNumber' value='" + mobileNumber + "' >"
           								 + "<input type= 'hidden' name='contacts[" + parameterNum + "].email' value='" + email + "' >"
           								 + "<input type= 'hidden' name='contacts[" + parameterNum + "].qqInfo' value='" + qqInfo + "' >"
           								 + "<input type= 'hidden' name='contacts[" + parameterNum + "].weChat' value='" + weChat + "' >"
           								 + "</div>"; 
           	   						 
       		}
       		
       		document.getElementById("surname").value = "" ;
       		document.getElementById("firstName").value = "" ;
       		document.getElementById("bornDate").value = "" ;
       		document.getElementById("duty").value= "" ;
       		document.getElementById("department").value = "" ;
       		document.getElementById("mobileNumber").value = "" ;
       		document.getElementById("email").value = "" ;
       		document.getElementById("qqInfo").value = "" ;
       		document.getElementById("weChat").value = "" ;
       		isModify = false ;
       		document.getElementById("closeModal").click() ;
       		//返回界面并清空add contacts input value
       		}
       		
       	}
       	
       	function deleteContacts(rowNumber){
       		var contactsTable = document.getElementById("contactsTable") ;
       		var row = document.getElementById("trNum" + rowNumber) ;
       		var index = row.rowIndex ; 											//rowIndex属性为tr的索引值，
       		contactsTable.deleteRow(index);   								    //从联系人表中，删除某条联系人信息
       		var contactsArea = document.getElementById("contactsArea") ; 			//获得联系人div区域 
       		var childNode = document.getElementById("contact" + rowNumber) ;
       		childNode.remove();													//删除对应的联系人div input 区域
       		
       	}
       	
       	function modifyContacts(rowNumber){
       		isModify = true ;
       		modifyRows = rowNumber ;
      		var surname = document.getElementById("surname");
       		var firstName = document.getElementById("firstName") ;
       		var bornDate = document.getElementById("bornDate") ;
       		var duty = document.getElementById("duty").value ;
       		var department = document.getElementById("department") ;
       		var mobileNumber = document.getElementById("mobileNumber");
       		var email = document.getElementById("email") ;
       		var qqInfo = document.getElementById("qqInfo") ;
       		var weChat = document.getElementById("weChat") ;					//找到联系人展示modal input 元素
       		var contactDiv = document.getElementById("contact" + rowNumber) ;		//找到联系人表单区域元素 
       		var contactInputs = contactDiv.getElementsByTagName("input") ;		   //获得联系人区域下的所有input 元素
       		surname.value = contactInputs[0].value ;
       		firstName.value = contactInputs[1].value ;
       		bornDate.value = contactInputs[2].value ;
       		duty.value = contactInputs[3].value ;
       		department.value = contactInputs[4].value ;
       		mobileNumber.value = contactInputs[5].value ;
       		email.value = contactInputs[6].value ;
       		qqInfo.value = contactInputs[7].value ;
       		weChat.value = contactInputs[8].value ;
       		document.getElementById("createContactBtn").click() ;
       	}
       	
       	function checkContacts(){
       		if(document.getElementById("surname").value == ''){
       			alert("联系人姓不能为空！");
       			document.getElementById("surname").focus();
       			return false;
       		}
       		if(document.getElementById("firstName").value == ''){
       			alert("联系人名不能为空！");
       			document.getElementById("firstName").focus();
       			return false;
       		}
       		if(document.getElementById("duty").value == ''){
       			alert("联系人职务不能为空！");
       			document.getElementById("duty").focus();
       			return false;
       		}
       		if(document.getElementById("mobileNumber").value == ''){
       			alert("联系人电话不能为空！");
       			document.getElementById("mobileNumber").focus();
       			return false;
       		}
       		if(document.getElementById("email").value == ''){
       			alert("联系人电子邮件不能为空！");
       			document.getElementById("email").focus();
       			return false;
       		}
       		return true;
       	}
       	function formSubmit(){
       		if(checkForm(document.getElementById('customerInfoForm'))){
       			document.getElementById('customerInfoForm').submit();
       		}
       	
       	}
    </script>          
</head>
<body class="hold-transition skin-blue sidebar-mini">
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  <!-- start of responsible staff  -->
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <!--   搜索  -->
                        <div class="row">
				            <div class="col-sm-offset-1 col-sm-10">
					           <div class="panel panel-default">
						          <div class="panel-heading">
							         <h2 class="panel-title">公司员工搜索</h2>
						          </div>
						          <div class="panel-body">
							 <form class="form-horizontal" action="${path}/creation.do" method="post">
								        <div class="form-group">
									       <label for="customer-category" class="col-sm-2 control-label">搜索</label>
								        <div class="col-sm-9">
										  <select class="form-control" name="customer-category" id="customer-category">
											 <option value="">员工搜索</option>
										  </select>
								        </div>
								    </div>
								    <div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-4">
											<select class="form-control" name="#" id="#">
												<option value="" selected>员工姓名</option>
											</select>
										</div>
										<div class="col-xs-6">
											<input type="text" class="form-control" id="employeeName" name="employeeName" value="${clerk.employeeName }">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-4">
											<select class="form-control" name="#" id="#">
												<option value="" selected>员工编号</option>
											</select>
										</div>
										<div class="col-xs-6">
										  <input type="text" class="form-control" id="employeeMark" name="employeeMark" value="${clerk.employeeMark }">
										</div>
									</div>
								</div>
								<button type="button" class="btn btn-default pull-right" onclick="loadClerk()">搜索:<span class="glyphicon glyphicon-search"></span></button>
								<button type="button" class="btn btn-default pull-right" data-dismiss="modal" id="returnButton">取消</button>
								<button type="reset" class="btn btn-default pull-right">重置</button>
							</form>
						</div>
					</div>
				</div>
			</div>
                                                    
                                                    
                                                    
                                                    
                                                    <!-- 搜索 -->
                    </div>
                        <div class="modal-body">
                            <div class="table-responsive">   
                            <table class="table" id="listData">
                                <thead>
                                    <tr>
                                        <td>姓名</td>
                                        <td>员工标识</td>            
                                    </tr>
                                </thead>
                                <tbody id="displayList">
                         
                             				 							
                                </tbody>
                            </table>
                            </div>     
                        </div> 
                        <div class="modal-footer">
                        </div>
                    </div>  <!--modal content -->
                </div>   <!-- /.modal -->   
        </div>  
        <!--  end of responsible staff modal -->
    <div class="modal modal-successful" id="contactsModal" tabindex="-1" role="dialog" aria-labelledby="contactsModal" aria-hidden="true" >	<!--  start of contacts modal -->
    	<div class="modal-dialog">
    		<div class="modal-content">		
    			<div class="modal-header">
    				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
    				<h4 class="modal-title" id="contactsModalTitle">
    				公司客户：新-联系人
    				</h4>
  
    			</div>
    			<div class="modal-body">
    			  <div class="box-body">
	 				 <div class="form-group">
	                  <label for="surname" class="col-sm-2 control-label" ><font >姓</font></label>
	                  <div class="col-sm-10" >
	                    <input type="text" class="form-control" id="surname" name="surname" placeholder="必填" style="border:solid 1px red">
	                  </div>
	                 </div>
	                  <div class="form-group">
	                  <label for="firstName" class="col-sm-2 control-label"><font >名</font></label>
				
	                  <div class="col-sm-10">
	                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="必填" style="border:solid 1px red">
	                  </div>
	                 </div>
	                 <div class="form-group">
	                  <label for="bornDate" class="col-sm-2 control-label">出生日期</label>
	
	                  <div class="col-sm-10">
	                    <input type="date" class="form-control" id="bornDate" name="bornDate" >
	                  </div>
	                 </div>
	                 <div class="form-group">
	                  <label for="duty" class="col-sm-2 control-label"><font >职务</font></label>
	
	                  <div class="col-sm-10">
	                    <input type="text" class="form-control" id="duty" name="duty" placeholder="必填" style="border:solid 1px red" >
	                  </div>
	                 </div>
	                 <div class="form-group">
	                  <label for="department" class="col-sm-2 control-label"><font >部门</font></label>
	
	                  <div class="col-sm-10">
	                    <input type="text" class="form-control" id="department" name="department" >
	                  </div>
	                 </div>
	                 <div class="form-group">
	                  <label for="mobileNumber" class="col-sm-2 control-label"><font >移动电话</font></label>
	
	                  <div class="col-sm-10">
	                    <input type="text" class="form-control" id="mobileNumber"  name="mobileNumber" placeholder="必填"  style="border:solid 1px red">
	                  </div>
	                 </div>	
	                 <div class="form-group">
	                  <label for="email" class="col-sm-2 control-label">E-Mail</label>
	
	                  <div class="col-sm-10">
	                    <input type="email" class="form-control" id="email" name="email" placeholder="必填" style="border:solid 1px red">
	                  </div>
	                 </div>	
	                 <div class="form-group">
	                  <label for="qqInfo" class="col-sm-2 control-label">QQ</label>
	                  <div class="col-sm-10">
	                    <input type="text" class="form-control" id="qqInfo" name="qqInfo">
	                  </div>
	                 </div>	
	                 <div class="form-group">
	                  <label for="weChat" class="col-sm-2 control-label">微信号</label>
	                  <div class="col-sm-10">
	                    <input type="text" class="form-control" id="weChat" name="weChat" >
	                  </div>
	                 </div>		                   	                   	                   	                 	                 
			      </div>  <!-- end of box body -->		
    			</div> 
    			<div class="modal-footer">
    				<button type="button" class="btn btn-outline pull-left" style="color:red" data-dismiss="modal" id="closeModal" >关闭</button>
                	<button type="button" class="btn btn-outline" style="color: green" onclick="confirmInfo()" >确定</button> 	
    			</div>
    			
    		</div>		<!--  end of modal content -->
    	
    	</div>
    </div>    <!--  end of contacts modal -->
	<div class="wrapper">

		<header class="main-header">

			<!-- Logo -->
			<a href="${path }/homePage.jsp" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>CRM</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>YUTO-Mobile</b>CRM</span>
			</a>

			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Notifications: style can be found in dropdown.less -->
						<li class="dropdown notifications-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <!-- <i class="fa fa-bell-o"></i> -->
								<i class="fa fa-home"></i> <span class="label label-warning">${appointment}</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">你今天有 ${appointment}个预约</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<c:forEach var="searchList1" items="${searchList1 }">
										<li><a href="${path}/cus/searchHomeItem.do?actMark=${searchList1.actMark}"> <i class="fa fa-bookmark text-aqua"></i>
												${searchList1.actDesc }
										</a></li>	
										</c:forEach>								
									</ul>
								</li>
								
							</ul></li>
						<!-- Tasks: style can be found in dropdown.less -->
						<li class="dropdown tasks-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="fa fa-flag-o"></i> <span class="label label-danger">${assignment }</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">你有${assignment }个未出行活动</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<c:forEach var="searchList2" items="${searchList2 }">
										<li><a href="${path}/cus/searchHomeItem.do?actMark=${searchList2.actMark}"> <i class="fa fa-bookmark text-aqua"></i>
												<font style="color : black"">${searchList2.actDesc }</font>
										</a></li>	
										</c:forEach>								
									</ul>
								</li>
								
							</ul></li>
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="${path}/js/bootstrap-admin/dist/img/photo1.png"
								class="user-image" alt="User Image"> <span
								class="hidden-xs">${clerkName }</span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="${path}/js/bootstrap-admin/dist/img/photo1.png"
									class="img-circle" alt="User Image">

									<p>${clerkName }- Salesman</p></li>
								<!-- Menu Body -->
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-right">
										<a href="${path}/user/logout.do" class="btn btn-default btn-flat">退出</a>
									</div>
								</li>
							</ul></li>
						<!-- Control Sidebar Toggle Button -->
	<!-- 					<li><a href="#" data-toggle="control-sidebar"><i
								class="fa fa-gears"></i></a></li> -->
					</ul>
				</div>

			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="${path}/js/bootstrap-admin/dist/img/yuto-iconfont.jpg"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${clerkName }</p>
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">MAIN NAVIGATION</li>
					<li><a href="${path }/homePage.jsp"><i
							class="fa fa-home"></i> <span>主页</span></a></li>
			        <li class="treeview active">
			          <a href="#">
			            <i class="fa fa-user"></i> <span>客户</span>
			                <span class="pull-right-container">
			                  <i class="fa fa-angle-left pull-right"></i>
			                </span>
			          </a>
			          <ul class="treeview-menu">
			            <li><a href="${path}/CusSearch.jsp"><i class="fa fa-circle-o"></i>客户搜索</a></li>
			            <c:if test="${EV_CREATE == 'C' }"><li class="active" ><a href="${path}/CusCreation.jsp"><i class="fa fa-circle-o"></i>客户创建</a></li></c:if>     
			          </ul>
			        </li>
			        <li class="treeview ">
			          <a href="#">
			            <i class="fa fa-table"></i> <span>报表</span>
			                <span class="pull-right-container">
			                  <i class="fa fa-angle-left pull-right"></i>
			                </span>
			          </a>
			          <ul class="treeview-menu">
			            <li ><a href="${path}/clueSearch.jsp"><i class="fa fa-circle-o"></i>线索统计报表</a></li> 
			            <li ><a href="${path}/SatisfactoryInvestigate.jsp"><i class="fa fa-circle-o"></i>客户满意度调查报表</a></li>     
			            <li ><a href="${path}/processEffiencyReport.jsp"><i class="fa fa-circle-o"></i>流程时效报表</a></li>  
			          </ul>
			        </li>			        							
		
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>线索客户创建界面</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-user"></i>客户</a></li>
					<li class="active">客户创建</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Main row -->
		<div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">客户基本信息</h3>
          <button type="button" class="btn btn-primary pull-right" onclick="formSubmit()" >保存</button>
        </div>
        <!-- /.box-header -->
        <div class="row">
        <form  id="customerInfoForm" name="form" action="${path}/cus/creation.do" method="post" onsubmit="return checkForm(this);">
        <div class="col-md-6">
          <div class="box box-danger">
            <div class="box-body">
              <!-- Date dd/mm/yyyy -->
              <div class="form-group">
                <label>类型</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-object-group"></i>
                  </div>
                  <select class="form-control" name="cusSearch.businessTypes" id="businessTypes" value="${cust.businessTypes }" disabled>
                                                    <option value="Z001">线索客户</option>                                             
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label>客户编号</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-paw"></i>
                  </div>
                  <input type="text" id="cusNo"  name="cusSearch.cusNo" class="form-control" value="${cust.cusMark }" disabled>
                </div>
                <!-- /.input group -->
              </div>
                            <div class="form-group">
              	<label>状态码</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa  fa-compass"></i>
                  </div>
                   <select class="form-control" name="cusSearch.status" id="businessStatus" value="${cust.businessStatus }" >
                                                <option value="0" ${cust.businessStatus == "0"? 'selected':'' }>开立</option>
                                                <option value="1" ${cust.businessStatus == "1"? 'selected':'' }>提交审批</option>
                                               
                   </select>
                </div>
              </div>
              <div class="form-group" >
                <label>客户类别</label>
                <div class="input-group" style="border:solid 1px red">
                  <div class="input-group-addon">
                    <i class="fa fa-puzzle-piece"></i>
                  </div>
                  <select class="form-control" name="cusSearch.cusClass" id="cusClass" value="${cust.cusClass }" >
                  	<option value=""></option>
                  	<option value="A">国内客户</option>
                   	<option value="B">国外客户</option>   
            	  </select>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->   
              <div class="form-group">
                <label>客户中文全称</label>
                <div class="input-group" id="cnName" name="cnName">
                  <div class="input-group-addon">
                    <i class="fa  fa-user-secret"></i>
                  </div>
                  <input type="text" id="cusName"  name="cusSearch.cusName" class="form-control" value="${cust.cusCnName }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>客户英文全称</label>
                <div class="input-group" id="enName" name="enName">
                  <div class="input-group-addon">
                    <i class="fa fa-user-plus"></i>
                  </div>
                  <input type="text" id="cusEnName"  name="cusSearch.cusEnName" class="form-control" value="${cust.cusEnName }" >
                </div>
                <!-- /.input group -->
              </div>

              <!-- /.form group -->
              <div class="form-group">
                <label>客户简称</label>
                <div class="input-group" style="border:solid 1px red">
                  <div class="input-group-addon">
                    <i class="fa fa-user"></i>
                  </div>
                  <input type="text" id="cusAbbr"  name="cusSearch.cusAbbr" class="form-control" value="${cust.cusAbbrName }" >
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->           
                <div class="form-group">
                <label>负责业务员</label>
                <div class="input-group" style="border:solid 1px red">
                  <div class="input-group-addon">
                    <i class="fa fa-user-plus"></i>
                  </div>
                  <input type="text" id="chargeSman" name="cusSearch.chargeSman" class="form-control" value="${sessionScope.clerkName }" disabled>
                  <input type="hidden" id="clerkMark" name="cusSearch.clerkMark"  value="${sessionScope.userName }" >	      
         		  <input type="hidden" id="creater" name="cusSearch.creater" value="${sessionScope.userName }" >	
               	  <span class="input-group-btn">
                      <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
                  </span>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
			  <div id="contactsArea">   <!--  start of contacts -->		  	
			  </div>	
            </div>
            <!-- /.box-body -->
          </div>   <!--  end of box -->
         			
          </div> 	<!--  end of left -->
          <div class="col-md-6">  <!--  start of right -->
          	<div class="box box-danger">
            <div class="box-body">                        
              <div class="form-group">
                <label>地区</label>
                <div class="input-group" style="border:solid 1px red">
                  <div class="input-group-addon">
                    <i class="fa fa-location-arrow"></i>
                  </div>
                                            <select class="form-control" name="cusSearch.cusDistrict" id="cusDistrict">
                                            	<option value=""></option>
                                                <option value="A001">东北</option>
                                                <option value="A002">华北</option>
                                                <option value="A003">华东</option>
                                                <option value="A004">华中</option> 
                                                <option value="A005">华南</option>
                                                <option value="A006">西北</option>
                                                <option value="A007">西南</option>
                                                <option value="A008">中南</option>
                                                <option value="A009">香港</option>
                                                <option value="A010">澳门</option>
                                                <option value="A011">国际</option>
                                                <option value="A012">台湾</option>
                                                <option value="B001">北部</option>
                                                <option value="B002">南部</option>
                                                <option value="B003">德国</option>
                                                <option value="B004">法国</option>    
                                            </select>                  
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>所属BU</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-industry"></i>
                  </div>
                    <select class="form-control" name="cusSearch.belongBu" id="belongBu" value="${cust.belongBU }">
                    							<option value=""></option>
                                                <option value="30">IT事业处石岩厂区</option>
                                                <option value="32">礼盒专案</option>
                                                <option value="36">深圳裕同</option>
                                                <option value="37">苏州裕同</option>    
                                                <option value="39">精品包装</option>
                                                <option value="40">泸州裕同</option>
                                                <option value="41">九江裕同</option>
                                                <option value="42">成都裕同</option>
                                                <option value="43">许昌裕同</option>
                                                <option value="44">烟台裕同</option>
                                                <option value="45">苏州810B</option>
                                                <option value="46">珠海裕同</option>
                                                <option value="47">武汉裕同</option>
                                                <option value="48">合肥裕同</option>
                                                <option value="50">合肥裕同</option>
                                                <option value="51">东莞裕同</option>    
                                                <option value="52">合肥裕同</option>
                                                <option value="54">合肥裕同</option>
                                                <option value="55">四川君和</option>
                                                <option value="59">苏州昆迅</option>
                                                <option value="60">毫州裕同</option>
                                                <option value="62">说明书事业部</option>
                                                <option value="64">IT事业处龙岗厂区</option>
                                                <option value="70">酒包BG</option>
                                                <option value="75">陕西裕凤</option>
                                                <option value="84">深圳商标部</option>
                                                <option value="85">重庆裕同</option>
                                                <option value="87">供应链中心</option>
                                                <option value="90">越南裕展</option>
                                                <option value="92">九江810B</option>
                                                <option value="93">云创</option>
                                                <option value="94">华智</option>
                                                <option value="95">裕同电子</option>
                                                <option value="101">印想</option>
                                                <option value="104">国内ICTBG</option>
                                                <option value="106">许昌纸托</option>
                                                <option value="106">许昌纸托</option>
                                                <option value="110">大健康BG</option>
                                                <option value="114">化妆品BG</option>
                                                <option value="115">国际BG(B专案)</option>
                                                <option value="116">国际BG(Non A)</option>  
                                                <option value="51">东莞裕同</option>    
                  </select>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>国内联系地址</label>

                <div class="input-group" id="domesticAddress" name="domesticAddress">
                  <div class="input-group-addon">
                    <i class="fa fa-location-arrow"></i>
                  </div>
				  <input type="text" id="domesticAddr" name="cusSearch.domesticAddr" class="form-control"  >
                </div>
              </div>
              <div class="form-group">
              	<label>国外联系地址</label>
                <div class="input-group" id="foreign" name="foreign">
                  <div class="input-group-addon">
                    <i class="fa fa-location-arrow"></i>
                  </div>
				  <input type="text" id="foreignAddr" name="cusSearch.foreignAddr" class="form-control" >
                </div>
              </div>
              <div class="form-group">
                <label>邮政编码</label>
                <div class="input-group" style="border:solid 1px red">
                  <div class="input-group-addon">
                    <i class="fa fa-file-code-o" title="邮政编码格式为6位数字" ></i>
                  </div>
                  <input type="text" id="postCode" name="cusSearch.postCode" class="form-control" value="${cust.postCode }">
                </div>
                <!-- /.input group -->
              </div> 			  	
              <!-- /.form group --> 
              <div class="form-group">
                <label>国家</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-flag"></i>
                  </div>
             	  <select class="form-control" name="cusSearch.cusNation" id="cusNation" value="${cust.nationCode }" >
                                                <option value="AD">安道尔共和国</option>
                                                <option value="AE">阿联酋</option>
                                                <option value="AF">阿富汗</option>
                                                <option value="AG">安提瓜和巴布达</option>
                                                <option value="AI">安圭拉岛</option>
                                                <option value="AL">	阿尔巴尼亚</option>
                                                <option value="AM">亚美尼亚</option>
                                                <option value="AO">安哥拉</option>
                                                <option value="AQ">南极洲</option>
                                                <option value="AR">阿根廷</option>
                                                <option value="AS">萨摩亚, 美国</option>
                                                <option value="AT">奥地利</option>
                                                <option value="AU">澳大利亚</option>
                                                <option value="AW">阿鲁巴</option>
                                                <option value="AZ">阿塞拜疆</option>
                                                <option value="BA">波黑</option>
                                                <option value="BB">巴巴多斯</option>
                                                <option value="BD">孟加拉国</option>
                                                <option value="BE">比利时</option>
                                                <option value="BF">布基纳法索</option>
                                                <option value="BG">保加利亚</option>
                                                <option value="BH">巴林</option>
                                                <option value="BI">布隆迪</option>
                                                <option value="BJ">贝宁</option>
                                                <option value="BM">	百慕大群岛	</option>
                                                <option value="BN">文莱达鲁萨兰</option>
                                                <option value="BO">玻利维亚</option>
                                                <option value="BQ">博内尔，沙巴</option>
                                                <option value="BR">巴西</option>
                                                <option value="BS">巴哈马(群岛)</option>
                                                <option value="BT">不丹</option>
                                                <option value="BV">布维群岛</option>
                                                <option value="BW">博茨瓦纳</option>
                                                <option value="BY">白俄罗斯</option>
                                                <option value="BZ">伯利兹</option>
                                                <option value="CA">加拿大</option>
                                                <option value="CC">基林群岛</option>
                                                <option value="CD">刚果民主共和国</option>
                                                <option value="CF">中非共和国</option>
                                                <option value="CG">刚果共和国</option>
                                                <option value="CH">瑞士</option>
                                                <option value="CI">象牙海岸</option>
                                                <option value="CK">科克群岛</option>
                                                <option value="CL">智利</option>
                                                <option value="CM">喀麦隆</option>
                                                <option value="CN" selected>中国</option>
                                                <option value="CO">哥伦比亚</option>
                                                <option value="CR">哥斯答黎加</option>
                                                <option value="CS">塞尔维亚/Monten</option>
                                                <option value="CU">古巴</option>
                                                <option value="CV">佛得角群岛</option>
                                                <option value="CW">库拉索岛</option>
                                                <option value="CX">圣诞岛</option>
                                                <option value="CY">塞浦路斯</option>
                                                <option value="CZ">捷克共和国</option>
                                                <option value="DE">德国</option>
                                                <option value="DJ">吉布提</option>
                                                <option value="DK">丹麦</option>
                                                <option value="DM">多米尼加</option>
                                                <option value="DO">多米尼加共和国</option>
                                                <option value="DZ">阿尔及利亚</option>
                                                <option value="EC">厄瓜多尔</option>
                                                <option value="EE">爱沙尼亚</option>
                                                <option value="EG">埃及</option>
                                                <option value="EH">撒哈拉西部</option>
                                                <option value="ER">埃立特里亚</option>
                                                <option value="ES">西班牙</option>
                                                <option value="ET">埃塞俄比亚</option>
                                                <option value="FI">芬兰</option>
                                                <option value="FJ">斐济</option>
                                                <option value="FK">福克兰群岛</option>
                                                <option value="FM">密克罗尼西亚</option>
                                                <option value="FO">法罗群岛</option>
                                                <option value="FR">法国</option>
                                                <option value="GA">加蓬</option>
                                                <option value="GB">英国</option>
                                                <option value="GD">格林纳达</option>
                                                <option value="GE">乔治亚</option>
                                                <option value="GF">法属圭亚那</option>
                                                <option value="GG">格恩西</option>
                                                <option value="GH">加纳</option>
                                                <option value="GI">直布罗陀</option>
                                                <option value="GL">格陵兰岛</option>
                                                <option value="GM">冈比亚</option>
                                                <option value="GN">几内亚</option>
                                                <option value="GP">瓜达洛普</option>
                                                <option value="GQ">赤道几内亚</option>
                                                <option value="GR">希腊</option>
                                                <option value="GS">南三维治岛</option>
                                                <option value="GT">危地马拉</option>
                                                <option value="GU">关岛</option>
                                                <option value="GW">几内亚比绍</option>
                                                <option value="GY">圭亚那</option>
                                                <option value="HK">中国香港</option>    
                                                <option value="HM">荷德/马克多纳岛</option>
                                                <option value="HN">洪都拉斯</option>
                                                <option value="HR">克罗地亚</option>
                                                <option value="HT">海地</option>
                                                <option value="HU">匈牙利</option>
                                                <option value="ID">印度尼西亚</option>
                                                <option value="IE">爱尔兰</option>
                                                <option value="IL">以色列</option>
                                                <option value="IM">马恩岛</option>
                                                <option value="IN">印度</option>
                                                <option value="IO">英属印度洋区</option>
                                                <option value="IQ">伊拉克</option>
                                                <option value="IR">伊朗</option>
                                                <option value="IS">冰岛</option>
                                                <option value="IT">意大利</option>
                                                <option value="JE">泽西</option>
                                                <option value="JM">牙买加</option>
                                                <option value="JO">约旦</option>
                                                <option value="JP">日本</option>
                                                <option value="KE">肯尼亚</option>
                                                <option value="KG">吉尔吉斯斯坦</option>
                                                <option value="KH">柬埔寨</option>
                                                <option value="KI">基里巴斯</option>
                                                <option value="KM">科摩罗群岛</option>
                                                <option value="KN">圣基茨和那维斯</option>
                                                <option value="KP">北朝鲜</option>
                                                <option value="KR">韩国</option>
                                                <option value="KW">科威特</option>
                                                <option value="KY">开曼群岛</option>
                                                <option value="KZ">哈萨克斯坦</option>
                                                <option value="LA">老挝</option>
                                                <option value="LB">黎巴嫩</option>
                                                <option value="LC">圣路西亚</option>
                                                <option value="LI">列支敦士登</option>
                                                <option value="LK">斯里兰卡</option>
                                                <option value="LR">利比里亚</option>
                                                <option value="LS">莱索托</option>
                                                <option value="LT">立陶宛</option>
                                                <option value="LU">卢森堡</option>
                                                <option value="LV">拉脱维亚</option>
                                                <option value="LY">利比亚</option>
                                                <option value="MA">摩洛哥</option>
                                                <option value="MC">摩纳哥</option>
                                                <option value="MD">摩尔多瓦</option>
                                                <option value="MG">马达加斯加</option>
                                                <option value="MH">马绍尔群岛</option>
                                                <option value="MK">马其顿</option>
                                                <option value="ML">马里</option>
                                                <option value="MM">缅甸</option>
                                                <option value="MN">蒙古</option>
                                                <option value="MO">中国澳门</option>
                                                <option value="MP">北马里亚纳</option>
                                                <option value="MQ">马提尼克</option>
                                                <option value="MR">毛里塔尼亚</option>
                                                <option value="MS">蒙塞拉特岛</option>
                                                <option value="MT">马耳他</option>
                                                <option value="MU">毛里求斯</option>
                                                <option value="MV">马尔代夫</option>
                                                <option value="MW">马拉维</option>
                                                <option value="MX">墨西哥</option>
                                                <option value="MY">马来西亚</option>
                                                <option value="MZ">莫桑比克</option>
                                                <option value="NA">纳米比亚</option>
                                                <option value="NC">新喀里多尼亚</option>
                                                <option value="NE">尼日尔</option>
                                                <option value="NF">诺福克岛</option>
                                                <option value="NG">尼日利亚</option>
                                                <option value="NI">尼加拉瓜</option>
                                                <option value="NL">荷 兰</option>
                                                <option value="NO">挪威</option>
                                                <option value="NP">尼泊尔</option>
                                                <option value="NR">瑙鲁</option>
                                                <option value="NU">纽埃群岛</option>
                                                <option value="NZ">新西兰</option>
                                                <option value="OM">阿曼</option>
                                                <option value="PA">巴拿马</option>
                                                <option value="PE">秘鲁</option>
                                                <option value="PF">法属波利尼西亚</option>
                                                <option value="PG">巴布亚新几内亚</option>
                                                <option value="PH">菲律宾</option>
                                                <option value="PK">巴基斯坦</option>
                                                <option value="PL">波兰</option>
                                                <option value="PM">圣皮埃尔/密克隆</option>
                                                <option value="PN">皮特肯岛</option>
                                                <option value="PR">波多黎哥</option>
                                                <option value="PS">巴基斯坦</option>
                                                <option value="PT">葡萄牙</option>
                                                <option value="PW">帕劳</option>
                                                <option value="PY">巴拉圭</option>
                                                <option value="QA">卡塔尔</option>
                                                <option value="RE">统一</option>
                                                <option value="RO">罗马尼亚</option>
                                                <option value="RU">俄罗斯联邦</option>
                                                <option value="RW">卢旺达</option>
                                                <option value="SA">沙特阿拉伯</option>
                                                <option value="SB">所罗门群岛</option>
                                                <option value="SC">塞舌尔群岛</option>
                                                <option value="SD">苏丹</option>
                                                <option value="SE">瑞典</option>
                                                <option value="SG">新加坡</option>
                                                <option value="SH">圣赫勒拿岛</option>
                                                <option value="SI">斯洛文尼亚</option>
                                                <option value="SJ">皮特肯岛</option>
                                                <option value="SK">斯洛伐克</option>
                                                <option value="SL">塞拉利昂</option>
                                                <option value="SM">圣马力诺</option>
                                                <option value="SN">塞内加尔</option>
                                                <option value="SO">索马里</option>
                                                <option value="SR">苏里南</option>
                                                <option value="SS">南苏丹</option>
                                                <option value="ST">圣多马/普林西比</option>
                                                <option value="SV">萨尔瓦多</option>
                                                <option value="SX">圣马丁</option>
                                                <option value="SY">叙利亚</option>
                                                <option value="SZ">斯威士兰</option>
                                                <option value="TC">	特克斯凯科斯</option>
                                                <option value="TD">乍得</option>
                                                <option value="TF">法国南部地区</option>
                                                <option value="TG">多哥</option>
                                                <option value="TH">泰国</option>
                                                <option value="TJ">塔吉克斯坦</option>
                                                <option value="TK">托客劳群岛</option>
                                                <option value="TL">东帝汶岛</option>
                                                <option value="TM">土库曼斯坦</option>
                                                <option value="TN">突尼斯</option>
                                                <option value="TO">汤加</option>
                                                <option value="TP">东帝汶岛</option>
                                                <option value="TR">土耳其</option>
                                                <option value="TT">特立尼达/多巴哥</option>
                                                <option value="TV">图瓦卢</option>
                                                <option value="TW">台湾</option>
                                                <option value="TZ">坦桑尼亚</option>
                                                <option value="UA">乌克兰</option>
                                                <option value="UG">乌干达</option>
                                                <option value="UM">小奥特兰群岛</option>
                                                <option value="UN">国际</option>
                                                <option value="US">美国</option>
                                                <option value="UY">乌拉圭</option>
                                                <option value="UZ">乌兹别克斯坦</option>
                                                <option value="VA">梵蒂冈城</option>
                                                <option value="VC">圣文森特</option>
                                                <option value="VE">委内瑞拉</option>
                                                <option value="VG">英属维尔京群岛</option>
                                                <option value="VI">美属维尔京群岛</option>
                                                <option value="VN">越南</option>
                                                <option value="VU">瓦努阿图</option>
                                                <option value="WF">瓦利斯/富图纳岛</option>
                                                <option value="WS">萨摩亚</option>
                                                <option value="YE">也门</option>
                                                <option value="YT">马约特岛</option>
                                                <option value="ZA">南非</option>
                                                <option value="ZM">赞比亚</option>
                                                <option value="ZW">津巴布韦</option>
                                            </select>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->      
              <div class="form-group">
                <label>客户电话</label>
                <div class="input-group" style="border:solid 1px red">
                  <div class="input-group-addon">
                    <i class="fa fa-phone"></i>
                  </div>
                  <input type="text" id="cusTelephone" name="cusSearch.cusTelephone" class="form-control" value="${cust.telephone }" >
                </div>
                <!-- /.input group -->
              </div>
<!--             <div class="box-footer">
                <button type="submit" class="btn btn-primary pull-right">创建</button>
              </div>  -->                                               
            </div>
            <!-- /.box-body -->
          </div>   <!--  end of box -->
          </div>	<!--  end of right -->
          </form>   <!-- end of form  -->	
          </div>   <!--  end of row -->
          
          
        <!-- /.box-body -->
      </div>
      <div class="box box-default" >  <!--  start of contacts  -->
        <div class="box-header with-border">
          <h3 class="box-title">创建联系人</h3>
              <div class="pull-right box-tools">
              	<button type="button" id="createContactBtn" class="btn btn-info btn-sm"  data-toggle="modal" data-target="#contactsModal" title="新建联系人">
                 	 新建</button>
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fa fa-minus"></i></button>
              <!--   <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove">
                  <i class="fa fa-times"></i></button> -->
              </div>
        </div>
        <div class="box-body no-padding" id="contactsDiv">
              <table class="table table-striped" id="contactsTable" name="contactsTable" >
                <tr>
                  <th style="width: 90px">操作</th>
                  <th style="width: 90px">姓名</th>
                  <th style="width: 90px">电话</th>
                  <th style="width: 90px">职务</th>
                  <th style="width: 90px">电子邮件</th>
                </tr>
              </table>
            </div>
            <!-- /.box-body -->
      </div>		<!--  end of contacts -->
      <!--  end base information -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>YUTO-Mobile</b>CRM
			</div>
			<strong>欢迎使用YUTO-MobileCRM.</strong> 
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane" id="control-sidebar-home-tab">

					<!-- /.control-sidebar-menu -->
				</div>
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>

	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.3 -->
	<!-- Bootstrap 3.3.6 -->
	<script src="${path}/js/bootstrap-admin/bootstrap/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="${path}/js/bootstrap-admin/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="${path}/js/bootstrap-admin/dist/js/app.min.js"></script>
	<!-- Sparkline -->
	<script
		src="${path}/js/bootstrap-admin/plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script
		src="${path}/js/bootstrap-admin/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${path}/js/bootstrap-admin/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script
		src="${path}/js/bootstrap-admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="${path}/js/bootstrap-admin/plugins/chartjs/Chart.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="${path}/js/bootstrap-admin/dist/js/pages/dashboard2.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${path}/js/bootstrap-admin/dist/js/demo.js"></script>
</body>
</html>
