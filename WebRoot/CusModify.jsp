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
            tr:hover{
                background-color:#708090
            }
        </style>
   		 <script>
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
                		console.log(list[i].employeeName);
                		console.log(list[i].employeeMark);
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
/*        	$(function(){
       		alert("进入了selectfunction");
           	$("#belongBu option[value='" + ${cust.belongBU } + "']").attr("selected",true);
           	$("#cusNation option[value='" + ${cust.nationCode } + "']").attr("selected",true);
           	$("#cusClass option[value='" + ${cust.cusClass } + "']").attr("selected",true);	
       
       	}) */
    </script>          
</head>
<body class="hold-transition skin-blue sidebar-mini">
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
        <!--  end of modal -->
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
		<!-- 				<li><a href="#" data-toggle="control-sidebar"><i
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
					<li class="active treeview"><a href="${path }/homePage.jsp"><i
							class="fa fa-home"></i> <span>主页</span></a></li>
			        <li class="treeview">
			          <a href="#">
			            <i class="fa fa-user"></i> <span>客户</span>
			                <span class="pull-right-container">
			                  <i class="fa fa-angle-left pull-right"></i>
			                </span>
			          </a>
			          <ul class="treeview-menu">
			            <c:if test="${EV_QUERY == 'Q' }"><li><a href="${path}/CusSearch.jsp"><i class="fa fa-circle-o"></i>客户搜索</a></li></c:if> 
			            <c:if test="${EV_CREATE == 'C' }"><li ><a href="${path}/CusCreation.jsp"><i class="fa fa-circle-o"></i>客户创建</a></li></c:if>     
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
				<h1>客户修改界面</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-home"></i> 主页</a></li>
					<li class="active">客户修改界面</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Main row -->
		<div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">客户基本信息</h3>
        </div>
        <!-- /.box-header -->
        <form  action="${path}/cus/creation.do" method="post">
        <div class="row">
        
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
                  <input type="text" id="customerCategory" name="customerCategory" class="form-control" placeholder="线索客户" disabled>
                </div>
              </div>
              <div class="form-group">
                <label>客户编号</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-paw"></i>
                  </div>
                  <input type="text" id="customerMark" name="customerMark" class="form-control" value="${cust.cusMark }"  disabled>
                  <input type="hidden" id="customerNo" name="customerNo" class="form-control" value="${cust.cusMark }"  >
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>客户类别</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-puzzle-piece"></i>
                  </div>
                  <select class="form-control" name="cusClass" id="cusClass" value= "${cust.cusClass }" >
                  	<option value=""  ${cust.cusClass == "" ? 'selected' : '' }></option>  
                  	<option value="A"  ${cust.cusClass == "A" ? 'selected' : '' }>国内客户</option>
                   	<option value="B"  ${cust.cusClass == "B" ? 'selected' : '' }>国外客户</option>   
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
                  <input type="text" id="cusName"  name="cusName" class="form-control" value="${cust.cusCnName }">
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
                  <input type="text" id="cusEnName"  name="cusEnName" class="form-control" value="${cust.cusEnName }" >
                </div>
                <!-- /.input group -->
              </div>

              <!-- /.form group -->              
              <div class="form-group">
                <label>客户简称</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-user"></i>
                  </div>
                  <input type="text" id="cusAbbr" name="cusAbbr" class="form-control" value="${cust.cusAbbrName }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>客户类别</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-puzzle-piece"></i>
                  </div>
                  <select class="form-control" name="cusClass" id="cusClass" value= "${cust.cusClass }" >
                  	<option value=""  ${cust.cusClass == "" ? 'selected' : '' }></option>  
                  	<option value="A"  ${cust.cusClass == "A" ? 'selected' : '' }>国内客户</option>
                   	<option value="B"  ${cust.cusClass == "B" ? 'selected' : '' }>国外客户</option>   
            	  </select>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->              
                <div class="form-group">
                <label>负责业务员</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-user-plus"></i>
                  </div>
                  <input type="text" id="chargeSman" name="chargeSman" class="form-control"  value="${cust.chargeSalesman }" disabled>
                  <input type="hidden" id="clerkMark" name="clerkMark" value="${cust.chargeSmanId }">	      
         		  <input type="hidden" id="creater" name="creater" value="${sessionScope.userName }" >	
               	  <span class="input-group-btn">
                      <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
                  </span>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->

            </div>
            <!-- /.box-body -->
          </div>   <!--  end of box -->
         			
          </div> 	<!--  end of left -->
          <div class="col-md-6">  <!--  start of right -->
          	<div class="box box-danger">
            <div class="box-body">                        
              <div class="form-group">
                <label>地区</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-location-arrow"></i>
                  </div>
                  <select class="form-control" name="cusDistrict" id="cusDistrict" value="${cust.zone }">
                                                <option value="A001" ${cust.zone == "A001" ? 'selected' : ''} >东北</option>
                                                <option value="A002" ${cust.zone == "A002" ? 'selected' : ''}>华北</option>
                                                <option value="A003" ${cust.zone == "A003" ? 'selected' : ''}>华东</option>
                                                <option value="A004" ${cust.zone == "A004" ? 'selected' : ''}>华中</option> 
                                                <option value="A005" ${cust.zone == "A005" ? 'selected' : ''}>华南</option>
                                                <option value="A006" ${cust.zone == "A006" ? 'selected' : ''}>西北</option>
                                                <option value="A007" ${cust.zone == "A007" ? 'selected' : ''}>西南</option>
                                                <option value="A008" ${cust.zone == "A008" ? 'selected' : ''}>中南</option>
                                                <option value="A009" ${cust.zone == "A009" ? 'selected' : ''}>香港</option>
                                                <option value="A010" ${cust.zone == "A010" ? 'selected' : ''}>澳门</option>
                                                <option value="A011" ${cust.zone == "A011" ? 'selected' : ''}>国际</option>
                                                <option value="A012" ${cust.zone == "A012" ? 'selected' : ''}>台湾</option>
                                                <option value="B001" ${cust.zone == "B001" ? 'selected' : ''}>北部</option>
                                                <option value="B002" ${cust.zone == "B002" ? 'selected' : ''}>南部</option>
                                                <option value="B003" ${cust.zone == "B003" ? 'selected' : ''}>德国</option>
                                                <option value="B004" ${cust.zone == "B004" ? 'selected' : ''}>法国</option>    
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
                    <select class="form-control" name="belongBu" id="belongBu" value="${cust.belongBU }">
                                                <option value="30"  ${cust.belongBU == "30" ? 'selected' : '' }>IT事业处石岩厂区</option>
                                                <option value="32"  ${cust.belongBU == "32" ? 'selected' : '' }>礼盒专案</option>
                                                <option value="36"  ${cust.belongBU == "36" ? 'selected' : '' }>深圳裕同</option>
                                                <option value="37"  ${cust.belongBU == "37" ? 'selected' : '' }>苏州裕同</option>    
                                                <option value="39"  ${cust.belongBU == "39" ? 'selected' : '' }>精品包装</option>
                                                <option value="40"  ${cust.belongBU == "40" ? 'selected' : '' }>泸州裕同</option>
                                                <option value="41"  ${cust.belongBU == "41" ? 'selected' : '' }>九江裕同</option>
                                                <option value="42"  ${cust.belongBU == "42" ? 'selected' : '' }>成都裕同</option>
                                                <option value="43"  ${cust.belongBU == "43" ? 'selected' : '' }>许昌裕同</option>
                                                <option value="44"  ${cust.belongBU == "44" ? 'selected' : '' }>烟台裕同</option>
                                                <option value="45"  ${cust.belongBU == "45" ? 'selected' : '' }>苏州810B</option>
                                                <option value="46"  ${cust.belongBU == "46" ? 'selected' : '' }>珠海裕同</option>
                                                <option value="47"  ${cust.belongBU == "47" ? 'selected' : '' }>武汉裕同</option>
                                                <option value="48"  ${cust.belongBU == "48" ? 'selected' : '' }>合肥裕同</option>
                                                <option value="50"  ${cust.belongBU == "50" ? 'selected' : '' }>合肥裕同</option>
                                                <option value="51"  ${cust.belongBU == "51" ? 'selected' : '' }>东莞裕同</option>    
                                                <option value="52"  ${cust.belongBU == "52" ? 'selected' : '' }>合肥裕同</option>
                                                <option value="54"  ${cust.belongBU == "54" ? 'selected' : '' }>合肥裕同</option>
                                                <option value="55"  ${cust.belongBU == "55" ? 'selected' : '' }>四川君和</option>
                                                <option value="59"  ${cust.belongBU == "59" ? 'selected' : '' }>苏州昆迅</option>
                                                <option value="60"  ${cust.belongBU == "60" ? 'selected' : '' }>毫州裕同</option>
                                                <option value="62"  ${cust.belongBU == "62" ? 'selected' : '' }>说明书事业部</option>
                                                <option value="64"  ${cust.belongBU == "64" ? 'selected' : '' }>IT事业处龙岗厂区</option>
                                                <option value="70"  ${cust.belongBU == "70" ? 'selected' : '' }>酒包BG</option>
                                                <option value="75"  ${cust.belongBU == "75" ? 'selected' : '' }>陕西裕凤</option>
                                                <option value="84"  ${cust.belongBU == "84" ? 'selected' : '' }>深圳商标部</option>
                                                <option value="85"  ${cust.belongBU == "85" ? 'selected' : '' }>重庆裕同</option>
                                                <option value="87"  ${cust.belongBU == "87" ? 'selected' : '' }>供应链中心</option>
                                                <option value="90"  ${cust.belongBU == "90" ? 'selected' : '' }>越南裕展</option>
                                                <option value="92"  ${cust.belongBU == "92" ? 'selected' : '' }>九江810B</option>
                                                <option value="93"  ${cust.belongBU == "93" ? 'selected' : '' }>云创</option>
                                                <option value="94"  ${cust.belongBU == "94" ? 'selected' : '' }>华智</option>
                                                <option value="95"  ${cust.belongBU == "95" ? 'selected' : '' }>裕同电子</option>
                                                <option value="101"  ${cust.belongBU == "101" ? 'selected' : '' }>印想</option>
                                                <option value="104"  ${cust.belongBU == "104" ? 'selected' : '' }>国内ICTBG</option>
                                                <option value="106"  ${cust.belongBU == "106" ? 'selected' : '' }>许昌纸托</option>
                                                <option value="106"  ${cust.belongBU == "106" ? 'selected' : '' }>许昌纸托</option>
                                                <option value="106"  ${cust.belongBU == "106" ? 'selected' : '' }>大健康BG</option>
                                                <option value="114"  ${cust.belongBU == "114" ? 'selected' : '' }>化妆品BG</option>
                                                <option value="115"  ${cust.belongBU == "115" ? 'selected' : '' }>国际BG(B专案)</option>
                                                <option value="116"  ${cust.belongBU == "116" ? 'selected' : '' }>国际BG(Non A)</option>
                                                <option value="51"  ${cust.belongBU == "51" ? 'selected' : '' }>东莞裕同</option>    
                  </select>
                </div>
                <!-- /.input group -->
              </div>
              <div class="form-group">
                <label>国内联系地址</label>

                <div class="input-group" id="domesticAddress" name="domesticAddress">
                  <div class="input-group-addon">
                    <i class="fa fa-location-arrow"></i>
                  </div>
				  <input type="text" id="domestcAddr" name="domesticAddr" class="form-control" value="${cust.domestcAddr }" >
                </div>
              </div>
              <div class="form-group">
              	<label>国外联系地址</label>
                <div class="input-group" id="foreign" name="foreign">
                  <div class="input-group-addon">
                    <i class="fa fa-location-arrow"></i>
                  </div>
				  <input type="text" id="foreignAddr" name="foreignAddr" class="form-control" value="${cust.foreignAddr }">
                </div>
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>邮政编码</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-file-code-o"></i>
                  </div>
                  <input type="text" id="postCode" name="postCode" class="form-control" value="${cust.postCode }">
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
              		<select class="form-control" name="cusNation" id="cusNation" value="${cust.nationCode }" >
                                                <option value="AD" ${cust.nationCode == 'AD' ? 'selected' : '' } >安道尔共和国</option>
                                                <option value="AE" ${cust.nationCode == 'AE' ? 'selected' : '' }>阿联酋</option>
                                                <option value="AF" ${cust.nationCode == 'AF' ? 'selected' : '' }>阿富汗</option>
                                                <option value="AG" ${cust.nationCode == 'AG' ? 'selected' : '' }>安提瓜和巴布达</option>
                                                <option value="AI" ${cust.nationCode == 'AI' ? 'selected' : '' }>安圭拉岛</option>
                                                <option value="AL" ${cust.nationCode == 'AL' ? 'selected' : '' }>	阿尔巴尼亚</option>
                                                <option value="AM" ${cust.nationCode == 'AM' ? 'selected' : '' }>亚美尼亚</option>
                                                <option value="AO" ${cust.nationCode == 'AO' ? 'selected' : '' }>安哥拉</option>
                                                <option value="AQ" ${cust.nationCode == 'AQ' ? 'selected' : '' }>南极洲</option>
                                                <option value="AR" ${cust.nationCode == 'AR' ? 'selected' : '' }>阿根廷</option>
                                                <option value="AS" ${cust.nationCode == 'AS' ? 'selected' : '' }>萨摩亚, 美国</option>
                                                <option value="AT" ${cust.nationCode == 'AT' ? 'selected' : '' }>奥地利</option>
                                                <option value="AU" ${cust.nationCode == 'AU' ? 'selected' : '' }>澳大利亚</option>
                                                <option value="AW" ${cust.nationCode == 'AW' ? 'selected' : '' }>阿鲁巴</option>
                                                <option value="AZ" ${cust.nationCode == 'AZ' ? 'selected' : '' }>阿塞拜疆</option>
                                                <option value="BA" ${cust.nationCode == 'BA' ? 'selected' : '' }>波黑</option>
                                                <option value="BB" ${cust.nationCode == 'BB' ? 'selected' : '' }>巴巴多斯</option>
                                                <option value="BD" ${cust.nationCode == 'BD' ? 'selected' : '' }>孟加拉国</option>
                                                <option value="BE" ${cust.nationCode == 'BE' ? 'selected' : '' }>比利时</option>
                                                <option value="BF" ${cust.nationCode == 'BF' ? 'selected' : '' }>布基纳法索</option>
                                                <option value="BG" ${cust.nationCode == 'BG' ? 'selected' : '' }>保加利亚</option>
                                                <option value="BH" ${cust.nationCode == 'BH' ? 'selected' : '' }>巴林</option>
                                                <option value="BI" ${cust.nationCode == 'BI' ? 'selected' : '' }>布隆迪</option>
                                                <option value="BJ" ${cust.nationCode == 'BJ' ? 'selected' : '' }>贝宁</option>
                                                <option value="BM" ${cust.nationCode == 'BM' ? 'selected' : '' }>	百慕大群岛	</option>
                                                <option value="BN" ${cust.nationCode == 'BN' ? 'selected' : '' }>文莱达鲁萨兰</option>
                                                <option value="BO" ${cust.nationCode == 'BO' ? 'selected' : '' }>玻利维亚</option>
                                                <option value="BQ" ${cust.nationCode == 'BQ' ? 'selected' : '' }>博内尔，沙巴</option>
                                                <option value="BR" ${cust.nationCode == 'BR' ? 'selected' : '' }>巴西</option>
                                                <option value="BS" ${cust.nationCode == 'BS' ? 'selected' : '' }>巴哈马(群岛)</option>
                                                <option value="BT" ${cust.nationCode == 'BT' ? 'selected' : '' }>不丹</option>
                                                <option value="BV" ${cust.nationCode == 'BV' ? 'selected' : '' }>布维群岛</option>
                                                <option value="BW" ${cust.nationCode == 'BW' ? 'selected' : '' }>博茨瓦纳</option>
                                                <option value="BY" ${cust.nationCode == 'BY' ? 'selected' : '' }>白俄罗斯</option>
                                                <option value="BZ" ${cust.nationCode == 'BZ' ? 'selected' : '' }>伯利兹</option>
                                                <option value="CA" ${cust.nationCode == 'CA' ? 'selected' : '' }>加拿大</option>
                                                <option value="CC" ${cust.nationCode == 'CC' ? 'selected' : '' }>基林群岛</option>
                                                <option value="CD" ${cust.nationCode == 'CD' ? 'selected' : '' }>刚果民主共和国</option>
                                                <option value="CF" ${cust.nationCode == 'CF' ? 'selected' : '' }>中非共和国</option>
                                                <option value="CG" ${cust.nationCode == 'CG' ? 'selected' : '' }>刚果共和国</option>
                                                <option value="CH" ${cust.nationCode == 'CH' ? 'selected' : '' }>瑞士</option>
                                                <option value="CI" ${cust.nationCode == 'CI' ? 'selected' : '' }>象牙海岸</option>
                                                <option value="CK" ${cust.nationCode == 'CK' ? 'selected' : '' }>科克群岛</option>
                                                <option value="CL" ${cust.nationCode == 'CL' ? 'selected' : '' }>智利</option>
                                                <option value="CM" ${cust.nationCode == 'CM' ? 'selected' : '' }>喀麦隆</option>
                                                <option value="CN" ${cust.nationCode == 'CN' ? 'selected' : '' }>中国</option>
                                                <option value="CO" ${cust.nationCode == 'CO' ? 'selected' : '' }>哥伦比亚</option>
                                                <option value="CR" ${cust.nationCode == 'CR' ? 'selected' : '' }>哥斯答黎加</option>
                                                <option value="CS" ${cust.nationCode == 'CS' ? 'selected' : '' }>塞尔维亚/Monten</option>
                                                <option value="CU" ${cust.nationCode == 'CU' ? 'selected' : '' }>古巴</option>
                                                <option value="CV" ${cust.nationCode == 'CV' ? 'selected' : '' }>佛得角群岛</option>
                                                <option value="CW" ${cust.nationCode == 'CW' ? 'selected' : '' }>库拉索岛</option>
                                                <option value="CX" ${cust.nationCode == 'CX' ? 'selected' : '' }>圣诞岛</option>
                                                <option value="CY" ${cust.nationCode == 'CY' ? 'selected' : '' }>塞浦路斯</option>
                                                <option value="CZ" ${cust.nationCode == 'CZ' ? 'selected' : '' }>捷克共和国</option>
                                                <option value="DE" ${cust.nationCode == 'DE' ? 'selected' : '' }>德国</option>
                                                <option value="DJ" ${cust.nationCode == 'DJ' ? 'selected' : '' }>吉布提</option>
                                                <option value="DK" ${cust.nationCode == 'DK' ? 'selected' : '' }>丹麦</option>
                                                <option value="DM" ${cust.nationCode == 'DM' ? 'selected' : '' }>多米尼加</option>
                                                <option value="DO" ${cust.nationCode == 'DO' ? 'selected' : '' }>多米尼加共和国</option>
                                                <option value="DZ" ${cust.nationCode == 'DZ' ? 'selected' : '' }>阿尔及利亚</option>
                                                <option value="EC" ${cust.nationCode == 'EC' ? 'selected' : '' }>厄瓜多尔</option>
                                                <option value="EE" ${cust.nationCode == 'EE' ? 'selected' : '' }>爱沙尼亚</option>
                                                <option value="EG" ${cust.nationCode == 'EG' ? 'selected' : '' }>埃及</option>
                                                <option value="EH" ${cust.nationCode == 'EH' ? 'selected' : '' }>撒哈拉西部</option>
                                                <option value="ER" ${cust.nationCode == 'ER' ? 'selected' : '' }>埃立特里亚</option>
                                                <option value="ES" ${cust.nationCode == 'ES' ? 'selected' : '' }>西班牙</option>
                                                <option value="ET" ${cust.nationCode == 'ET' ? 'selected' : '' }>埃塞俄比亚</option>
                                                <option value="FI" ${cust.nationCode == 'FI' ? 'selected' : '' }>芬兰</option>
                                                <option value="FJ" ${cust.nationCode == 'FJ' ? 'selected' : '' }>斐济</option>
                                                <option value="FK" ${cust.nationCode == 'FK' ? 'selected' : '' }>福克兰群岛</option>
                                                <option value="FM" ${cust.nationCode == 'FM' ? 'selected' : '' }>密克罗尼西亚</option>
                                                <option value="FO" ${cust.nationCode == 'FO' ? 'selected' : '' }>法罗群岛</option>
                                                <option value="FR" ${cust.nationCode == 'FR' ? 'selected' : '' }>法国</option>
                                                <option value="GA" ${cust.nationCode == 'GA' ? 'selected' : '' }>加蓬</option>
                                                <option value="GB" ${cust.nationCode == 'GB' ? 'selected' : '' }>英国</option>
                                                <option value="GD" ${cust.nationCode == 'GD' ? 'selected' : '' }>格林纳达</option>
                                                <option value="GE" ${cust.nationCode == 'GE' ? 'selected' : '' }>乔治亚</option>
                                                <option value="GF" ${cust.nationCode == 'GF' ? 'selected' : '' }>法属圭亚那</option>
                                                <option value="GG" ${cust.nationCode == 'GG' ? 'selected' : '' }>格恩西</option>
                                                <option value="GH" ${cust.nationCode == 'GH' ? 'selected' : '' }>加纳</option>
                                                <option value="GI" ${cust.nationCode == 'GI' ? 'selected' : '' }>直布罗陀</option>
                                                <option value="GL" ${cust.nationCode == 'GL' ? 'selected' : '' }>格陵兰岛</option>
                                                <option value="GM" ${cust.nationCode == 'GM' ? 'selected' : '' }>冈比亚</option>
                                                <option value="GN" ${cust.nationCode == 'GN' ? 'selected' : '' }>几内亚</option>
                                                <option value="GP"  ${cust.nationCode == 'GP' ? 'selected' : '' }>瓜达洛普</option>
                                                <option value="GQ" ${cust.nationCode == 'GQ' ? 'selected' : '' }>赤道几内亚</option>
                                                <option value="GR" ${cust.nationCode == 'GR' ? 'selected' : '' }>希腊</option>
                                                <option value="GS" ${cust.nationCode == 'GS' ? 'selected' : '' }>南三维治岛</option>
                                                <option value="GT" ${cust.nationCode == 'GT' ? 'selected' : '' }>危地马拉</option>
                                                <option value="GU" ${cust.nationCode == 'GU' ? 'selected' : '' }>关岛</option>
                                                <option value="GW" ${cust.nationCode == 'GW' ? 'selected' : '' }>几内亚比绍</option>
                                                <option value="GY" ${cust.nationCode == 'GY' ? 'selected' : '' }>圭亚那</option>
                                                <option value="HK" ${cust.nationCode == 'HK' ? 'selected' : '' }>中国香港</option>    
                                                <option value="HM" ${cust.nationCode == 'HM' ? 'selected' : '' }>荷德/马克多纳岛</option>
                                                <option value="HN" ${cust.nationCode == 'HN' ? 'selected' : '' }>洪都拉斯</option>
                                                <option value="HR" ${cust.nationCode == 'HR' ? 'selected' : '' }>克罗地亚</option>
                                                <option value="HT" ${cust.nationCode == 'HT' ? 'selected' : '' }>海地</option>
                                                <option value="HU" ${cust.nationCode == 'HU' ? 'selected' : '' }>匈牙利</option>
                                                <option value="ID" ${cust.nationCode == 'ID' ? 'selected' : '' }>印度尼西亚</option>
                                                <option value="IE" ${cust.nationCode == 'IE' ? 'selected' : '' }>爱尔兰</option>
                                                <option value="IL" ${cust.nationCode == 'IL' ? 'selected' : '' }>以色列</option>
                                                <option value="IM" ${cust.nationCode == 'IM' ? 'selected' : '' }>马恩岛</option>
                                                <option value="IN" ${cust.nationCode == 'IN' ? 'selected' : '' }>印度</option>
                                                <option value="IO" ${cust.nationCode == 'IO' ? 'selected' : '' }>英属印度洋区</option>
                                                <option value="IQ" ${cust.nationCode == 'IQ' ? 'selected' : '' }>伊拉克</option>
                                                <option value="IR" ${cust.nationCode == 'IR' ? 'selected' : '' }>伊朗</option>
                                                <option value="IS" ${cust.nationCode == 'IS' ? 'selected' : '' }>冰岛</option>
                                                <option value="IT" ${cust.nationCode == 'IT' ? 'selected' : '' }>意大利</option>
                                                <option value="JE" ${cust.nationCode == 'JE' ? 'selected' : '' }>泽西</option>
                                                <option value="JM" ${cust.nationCode == 'JM' ? 'selected' : '' }>牙买加</option>
                                                <option value="JO" ${cust.nationCode == 'JO' ? 'selected' : '' }>约旦</option>
                                                <option value="JP" ${cust.nationCode == 'JP' ? 'selected' : '' }>日本</option>
                                                <option value="KE" ${cust.nationCode == 'KE' ? 'selected' : '' }>肯尼亚</option>
                                                <option value="KG" ${cust.nationCode == 'KG' ? 'selected' : '' }>吉尔吉斯斯坦</option>
                                                <option value="KH" ${cust.nationCode == 'KH' ? 'selected' : '' }>柬埔寨</option>
                                                <option value="KI" ${cust.nationCode == 'KI' ? 'selected' : '' }>基里巴斯</option>
                                                <option value="KM" ${cust.nationCode == 'KM' ? 'selected' : '' }>科摩罗群岛</option>
                                                <option value="KN" ${cust.nationCode == 'KN' ? 'selected' : '' }>圣基茨和那维斯</option>
                                                <option value="KP" ${cust.nationCode == 'KP' ? 'selected' : '' }>北朝鲜</option>
                                                <option value="KR" ${cust.nationCode == 'KR' ? 'selected' : '' }>韩国</option>
                                                <option value="KW" ${cust.nationCode == 'KW' ? 'selected' : '' }>科威特</option>
                                                <option value="KY" ${cust.nationCode == 'KY' ? 'selected' : '' }>开曼群岛</option>
                                                <option value="KZ" ${cust.nationCode == 'KZ' ? 'selected' : '' }>哈萨克斯坦</option>
                                                <option value="LA" ${cust.nationCode == 'LA' ? 'selected' : '' }>老挝</option>
                                                <option value="LB" ${cust.nationCode == 'LB' ? 'selected' : '' }>黎巴嫩</option>
                                                <option value="LC" ${cust.nationCode == 'LC' ? 'selected' : '' }>圣路西亚</option>
                                                <option value="LI" ${cust.nationCode == 'LI' ? 'selected' : '' }>列支敦士登</option>
                                                <option value="LK" ${cust.nationCode == 'LK' ? 'selected' : '' }>斯里兰卡</option>
                                                <option value="LR" ${cust.nationCode == 'LR' ? 'selected' : '' }>利比里亚</option>
                                                <option value="LS" ${cust.nationCode == 'LS' ? 'selected' : '' }>莱索托</option>
                                                <option value="LT" ${cust.nationCode == 'LT' ? 'selected' : '' }>立陶宛</option>
                                                <option value="LU" ${cust.nationCode == 'LU' ? 'selected' : '' }>卢森堡</option>
                                                <option value="LV" ${cust.nationCode == 'LV' ? 'selected' : '' }>拉脱维亚</option>
                                                <option value="LY" ${cust.nationCode == 'LY' ? 'selected' : '' }>利比亚</option>
                                                <option value="MA" ${cust.nationCode == 'MA' ? 'selected' : '' }>摩洛哥</option>
                                                <option value="MC" ${cust.nationCode == 'MC' ? 'selected' : '' }>摩纳哥</option>
                                                <option value="MD" ${cust.nationCode == 'MD' ? 'selected' : '' }>摩尔多瓦</option>
                                                <option value="MG" ${cust.nationCode == 'MG' ? 'selected' : '' }>马达加斯加</option>
                                                <option value="MH" ${cust.nationCode == 'MH' ? 'selected' : '' }>马绍尔群岛</option>
                                                <option value="MK" ${cust.nationCode == 'MK' ? 'selected' : '' }>马其顿</option>
                                                <option value="ML" ${cust.nationCode == 'ML' ? 'selected' : '' }>马里</option>
                                                <option value="MM" ${cust.nationCode == 'MM' ? 'selected' : '' }>缅甸</option>
                                                <option value="MN" ${cust.nationCode == 'MN' ? 'selected' : '' }>蒙古</option>
                                                <option value="MO" ${cust.nationCode == 'MO' ? 'selected' : '' }>中国澳门</option>
                                                <option value="MP" ${cust.nationCode == 'MP' ? 'selected' : '' }>北马里亚纳</option>
                                                <option value="MQ" ${cust.nationCode == 'MQ' ? 'selected' : '' }>马提尼克</option>
                                                <option value="MR" ${cust.nationCode == 'MR' ? 'selected' : '' }>毛里塔尼亚</option>
                                                <option value="MS" ${cust.nationCode == 'MS' ? 'selected' : '' }>蒙塞拉特岛</option>
                                                <option value="MT" ${cust.nationCode == 'MT' ? 'selected' : '' }>马耳他</option>
                                                <option value="MU" ${cust.nationCode == 'MU' ? 'selected' : '' }>毛里求斯</option>
                                                <option value="MV" ${cust.nationCode == 'MV' ? 'selected' : '' }>马尔代夫</option>
                                                <option value="MW" ${cust.nationCode == 'MW' ? 'selected' : '' }>马拉维</option>
                                                <option value="MX" ${cust.nationCode == 'MX' ? 'selected' : '' }>墨西哥</option>
                                                <option value="MY" ${cust.nationCode == 'MY' ? 'selected' : '' }>马来西亚</option>
                                                <option value="MZ" ${cust.nationCode == 'MZ' ? 'selected' : '' }>莫桑比克</option>
                                                <option value="NA" ${cust.nationCode == 'NA' ? 'selected' : '' }>纳米比亚</option>
                                                <option value="NC" ${cust.nationCode == 'NC' ? 'selected' : '' }>新喀里多尼亚</option>
                                                <option value="NE" ${cust.nationCode == 'NE' ? 'selected' : '' }>尼日尔</option>
                                                <option value="NF" ${cust.nationCode == 'NF' ? 'selected' : '' }>诺福克岛</option>
                                                <option value="NG" ${cust.nationCode == 'NG' ? 'selected' : '' }>尼日利亚</option>
                                                <option value="NI" ${cust.nationCode == 'NI' ? 'selected' : '' }>尼加拉瓜</option>
                                                <option value="NL" ${cust.nationCode == 'NL' ? 'selected' : '' }>荷 兰</option>
                                                <option value="NO" ${cust.nationCode == 'NO' ? 'selected' : '' }>挪威</option>
                                                <option value="NP" ${cust.nationCode == 'NP' ? 'selected' : '' }>尼泊尔</option>
                                                <option value="NR" ${cust.nationCode == 'NR' ? 'selected' : '' }>瑙鲁</option>
                                                <option value="NU" ${cust.nationCode == 'NU' ? 'selected' : '' }>纽埃群岛</option>
                                                <option value="NZ" ${cust.nationCode == 'NZ' ? 'selected' : '' }>新西兰</option>
                                                <option value="OM" ${cust.nationCode == 'OM' ? 'selected' : '' }>阿曼</option>
                                                <option value="PA" ${cust.nationCode == 'PA' ? 'selected' : '' }>巴拿马</option>
                                                <option value="PE" ${cust.nationCode == 'PE' ? 'selected' : '' }>秘鲁</option>
                                                <option value="PF" ${cust.nationCode == 'PF' ? 'selected' : '' }>法属波利尼西亚</option>
                                                <option value="PG" ${cust.nationCode == 'PG' ? 'selected' : '' }>巴布亚新几内亚</option>
                                                <option value="PH" ${cust.nationCode == 'PH' ? 'selected' : '' }>菲律宾</option>
                                                <option value="PK" ${cust.nationCode == 'PK' ? 'selected' : '' }>巴基斯坦</option>
                                                <option value="PL" ${cust.nationCode == 'PL' ? 'selected' : '' }>波兰</option>
                                                <option value="PM" ${cust.nationCode == 'PM' ? 'selected' : '' }>圣皮埃尔/密克隆</option>
                                                <option value="PN" ${cust.nationCode == 'PN' ? 'selected' : '' }>皮特肯岛</option>
                                                <option value="PR" ${cust.nationCode == 'PR' ? 'selected' : '' }>波多黎哥</option>
                                                <option value="PS" ${cust.nationCode == 'PS' ? 'selected' : '' }>巴基斯坦</option>
                                                <option value="PT" ${cust.nationCode == 'PT' ? 'selected' : '' }>葡萄牙</option>
                                                <option value="PW" ${cust.nationCode == 'PW' ? 'selected' : '' }>帕劳</option>
                                                <option value="PY" ${cust.nationCode == 'PY' ? 'selected' : '' }>巴拉圭</option>
                                                <option value="QA" ${cust.nationCode == 'QA' ? 'selected' : '' }>卡塔尔</option>
                                                <option value="RE" ${cust.nationCode == 'RE' ? 'selected' : '' }>统一</option>
                                                <option value="RO" ${cust.nationCode == 'RO' ? 'selected' : '' }>罗马尼亚</option>
                                                <option value="RU" ${cust.nationCode == 'RU' ? 'selected' : '' }>俄罗斯联邦</option>
                                                <option value="RW" ${cust.nationCode == 'RW' ? 'selected' : '' }>卢旺达</option>
                                                <option value="SA" ${cust.nationCode == 'SA' ? 'selected' : '' }>沙特阿拉伯</option>
                                                <option value="SB" ${cust.nationCode == 'SB' ? 'selected' : '' }>所罗门群岛</option>
                                                <option value="SC" ${cust.nationCode == 'SC' ? 'selected' : '' }>塞舌尔群岛</option>
                                                <option value="SD" ${cust.nationCode == 'SD' ? 'selected' : '' }>苏丹</option>
                                                <option value="SE" ${cust.nationCode == 'SE' ? 'selected' : '' }>瑞典</option>
                                                <option value="SG" ${cust.nationCode == 'SG' ? 'selected' : '' }>新加坡</option>
                                                <option value="SH" ${cust.nationCode == 'SH' ? 'selected' : '' }>圣赫勒拿岛</option>
                                                <option value="SI" ${cust.nationCode == 'SI' ? 'selected' : '' }>斯洛文尼亚</option>
                                                <option value="SJ" ${cust.nationCode == 'SJ' ? 'selected' : '' }>皮特肯岛</option>
                                                <option value="SK" ${cust.nationCode == 'SK' ? 'selected' : '' }>斯洛伐克</option>
                                                <option value="SL" ${cust.nationCode == 'SL' ? 'selected' : '' }>塞拉利昂</option>
                                                <option value="SM" ${cust.nationCode == 'SM' ? 'selected' : '' }>圣马力诺</option>
                                                <option value="SN" ${cust.nationCode == 'SN' ? 'selected' : '' }>塞内加尔</option>
                                                <option value="SO" ${cust.nationCode == 'SO' ? 'selected' : '' }>索马里</option>
                                                <option value="SR" ${cust.nationCode == 'SR' ? 'selected' : '' }>苏里南</option>
                                                <option value="SS" ${cust.nationCode == 'SS' ? 'selected' : '' }>南苏丹</option>
                                                <option value="ST" ${cust.nationCode == 'ST' ? 'selected' : '' }>圣多马/普林西比</option>
                                                <option value="SV" ${cust.nationCode == 'SV' ? 'selected' : '' }>萨尔瓦多</option>
                                                <option value="SX" ${cust.nationCode == 'SX' ? 'selected' : '' }>圣马丁</option>
                                                <option value="SY" ${cust.nationCode == 'SY' ? 'selected' : '' }>叙利亚</option>
                                                <option value="SZ" ${cust.nationCode == 'SZ' ? 'selected' : '' }>斯威士兰</option>
                                                <option value="TC" ${cust.nationCode == 'TC' ? 'selected' : '' }>	特克斯凯科斯</option>
                                                <option value="TD" ${cust.nationCode == 'TD' ? 'selected' : '' }>乍得</option>
                                                <option value="TF" ${cust.nationCode == 'TF' ? 'selected' : '' }>法国南部地区</option>
                                                <option value="TG" ${cust.nationCode == 'TG' ? 'selected' : '' }>多哥</option>
                                                <option value="TH" ${cust.nationCode == 'TH' ? 'selected' : '' }>泰国</option>
                                                <option value="TJ" ${cust.nationCode == 'TJ' ? 'selected' : '' }>塔吉克斯坦</option>
                                                <option value="TK" ${cust.nationCode == 'TK' ? 'selected' : '' }>托客劳群岛</option>
                                                <option value="TL" ${cust.nationCode == 'TL' ? 'selected' : '' }>东帝汶岛</option>
                                                <option value="TM" ${cust.nationCode == 'TM' ? 'selected' : '' }>土库曼斯坦</option>
                                                <option value="TN" ${cust.nationCode == 'TN' ? 'selected' : '' }>突尼斯</option>
                                                <option value="TO" ${cust.nationCode == 'TO' ? 'selected' : '' }>汤加</option>
                                                <option value="TP" ${cust.nationCode == 'TP' ? 'selected' : '' }>东帝汶岛</option>
                                                <option value="TR" ${cust.nationCode == 'TR' ? 'selected' : '' }>土耳其</option>
                                                <option value="TT" ${cust.nationCode == 'TT' ? 'selected' : '' }>特立尼达/多巴哥</option>
                                                <option value="TV" ${cust.nationCode == 'TV' ? 'selected' : '' }>图瓦卢</option>
                                                <option value="TW" ${cust.nationCode == 'TW' ? 'selected' : '' }>台湾</option>
                                                <option value="TZ" ${cust.nationCode == 'TZ' ? 'selected' : '' }>坦桑尼亚</option>
                                                <option value="UA" ${cust.nationCode == 'UZ' ? 'selected' : '' }>乌克兰</option>
                                                <option value="UG" ${cust.nationCode == 'UG' ? 'selected' : '' }>乌干达</option>
                                                <option value="UM" ${cust.nationCode == 'UM' ? 'selected' : '' }>小奥特兰群岛</option>
                                                <option value="UN" ${cust.nationCode == 'UN' ? 'selected' : '' }>国际</option>
                                                <option value="US" ${cust.nationCode == 'US' ? 'selected' : '' }>美国</option>
                                                <option value="UY" ${cust.nationCode == 'UY' ? 'selected' : '' }>乌拉圭</option>
                                                <option value="UZ" ${cust.nationCode == 'UZ' ? 'selected' : '' }>乌兹别克斯坦</option>
                                                <option value="VA" ${cust.nationCode == 'VA' ? 'selected' : '' }>梵蒂冈城</option>
                                                <option value="VC" ${cust.nationCode == 'VC' ? 'selected' : '' }>圣文森特</option>
                                                <option value="VE" ${cust.nationCode == 'VE' ? 'selected' : '' }>委内瑞拉</option>
                                                <option value="VG" ${cust.nationCode == 'VG' ? 'selected' : '' }>英属维尔京群岛</option>
                                                <option value="VI" ${cust.nationCode == 'VI' ? 'selected' : '' }>美属维尔京群岛</option>
                                                <option value="VN" ${cust.nationCode == 'VN' ? 'selected' : '' }>越南</option>
                                                <option value="VU" ${cust.nationCode == 'VU' ? 'selected' : '' }>瓦努阿图</option>
                                                <option value="WF" ${cust.nationCode == 'WF' ? 'selected' : '' }>瓦利斯/富图纳岛</option>
                                                <option value="WS" ${cust.nationCode == 'WS' ? 'selected' : '' }>萨摩亚</option>
                                                <option value="YE" ${cust.nationCode == 'YE' ? 'selected' : '' }>也门</option>
                                                <option value="YT" ${cust.nationCode == 'YT' ? 'selected' : '' }>马约特岛</option>
                                                <option value="ZA" ${cust.nationCode == 'ZA' ? 'selected' : '' }>南非</option>
                                                <option value="ZM" ${cust.nationCode == 'ZM' ? 'selected' : '' }>赞比亚</option>
                                                <option value="ZW" ${cust.nationCode == 'ZW' ? 'selected' : '' }>津巴布韦</option>
                                            </select>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->      
              <div class="form-group">
                <label>客户电话</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-phone"></i>
                  </div>
                  <input type="text" id="cusTelephone" name="cusTelephone" class="form-control" value="${cust.telephone }" >
                </div>
                <!-- /.input group -->
              </div>
              <div class="box-footer">
                <button type="submit" class="btn btn-primary pull-right">保存</button>
              </div>                                                       
            </div>
            <!-- /.box-body -->
          </div>   <!--  end of box -->
          </div>	<!--  end of right -->
         
          </div>   <!--  end of row -->
          </form>
        <!-- /.box-body -->
      </div>
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
