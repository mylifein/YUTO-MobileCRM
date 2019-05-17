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
<script type="text/javascript">
            //用来获得option元素中selected属性为true的元素id
            function Get_Selected_Id(place){
                var pro = document.getElementById(place);
                var Selected_Id = pro.option[pro.selectedIndex].id;
                return Selected_Id;//返回selected属性为true的元素id
            }
            //改变下一级联的option元素的内容，即加载第二级联动值
            function Get_Next_Place(This_Place_Id,Action){
                var Selected_Id = Get_Selected_Id(This_Place_ID);//Selected_Id用来记录前被选中
                if(Action == "get_city")//从而可以加载下一级联中加载相应的下拉值
                Add_status(Selected_Id);                
            }
            var Status_dic = {
                "交易状态":{
                	
                }
                
            }
            
        </script>
<title>公司客户搜索</title>
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
						<li><a href="${path}/clueSearch.jsp">线索申请报表搜索</a></li>
						<li><a href="${path}/SatisfactoryInvestigate.jsp">客户满意度调查报表搜索</a></li>
						<li><a href="${path}/processEffiencyReport.jsp">流程时效报表搜索</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><button type="button" class="btn pull-left"  onclick="window.history.back()">返回</button></li>
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
						<h2 class="panel-title">公司客户搜索</h2>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" action="${path}/cus/search.do"
							method="get">
							<div class="form-group">
								<label for="customer-category" class="col-sm-2 control-label">搜索</label>
								<div class="col-sm-9">
									<select class="form-control" name="customerCategory"
										id="customerCategory">
										<option value="">公司客户</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-xs-offset-1 col-xs-5">
										<select class="form-control" name="selectStatus" id="selectStatus">
											<option value="" selected>交易状态</option>
										</select>
									</div>
									<div class="col-xs-5">
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
									<div class="col-xs-offset-1 col-xs-5">
										<select class="form-control" name="selectCusNo" id="selectCusNo">
											<option value="" selected>客户编号</option>
										</select>
									</div>
									<div class="col-xs-5">
										<input type="text" class="form-control" id="customerNo"
											name="customerNo" value="${cusSearch.customerNo }">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-xs-offset-1 col-xs-5">
										<select class="form-control" name="selectAbbrName"
											id="selectAbbrName">
											<option value="" selected>客户简称</option>
										</select>
									</div>
									<div class="col-xs-5">
										<input type="text" class="form-control" id="cusAbbr"
											name="cusAbbr" value="${cusSearch.cusAbbr }">
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
						<h2 class="panel-title">公司客户搜索结果清单</h2>
						<%-- <input type="button" value="${list}"/> 页面传来的数据 --%>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped">
								<tr>
									<th>标识</th>
									<th>客户简称</th>
									<th>电话</th>
									<th>地区</th>
									<th>国家</th>
									<th>邮政编码</th>
									<th></th>
								</tr>
								<c:forEach var="cus" items="${pagecusList}">
									<tr>
										<td id="Z003"><a
											href="${path}/cus/searchList.do?cusMark=${cus.cusMark}&keyJ=search">${cus.cusMark}</a></td>
										<td id="Z004">${cus.cusAbbrName}</td>
										<td id="Z005">${cus.telephone}</td>
										<td id="Z034">${cus.zone}</td>
										<td id="Z018">${cus.nation}</td>
										<td id="Z027">${cus.postCode}</td>
										<td id="modify"><c:if test="${cus.businessTypes == 'Z001' && cus.businessStatus == '0' }"><a href="${path}/cus/searchList.do?cusMark=${cus.cusMark}&keyJ=modify" >修改</a></c:if></td>
									</tr>
								</c:forEach>
							</table>
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<c:if test="${pagecusUtil.pageCount > 1 }" ><li><a href="${path}/cus/search.do?page=${pagecusUtil.pageNum -1}" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li></c:if>
										<c:forEach begin="1" end="${pagecusUtil.pageCount }" step="1" var="i" >
											<c:if test="${pagecusUtil.pageNum  == i }"><li><a href="${path}/cus/search.do?page=${i }"><font color="#ff0000">${i }</font></a></li>
											</c:if>
											<c:if test="${pagecusUtil.pageNum  != i }">
												<li><a href="${path}/cus/search.do?page=${i }">${i }</a></li>
											</c:if>
			
										</c:forEach>
										
									<c:if test="${pagecusUtil.pageNum < pagecusUtil.pageCount }"><li><a href="${path}/cus/search.do?page=${pagecusUtil.pageNum +1}" aria-label="Next"> <span
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


</body>
</html>