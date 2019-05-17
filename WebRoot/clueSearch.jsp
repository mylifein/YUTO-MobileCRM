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
  <title>YUTO-Mobile CRM</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${path}/js/bootstrap-admin/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="${path}/js/bootstrap-admin/plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/js/bootstrap-admin/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${path}/js/bootstrap-admin/dist/css/skins/_all-skins.min.css">

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
        <li><a href="${path}/homePage.jsp "><i class="fa fa-home"></i> <span>主页</span></a></li>
		<li class="treeview">
			<a href="#">
			<i class="fa fa-user"></i> <span>客户</span>
				<span class="pull-right-container">
			    	<i class="fa fa-angle-left pull-right"></i>
			    </span>
			</a>
			<ul class="treeview-menu">
				<li><a href="${path}/CusSearch.jsp"><i class="fa fa-circle-o"></i>客户搜索</a></li>
			    <c:if test="${EV_CREATE == 'C' }"><li ><a href="${path}/CusCreation.jsp"><i class="fa fa-circle-o"></i>客户创建</a></li></c:if>     
			</ul>
		</li> 			          
        <li class="treeview active">
          <a href="#">
            <i class="fa fa-table"></i> <span>报表</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="${path}/clueSearch.jsp"><i class="fa fa-circle-o"></i>线索统计报表</a></li> 
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
      <h1>
       	线索统计报表
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-table"></i> 报表</a></li>
        <li class="active">线索统计报表</li>
      </ol>
    </section>
	
    <!-- Main content -->
    <section class="content">
        <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">线索统计报表搜索</h3>
        </div>
        <!-- /.box-header -->
        <form action="${path}/report/clueReport.do" method="get">
        <div class="box-body">
          <div class="row">
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-4">
											<select class="form-control" name="selectCondiont1" id="selectCondiont1" value="${clueCondition.selectCondiont1 }">
												<option value="OBJECT_ID"  ${clueCondition.selectCondiont1 == "OBJECT_ID"? 'selected' : '' }>线索编号</option>
                                                <option value="DESCRIPTION" ${clueCondition.selectCondiont1 == "DESCRIPTION"? 'selected' : '' }>线索名称</option>
                                                <option value="CUST" ${clueCondition.selectCondiont1 == "CUST"? 'selected' : '' }>客户名称</option>
                                                <option value="CUST_PARTNER" ${clueCondition.selectCondiont1 == "CUST_PARTNER"? 'selected' : '' }>客户编号</option>
											</select>
										</div>
										<div class="col-xs-6">
											<input type="text" id="inputCondition1" name="inputCondition1" class="form-control" value="${clueCondition.inputCondition1 }">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-4">
											<select class="form-control" name="selectCondition2" id="selectCondition2">
												<option value="DESCRIPTION" ${clueCondition.selectCondition2 == "DESCRIPTION" ? 'selected' : '' }>线索名称</option>
												<option value="OBJECT_ID" ${clueCondition.selectCondition2 == "OBJECT_ID" ? 'selected' : '' }>线索编号</option>
                                                <option value="CUST" ${clueCondition.selectCondition2 == "CUST" ? 'selected' : '' }>客户名称</option>
                                                <option value="CUST_PARTNER" ${clueCondition.selectCondition2 == "CUST_PARTNER" ? 'selected' : '' }>客户编号</option>
											</select>
										</div>
										<div class="col-xs-6">
										  <input type="text" id="inputCondition2" name="inputCondition2" class="form-control" value="${clueCondition.inputCondition2 }">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-4">
											<select class="form-control" name="statusCondition" id="statusCondition">
												<option value="STAT" selected>线索状态</option>
											</select>
										</div>
										<div class="col-xs-6">
								            <select class="form-control" name="clueStatus" id="clueStatus" value="${clueCondition.clueStatus }">
                                                <option value="" ></option>
												<option value="E0001" ${clueCondition.clueStatus == "E0001"? 'selected' : '' }>未处理</option>
                                                <option value="E0002" ${clueCondition.clueStatus == "E0002"? 'selected' : '' }>已分配</option>
                                                <option value="E0003" ${clueCondition.clueStatus == "E0003"? 'selected' : '' }>提交评审</option>
                                                <option value="E0004" ${clueCondition.clueStatus == "E0004"? 'selected' : '' }>已转化</option>
                                                <option value="E0005" ${clueCondition.clueStatus == "E0005"? 'selected' : '' }>关闭</option>
											</select>
										</div>
									</div>
								</div>
								
							

            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
        <button type="submit" class="btn btn-primary pull-right"><span class="fa fa-search"></span></button>
        </div>
      </div>
      <!-- /.box -->
      <div class="row">
        <div class="col-xs-12">
        

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">搜索结果</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                                        <th style="width: 60px">线索编号</th>
										<th style="width: 60px">线索名称</th>
                                        <th style="width: 60px">客户编号</th>
										<th style="width: 60px">客户名称</th>
                                        <th style="width: 60px">线索提供人</th>
										<th style="width: 60px">线索跟进入</th>
										<th style="width: 60px">线索提供部门</th>
										<th style="width: 60px">创建日期</th>
                                        <th style="width: 60px">线索到期日期</th>
										<th style="width: 60px">预估项目金额</th>
										<th style="width: 60px">预估项目毛利</th>
										<th style="width: 60px">预估采购时间</th>
                </tr>
                </thead>
                <tbody>
									<c:forEach var="clueReportList" items="${searchList }">
									<tr>
										<td id="clueNo" name="clueNo" style="width: 60px">${clueReportList.clueNo }</td>
										<td id="clueName" name="clueName" style="width: 60px">${clueReportList.clueName }</td>
										<td id="cusNo" name="cusNo" style="width: 60px">${clueReportList.cusNo }</td>
										<td id="cusName" name="cusName" style="width: 60px">${clueReportList.cusName }</td>
										<td id="clueProvider" name="clueProvider" style="width: 60px">${clueReportList.clueProvider }</td>
										<td id="clueTracker" name="clueTracker" style="width: 60px">${clueReportList.clueTracker }</td>
										<td id="clueProvideDep" name="clueProvideDep" style="width: 60px">${clueReportList.clueProvideDep }</td>
										<td id="createDate" name="createDate" style="width: 60px">${clueReportList.createDate }</td>
                                        <td id="clueDueDate" name="clueDueDate" style="width: 60px">${clueReportList.clueDueDate }</td>
										<td id="anticipateProjMoney" name="anticipateProjMoney" style="width: 60px">${clueReportList.anticipateProjMoney }</td>
										<td id="anticipateProProfit" name="anticipateProProfit" style="width: 60px">${clueReportList.anticipateProProfit }</td>
                                        <td id="anticipateBuyDate" name="anticipateBuyDate" style="width: 60px">${clueReportList.anticipateBuyDate }</td>
									</tr>
									</c:forEach>
                </tbody>
              </table>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
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
<script src="${path}/js/bootstrap-admin/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${path}/js/bootstrap-admin/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="${path}/js/bootstrap-admin/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${path}/js/bootstrap-admin/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${path}/js/bootstrap-admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${path}/js/bootstrap-admin/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${path}/js/bootstrap-admin/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${path}/js/bootstrap-admin/dist/js/demo.js"></script>
<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable({
    	"autoWidth": false,
    	  language: {  
    	      "sProcessing": "处理中...",  
    	      "sLengthMenu": "显示 _MENU_ 项结果",  
    	      "sZeroRecords": "没有匹配结果",  
    	      "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",  
    	      "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",  
    	      "sInfoFiltered": "(由 _MAX_ 项结果过滤)",  
    	      "sInfoPostFix": "",  
    	      "sSearch": "搜索:",  
    	      "sUrl": "",  
    	      "sEmptyTable": "表中数据为空",  
    	      "sLoadingRecords": "载入中...",  
    	      "sInfoThousands": ",",  
    	      "oPaginate": {  
    	          "sFirst": "首页",  
    	          "sPrevious": "上页",  
    	          "sNext": "下页",  
    	          "sLast": "末页"  
    	      },  
    	      "oAria": {  
    	          "sSortAscending": ": 以升序排列此列",  
    	          "sSortDescending": ": 以降序排列此列"  
    	      }  
    	      
    	  },
    
		"aoColumns" : [
				{"sWidth" : "60px"},
				{"sWidth" : "60px"},
				{"sWidth" : "60px"},
				{"sWidth" : "60px"},
				{"sWidth" : "60px"},
				{"sWidth" : "60px"},
				{"sWidth" : "60px"},
				{"sWidth" : "60px"},
				{"sWidth" : "60px"},
				{"sWidth" : "60px"},
				{"sWidth" : "60px"},
				{"sWidth" : "60px"}
			]
    	
    });
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>
</body>
</html>
