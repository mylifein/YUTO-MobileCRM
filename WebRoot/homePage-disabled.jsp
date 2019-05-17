

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
<title>主页</title>
<script>
	function logOut(){
		
		window.location.href="${path}/user/logout.do";
		
	}
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
					<ul class="nav navbar-nav">
						<c:if test="${EV_CREATE == 'C' }"><li><a href="${path}/CusCreation.jsp">公司客户创建</a></li></c:if>
						<c:if test="${EV_QUERY == 'Q' }"><li><a href="${path}/CusSearch.jsp">公司客户搜索</a></li></c:if>
						<li><a href="${path}/clueSearch.jsp">线索申请报表搜索</a></li>
						<li><a href="${path}/SatisfactoryInvestigate.jsp">客户满意度调查报表搜索</a></li>
						<li><a href="${path}/processEffiencyReport.jsp">流程时效报表搜索</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#" onclick="logOut()">退出</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!--End of header-->

	<div class="content container">
		<div class="row">
			<div class="col-sm-offset-1 col-sm-10">
				<section class="col-sm-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title" style="color: forestgreen">我今天的预约</h2>
						</div>
						<div class="panel-body">
							<table class="table table-striped">
								<thead>
									<tr>
										<td>活动标识</td>
										<td>活动描述</td>
										<td>客户</td>
										<td>地点</td>
										<td>活动开始日期</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list1" items="${pageList1}">
										<tr>
											<td id="actMark" name="actMark"><a
												href="${path}/cus/searchHomeItem.do?actMark=${list1.actMark}">${list1.actMark}</a></td>
											<td id="actDesc" name="actDesc">${list1.actDesc}</td>
											<td id="customer" name="customer">${list1.cust}</td>
											<td id="location" name="location">${list1.place}</td>
											<td id="actStartDate" name="actStartDate">${list1.actStartDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<nav aria-label="Page navigation">
									<ul class="pagination">
									<c:if test="${pageUtil1.pageNum > 1 }" ><li><a href="${path}/user/homePage.do?pageNo1=${pageUtil1.pageNum -1}" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li></c:if>
										<c:forEach begin="1" end="${pageUtil1.pageCount }" step="1" var="i" >
											<c:if test="${pageUtil1.pageNum  == i }"><li><a href="${path}/user/homePage.do?pageNo1=${i }"><font color="#ff0000">${i }</font></a></li>
											</c:if>
											<c:if test="${pageUtil1.pageNum  != i }">
												<li><a href="${path}/user/homePage.do?pageNo1=${i }">${i }</a></li>
											</c:if>
			
										</c:forEach>
										
									<c:if test="${pageUtil1.pageNum < pageUtil1.pageCount }"><li><a href="${path}/user/homePage.do?pageNo1=${pageUtil1.pageNum +1}" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li></c:if>
								</ul>
							</nav>

						</div>
					</div>
				</section>
				<section class="col-sm-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title" style="color: red">我的未完成任务</h2>
						</div>
						<div class="panel-body">
							<table class="table table-striped">
								<thead>
									<tr>
										<td>活动标识</td>
										<td>活动描述</td>
										<td>客户</td>
										<td>地点</td>
										<td>活动开始日期</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list2" items="${pageList2}">
										<tr>
											<td id="actMark" name="actMark"><a
												href="${path}/cus/searchHomeItem.do?actMark=${list2.actMark}">${list2.actMark}</a></td>
											<td id="actDesc" name="actDesc">${list2.actDesc}</td>
											<td id="customer" name="customer">${list2.cust}</td>
											<td id="location" name="location">${list2.place}</td>
											<td id="actStartDate" name="actStartDate">${list2.actStartDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<c:if test="${pageUtil2.pageNum > 1 }" ><li><a href="${path}/user/homePage.do?pageNo2=${pageUtil2.pageNum -1}" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li></c:if>
										<c:forEach begin="1" end="${pageUtil2.pageCount }" step="1" var="i" >
											<c:if test="${pageUtil2.pageNum  == i }"><li><a href="${path}/user/homePage.do?pageNo2=${i }"><font color="#ff0000">${i }</font></a></li>
											</c:if>
											<c:if test="${pageUtil2.pageNum  != i }">
												<li><a href="${path}/user/homePage.do?pageNo2=${i }">${i }</a></li>
											</c:if>
			
										</c:forEach>
										
									<c:if test="${pageUtil2.pageNum < pageUtil2.pageCount }"><li><a href="${path}/user/homePage.do?pageNo2=${pageUtil2.pageNum +1}&" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li></c:if>
								</ul>
							</nav>
						</div>
					</div>
				</section>
			</div>

		</div>
	</div>


</body>
</html>