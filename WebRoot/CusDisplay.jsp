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
<script>
function logOut(){
	
	window.location.href="${path}/user/logout.do";
	
}
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
			            <li><a href="${path}/clueSearch.jsp"><i class="fa fa-circle-o"></i>客户搜索</a></li>
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
				<h1>客户界面</h1>
				<ol class="breadcrumb">
					<li><a href="${path }/homePage.jsp"><i class="fa fa-home"></i>主页</a></li>
					<li class="active">客户详细界面</li>
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
        <fieldset disabled>
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
                  <select class="form-control" name="businessTypes" id="businessTypes" value="${cust.businessTypes }">
                                                    <option value="Z001" ${cust.businessTypes == "Z001"? 'selected':'' }>线索客户</option>
                                                    <option value="Z002" ${cust.businessTypes == "Z002"? 'selected':'' }>机会客户</option>
                                                    <option value="Z003" ${cust.businessTypes == "Z003"? 'selected':'' }>正式客户</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
              	<label>状态码</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa  fa-compass"></i>
                  </div>
                   <select class="form-control" name="businessStatus" id="businessStatus" value="${cust.businessStatus }" >
                                                <option value="0" ${cust.businessStatus == "0"? 'selected':'' }>开立</option>
                                                <option value="1" ${cust.businessStatus == "1"? 'selected':'' }>提交审批</option>
                                                <option value="2" ${cust.businessStatus == "2"? 'selected':'' }>审核中</option>
                                                <option value="3" ${cust.businessStatus == "3"? 'selected':'' }>审批拒绝</option>
                                                <option value="4" ${cust.businessStatus == "4"? 'selected':'' }>审批通过</option>
                                                <option value="5" ${cust.businessStatus == "5"? 'selected':'' }>待审批</option>
                                                <option value="6" ${cust.businessStatus == "6"? 'selected':'' }>留置</option>
                                                <option value="7" ${cust.businessStatus == "7"? 'selected':'' }>停止交易</option>   
                   </select>
                </div>
              </div>
   
              <div class="form-group">
                <label>客户编号</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-paw"></i>
                  </div>
                  <input type="text" id="cusNo"  name="cusNo" class="form-control" value="${cust.cusMark }">
                </div>
                <!-- /.input group -->
              </div>
              <div class="form-group">
                <label>客户中文全称</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa  fa-user-secret"></i>
                  </div>
                  <input type="text" id="cusNo"  name="cusNo" class="form-control" value="${cust.cusCnName }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>客户英文全称</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-user-plus"></i>
                  </div>
                  <input type="text" id="cusNo"  name="cusNo" class="form-control" value="${cust.cusEnName }" >
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
                <label>社会统一信用代码</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-credit-card"></i>
                  </div>
                  <input type="text" id="chargeSman" name="chargeSman" class="form-control" value="${cust.unityCreditCode }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
               <div class="form-group">
                <label>法定代表人</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-user-md"></i>
                  </div>
                  <input type="text" id="creater"  name="creater" class="form-control" value="${cust.corporRepresent }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
               <div class="form-group">
                <label>注册资金</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-money"></i>
                  </div>
                 <input type="text" id="creater"  name="creater" class="form-control" style="text-align:right" value="${cust.registerFoundation }万 ${cust.currency }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>营业期限</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar-times-o"></i>
                  </div>
                  <input type="text" id="creater"  name="creater" class="form-control" value="${cust.businessTerm }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
               <div class="form-group">
                <label>注册地址</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-location-arrow"></i>
                  </div>
                  <input type="text" id="creater"  name="creater" class="form-control" value="${cust.regAddress }">
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
                  <input type="text" id="creater"  name="creater" class="form-control" value="${cust.chargeSalesman }">
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
                <label>公司性质</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-bullseye"></i> 
                  </div>
                  <input type="text" id="creater"  name="creater" class="form-control" value="${cust.corporIdentity }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>员工人数</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-group"></i> 
                  </div>
                  <input type="text" id="creater"  name="creater" class="form-control" value="${cust.clerkCount }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>年营业额</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-money"></i>
                  </div>
                  <input type="text" id="creater"  name="creater" class="form-control" value="${cust.annualSales }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>经营状况</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa  fa-bar-chart"></i>
                  </div>
                  <input type="text" id="creater"  name="creater" class="form-control" value="${cust.businessCondition }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->                            
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
                <label>所属方</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-building-o"></i>
                  </div>
                  <input type="text" id="creater"  name="creater" class="form-control" value="${cust.chargeSalesman }">
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
              <!-- /.form group -->
              <div class="form-group">
                <label>所属BG</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-object-ungroup"></i>
                  </div>
                  <input type="text" id="creater"  name="creater" class="form-control" value="${cust.belongBG }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>客户所属集团</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-object-group"></i>
                  </div>
                  <input type="text" id="postCode" name="postCode" class="form-control" value="${cust.belongClient }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group --> 
              <div class="form-group">
                <label>所属事业处</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-wrench"></i>
                  </div>
                  <input type="text" id="postCode" name="postCode" class="form-control" value="${cust.belongFactory }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>首次ERP账套</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-star-half"></i>
                  </div>
                  <input type="text" id="postCode" name="postCode" class="form-control" value="${cust.initERPAccount }">
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
      <!--  start contact information -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">常用地址和联系信息</h3>
        </div>
        <!-- /.box-header -->
        <div class="row">
        <fieldset disabled>
        <div class="col-md-6">
          <div class="box box-danger">
            <div class="box-body">
              <!-- Date dd/mm/yyyy -->
              <div class="form-group">
                <label>国内联系地址</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-location-arrow"></i>
                  </div>
				  <input type="text" id="type" class="form-control" value="${cust.domestcAddr }" >
                </div>
              </div>
              <div class="form-group">
              	<label>国外联系地址</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-location-arrow"></i>
                  </div>
				  <input type="text" id="num" class="form-control" value="${cust.foreignAddr }">
                </div>
              </div>
   
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
              <div class="form-group">
                <label>国家</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-flag"></i>
                  </div>
                  <input type="text" id="cusNo"  name="cusNo" class="form-control" value="${cust.nation }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>省区</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-map"></i>
                    
                  </div>
                  <input type="text" id="clue-name" class="form-control" value="${cust.province }">
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
                <label>电话</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-phone"></i>
                  </div>
                  <input type="text" id="telephoneNo" name="telephoneNo" class="form-control" value="${cust.telephone }" >
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>传真</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-fax"></i>
                  </div>
                  <input type="text" id="clue-department" class="form-control" value="${cust.fax }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>E-mail</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-envelope"></i>
                  </div>
                  <input class="form-control" type="text" name="creation-date" id="creation-date" value="${cust.email  }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
              <div class="form-group">
                <label>公司网站地址</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-laptop"></i>
                  </div>
                  <input class="form-control" type="text" name="clue-asign-date" id="clue-asign-date" value="${cust.webSite }">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->                                                                                 
            </div>
            <!-- /.box-body -->
          </div>   <!--  end of box -->
          </div>	<!--  end of right -->
          </fieldset>  <!-- end of disabled  -->
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
