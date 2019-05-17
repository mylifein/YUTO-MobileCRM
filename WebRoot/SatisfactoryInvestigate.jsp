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
  <script src="${path}/js/bootstrap-admin/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script >
	$(function(){
		$("#selectCondition1").change(function(){
			var option1 = $(this).find("option:selected").val();
			if(option1 == "ZS_DATE"){
				document.getElementById("divInput1").innerHTML = "<input type='date' id='inputCondition1' name='inputCondition1' class='form-control' value=' " + ${satifcondition.inputCondition1 } "' >";	
			}else{
				document.getElementById("divInput1").innerHTML = "<input type='text' id='inputCondition1' name='inputCondition1' class='form-control' value=' " + ${satifcondition.inputCondition1 } "' >";
			}					
		})
		
	 	$("#selectCondition2").change(function(){
			var option2 = $(this).find("option:selected").val();
			if(option2 == "ZS_DATE"){
				document.getElementById("divInput2").innerHTML = "<input type='date' id='inputCondition1' name='inputCondition1' class='form-control' value=' " + ${satifcondition.inputCondition1 } "' >";		
			}else{
				document.getElementById("divInput2").innerHTML = "<input type='text' id='inputCondition1' name='inputCondition1' class='form-control' value=' " + ${satifcondition.inputCondition1 } "' >";
			}
		})
	})
