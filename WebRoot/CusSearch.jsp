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
        <li><a href="${path}/homePage.jsp"><i class="fa fa-home"></i> <span>主页</span></a></li> 
        <li class="treeview active">
          <a href="#">
            <i class="fa fa-user"></i> <span>客户</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="${path}/clueSearch.jsp"><i class="fa fa-circle-o"></i>客户搜索</a></li>
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
      <h1>
       	客户搜索界面
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i> 客户</a></li>
        <li class="active">客户搜索</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">客户搜索</h3>
        </div>
        <!-- /.box-header -->
        <form action="${path}/cus/search.do"
							method="get">
        <div class="box-body">
          <div class="row">
          
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-4">
										<select class="form-control" name="selectStatus" id="selectStatus">
											<option value="" selected>交易状态</option>
										</select>
										</div>
										<div class="col-xs-6">
										<select class="form-control" name="status" id="status" value="${cusSearch.status }">
											<option value=""></option>
											<option value="Z001" ${cusSearch.status=="Z001"?'selected':'' }>线索客户</option>
											<option value="Z002" ${cusSearch.status=="Z002"?'selected':'' }>机会客户</option>
											<option value="Z003" ${cusSearch.status=="Z003"?'selected':'' }>正式客户</option>
										</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-4">
										<select class="form-control" name="selectCusNo" id="selectCusNo">
											<option value="" selected>客户编号</option>
										</select>
										</div>
										<div class="col-xs-6">
										<input type="text" class="form-control" id="customerNo"
											name="customerNo" value="${cusSearch.customerNo }">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-4">
										<select class="form-control" name="selectAbbrName"
											id="selectAbbrName">
											<option value="" selected>客户简称</option>
										</select>
										</div>
										<div class="col-xs-6">
										<input type="text" class="form-control" id="cusAbbr"
											name="cusAbbr" value="${cusSearch.cusAbbr }">
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
		 </form>
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
            
              <table id="example1" class="table table-bordered table-striped">
              <colgroup>
              <col/>
              </colgroup>
                <thead>
                <tr>
									<th style="width: 90px">标识</th>
									<th style="width: 90px">客户简称</th>
									<th style="width: 90px">电话</th>
									<th style="width: 90px">地区</th>
									<th style="width: 90px">国家</th>
									<th style="width: 90px">邮政编码</th>
									<th style="width: 10px"></th>
                </tr>
                </thead>
                <tbody>
								<c:forEach var="cus" items="${searchcusList}">
									<tr>
										<td id="Z003" style="width: 90px"><a
											href="${path}/cus/searchList.do?cusMark=${cus.cusMark}&keyJ=search">${cus.cusMark}</a></td>
										<td id="Z004" style="width: 90px">${cus.cusAbbrName}</td>
										<td id="Z005" style="width: 90px">${cus.telephone}</td>
										<td id="Z034" style="width: 90px">
										<c:if test="${cus.zone == '' }"></c:if>
										<c:if test="${cus.zone == 'A001' }">东北</c:if>
										<c:if test="${cus.zone == 'A002' }">华北</c:if>
										<c:if test="${cus.zone == 'A003' }">华东</c:if>
										<c:if test="${cus.zone == 'A004' }">华中</c:if>
										<c:if test="${cus.zone == 'A005' }">华南</c:if>
										<c:if test="${cus.zone == 'A006' }">西北</c:if>
										<c:if test="${cus.zone == 'A007' }">西南</c:if>
										<c:if test="${cus.zone == 'A008' }">中南</c:if>
										<c:if test="${cus.zone == 'A009' }">香港</c:if>
										<c:if test="${cus.zone == 'A010' }">澳门</c:if>
										<c:if test="${cus.zone == 'A011' }">国际</c:if>
										<c:if test="${cus.zone == 'A012' }">台湾</c:if>
										<c:if test="${cus.zone == 'B001' }">北部</c:if>
										<c:if test="${cus.zone == 'B002' }">南部</c:if>
										<c:if test="${cus.zone == 'B003' }">德国</c:if>
										<c:if test="${cus.zone == 'B004' }">法国</c:if>
										</td>
										<td id="Z018" style="width: 90px">${cus.nation}</td>
										<td id="Z027" style="width: 90px">${cus.postCode}</td>
										<td id="modify" style="width: 10px"><c:if test="${cus.businessTypes == 'Z001' && cus.businessStatus == '0' }"><a href="${path}/cus/searchList.do?cusMark=${cus.cusMark}&keyJ=modify" ><span class="fa fa-pencil"></span></a></c:if></td>
									</tr>
								</c:forEach>
                </tbody>
              </table>
        
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
    	  language : {  
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
    	  } ,
	"columns" : [
		{"width" : "90px"},
		{"width" : "90px"},
		{"width" : "90px"},
		{"width" : "90px"},
		{"width" : "90px"},
		{"width" : "90px"},
		{"width" : "90px"}
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
