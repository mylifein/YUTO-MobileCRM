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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">

			<!-- Logo -->
			<a href="index2.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
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
										<a href="#" class="btn btn-default btn-flat">退出</a>
									</div>
								</li>
							</ul></li>
						<!-- Control Sidebar Toggle Button -->
						<li><a href="#" data-toggle="control-sidebar"><i
								class="fa fa-gears"></i></a></li>
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
				<!-- search form -->
				<form action="#" method="get" class="sidebar-form">
					<div class="input-group">
						<input type="text" name="q" class="form-control"
							placeholder="Search..."> <span class="input-group-btn">
							<button type="submit" name="search" id="search-btn"
								class="btn btn-flat">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- /.search form -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">MAIN NAVIGATION</li>
					<li class="active treeview"><a href="index2.html"><i
							class="fa fa-home"></i> <span>Homepage</span></a></li>
					<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
							<span>报表</span> <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="pages/tables/clueReport.html"><i
									class="fa fa-circle-o"></i>线索申请报表</a></li>
							<li><a href="pages/tables/efficiencyReport.html"><i
									class="fa fa-circle-o"></i>流程时效报表</a></li>
							<li><a href="pages/tables/satisfactoryReport.html"><i
									class="fa fa-circle-o"></i>客户满意度调查报表</a></li>
						</ul></li>			
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>客户界面</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Dashboard</li>
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
                  <select class="form-control" name="businessTypes" id="businessTypes" value="${cust.businessTypes }" disabled>
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
                  <input type="text" id="cusNo"  name="cusNo" class="form-control" value="${cust.cusMark }" disabled>
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
                  <input type="text" id="cusAbbr"  name="cusAbbr" class="form-control" value="${cust.cusAbbrName }" >
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
                  <select class="form-control" name="cusClass" id="cusClass" value="${cust.cusClass }" >
                  	<option value="A" selected>国内客户</option>
                   	<option value="B">国外客户</option>   
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
                  <input type="text" id="creater"  name="creater" class="form-control" value="${cust.chargeSalesman }" disabled>      
               	  <span class="input-group-addon"><i class="fa fa-check"></i></span>
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
                <label>所属区域</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-cloud"></i>
                  </div>
                  <input type="text" id="creater"  name="creater" class="form-control" value="${cust.belongDistrict }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>地区</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-location-arrow"></i>
                  </div>
                  <input type="text" id="creater"  name="creater" class="form-control" value="${cust.zone }">
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
                                                <option value="30" selected>IT事业处石岩厂区</option>
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
                  </select>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>邮政编码</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-file-code-o"></i>
                  </div>
                  <input type="text" id="clue-name" class="form-control" value="${cust.postCode }">
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
                  <input type="text" id="cusNo"  name="cusNo" class="form-control" value="${cust.nationCode }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->      
              <div class="form-group">
                <label>电话</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-phone"></i>
                  </div>
                  <input type="text" id="telephoneNo" name="telephoneNo" class="form-control" value="${cust.telephone }" >
                </div>
                <!-- /.input group -->
              </div>                                                      
            </div>
            <!-- /.box-body -->
          </div>   <!--  end of box -->
          </div>	<!--  end of right -->
         
          </div>   <!--  end of row -->
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
			<strong>Welcome to use YUTO-MobileCRM.</strong> All rights reserved.
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
	<script
		src="${path}/js/bootstrap-admin/plugins/jQuery/jquery-2.2.3.min.js"></script>
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
