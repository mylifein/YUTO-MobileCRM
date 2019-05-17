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
			<!-- 			<li><a href="#" data-toggle="control-sidebar"><i
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
        <li><a href="${path }/homePage.jsp"><i class="fa fa-home"></i> <span>主页</span></a></li>  
			        <li class="treeview">
			          <a href="#">
			            <i class="fa fa-user"></i> <span>客户</span>
			                <span class="pull-right-container">
			                  <i class="fa fa-angle-left pull-right"></i>
			                </span>
			          </a>
			          <ul class="treeview-menu">
			            <li><a href="${path}/clueSearch.jsp"><i class="fa fa-circle-o"></i>客户搜索</a></li>
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
            <li ><a href="${path}/clueSearch.jsp"><i class="fa fa-circle-o"></i> 线索统计报表</a></li>
            <li ><a href="${path}/SatisfactoryInvestigate.jsp"><i class="fa fa-circle-o"></i>客户满意度调查报表</a></li>  
            <li class="active"><a href="${path}/processEffiencyReport.jsp"><i class="fa fa-circle-o"></i>流程时效报表</a></li>        
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
                            流程时效报表
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-table"></i> 报表</a></li>
        <li class="active">流程时效报表</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     <div class="box box-default">
         <div class="box-header with-border">
          <h3 class="box-title">流程时效报表搜索</h3>
       	 </div>
       	 <form  action="${path}/report/efficiencyReport.do" method="get">
		 <div class="box-body">
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-5">
											<select class="form-control" name="#" id="#">
												<option value="" >事务类型</option>
											</select>
                                        </div>
										<div class="col-xs-5">
								            <select class="form-control" name="activityType" id="activityType" value="${searchCondition.activityType }">
								            	<option value="" ></option>
                                                <option value="ZACP" ${searchCondition.activityType == "ZACP"? 'selected' : '' }>市场活动计划单</option>
                                                <option value="ZCA" ${searchCondition.activityType == "ZCA"? 'selected' : '' }>销售合同</option>
                                                <option value="ZCP1" ${searchCondition.activityType == "ZCP1"? 'selected' : '' }>客诉处理</option>
                                                <option value="ZOP1" ${searchCondition.activityType == "ZOP1"? 'selected' : '' }>机会立项申请</option>
                                                <option value="ZPD1" ${searchCondition.activityType == "ZPD1"? 'selected' : '' }>报价主导型项目进度(自主设计方案)</option>
                                                <option value="ZPD2" ${searchCondition.activityType == "ZPD2"? 'selected' : '' }>打样主导型项目进度(自主设计方案)</option>
                                                <option value="ZPD3" ${searchCondition.activityType == "ZPD3"? 'selected' : '' }>招投标型项目进度</option>
                                                <option value="ZPD4" ${searchCondition.activityType == "ZPD4"? 'selected' : '' }>报价主导型项目进度(客户设计方案)</option>
                                                <option value="ZPD7" ${searchCondition.activityType == "ZPD7"? 'selected' : '' }>打样主导型项目进度(客户设计方案)</option>
                                                <option value="ZQT1" ${searchCondition.activityType == "ZQT1"? 'selected' : '' }>报价单</option>
											</select>
										</div>
									</div>
								</div>
                                <div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-5">
											<select class="form-control" name="#" id="#">
												<option value="" >节点代码</option>
											</select>
										</div>
										<div class="col-xs-5">
											<input class="form-control" type="text" name="nodeCode" id="nodeCode" value="${searchCondition.nodeCode }">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-5">
											<select class="form-control" name="#" id="#">
												<option value="" >开始日期时间</option>
											</select>
										</div>
										<div class="col-xs-5">
											<input class="form-control" type="date" name="createDate" id="createDate" value="${searchCondition.createDate }">
										</div>                
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-5">
											<select class="form-control" name="#" id="#">
												<option value="" >结束日期时间</option>
											</select>
										</div>                   
                                        <div class="col-xs-5">
											<input class="form-control" type="date" name="endDate" id="endDate" value="${searchCondition.endDate }">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-5">
											<select class="form-control" name="#" id="#">
												<option value="" selected>创建人</option>
											</select>
										</div>
										<div class="col-xs-5">
								           <input class="form-control" type="text" name="createUser" id="createUser" value="${searchCondition.createUser }">
										</div>
									</div>
								</div>
					</div>	  <!-- end of boxbody  -->	
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
                <thead>
									<tr>
                                        <th style="width: 60px">事务类型</th>
										<th style="width: 60px">事务标识</th>
                                        <th style="width: 60px">描述</th>
										<th style="width: 60px">节点代码</th>
                                        <th style="width: 60px">节点名称</th>
										<th style="width: 60px">节点负责人</th>
										<th style="width: 60px">开始时间</th>
										<th style="width: 60px">结束时间</th>
                                        <th style="width: 60px">标准时效</th>
										<th style="width: 60px">实际时效</th>
										<th style="width: 60px">延误时长</th>
									</tr>
                </thead>
                <tbody>
										<c:forEach var="efficiencyReportList"
											items="${efficiencyReportList }">
											<tr>
												<td style="width: 60px">${efficiencyReportList.businessType }</td>
												<td style="width: 60px">${efficiencyReportList.businessMark }</td>
												<td style="width: 60px">${efficiencyReportList.discription }</td>
												<td style="width: 60px">${efficiencyReportList.nodeCode }</td>
												<td style="width: 60px">${efficiencyReportList.nodeName }</td>
												<td style="width: 60px">${efficiencyReportList.nodeCharger }</td>
												<td style="width: 60px">${efficiencyReportList.startTime }</td>
												<td style="width: 60px">${efficiencyReportList.endTime  }</td>
												<td style="width: 60px">${efficiencyReportList.standardEfficiency }</td>
												<td style="width: 60px">${efficiencyReportList.actualEfficiency }</td>
												<td style="width: 60px">${efficiencyReportList.delayTime }</td>
											</tr>
										</c:forEach>
				</tbody>
                <tfoot>
                </tfoot>
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
    	  } ,
    
    	  "columns" : [
    		  {"width" : "60px"},
    		  {"width" : "60px"},
    		  {"width" : "60px"},
    		  {"width" : "60px"},
    		  {"width" : "60px"},
    		  {"width" : "60px"},
    		  {"width" : "60px"},
    		  {"width" : "60px"},
    		  {"width" : "60px"},
    		  {"width" : "60px"},
    		  {"width" : "60px"}	  
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
