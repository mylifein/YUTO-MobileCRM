<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"
	trimDirectiveWhitespaces="true" language="java"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script type="text/javascript" src="${path}/js/jquery-1.11.3.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- <link href="css/styles.css" rel="stylesheet" type="text/css"> -->
<title>日常活动计划单界面</title>
<script type="text/javascript">
			<!-- $(function(){ 
				$("#activityType option[value='${dailyActivities.activityType}']").attr('selected',true);
				$("#businessType option[value='${dailyActivities.businessType}']").attr('selected',true);
				$("#status option[value='${dailyActivities.status}']").attr('selected',true);
				
			})       -->	
		
</script>
</head>

<body>
	<!--Start of header-->
	<header>
		<nav class="navbar navbar-inverse">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#collapsemenu"
						aria-expanded="false">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a href="#" class="navbar-brand">SAP CRM</a>
				</div>
				<div class="collapse navbar-collapse" id="collapsemenu">
					<ul class="nav navbar-nav navbar-right">
							<li><a href="#" onclick="window.history.back()">返回</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!--End of header-->

	<div class="content container">
		<div class="row">
			<div class="col-sm-offset-1 col-sm-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">日常活动计划单明细</h2>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" action="#" method="post">
							<div class="row">
								<!--Start of left column-->
								<div class="col-sm-6">
									<h4>基本信息</h4>
									<fieldset disabled>
										<div class="form-group">
											<label for="type" class="col-sm-3 control-label">活动标识</label>
											<div class="col-sm-9">
												<input type="text" id="actMark" name="actMark"
													value="${dailyAct.actMark}" class="form-control">
											</div>
										</div>
									</fieldset>
									<fieldset disabled>
									<div class="form-group">
										<label for="num" class="col-sm-3 control-label">活动类型</label>
										<div class="col-sm-9">
										<input type="text" id="activityType" name="activityType"
													value="${dailyAct.activityType}" class="form-control">
										</div>
									</div>
									</fieldset>
									<fieldset disabled>
									<div class="form-group">
										<label for="clue-name" class="col-sm-3 control-label">出差类型</label>
										<div class="col-sm-9">
											<input type="text" id="businessType" name="businessType"
													value="${dailyAct.businessType}" class="form-control">
										</div>
									</div>
									</fieldset>
									<fieldset disabled>
									<div class="form-group">
										<label for="cust-name" class="col-sm-3 control-label">活动描述</label>
										<div class="col-sm-9">
											<input type="text" id="actDes" name="actDesc"
												value="${dailyAct.actDesc}" class="form-control">
										</div>
									</div>
									</fieldset>
									<fieldset disabled>
									<div class="form-group">
										<label for="cust-num" class="col-sm-3 control-label">地点</label>
										<div class="col-sm-9">
											<input type="text" id="location"
												value="${dailyAct.location}" class="form-control">
										</div>
									</div>
									</fieldset>
									<fieldset disabled>									
									<div class="form-group">
										<label for="manager" class="col-sm-3 control-label">负责员工</label>
										<div class="col-sm-9">
											<input type="text" id="chargePerson" name="chargePerson"
												value="${dailyAct.chargePerson}" class="form-control">
										</div>
									</div>
									</fieldset>
								</div>
								<!--End of left column-->

								<!--Start of right column-->
								<div class="col-sm-6">
									<h4>参考</h4>
									<fieldset disabled>	
									<div class="form-group">
										<label for="clue-supplier" class="col-sm-3 control-label">活动状态</label>				
										<div class="col-sm-9">
                                            <select class="form-control" name="statust" id="status" value="${dailyAct.status}">
                                                <option value="E0001">新建</option>
                                                <option value="E0008">发送日常任务</option> 
                                            </select>
                                        </div>
									</div>
									</fieldset>
									<fieldset disabled>	
									<div class="form-group">
										<label for="clue-department" class="col-sm-3 control-label">客户简称</label>
										<div class="col-sm-9">
											<input type="text" id="customer" name="customer"
												value="${dailyAct.cust}" class="form-control">
										</div>
									</div>
									</fieldset>
									<fieldset disabled>	
									<div class="form-group">
										<label for="creation-date" class="col-sm-3 control-label">客户联系人</label>
										<div class="col-sm-9">
											<input class="form-control" type="text" name="custAct"
												id="custAct"  value="${dailyAct.custAct}" >
										</div>
									</div>
									<div class="form-group">
										<label for="clue-asign-date" class="col-sm-3 control-label">费用合计</label>
										<div class="col-sm-9">
											<input class="form-control" type="text" name="totalExpense"
												id="totalExpense" value="${dailyAct.totalExpense}" >
										</div>
									</div>
									<div class="form-group">
										<label for="clue-deadline" class="col-sm-3 control-label">负责部门</label>
										<div class="col-sm-9">
											<input type="text" id="department" name="department"
												value="${dailyAct.department}" class="form-control">
										</div>
									</div>
									</fieldset>
								</div>
								<!--End of right column-->
							</div>
							<!--End of first row-->

						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- start of schedule list -->
		<div class="row">
			<div class="col-sm-offset-1 col-sm-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">日程列表</h2>
					</div>
					<div class="panel-body">
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
									<td id="item" name="item">${schedule.item }</td>
									<td id="departDate" name="departDate">${schedule.departDate }</td>
									<td id="arriveDate" name="arriveDate">${schedule.arriveDate }</td>
									<td id="departSite" name="departSite">${schedule.departSite}</td>
									<td id="arriveSite" name="arriveSite">${schedule.arriveSite}</td>
									<td id="trafficMode" name="trafficMode">${schedule.vehicle }</td>
								</tr>
								</c:forEach>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end of schedule list -->
		<!-- start of activity expense evaluate -->
		<div class="row">
			<div class="col-sm-offset-1 col-sm-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">日常活动费用估算</h2>
					</div> 
					<div class="panel-body">
						<div class="table-responsive">
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
									<td id="item" name="item">${actExpenseList.item }</td>
									<td id="budgetNo" name="budgetNo" >${actExpenseList.budgetNo }</td>
									<td id="balanceMoney" name="balanceMoney">${actExpenseList.balanceMoney }</td>
									<td id="evaluateExpense" name="evaluateExpense">${actExpenseList.evaluateExpense }</td>
									<td id="hotelPrice" name="hotelPrice">${actExpenseList.hotelPrice }</td>
									<td id="boardDays" name="boardDays">${actExpenseList.boardDays }天</td>
									<td id="shuttleExpense" name="shuttleExpense">${actExpenseList.shuttleExpense }</td>
									<td id="tripExpense" name="tripExpense">${actExpenseList.tripExpense }</td>
									<td id="eatCompensation" name="eatCompensation">${actExpenseList.eatCompensation }</td>
									<td id="other" name="other">${actExpenseList.other }</td>
								</tr>
							</c:forEach>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end of activity expense evaluate -->

	</div>


</body>
</html>