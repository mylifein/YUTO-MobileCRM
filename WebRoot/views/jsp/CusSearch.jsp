<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"
	trimDirectiveWhitespaces="true" language="java"%>
<%@ page isELIgnored="false"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
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
<!-- <script type="text/javascript">
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
            
        </script> -->
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
						<li><a href="CusCreation.html">公司客户创建</a></li>
						<li><a href="CusSearch.html">公司客户搜索</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">登出</a></li>
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
						<form class="form-horizontal" action="cus/search.do" method="post">
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
									<div class="col-xs-offset-1 col-xs-4">
										<select class="form-control" name="status" id="status">
											<option value="" selected>交易状态</option>
										</select>
									</div>
									<div class="col-xs-6">
										<select class="form-control" name="clueClient" id="clueClient">
											<option value=""></option>
											<option value="Z001" selected>线索客户</option>
											<option value="Z002">机会客户</option>
											<option value="Z003">正式客户</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-xs-offset-1 col-xs-4">
										<select class="form-control" name="customerNo" id="customerNo">
											<option value="" selected>客户编号</option>
										</select>
									</div>
									<div class="col-xs-6">
										<input type="text" class="form-control" id="CusNo">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-xs-offset-1 col-xs-4">
										<select class="form-control" name="customerName"
											id="customerName">
											<option value="" selected>客户名称</option>
										</select>
									</div>
									<div class="col-xs-6">
										<input type="text" class="form-control" id="CusName">
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
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped">
								<tr>
									<th>标识</th>
									<th>名称</th>
									<th>电话</th>
									<th>街道</th>
									<th>城市</th>
									<th>地区</th>
									<th>国家</th>
									<th>电子邮件</th>
									<th>邮政编码</th>
								</tr>
								<tr>
									<td>a</td>
									<td>b</td>
									<td>c</td>
									<td>d</td>
									<td>e</td>
									<td>f</td>
									<td>g</td>
									<td>h</td>
									<td>i</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>