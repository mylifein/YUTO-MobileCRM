<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"
	trimDirectiveWhitespaces="true" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false" %>  
  <% 
	pageContext.setAttribute("path", request.getContextPath());
%>  
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<link href="css/styles.css" rel="stylesheet" type="text/css">
		<title>客户满意度调查报表</title>
        <script>
        document.getElementById("")
        
     
		$("#selectCondiont1").change(function(){
			var judge = $(this).children('otion:selected').val();
			var changeNode = document.getElementById("")
			if(judge == "ZS_SYC"){
				
			}
		});
		
		</script>
        </script>
  	</head>
	
	<body>
		<!--Start of header-->
		<header>
			<nav class="navbar navbar-inverse">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapsemenu" aria-expanded="false">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a href="#" class="navbar-brand">SAP CRM</a>
					</div>
					<div class="collapse navbar-collapse" id="collapsemenu">
						<ul class="nav navbar-nav">
							<li><a href="${path}/homePage.jsp">主页</a></li>
							<c:if test="${EV_CREATE == 'C' }"><li><a href="${path}/CusCreation.jsp">公司客户创建</a></li></c:if>
							<c:if test="${EV_QUERY == 'Q' }"><li><a href="${path}/CusSearch.jsp">公司客户搜索</a></li></c:if>
							<li><a href="${path}/clueSearch.jsp">线索申请报表搜索</a></li>
							<li><a href="${path}/processEffiencyReport.jsp">流程时效报表搜索</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#" onclick="window.history.back()">返回</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</header><!--End of header-->
		
		<div class="content container">
			<div class="row">
				<div class="col-sm-offset-1 col-sm-10">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">客户满意度调查报表</h2>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" action="${path}/report//satisfactory.do" method="get">
								<h4>搜索条件</h4>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-5">
											<select class="form-control" name="selectCondition1" id="selectCondition1">
												<option value="ZS_CNAME" ${satifcondition.selectCondition1 == "ZS_CNAME"? 'selected' : '' }>客户名称</option>
												<option value="ZS_CONSNO" ${satifcondition.selectCondition1 == "ZS_CONSNO"? 'selected' : '' }>客户编号</option>                                         
                                                <option value="ZS_DEP"  ${satifcondition.selectCondition1 == "ZS_DEP"? 'selected' : '' }>所属部门</option>
                                                
                                                <option value="ZS_SCORE" ${satifcondition.selectCondition1 == "ZS_SCORE"? 'selected' : '' }>调查总分</option>
                                                <option value="ZS_DATE" ${satifcondition.selectCondition1 == "ZS_DATE"? 'selected' : '' }>调查结束日期</option>
											</select>
                                        </div>
										<div class="col-xs-4" >
										  <input type="text" id="inputCondition1" name="inputCondition1" class="form-control" value="${satifcondition.inputCondition1 }">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-5">
											<select class="form-control" name="selectCondition2" id="selectCondition2">
												<option value="ZS_CNAME" ${satifcondition.selectCondition2 == "ZS_CNAME"? 'selected' : '' }>客户名称</option>
												<option value="ZS_CONSNO" ${satifcondition.selectCondition2 == "ZS_CONSNO"? 'selected' : '' }>客户编号</option>                                         
                                                <option value="ZS_DEP"  ${satifcondition.selectCondition2 == "ZS_DEP"? 'selected' : '' }>所属部门</option>
                                                
                                                <option value="ZS_SCORE" ${satifcondition.selectCondition2 == "ZS_SCORE"? 'selected' : '' }>调查总分</option>
                                                <option value="ZS_DATE" ${satifcondition.selectCondition2 == "ZS_DATE"? 'selected' : '' }>调查结束日期</option>
											</select>
										</div>
										<div class="col-xs-4">
											<input type="text" id="inputCondition2" name="inputCondition2" class="form-control" value="${satifcondition.inputCondition2 }">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-5">
											<select class="form-control" name="selectConditon3" id="selectConditon3">                                    
                                                <option value="ZS_SYC"  selected} >所属事业处</option>
											</select>
										</div>
										<div class="col-xs-4">
								           
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
								<button type="submit" class="btn btn-default pull-right">搜索</button>
								<button type="button" class="btn btn-default pull-right">清除</button>
								<button type="reset" class="btn btn-default pull-right">重置</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-offset-1 col-sm-10">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">线索搜索结果清单</h2>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped">
									<tr>
                                        <th>客户编号</th>
										<th>客户名称</th>
                                        <th>负责员工</th>
										<th>所属部门</th>
                                        <th>所属事业处</th>
										<th>调查总分</th>
										<th>调查结束日期</th>
									</tr>
									<c:forEach var="satReport" items="${pagesatisList }" >
									<tr>
										<td id="cusMark" name="cusMark">${satReport.cusMark }</td>
										<td id="cusName" name="cusName">${satReport.cusName }</td>
										<td id="chargeClerk" name="chargeClerk">${satReport.chargeClerk }</td>
										<td id="belongDep" name="belongDep">${satReport.belongDep }</td>
										<td id="belongBU" name="belongBU">${satReport.belongBU }</td>
										<td id="totalScore" name="totalScore">${satReport.totalScore }</td>
										<td id="investigateDate" name="investigateDate" >${satReport.investigateDate }</td>
									</tr>
									</c:forEach>
								</table>
								<nav aria-label="Page navigation">
									<ul class="pagination">
										<c:if test="${pagesatisUtil.pageNum > 1 }" ><li><a href="${path}/report//satisfactory.do.do?page=${pagesatisUtil.pageNum -1}" aria-label="Previous"> <span
												aria-hidden="true">&laquo;</span>
										</a></li></c:if>
											<c:forEach begin="1" end="${pagesatisUtil.pageCount }" step="1" var="i" >
												<c:if test="${pagesatisUtil.pageNum  == i }"><li><a href="${path}/report//satisfactory.do?page=${i }"><font color="#ff0000">${i }</font></a></li>
												</c:if>
												<c:if test="${pagesatisUtil.pageNum  != i }">
													<li><a href="${path}/report//satisfactory.do?page=${i }">${i }</a></li>
												</c:if>
				
											</c:forEach>
											
										<c:if test="${pagesatisUtil.pageNum < pagesatisUtil.pageCount }"><li><a href="${path}/report//satisfactory.do?page=${pagesatisUtil.pageNum +1}" aria-label="Next"> <span
												aria-hidden="true">&raquo;</span>
										</a></li></c:if>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
    	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </body>
</html>