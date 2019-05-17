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
		<script type="text/javascript" src="${path}/js/jquery-1.11.3.min.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<link href="css/styles.css" rel="stylesheet" type="text/css">
		<title>公司客户详细界面</title>
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
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#" onclick="window.history.back()">返回</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</header><!--End of header-->
		
		<div class="content container">
			<fieldset disabled>
			<div class="row">
				<div class="col-sm-offset-1 col-sm-10">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">公司客户基本信息</h2>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" action="#" method="post">
                                <div class="row">
                                    <!-- start of left column-->
                                    <div class="col-sm-6">
                                    <fieldset disabled>
                                        <div class="form-group">
                                            <label for="type" class="col-sm-2 control-label">类型</label>
                                            <div class="col-sm-9">
                                                 <select class="form-control" name="businessTypes" id="businessTypes" value="${cust.businessTypes }">
                                                    <option value="Z001" ${cust.businessTypes == "Z001"? 'selected':'' }>线索客户</option>
                                                    <option value="Z002" ${cust.businessTypes == "Z002"? 'selected':'' }>机会客户</option>
                                                    <option value="Z003" ${cust.businessTypes == "Z003"? 'selected':'' }>正式客户</option>
                                                </select>
                                            </div>
                                        </div>
                                    </fieldset>
                                        
                                    <fieldset disabled>
                                         <div class="form-group"> 
                                             <label for="num" class="col-sm-2">状态码</label>
                                            <div class="col-sm-9" name="source" id="source">
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
                                             <label for="num" class="col-sm-2">客户编号</label>
                                             <div class="col-sm-9">
                                                 <input type="text" id="cusNo"  name="cusNo" class="form-control" value="${cust.cusMark }">
                                             </div>                                                         
                                         </div>
                                        <div class="form-group"> 
                                             <label for="num" class="col-sm-2">客户中文全称</label>
                                             <div class="col-sm-9">
                                                 <input type="text" id="cusNo"  name="cusNo" class="form-control" value="${cust.cusCnName }">
                                             </div>                                                         
                                         </div>
                                         <div class="form-group"> 
                                             <label for="num" class="col-sm-2">客户英文全称</label>
                                             <div class="col-sm-9">
                                                 <input type="text" id="cusNo"  name="cusNo" class="form-control" value="${cust.cusEnName }" >
                                             </div>                                                         
                                         </div>            
                                        <div class="form-group">
                                                <label for="num" class="col-sm-2 control-label">客户简称</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="cusAbbr"  name="cusAbbr" class="form-control" value="${cust.cusAbbrName }" >
                                                </div>
                                        </div>
                                    </fieldset>
                                    <div class="form-group">
                                        <label for="num" class="col-sm-2 control-label">客户类别</label>
                                        <div class="col-sm-9" name="source" id="source">
                                            <select class="form-control" name="cusClass" id="cusClass" value="${cust.cusClass }" >
                                                <option value="A" selected>国内客户</option>
                                                <option value="B">国外客户</option>   
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="num" class="col-sm-2 control-label">社会统一信用代码</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="chargeSman" name="chargeSman" class="form-control" value="${cust.unityCreditCode }">
                                        </div>    
                                    </div>
                                    <div class="form-group">
                                        <label for="creater" class="col-sm-2 control-label">法定代表人</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="creater"  name="creater" class="form-control" value="${cust.corporRepresent }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="creater" class="col-sm-2 control-label">注册资金</label>
                                        <div class="col-sm-6">
                                            <input type="text" id="creater"  name="creater" class="form-control" value="${cust.registerFoundation }万">
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="text" id="creater"  name="creater" class="form-control" value="${cust.currency }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="creater" class="col-sm-2 control-label">营业期限</label>
                                        <div class="col-sm-9">
                                             <input type="text" id="creater"  name="creater" class="form-control" value="${cust.businessTerm }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="creater" class="col-sm-2 control-label">注册地址</label>
                                        <div class="col-sm-9">
                                             <input type="text" id="creater"  name="creater" class="form-control" value="${cust.regAddress }">
                                        </div>
                                    </div>  
                                    <div class="form-group">
                                        <label for="creater" class="col-sm-2 control-label">负责业务员</label>
                                        <div class="col-sm-9">
                                             <input type="text" id="creater"  name="creater" class="form-control" value="${cust.chargeSalesman }">
                                        </div>
                                    </div>    
                                </div>
                                <!--end of left column-->
                              <!-- start of right column-->
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="creater" class="col-sm-2 control-label">公司性质</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="creater"  name="creater" class="form-control" value="${cust.corporIdentity }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="creater" class="col-sm-2 control-label">员工人数</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="creater"  name="creater" class="form-control" value="${cust.clerkCount }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="creater" class="col-sm-2 control-label">年营业额</label>
                                        <div class="col-sm-9">
                                             <input type="text" id="creater"  name="creater" class="form-control" value="${cust.annualSales }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="creater" class="col-sm-2 control-label">经营状况</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="creater"  name="creater" class="form-control" value="${cust.businessCondition }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="creater" class="col-sm-2 control-label">所属区域</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="creater"  name="creater" class="form-control" value="${cust.belongDistrict }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="source" class="col-sm-2 control-label">地区</label>
                                        <div class="col-sm-9">
                                            <select class="form-control" name="district" id="district" value="${cust.zone }">
                                                <option value="A001">东北</option>
                                                <option value="A002">华北</option>
                                                <option value="A003">华东</option>
                                                <option value="A004">华中</option> 
                                                <option value="A005" seleced>华南</option>
                                                <option value="A006">西北</option>
                                                <option value="A007">西南</option>
                                                <option value="A008">中南</option>
                                                <option value="A009">香港</option>
                                                <option value="A010">澳门</option>
                                                <option value="A011">国际</option>
                                                <option value="A012">台湾</option>
                                                <option value="B001">北部</option>
                                                <option value="B002">南部</option>
                                                <option value="B003">德国</option>
                                                <option value="B004">法国</option>    
                                            </select>
                                        </div>    
                                    </div>
                                    <div class="form-group">
                                        <label for="creater" class="col-sm-2 control-label">所属方</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="creater"  name="creater" class="form-control" value="${cust.belongCorpor }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="num" class="col-sm-2 control-label">所属BU</label>
                                        <div class="col-sm-9">
                                             <select class="form-control" name="belongBu" id="belongBu" value="${cust.belongBU }">
                                                <option value="30" selected>IT事业处石岩厂区</option>
                                                <option value="32">礼盒专案</option>
                                                <option value="36">深圳裕同</option>
                                                <option value="37">苏州裕同</option>    
                                                <option value="39">精品包装</option>
                                                <option value="40">泸州裕同</option>
                                                <option value="41">九江裕同</option>
                                                <option value="42">成都裕同</option>
                                                <option value="43">许昌裕同</option>
                                                <option value="44">烟台裕同</option>
                                                <option value="45">苏州810B</option>
                                                <option value="46">珠海裕同</option>
                                                <option value="47">武汉裕同</option>
                                                <option value="48">合肥裕同</option>
                                                <option value="50">合肥裕同</option>
                                                <option value="51">东莞裕同</option>    
                                                <option value="52">合肥裕同</option>
                                                <option value="54">合肥裕同</option>
                                                <option value="55">四川君和</option>
                                                <option value="59">苏州昆迅</option>
                                                <option value="60">毫州裕同</option>
                                                <option value="62">说明书事业部</option>
                                                <option value="64">IT事业处龙岗厂区</option>
                                                <option value="70">酒包BG</option>
                                                <option value="75">陕西裕凤</option>
                                                <option value="84">深圳商标部</option>
                                                <option value="85">重庆裕同</option>
                                                <option value="87">供应链中心</option>
                                                <option value="90">越南裕展</option>
                                                <option value="92">九江810B</option>
                                                <option value="93">云创</option>
                                                <option value="94">华智</option>
                                                <option value="95">裕同电子</option>
                                                <option value="101">印想</option>
                                                <option value="104">国内ICTBG</option>
                                                <option value="106">许昌纸托</option>
                                                <option value="106">许昌纸托</option>
                                                <option value="110">大健康BG</option>
                                                <option value="114">化妆品BG</option>
                                                <option value="115">国际BG(B专案)</option>
                                                <option value="116">国际BG(Non A)</option>    
                                            </select>
                                        </div>    
                                    </div>
                                    <div class="form-group">
                                        <label for="creater" class="col-sm-2 control-label">所属BG</label>
                                        <div class="col-sm-9">
                                             <input type="text" id="creater"  name="creater" class="form-control" value="${cust.belongBG }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="num" class="col-sm-2 control-label">客户所属集团</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="postCode" name="postCode" class="form-control" value="${cust.belongClient }">
                                        </div>    
                                    </div>
                                    <div class="form-group">
                                        <label for="num" class="col-sm-2 control-label">所属事业处</label>
                                        <div class="col-sm-9">
                                           <input type="text" id="postCode" name="postCode" class="form-control" value="${cust.belongFactory }">
                                        </div>    
                                    </div>
                                    <div class="form-group">
                                        <label for="num" class="col-sm-2 control-label">首次ERP账套</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="postCode" name="postCode" class="form-control" value="${cust.initERPAccount }">
                                        </div>    
                                    </div>                                   
                                </div>
                                </div>
                            </form>
						</div>
					</div>
				</div>
			</div>
            <div class="row">
				<div class="col-sm-offset-1 col-sm-10">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">常用地址和联系信息</h2>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" action="#" method="post">
								<div class="row">
									<!--Start of left column-->
									<div class="col-sm-6">

										<fieldset disabled>
											<div class="form-group">
												<label for="type" class="col-sm-2 control-label">国内联系地址</label>
												<div class="col-sm-9">
													<input type="text" id="type" class="form-control" value="${cust.domestcAddr }" >
												</div>
											</div>	
										</fieldset>
										<fieldset disabled>
											<div class="form-group">
												<label for="num" class="col-sm-2 control-label">国外联系地址</label>
												<div class="col-sm-9">
													<input type="text" id="num" class="form-control" value="${cust.foreignAddr }">
												</div>
											</div>	
										</fieldset>
										<div class="form-group">
											<label for="clue-name" class="col-sm-2 control-label">邮政编码</label>
											<div class="col-sm-9">
												<input type="text" id="clue-name" class="form-control" value="${cust.postCode }">
											</div>
										</div>
                                        <div class="form-group">
                                        <label for="nation" class="col-sm-2 control-label">国家</label>
                                        <div class="col-sm-9">
                                            <select class="form-control" name="nation" id="nation" value="${cust.nationCode }">
                                                <option value="AD">安道尔共和国</option>
                                                <option value="AE">阿联酋</option>
                                                <option value="AF">阿富汗</option>
                                                <option value="AG">安提瓜和巴布达</option>
                                                <option value="AI">安圭拉岛</option>
                                                <option value="AL">	阿尔巴尼亚</option>
                                                <option value="AM">亚美尼亚</option>
                                                <option value="AO">安哥拉</option>
                                                <option value="AQ">南极洲</option>
                                                <option value="AR">阿根廷</option>
                                                <option value="AS">萨摩亚, 美国</option>
                                                <option value="AT">奥地利</option>
                                                <option value="AU">澳大利亚</option>
                                                <option value="AW">阿鲁巴</option>
                                                <option value="AZ">阿塞拜疆</option>
                                                <option value="BA">波黑</option>
                                                <option value="BB">巴巴多斯</option>
                                                <option value="BD">孟加拉国</option>
                                                <option value="BE">比利时</option>
                                                <option value="BF">布基纳法索</option>
                                                <option value="BG">保加利亚</option>
                                                <option value="BH">巴林</option>
                                                <option value="BI">布隆迪</option>
                                                <option value="BJ">贝宁</option>
                                                <option value="BM">	百慕大群岛	</option>
                                                <option value="BN">文莱达鲁萨兰</option>
                                                <option value="BO">玻利维亚</option>
                                                <option value="BQ">博内尔，沙巴</option>
                                                <option value="BR">巴西</option>
                                                <option value="BS">巴哈马(群岛)</option>
                                                <option value="BT">不丹</option>
                                                <option value="BV">布维群岛</option>
                                                <option value="BW">博茨瓦纳</option>
                                                <option value="BY">白俄罗斯</option>
                                                <option value="BZ">伯利兹</option>
                                                <option value="CA">加拿大</option>
                                                <option value="CC">基林群岛</option>
                                                <option value="CD">刚果民主共和国</option>
                                                <option value="CF">中非共和国</option>
                                                <option value="CG">刚果共和国</option>
                                                <option value="CH">瑞士</option>
                                                <option value="CI">象牙海岸</option>
                                                <option value="CK">科克群岛</option>
                                                <option value="CL">智利</option>
                                                <option value="CM">喀麦隆</option>
                                                <option value="CN">中国</option>
                                                <option value="CO">哥伦比亚</option>
                                                <option value="CR">哥斯答黎加</option>
                                                <option value="CS">塞尔维亚/Monten</option>
                                                <option value="CU">古巴</option>
                                                <option value="CV">佛得角群岛</option>
                                                <option value="CW">库拉索岛</option>
                                                <option value="CX">圣诞岛</option>
                                                <option value="CY">塞浦路斯</option>
                                                <option value="CZ">捷克共和国</option>
                                                <option value="DE">德国</option>
                                                <option value="DJ">吉布提</option>
                                                <option value="DK">丹麦</option>
                                                <option value="DM">多米尼加</option>
                                                <option value="DO">多米尼加共和国</option>
                                                <option value="DZ">阿尔及利亚</option>
                                                <option value="EC">厄瓜多尔</option>
                                                <option value="EE">爱沙尼亚</option>
                                                <option value="EG">埃及</option>
                                                <option value="EH">撒哈拉西部</option>
                                                <option value="ER">埃立特里亚</option>
                                                <option value="ES">西班牙</option>
                                                <option value="ET">埃塞俄比亚</option>
                                                <option value="FI">芬兰</option>
                                                <option value="FJ">斐济</option>
                                                <option value="FK">福克兰群岛</option>
                                                <option value="FM">密克罗尼西亚</option>
                                                <option value="FO">法罗群岛</option>
                                                <option value="FR">法国</option>
                                                <option value="GA">加蓬</option>
                                                <option value="GB">英国</option>
                                                <option value="GD">格林纳达</option>
                                                <option value="GE">乔治亚</option>
                                                <option value="GF">法属圭亚那</option>
                                                <option value="GG">格恩西</option>
                                                <option value="GH">加纳</option>
                                                <option value="GI">直布罗陀</option>
                                                <option value="GL">格陵兰岛</option>
                                                <option value="GM">冈比亚</option>
                                                <option value="GN">几内亚</option>
                                                <option value="GP">瓜达洛普</option>
                                                <option value="GQ">赤道几内亚</option>
                                                <option value="GR">希腊</option>
                                                <option value="GS">南三维治岛</option>
                                                <option value="GT">危地马拉</option>
                                                <option value="GU">关岛</option>
                                                <option value="GW">几内亚比绍</option>
                                                <option value="GY">圭亚那</option>
                                                <option value="HK">中国香港</option>    
                                                <option value="HM">荷德/马克多纳岛</option>
                                                <option value="HN">洪都拉斯</option>
                                                <option value="HR">克罗地亚</option>
                                                <option value="HT">海地</option>
                                                <option value="HU">匈牙利</option>
                                                <option value="ID">印度尼西亚</option>
                                                <option value="IE">爱尔兰</option>
                                                <option value="IL">以色列</option>
                                                <option value="IM">马恩岛</option>
                                                <option value="IN">印度</option>
                                                <option value="IO">英属印度洋区</option>
                                                <option value="IQ">伊拉克</option>
                                                <option value="IR">伊朗</option>
                                                <option value="IS">冰岛</option>
                                                <option value="IT">意大利</option>
                                                <option value="JE">泽西</option>
                                                <option value="JM">牙买加</option>
                                                <option value="JO">约旦</option>
                                                <option value="JP">日本</option>
                                                <option value="KE">肯尼亚</option>
                                                <option value="KG">吉尔吉斯斯坦</option>
                                                <option value="KH">柬埔寨</option>
                                                <option value="KI">基里巴斯</option>
                                                <option value="KM">科摩罗群岛</option>
                                                <option value="KN">圣基茨和那维斯</option>
                                                <option value="KP">北朝鲜</option>
                                                <option value="KR">韩国</option>
                                                <option value="KW">科威特</option>
                                                <option value="KY">开曼群岛</option>
                                                <option value="KZ">哈萨克斯坦</option>
                                                <option value="LA">老挝</option>
                                                <option value="LB">黎巴嫩</option>
                                                <option value="LC">圣路西亚</option>
                                                <option value="LI">列支敦士登</option>
                                                <option value="LK">斯里兰卡</option>
                                                <option value="LR">利比里亚</option>
                                                <option value="LS">莱索托</option>
                                                <option value="LT">立陶宛</option>
                                                <option value="LU">卢森堡</option>
                                                <option value="LV">拉脱维亚</option>
                                                <option value="LY">利比亚</option>
                                                <option value="MA">摩洛哥</option>
                                                <option value="MC">摩纳哥</option>
                                                <option value="MD">摩尔多瓦</option>
                                                <option value="MG">马达加斯加</option>
                                                <option value="MH">马绍尔群岛</option>
                                                <option value="MK">马其顿</option>
                                                <option value="ML">马里</option>
                                                <option value="MM">缅甸</option>
                                                <option value="MN">蒙古</option>
                                                <option value="MO">中国澳门</option>
                                                <option value="MP">北马里亚纳</option>
                                                <option value="MQ">马提尼克</option>
                                                <option value="MR">毛里塔尼亚</option>
                                                <option value="MS">蒙塞拉特岛</option>
                                                <option value="MT">马耳他</option>
                                                <option value="MU">毛里求斯</option>
                                                <option value="MV">马尔代夫</option>
                                                <option value="MW">马拉维</option>
                                                <option value="MX">墨西哥</option>
                                                <option value="MY">马来西亚</option>
                                                <option value="MZ">莫桑比克</option>
                                                <option value="NA">纳米比亚</option>
                                                <option value="NC">新喀里多尼亚</option>
                                                <option value="NE">尼日尔</option>
                                                <option value="NF">诺福克岛</option>
                                                <option value="NG">尼日利亚</option>
                                                <option value="NI">尼加拉瓜</option>
                                                <option value="NL">荷 兰</option>
                                                <option value="NO">挪威</option>
                                                <option value="NP">尼泊尔</option>
                                                <option value="NR">瑙鲁</option>
                                                <option value="NU">纽埃群岛</option>
                                                <option value="NZ">新西兰</option>
                                                <option value="OM">阿曼</option>
                                                <option value="PA">巴拿马</option>
                                                <option value="PE">秘鲁</option>
                                                <option value="PF">法属波利尼西亚</option>
                                                <option value="PG">巴布亚新几内亚</option>
                                                <option value="PH">菲律宾</option>
                                                <option value="PK">巴基斯坦</option>
                                                <option value="PL">波兰</option>
                                                <option value="PM">圣皮埃尔/密克隆</option>
                                                <option value="PN">皮特肯岛</option>
                                                <option value="PR">波多黎哥</option>
                                                <option value="PS">巴基斯坦</option>
                                                <option value="PT">葡萄牙</option>
                                                <option value="PW">帕劳</option>
                                                <option value="PY">巴拉圭</option>
                                                <option value="QA">卡塔尔</option>
                                                <option value="RE">统一</option>
                                                <option value="RO">罗马尼亚</option>
                                                <option value="RU">俄罗斯联邦</option>
                                                <option value="RW">卢旺达</option>
                                                <option value="SA">沙特阿拉伯</option>
                                                <option value="SB">所罗门群岛</option>
                                                <option value="SC">塞舌尔群岛</option>
                                                <option value="SD">苏丹</option>
                                                <option value="SE">瑞典</option>
                                                <option value="SG">新加坡</option>
                                                <option value="SH">圣赫勒拿岛</option>
                                                <option value="SI">斯洛文尼亚</option>
                                                <option value="SJ">皮特肯岛</option>
                                                <option value="SK">斯洛伐克</option>
                                                <option value="SL">塞拉利昂</option>
                                                <option value="SM">圣马力诺</option>
                                                <option value="SN">塞内加尔</option>
                                                <option value="SO">索马里</option>
                                                <option value="SR">苏里南</option>
                                                <option value="SS">南苏丹</option>
                                                <option value="ST">圣多马/普林西比</option>
                                                <option value="SV">萨尔瓦多</option>
                                                <option value="SX">圣马丁</option>
                                                <option value="SY">叙利亚</option>
                                                <option value="SZ">斯威士兰</option>
                                                <option value="TC">	特克斯凯科斯</option>
                                                <option value="TD">乍得</option>
                                                <option value="TF">法国南部地区</option>
                                                <option value="TG">多哥</option>
                                                <option value="TH">泰国</option>
                                                <option value="TJ">塔吉克斯坦</option>
                                                <option value="TK">托客劳群岛</option>
                                                <option value="TL">东帝汶岛</option>
                                                <option value="TM">土库曼斯坦</option>
                                                <option value="TN">突尼斯</option>
                                                <option value="TO">汤加</option>
                                                <option value="TP">东帝汶岛</option>
                                                <option value="TR">土耳其</option>
                                                <option value="TT">特立尼达/多巴哥</option>
                                                <option value="TV">图瓦卢</option>
                                                <option value="TW">台湾</option>
                                                <option value="TZ">坦桑尼亚</option>
                                                <option value="UA">乌克兰</option>
                                                <option value="UG">乌干达</option>
                                                <option value="UM">小奥特兰群岛</option>
                                                <option value="UN">国际</option>
                                                <option value="US">美国</option>
                                                <option value="UY">乌拉圭</option>
                                                <option value="UZ">乌兹别克斯坦</option>
                                                <option value="VA">梵蒂冈城</option>
                                                <option value="VC">圣文森特</option>
                                                <option value="VE">委内瑞拉</option>
                                                <option value="VG">英属维尔京群岛</option>
                                                <option value="VI">美属维尔京群岛</option>
                                                <option value="VN">越南</option>
                                                <option value="VU">瓦努阿图</option>
                                                <option value="WF">瓦利斯/富图纳岛</option>
                                                <option value="WS">萨摩亚</option>
                                                <option value="YE">也门</option>
                                                <option value="YT">马约特岛</option>
                                                <option value="ZA">南非</option>
                                                <option value="ZM">赞比亚</option>
                                                <option value="ZW">津巴布韦</option>
                                            </select>
                                        </div>    
                                    </div>
                                    <div class="form-group">
								        <label for="clue-name" class="col-sm-2 control-label">省区</label>
								        <div class="col-sm-9">
								            <input type="text" id="clue-name" class="form-control" value="${cust.province }">
								        </div>
								    </div>    
                        
								
									</div><!--End of left column-->
									
									<!--Start of right column-->
									<div class="col-sm-6">
										<div class="form-group">
                                        <label for="telephone" class="col-sm-2 control-label">电话</label>
                                            <div class="col-sm-9">
                                               <input type="text" id="telephoneNo" name="telephoneNo" class="form-control" value="${cust.telephone }" >
                                            </div>
                                        </div>
										<div class="form-group">
											<label for="clue-department" class="col-sm-2 control-label">传真</label>
											<div class="col-sm-9">
												<input type="text" id="clue-department" class="form-control" value="${cust.fax }">
											</div>
										</div>
										<div class="form-group">
											<label for="creation-date"  class="col-sm-2 control-label">E-mail</label>
											<div class="col-sm-9">
            									<input class="form-control" type="text" name="creation-date" id="creation-date" value="${cust.email  }">
											</div>
										</div>
										<div class="form-group">
											<label for="clue-asign-date"  class="col-sm-2 control-label">公司网站地址</label>
											<div class="col-sm-9">
            									<input class="form-control" type="text" name="clue-asign-date" id="clue-asign-date" value="${cust.webSite }">
											</div>
										</div>
									
									
									
									</div><!--End of right column-->
								</div><!--End of first row-->
							</form>
						</div>
					</div>
				</div>
			</div>
			</fieldset>
		</div>
		
    	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </body>
</html>