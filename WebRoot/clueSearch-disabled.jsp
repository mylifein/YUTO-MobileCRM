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
		<script type="text/javascript" src="${path}/js/jquery-1.11.3.min.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<link href="css/styles.css" rel="stylesheet" type="text/css">
		<title>线索申请报表搜索</title>
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
							<li><a href="${path}/SatisfactoryInvestigate.jsp">客户满意度调查报表搜索</a></li>
							<li><a href="${path}/processEffiencyReport.jsp">流程时效报表搜索</a></li>
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
							<h2 class="panel-title">线索搜索</h2>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" action="${path}/report/clueReport.do" method="get">
								<h4>搜索条件</h4>
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
										<div class="col-xs-3">
										  <input type="text" id="inputCondition1" name="inputCondition1" class="form-control" value="${clueCondition.inputCondition1 }">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-offset-1 col-xs-4">
											<select class="form-control" name="selectCondition2" id="selectCondition2">
												 <option value="DESCRIPTION" ${clueCondition.selectCondiont1 == "DESCRIPTION"? 'selected' : '' }>线索名称</option>
												<option value="OBJECT_ID" ${clueCondition.selectCondiont1 == "OBJECT_ID"? 'selected' : '' }>线索编号</option>
                                                <option value="CUST" ${clueCondition.selectCondiont1 == "CUST"? 'selected' : '' }>客户名称</option>
                                                <option value="CUST_PARTNER" ${clueCondition.selectCondiont1 == "CUST_PARTNER"? 'selected' : '' }>客户编号</option>
											</select>
										</div>
										<div class="col-xs-3">
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
										<div class="col-xs-3">
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
                                        <th>线索编号</th>
										<th>线索名称</th>
                                        <th>客户编号</th>
										<th>客户名称</th>
                                        <th>线索提供人</th>
										<th>线索跟进入</th>
										<th>线索提供部门</th>
										<th>创建日期</th>
                                        <th>线索到期日期</th>
										<th>预估项目金额</th>
										<th>预估项目毛利</th>
										<th>预估采购时间</th>
									</tr>
									<c:forEach var="clueReportList" items="${pageList }">
									<tr>
										<td id="clueNo" name="clueNo">${clueReportList.clueNo }</td>
										<td id="clueName" name="clueName">${clueReportList.clueName }</td>
										<td id="cusNo" name="cusNo">${clueReportList.cusNo }</td>
										<td id="cusName" name="cusName">${clueReportList.cusName }</td>
										<td id="clueProvider" name="clueProvider">${clueReportList.clueProvider }</td>
										<td id="clueTracker" name="clueTracker">${clueReportList.clueTracker }</td>
										<td id="clueProvideDep" name="clueProvideDep" >${clueReportList.clueProvideDep }</td>
										<td id="createDate" name="createDate">${clueReportList.createDate }</td>
                                        <td id="clueDueDate" name="clueDueDate">${clueReportList.clueDueDate }</td>
										<td id="anticipateProjMoney" name="anticipateProjMoney">${clueReportList.anticipateProjMoney }</td>
										<td id="anticipateProProfit" name="anticipateProProfit">${clueReportList.anticipateProProfit }</td>
                                        <td id="anticipateBuyDate" name="anticipateBuyDate">${clueReportList.anticipateBuyDate }</td>
									</tr>
									</c:forEach>
								</table>
								<nav aria-label="Page navigation">
								<ul class="pagination">
									<c:if test="${pageUtil.pageNum > 1 }" ><li><a href="${path}/report/clueReport.do.do?page=${pageUtil.pageNum -1}" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li></c:if>
										<c:forEach begin="1" end="${pageUtil.pageCount }" step="1" var="i" >
											<c:if test="${pageUtil.pageNum  == i }"><li><a href="${path}/report/clueReport.do?page=${i }"><font color="#ff0000">${i }</font></a></li>
											</c:if>
											<c:if test="${pageUtil.pageNum  != i }">
												<li><a href="${path}/report/clueReport.do?page=${i }">${i }</a></li>
											</c:if>
			
										</c:forEach>
										
									<c:if test="${pageUtil.pageNum < pageUtil.pageCount }"><li><a href="${path}/report/clueReport.do?page=${pageUtil.pageNum +1}" aria-label="Next"> <span
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