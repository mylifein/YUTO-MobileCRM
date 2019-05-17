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
  <script type="text/javascript">
  	window.onload = function(){
   		var message = "${sessionScope.message}";
		if(message != "" && message != null){
  			alert(message);
  			<% HttpSession sess = request.getSession();
  			   sess.setAttribute("message", "");				
  			%>  
		}	
  	};
  </script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
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
										<a href="${path}/user/logout.do" class="btn btn-default btn-flat" >退出</a>
									</div>
								</li>
							</ul></li>
						<!-- Control Sidebar Toggle Button -->
					<!-- 	<li><a href="#" data-toggle="control-sidebar"><i
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
					<li class="active treeview"><a href="/crm-mobile/user/homePage.do"><i
							class="fa fa-home"></i> <span>主页</span></a></li>
			        <li class="treeview">
			          <a href="#">
			            <i class="fa fa-user"></i> <span>客户</span>
			                <span class="pull-right-container">
			                  <i class="fa fa-angle-left pull-right"></i>
			                </span>
			          </a>
			          <ul class="treeview-menu">
			           <c:if test="${EV_QUERY == 'Q' }"> <li><a href="${path}/CusSearch.jsp"><i class="fa fa-circle-o"></i>客户搜索</a></li></c:if>
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
				<h1>主页</h1>
				<ol class="breadcrumb">
					<li><a href="/crm-mobile/user/homePage.do"><i class="fa fa-home"></i> 主页</a></li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
				<div class="row">
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-aqua"><i class="fa fa-tree"></i></span>

							<div class="info-box-content">
								<span class="info-box-text"></span> <span
									class="info-box-number"><small></small></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-red"><i class="fa fa-sun-o"></i></span>

							<div class="info-box-content">
								<span class="info-box-text"></span> <span
									class="info-box-number"></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->

					<!-- fix for small devices only -->
					<div class="clearfix visible-sm-block"></div>
					<!-- /.col -->
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-yellow"><i
								class="ion ion-ios-people-outline"></i></span>

							<div class="info-box-content">
								<span class="info-box-text"></span> <span
									class="info-box-number"></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->


				<!-- /.row -->

				<!-- Main row -->
				<div class="row">
					<!-- Left col -->
					<div class="col-md-6">
						<!-- MAP & BOX PANE -->
						<div class="box">
							<div class="box-header with-border">
								<h3 class="box-title">今天的预约</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
								<table class="table table-bordered">
									<tr>
										<td>活动标识</td>
										<td>活动描述</td>
										<td>客户</td>
										<td>地点</td>
										<td>活动开始日期</td>
									</tr>
									<c:forEach var="list1" items="${pageList1}">
										<tr>
											<td id="actMark" name="actMark"><a
												href="${path}/cus/searchHomeItem.do?actMark=${list1.actMark}">${list1.actMark}</a></td>
											<td id="actDesc" name="actDesc">${list1.actDesc}</td>
											<td id="customer" name="customer">${list1.cust}</td>
											<td id="location" name="location">${list1.place}</td>
											<td id="actStartDate" name="actStartDate"><span
												class="badge bg-green">${list1.actStartDate}</span></td>
										</tr>
									</c:forEach>


								</table>
								</div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<ul class="pagination pagination-sm no-margin pull-right">
									<c:if test="${pageUtil1.pageNum > 1 }" ><li><a href="${path}/user/homePage.do?pageNo1=${pageUtil1.pageNum -1}" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li></c:if>
										<c:forEach begin="1" end="${pageUtil1.pageCount }" step="1" var="i" >
											<c:if test="${pageUtil1.pageNum  == i }"><li><a href="${path}/user/homePage.do?pageNo1=${i }"><font color="#ff0000">${i }</font></a></li>
											</c:if>
											<c:if test="${pageUtil1.pageNum  != i }">
												<li><a href="${path}/user/homePage.do?pageNo1=${i }">${i }</a></li>
											</c:if>
			
										</c:forEach>
										
									<c:if test="${pageUtil1.pageNum < pageUtil1.pageCount }"><li><a href="${path}/user/homePage.do?pageNo1=${pageUtil1.pageNum +1}" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li></c:if>
								</ul>
							</div>
						</div>
						<!-- /.box -->

						<!--/.direct-chat -->
					</div>
					<div class="col-md-6">
						<!-- USERS LIST -->
						<div class="box">
							<div class="box-header with-border">
								<h3 class="box-title">未完成的任务</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
								<table class="table table-bordered">
									<tr>
										<td>活动标识</td>
										<td>活动描述</td>
										<td>客户</td>
										<td>地点</td>
										<td>活动开始日期</td>
									</tr>
									<c:forEach var="list2" items="${pageList2}">
										<tr>
											<td id="actMark" name="actMark"><a
												href="${path}/cus/searchHomeItem.do?actMark=${list2.actMark}">${list2.actMark}</a></td>
											<td id="actDesc" name="actDesc">${list2.actDesc}</td>
											<td id="customer" name="customer">${list2.cust}</td>
											<td id="location" name="location">${list2.place}</td>
											<td id="actStartDate" name="actStartDate"><span class="badge bg-red"">${list2.actStartDate}</span></td>
										</tr>
									</c:forEach>
								</table>
								</div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<ul class="pagination pagination-sm no-margin pull-right">
									<c:if test="${pageUtil2.pageNum > 1 }" ><li><a href="${path}/user/homePage.do?pageNo2=${pageUtil2.pageNum -1}" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li></c:if>
										<c:forEach begin="1" end="${pageUtil2.pageCount }" step="1" var="i" >
											<c:if test="${pageUtil2.pageNum  == i }"><li><a href="${path}/user/homePage.do?pageNo2=${i }"><font color="#ff0000">${i }</font></a></li>
											</c:if>
											<c:if test="${pageUtil2.pageNum  != i }">
												<li><a href="${path}/user/homePage.do?pageNo2=${i }">${i }</a></li>
											</c:if>
			
										</c:forEach>
										
									<c:if test="${pageUtil2.pageNum < pageUtil2.pageCount }"><li><a href="${path}/user/homePage.do?pageNo2=${pageUtil2.pageNum +1}&" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li></c:if>
								</ul>
							</div>
						</div>
						<!-- /.box -->

					</div>

				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-md-12">
						<!-- TABLE: LATEST ORDERS -->
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">线索客户</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin">
										<thead>
											<tr>
												<th>标识</th>
												<th>交易状态</th>
												<th>客户简称</th>
												<th>状态码</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="cus" items="${queryList}" >
											<tr>
												<td><a
											href="${path}/cus/searchList.do?cusMark=${cus.cusMark}&keyJ=search">${cus.cusMark}</a></td>
												<td><span class="label label-success">线索客户</span></td>
												<td>${cus.cusAbbrName}</td>
												<td>
												<c:if test="${cus.businessStatus == 0 }"><span class="label label-info">开立</span></c:if>
												<c:if test="${cus.businessStatus == 1 }">提交审批</c:if>		
												<c:if test="${cus.businessStatus == 2 }"><span class="label label-warning">审核中</span></c:if>
												<c:if test="${cus.businessStatus == 3 }"><span class="label label-danger">审批拒绝</span></c:if>
												<c:if test="${cus.businessStatus == 4 }"><span class="label label-success">审批通过</span>	</c:if>
												<c:if test="${cus.businessStatus == 5 }">待审批</c:if>
												<c:if test="${cus.businessStatus == 6 }">留置</c:if>
												<c:if test="${cus.businessStatus == 7 }">停止交易</c:if>	
												</td>
												<td id="modify"><c:if test="${cus.businessTypes == 'Z001' && cus.businessStatus == '0' }"><a href="${path}/cus/searchList.do?cusMark=${cus.cusMark}&keyJ=modify" ><span class="fa fa-pencil"></span></a></c:if></td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<c:if test="${EV_CREATE == 'C' }"><a href="${path}/CusCreation.jsp"
									class="btn btn-sm btn-info btn-flat pull-left">创建线索客户</a></c:if> <c:if test="${EV_QUERY == 'Q' }"> <a href="${path}/CusSearch.jsp"
									class="btn btn-sm btn-default btn-flat pull-right">查看所有客户</a></c:if>
									
							<!-- /.box-footer -->
						</div>
						<!-- end table list -->

					</div>

				</div>

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
<!-- 	  <aside class="control-sidebar control-sidebar-dark">
			Create the tabs
			Tab panes
			<div class="tab-content">
				Home tab content
				<div class="tab-pane" id="control-sidebar-home-tab">

					/.control-sidebar-menu
				</div>
			</div>
		</aside>  -->
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