/* 		$(function(){

		
		$("#selectCondition2").change(function(){
			var option2 = $(this).find("option:selected").val();
			if(option2 == "ZS_DATE"){
				document.getElementById("divInput2").innerHTML = "<input type='date' id='inputCondition1' name='inputCondition1' class='form-control' value=' " + ${satifcondition.inputCondition1 } "' >";		
			}else{
				document.getElementById("divInput2").innerHTML = "<input type='text' id='inputCondition1' name='inputCondition1' class='form-control' value=' " + ${satifcondition.inputCondition1 } "' >";
			}
		}) 
	})
 */
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
            <li><a href="${path }/clueSearch.jsp"><i class="fa fa-circle-o"></i>线索统计报表</a></li> 
            <li class="active"><a href="${path }/SatisfactoryInvestigate.jsp"><i class="fa fa-circle-o"></i>客户满意度调查报表</a></li>     
            <li ><a href="${path }/processEffiencyReport.jsp"><i class="fa fa-circle-o"></i>流程时效报表</a></li> 
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
                            客户满意度调查报表
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-table"></i> 报表</a></li>
        <li class="active">客户满意度调查报表</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
              <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">客户满意度调查报表搜索</h3>
        </div>
        <form class="form-horizontal" action="${path}/report//satisfactory.do" method="get">
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-4">
											<select class="form-control" name="selectCondition1" id="selectCondition1">
												<option value="ZS_CONSNO" ${satifcondition.selectCondition1 == "ZS_CONSNO"? 'selected' : '' }>客户编号</option> 
												<option value="ZS_CNAME" ${satifcondition.selectCondition1 == "ZS_CNAME"? 'selected' : '' }>客户名称</option>                                        
                                                <option value="ZS_DEP"  ${satifcondition.selectCondition1 == "ZS_DEP"? 'selected' : '' }>所属部门</option>          
                                                <option value="ZS_SCORE" ${satifcondition.selectCondition1 == "ZS_SCORE"? 'selected' : '' }>调查总分</option>
                                                <option value="ZS_DATE" ${satifcondition.selectCondition1 == "ZS_DATE"? 'selected' : '' }>调查结束日期</option>
											</select>
										</div>
										<div class="col-xs-6" id="divInput1" name="divInput1" >
										  <input type="text" id="inputCondition1" name="inputCondition1" class="form-control" value="${satifcondition.inputCondition1 }">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-4">
											<select class="form-control" name="selectCondition2" id="selectCondition2">
												<option value="ZS_CNAME" ${satifcondition.selectCondition2 == "ZS_CNAME"? 'selected' : '' }>客户名称</option>
												<option value="ZS_CONSNO" ${satifcondition.selectCondition2 == "ZS_CONSNO"? 'selected' : '' }>客户编号</option>                                         
                                                <option value="ZS_DEP"  ${satifcondition.selectCondition2 == "ZS_DEP"? 'selected' : '' }>所属部门</option>                                          
                                                <option value="ZS_SCORE" ${satifcondition.selectCondition2 == "ZS_SCORE"? 'selected' : '' }>调查总分</option>
                                                <option value="ZS_DATE" ${satifcondition.selectCondition2 == "ZS_DATE"? 'selected' : '' }>调查结束日期</option>
											</select>
										</div>
										<div class="col-xs-6" id="divInput2" name="divInput2">
										  <input type="text" id="inputCondition2" name="inputCondition2" class="form-control" value="${satifcondition.inputCondition2 }">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-4">
											<select class="form-control" name="selectConditon3" id="selectConditon3">                                    
                                                <option value="ZS_SYC"  selected} >所属事业处</option>
											</select>
										</div>
										<div class="col-xs-6">
								            <select class="form-control" name="inputCondition3" id="inputCondition3" >
								            <option	value="" }></option>	
											<option	value="SZ17" ${satifcondition.inputCondition3 == "SZ17" ? 'selected' : '' }>东莞包装科技</option>	
											<option value="SZ3" ${satifcondition.inputCondition3 == "SZ3" ? 'selected' : '' }>事业三部</option>
											<option value="SZ1"
												${satifcondition.inputCondition3 == "SZ1" ? 'selected' : '' }>事业一部 </option>
											<option value="SZ2"
												${satifcondition.inputCondition3 == "SZ2" ? 'selected' : '' }>IT事业处 </option>
											<option value="SZ4"
												${satifcondition.inputCondition3 == "SZ4" ? 'selected' : '' }>事业四部</option>
											<option value="SYSTEM"
												${satifcondition.inputCondition3 == "SYSTEM" ? 'selected' : '' }>系統資料庫</option>
											<option value="SZ5"
												${satifcondition.inputCondition3 == "SZ5" ? 'selected' : '' }>事业一处(有限)</option>
											<option value="SZ6"
												${satifcondition.inputCondition3 == "SZ6" ? 'selected' : '' }>三河裕同</option>
											<option value="SZ19"
												${satifcondition.inputCondition3 == "SZ19" ? 'selected' : '' }>国内ICTBG供应链 </option>
											<option value="SZ62"
												${satifcondition.inputCondition3 == "SZ62" ? 'selected' : '' }>九江裕同裱卡</option>
											<option value="SZ14"
												${satifcondition.inputCondition3 == "Z14" ? 'selected' : '' }>君合置业</option>
											<option value="SZ8"
												${satifcondition.inputCondition3 == "SZ8" ? 'selected' : '' }>事业四处</option>
											<option value="SZ7"
												${satifcondition.inputCondition3 == "SZ7" ? 'selected' : '' }>苏州裕同</option>
											<option value="HSZ1"
												${satifcondition.inputCondition3 == "HSZ1" ? 'selected' : '' }>包装厂(财务二)</option>
											<option value="SZ9"
												${satifcondition.inputCondition3 == "SZ9" ? 'selected' : '' }>珠海裕同</option>
											<option value="DZ"
												${satifcondition.inputCondition3 == "DZ" ? 'selected' : '' }>裕同电子厂</option>
											<option value="CSZ1"
												${satifcondition.inputCondition3 == "CSZ1" ? 'selected' : '' }>包装厂(财务一)</option>
											<option value="SZ10"
												${satifcondition.inputCondition3 == "SZ10" ? 'selected' : '' }>上海裕同</option>
											<option value="SZ29"
												${satifcondition.inputCondition3 == "SZ29" ? 'selected' : '' }>	越南平阳裕同	</option>
											<option value="SZ15"
												${satifcondition.inputCondition3 == "SZ15" ? 'selected' : '' }>事业一处(转厂)</option>
											<option value="DC"
												${satifcondition.inputCondition3 == "DC" ? 'selected' : '' }>福来特电子</option>
											<option value="SZ88"
												${satifcondition.inputCondition3 == "SZ88" ? 'selected' : '' }>	伟创力(转厂)</option>
											<option value="SZ22"
												${satifcondition.inputCondition3 == "SZ22" ? 'selected' : '' }>IT事业处(转厂)</option>
											<option value="SZ16"
												${satifcondition.inputCondition3 == "SZ16" ? 'selected' : '' }>烟台裕鸿</option>
											<option value="SZ31"
												${satifcondition.inputCondition3 == "SZ31" ? 'selected' : '' }>纸箱厂(转厂)</option>
											<option value="SZ30"
												${satifcondition.inputCondition3 == "SZ30" ? 'selected' : '' }>纸箱厂	</option>
											<option value="SZ166"
												${satifcondition.inputCondition3 == "SZ166" ? 'selected' : '' }>青岛分公司	</option>
											<option value="SZ41"
												${satifcondition.inputCondition3 == "SZ41" ? 'selected' : '' }>	事业四处(转厂)</option>
											<option value="SZYN"
												${satifcondition.inputCondition3 == "SZYN" ? 'selected' : '' }>	越南裕同</option>
											<option value="SZ917"
												${satifcondition.inputCondition3 == "SZ917" ? 'selected' : '' }>陕西裕凤</option>
											<option value="SZ44"
												${satifcondition.inputCondition3 == "SZ44" ? 'selected' : '' }>	许昌裕同</option>
											<option value="SZ00"
												${satifcondition.inputCondition3 == "SZ00" ? 'selected' : '' }>集团采购中心	</option>
											<option value="SZ60"
												${satifcondition.inputCondition3 == "SZ60" ? 'selected' : '' }>九江裕同</option>
											<option value="SZ028"
												${satifcondition.inputCondition3 == "SZ028" ? 'selected' : '' }>成都裕同</option>
											<option value="SZT15"
												${satifcondition.inputCondition3 == "SZT15" ? 'selected' : '' }>集团报价组</option>
											<option value="T41"
												${satifcondition.inputCondition3 == "T41" ? 'selected' : '' }>YUTO测试库</option>
											<option value="THSZ1"
												${satifcondition.inputCondition3 == "THSZ1" ? 'selected' : '' }>财务处理套账	</option>
											<option value="SZ55"
												${satifcondition.inputCondition3 == "SZ55" ? 'selected' : '' }>重庆-免税</option>
											<option value="SZ023"
												${satifcondition.inputCondition3 == "SZ023" ? 'selected' : '' }>重庆裕同</option>
											<option value="SZ11"
												${satifcondition.inputCondition3 == "SZ11" ? 'selected' : '' }>东莞裕同</option>
											<option value="SH1"
												${satifcondition.inputCondition3 == "SH1" ? 'selected' : '' }>三河测试</option>
											<option value="SZ551"
												${satifcondition.inputCondition3 == "SZ551" ? 'selected' : '' }>合肥裕同</option>
											<option value="sz16b"
												${satifcondition.inputCondition3 == "sz16b" ? 'selected' : '' }>烟台裕同B</option>
											<option value="SZ81"
												${satifcondition.inputCondition3 == "SZ81" ? 'selected' : '' }>事业四处-报价	</option>
											<option value="SZYNT"
												${satifcondition.inputCondition3 == "SZYNT" ? 'selected' : '' }>越南裕同报价	</option>
											<option value="SZ28"
												${satifcondition.inputCondition3 == "SZ28" ? 'selected' : '' }>成都裕同-APPLE</option>
											<option value="SZ78"
												${satifcondition.inputCondition3 == "SZ78" ? 'selected' : '' }>苏州裕同-B018</option>
											<option value="SZ830"
												${satifcondition.inputCondition3 == "SZ830" ? 'selected' : '' }>泸洲裕同</option>
											<option value="SZ027"
												${satifcondition.inputCondition3 == "SZ027" ? 'selected' : '' }>武汉裕同</option>
											<option value="SZ77"
												${satifcondition.inputCondition3 == "SZ77" ? 'selected' : '' }>昆讯裕同</option>
											<option value="SZ79"
												${satifcondition.inputCondition3 == "SZ79" ? 'selected' : '' }>苏州B018非保税</option>
											<option value="SZ068"
												${satifcondition.inputCondition3 == "SZ068" ? 'selected' : '' }>泸州裕同科技	</option>
											<option value="SZ083"
												${satifcondition.inputCondition3 == "SZ083" ? 'selected' : '' }>君和供应链	</option>
											<option value="SZ02"
												${satifcondition.inputCondition3 == "SZ02" ? 'selected' : '' }>深圳华智信息</option>
											<option value="SZ01"
												${satifcondition.inputCondition3 == "SZ01" ? 'selected' : '' }>模切事业部</option>
											<option value="SZ03"
												${satifcondition.inputCondition3 == "SZ03" ? 'selected' : '' }>前海君爵投资</option>
											<option value="SZ12"
												${satifcondition.inputCondition3 == "SZ12" ? 'selected' : '' }>深圳商标部</option>
											<option value="SZ13"
												${satifcondition.inputCondition3 == "SZ13" ? 'selected' : '' }>做合并报测试</option>
											<option value="SZ48"
												${satifcondition.inputCondition3 == "SZ48" ? 'selected' : '' }>许昌裕同(转厂)</option>
											<option value="SZ21"
												${satifcondition.inputCondition3 == "SZ21" ? 'selected' : '' }>IT事业处(华为)</option>
											<option value="SZ04"
												${satifcondition.inputCondition3 == "SZ04" ? 'selected' : '' }>知昊</option>
											<option value="SZ75"
												${satifcondition.inputCondition3 == "SZ75" ? 'selected' : '' }>昆山裕锦包装</option>
											<option value="SZ76"
												${satifcondition.inputCondition3 == "SZ76" ? 'selected' : '' }>苏州昆迅专案</option>
											<option value="SZ58"
												${satifcondition.inputCondition3 == "SZ58" ? 'selected' : '' }>亳州裕同</option>
											<option value="SZ25"
												${satifcondition.inputCondition3 == "SZ25" ? 'selected' : '' }>华研精工</option>
											<option value="SZ05"
												${satifcondition.inputCondition3 == "SZ05" ? 'selected' : '' }>供应链(暂停)</option>
											<option value="SZ06"
												${satifcondition.inputCondition3 == "SZ06" ? 'selected' : '' }>君和设计</option>
											<option value="SZ08"
												${satifcondition.inputCondition3 == "SZ08" ? 'selected' : '' }>苏州永承</option>
											<option value="SZ61"
												${satifcondition.inputCondition3 == "SZ61" ? 'selected' : '' }>模切部(转厂)</option>
											<option value="SZ26"
												${satifcondition.inputCondition3 == "SZ26"? 'selected' : '' }>东莞华研科技</option>
											<option value="SZ09"
												${satifcondition.inputCondition3 == "SZ09"? 'selected' : '' }>越南裕同B018</option>
											<option value="SZ18"
												${satifcondition.inputCondition3 == "SZ18" ? 'selected' : '' }>九江裕同-810B</option>
											<option value="SZ33"
												${satifcondition.inputCondition3 == "SZ33" ? 'selected' : '' }>北京云创网印</option>
											<option value="SZ34"
												${satifcondition.inputCondition3 == "SZ34" ? 'selected' : '' }>上海裕仁</option>
											<option value="SZ35"
												${satifcondition.inputCondition3 == "SZ35" ? 'selected' : '' }>苏州永沅</option>
											<option value=	SZ36"
												${satifcondition.inputCondition3 == "SZ36" ? 'selected' : '' }>深圳云创</option>
											<option value="SZ37"
												${satifcondition.inputCondition3 == "SZ37" ? 'selected' : '' }>深圳奥印网</option>
											<option value="SZ39"
												${satifcondition.inputCondition3 == "SZ39" ? 'selected' : '' }>裕同精品包装	</option>
											<option value="SZ40"
												${satifcondition.inputCondition3 == "SZ40" ? 'selected' : '' }>	YUTO in India</option>
											<option value="SZ024"
												${satifcondition.inputCondition3 == "SZ024" ? 'selected' : '' }>重庆供应链</option>
											<option value="SZ63"
												${satifcondition.inputCondition3 == "SZ63" ? 'selected' : '' }>三河同雅</option>
											<option value="SZ45"
												${satifcondition.inputCondition3 == "SZ45" ? 'selected' : '' }>	许昌裕同环保	</option>
											<option value="SZ71"
												${satifcondition.inputCondition3 == "SZ71" ? 'selected' : '' }>苏州商标部</option>
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
                  <th style="width: 60px">客户编号</th>
                  <th style="width: 60px">客户名称</th>
                  <th style="width: 60px">负责员工</th>
                  <th style="width: 60px">所属部门</th>
                  <th style="width: 60px">所属事业处</th>
                  <th style="width: 60px">调查总分</th>
                  <th style="width: 60px">调查结束日期</th>
                </tr>
                </thead>
                <tbody>
					<c:forEach var="satReport" items="${searchsatisList }" >
						<tr>
							<td id="cusMark" name="cusMark" style="width: 60px">${satReport.cusMark }</td>
							<td id="cusName" name="cusName" style="width: 60px">${satReport.cusName }</td>
							<td id="chargeClerk" name="chargeClerk" style="width: 60px">${satReport.chargeClerk }</td>
							<td id="belongDep" name="belongDep" style="width: 60px">${satReport.belongDep }</td>
							<td id="belongBU" name="belongBU" style="width: 60px">${satReport.belongBU }</td>
							<td id="totalScore" name="totalScore" style="width: 60px">${satReport.totalScore }</td>
							<td id="investigateDate" name="investigateDate"  style="width: 60px">${satReport.investigateDate }</td>
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
    "autoWidth": false ,
    
    language:{
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
    
    }	,
    
    "columns" : [
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
