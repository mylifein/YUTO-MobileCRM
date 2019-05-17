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
				<!-- 		<li><a href="#" data-toggle="control-sidebar"><i
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
				<!-- /.search form -->
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
			            <li><a href="${path}/CusSearch.jsp"><i class="fa fa-circle-o"></i>客户搜索</a></li>
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
				<h1>日常活动界面</h1>
				<ol class="breadcrumb">
					<li><a href="${path }/homePage.jsp"><i class="fa fa-home"></i> 主页</a></li>
					<li class="active">日常活动计划单</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Main row -->
		<div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">日常活动计划单明细</h3>
        </div>
        <!-- /.box-header -->
        <div class="row">
        <fieldset disabled>
        <div class="col-md-6">
          <div class="box box-danger">
            <div class="box-body">
              <!-- Date dd/mm/yyyy -->
              <div class="form-group">
                <label>活动标识</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-paw"></i>
                  </div>
                  <input type="text" id="actMark" name="actMark"
													value="${dailyAct.actMark}" class="form-control">
                </div>
                <!-- /.input group -->
              </div>              
              <div class="form-group">
                <label>活动类型</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-object-group"></i>
                  </div>
					<input type="text" id="activityType" name="activityType"
													value="${dailyAct.activityType}" class="form-control">
                </div>
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>出差类型</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-puzzle-piece"></i>
                  </div>
                  <input type="text" id="businessType" name="businessType"
													value="${dailyAct.businessType}" class="form-control">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->              
              <div class="form-group">
                <label>活动描述</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-tablet"></i>
                  </div>
                  <input type="text" id="actDes" name="actDesc"
												value="${dailyAct.actDesc}" class="form-control">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
               <div class="form-group">
                <label>地点</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-location-arrow"></i>
                  </div>
                  <input type="text" id="location"
												value="${dailyAct.location}" class="form-control">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
                <div class="form-group">
                <label>负责员工</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-user-plus"></i>
                  </div>
                  <input type="text" id="chargePerson" name="chargePerson"
												value="${dailyAct.chargePerson}" class="form-control">
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
                <label>活动状态</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa  fa-compass"></i> 
                  </div>
                  <select class="form-control" name="statust" id="status" value="${dailyAct.status}">
                 	<option value="E0001"  ${dailyAct.status == "E0001" ? 'selected' : '' } >新建</option>
                 	<option value="E0002"  ${dailyAct.status == "E0002" ? 'selected' : '' } >任务进行中</option> 
                  	<option value="E0008"  ${dailyAct.status == "E0008" ? 'selected' : '' } >发送日常任务</option> 
                  </select>
                      
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
                  <input type="text" id="customer" name="customer"
												value="${dailyAct.cust}" class="form-control">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>客户联系人</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-user-plus"></i>
                  </div>
                  <input class="form-control" type="text" name="custAct"
												id="custAct"  value="${dailyAct.custAct}" >
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>费用合计</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-money"></i>
                  </div>
                  <input class="form-control" type="text" name="totalExpense"
												id="totalExpense" value="${dailyAct.totalExpense}" >
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->                
              <div class="form-group">
                <label>负责部门</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-building"></i>
                  </div>
                  <input type="text" id="department" name="department"
												value="${dailyAct.department}" class="form-control">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group --> 
              <div class="form-group">
                <label>开始日期</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-hourglass-start"></i>
                  </div>
                  <input type="text" id="department" name="department"
												value="${dailyAct.actStartDate} - ${dailyAct.startTime } " class="form-control">
												
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->   
              <div class="form-group">
                <label>结束日期</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-hourglass-o"></i>
                  </div>
                  <input type="text" id="department" name="department"
												value="${dailyAct.actEndDate} - ${dailyAct.endTime } " class="form-control">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->                                                                                                               
            </div>
            <!-- /.box-body -->
          </div>   <!--  end of box -->
          </div>	<!--  end of right -->
          </fieldset> <!-- end of fieldset -->
          </div>   <!--  end of row -->
        <!-- /.box-body -->
      </div>
      <!--  end base information -->
      <!--  start schedule list information -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">日程列表</h3>
        </div>
        <!-- /.box-header -->
        <div class="row">
        <fieldset disabled>
        <div class="col-md-12">
          <div class="box">
            <!-- /.box-header -->
            <div class="box-body no-padding">
            <div class="table-responsive">
              <table class="table table-striped">
                <tr>
                  <th>序号</th>
                  <th>出发日期</th>
                  <th>到达日期</th>
                  <th>出发地点</th>
                  <th>到达地点</th>
                  <th>交通方式</th>
                </tr>
                <c:forEach var="schedule" items="${scheList}">
                <tr>
                  <td><span class="badge bg-green">${schedule.item }</span></td>
                  <td><span class="badge bg-red">${schedule.departDate }</span></td>
                  <td><span class="badge bg-red">${schedule.arriveDate }</span></td>
                  <td><span class="badge bg-blue">${schedule.departSite}</span></td>
                  <td><span class="badge bg-blue">${schedule.arriveSite}</span></td>
                  <td><span class="badge bg-purple">${schedule.vehicle }</span></td>
                </tr>
                </c:forEach>
              </table>
             </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->  
         </div>     <!-- end of col --> 
         </fieldset>  <!-- end of fieldset -->        
        </div>   <!--  end of row -->
        <!-- /.box-body -->
      </div>	
      <!--  end of schedule list information -->
      <!--  start schedule budget information -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">日常活动费用估算</h3>
        </div>
        <!-- /.box-header -->
        <div class="row">
        <div class="col-md-12">
          <div class="box">
            <!-- /.box-header -->
            <div class="box-body no-padding">
        
              <table class="table table-striped">
                <tr>
                  <th>序号</th>
                  <th>预算项编码</th>
                  <th>可用余额</th>
                  <th>估算金额</th>
                  <th>酒店单价</th>
                  <th>住宿天数</th>
                  <th>往返交通费用</th>
                  <th>短途费用</th>
                  <th>餐补</th>
                  <th>其他</th>
                </tr>
                <c:forEach var="actExpenseList" items="${actExpenseList}">
                <tr>
                  <td><span class="badge bg-green">${actExpenseList.item }</span></td>
                  <td><span class="badge bg-yellow">${actExpenseList.budgetNo }</span></td>
                  <td><span class="badge bg-red">${actExpenseList.balanceMoney }</span></td>
                  <td><span class="badge bg-blue">${actExpenseList.evaluateExpense }</span></td>
                  <td><span class="badge bg-purple">${actExpenseList.hotelPrice }</span></td>
                  <td><span class="badge bg-grey">${actExpenseList.boardDays }天</span></td>
                  <td><span class="badge bg-silver">${actExpenseList.shuttleExpense }</span></td>
                  <td><span class="badge bg-khaki">${actExpenseList.tripExpense }</span></td>
                  <td><span class="badge bg-brown">${actExpenseList.eatCompensation }</span></td>
                  <td><span class="badge bg-azure">${actExpenseList.other }</span></td>
                </tr>
                </c:forEach>
              </table>
        
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->  
         </div>     <!-- end of col --> 
        </div>   <!--  end of row -->
        <!-- /.box-body -->
      </div>	
      <!--  end of contact information -->	

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
