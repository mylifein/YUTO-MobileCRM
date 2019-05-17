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
		<title>流程时效报表</title>
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
							<li><a href="${path}/SatisfactoryInvestigate.jsp">客户满意度调查报表搜索</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><button type="button" class="btn pull-left"  onclick="window.history.back()">返回</button></li>
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
							<h2 class="panel-title">流程时效报表</h2>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" action="${path}/report/efficiencyReport.do" method="get">
								<h4>搜索条件</h4>
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
												<option value="" >创建日期时间一</option>
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
												<option value="" >创建日期时间二</option>
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
							<h2 class="panel-title">搜索结果清单</h2>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped">
									<tr>
                                        <th>事务类型</th>
										<th>事务标识</th>
                                        <th>描述</th>
										<th>节点代码</th>
                                        <th>节点名称</th>
										<th>节点负责人</th>
										<th>开始时间</th>
										<th>结束时间</th>
                                        <th>标准时效</th>
										<th>实际时效</th>
										<th>延误时长</th>
									</tr>
									<c:forEach var="efficiencyReportList" items="${pageEffiencyList }" > 
									<tr>
										<td >${efficiencyReportList.businessType }</td>
										<td >${efficiencyReportList.businessMark }</td>
										<td >${efficiencyReportList.discription }</td>					
										<td >${efficiencyReportList.nodeCode }</td>
										<td >${efficiencyReportList.nodeName }</td>
										<td >${efficiencyReportList.nodeCharger }</td>
										<td >${efficiencyReportList.startTime }</td>
										<td >${efficiencyReportList.endTime  }</td>
										<td >${efficiencyReportList.standardEfficiency }</td>
                                        <td >${efficiencyReportList.actualEfficiency }</td>
										<td >${efficiencyReportList.delayTime }</td>
									</tr>
									</c:forEach>
								</table>
								<nav aria-label="Page navigation">
									<ul class="pagination">
										<c:if test="${pageEffiencyUtil.pageNum > 1 }" ><li><a href="${path}/report/efficiencyReport.do.do?page=${pageEffiencyUtil.pageNum -1}" aria-label="Previous"> <span
												aria-hidden="true">&laquo;</span>
										</a></li></c:if>
											<c:forEach begin="1" end="${pageEffiencyUtil.pageCount }" step="1" var="i" >
												<c:if test="${pageEffiencyUtil.pageNum  == i }"><li><a href="${path}/report/efficiencyReport.do?page=${i }"><font color="#ff0000">${i }</font></a></li>
												</c:if>
												<c:if test="${pageEffiencyUtil.pageNum  != i }">
													<li><a href="${path}/report/efficiencyReport.do?page=${i }">${i }</a></li>
												</c:if>
				
											</c:forEach>
											
										<c:if test="${pageEffiencyUtil.pageNum < pageEffiencyUtil.pageCount }"><li><a href="${path}/report/efficiencyReport.do?page=${pageEffiencyUtil.pageNum +1}" aria-label="Next"> <span
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