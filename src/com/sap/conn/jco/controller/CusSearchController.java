package com.sap.conn.jco.controller;


import java.awt.print.Pageable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sap.conn.jco.JCo;
import com.sap.conn.jco.JCoField;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.sap.conn.jco.controller.jcoutil.PageUtil;
import com.sap.conn.jco.controller.jcoutil.RfcManager;
import com.sap.conn.jco.controller.pojo.ActivityExpense;
import com.sap.conn.jco.controller.pojo.CusSearch;
import com.sap.conn.jco.controller.pojo.Customer;
import com.sap.conn.jco.controller.pojo.DailyActivities;
import com.sap.conn.jco.controller.pojo.Schedule;
import com.sun.javafx.css.converters.ShapeConverter;

@Controller
@RequestMapping("cus")
public class CusSearchController {
	
	@RequestMapping(value="/search",method=RequestMethod.GET)
	public ModelAndView search(CusSearch cusSearch,HttpServletRequest request,  
            HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("cusSearch", cusSearch);
		String userName = (String) session.getAttribute("userName");
		String page = request.getParameter("page");
		if(page == null || "".equals(page)) {
			
			// 获取RFC 对象
		JCoFunction function = RfcManager.getFunction("ZMOBILE_CUST_GET");
			
		// 设置import 参数
		JCoParameterList importParam = function.getImportParameterList();
		String queryNo = "*" + cusSearch.getCustomerNo() + "*";
		String queryName = "*" + cusSearch.getCusAbbr() + "*";
		importParam.setValue("ZTYPE", cusSearch.getStatus());
		importParam.setValue("ZPARTNER_NO", queryNo);
		importParam.setValue("ZPARTNER_NAME", queryName);
		importParam.setValue("ZUSER",userName );
		// 执行RFC
		RfcManager.execute(function);

		JCoParameterList tableParameterList = function.getTableParameterList();
		JCoTable jcoTable = tableParameterList.getTable("ET_CUST");
		List<Object> list = new ArrayList<Object>();
		for (int i = 0; i < jcoTable.getNumRows(); i++) {
			jcoTable.setRow(i);
			Customer cust = new Customer();

			// 用实体类来接收数据
			cust.setBusinessTypes(jcoTable.getString("Z001"));   //交易类型
			cust.setBusinessStatus(jcoTable.getString("Z002"));  
			cust.setCusMark(jcoTable.getString("Z003"));
			cust.setCusAbbrName(jcoTable.getString("Z006"));
			cust.setTelephone(jcoTable.getString("Z033"));
			cust.setZone(jcoTable.getString("Z018"));
			cust.setNation(jcoTable.getString("Z029"));
			cust.setEmail(jcoTable.getString("Z036"));
			cust.setPostCode(jcoTable.getString("Z027"));
			list.add(cust);
		}
		//得到结果集
		mv.addObject("list", list);
		
		//对结果集进行分页操作
		
		PageUtil pageUtil = new PageUtil(list);
		List<Object> pageList = list.subList(pageUtil.getBeginIndex(),pageUtil.getEndIndex() );
		//结果集存入session 中，可以让下次指定页数分页时不用再重新调用
		session.setAttribute("searchcusList", list);
		//分页好的结果存入session中
		session.setAttribute("pagecusList", pageList);
		//分页信息存入session中
		session.setAttribute("pagecusUtil", pageUtil);
		}else {
		//指定某一页时,调用分页工具类修改页面
		PageUtil pageUtil = (PageUtil) session.getAttribute("pagecusUtil");
		List<Object> searchcusList = (List<Object>) session.getAttribute("searchcusList");
		pageUtil.setPageNum(Integer.parseInt(page));
		List<Object> pageList = searchcusList.subList(pageUtil.getBeginIndex(),pageUtil.getEndIndex() );
		session.setAttribute("pagecusList", pageList);
		session.setAttribute("pagecusUtil", pageUtil);
		
		}
		mv.setViewName("CusSearch");
		return mv;
		
	}
	
	//进入展示页面
	@RequestMapping(value="/searchList",method=RequestMethod.GET)
	public ModelAndView searchList(@RequestParam("cusMark")String cusMark ,@RequestParam("keyJ")String distribute ,HttpServletRequest request,  
            HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
//		List<CusSearch> list = (List<CusSearch>) session.getAttribute("searchList");
		if(!StringUtils.isEmpty(cusMark)){
			JCoFunction jCoFunction = RfcManager.getFunction("ZMOBILE_CUST_GET");
			//设置import参数
			JCoParameterList importParams  = jCoFunction.getImportParameterList();
			importParams.setValue("ZPARTNER_NO",cusMark);
			importParams.setValue("ZUSER",userName);
			RfcManager.execute(jCoFunction);
			JCoParameterList exportParam = jCoFunction.getTableParameterList();
			JCoTable jcoTable = exportParam.getTable("ET_CUST");
			Customer cust = new Customer();
			for (int i = 0; i < jcoTable.getNumRows(); i++) {
				jcoTable.setRow(i);
				// 用实体类来接收数据
				cust.setBusinessTypes(jcoTable.getString("Z001"));   //交易类型
				cust.setBusinessStatus(jcoTable.getString("Z002"));  
				cust.setCusMark(jcoTable.getString("Z003"));
				cust.setCusCnName(jcoTable.getString("Z004"));
				cust.setCusEnName(jcoTable.getString("Z005"));
				cust.setCusAbbrName(jcoTable.getString("Z006"));
				cust.setCusClass(jcoTable.getString("Z007"));
				cust.setUnityCreditCode(jcoTable.getString("Z008"));
				cust.setCorporIdentity(jcoTable.getString("Z009"));
				cust.setCorporRepresent(jcoTable.getString("Z010"));
				cust.setRegisterFoundation(jcoTable.getString("Z011"));
				cust.setCurrency(jcoTable.getString("Z038"));
				cust.setBusinessTerm(jcoTable.getString("Z012"));
				cust.setRegAddress(jcoTable.getString("Z013"));
				cust.setClerkCount(jcoTable.getString("Z014"));
				cust.setAnnualSales(jcoTable.getString("Z015"));
				cust.setBusinessCondition(jcoTable.getString("Z016"));
				cust.setBelongDistrict(jcoTable.getString("Z017"));
				cust.setZone(jcoTable.getString("Z018"));
				cust.setBelongCorpor(jcoTable.getString("Z019"));
				cust.setBelongBU(jcoTable.getString("Z020"));
				cust.setBelongClient(jcoTable.getString("Z021"));
				cust.setBelongFactory(jcoTable.getString("Z022"));
				cust.setInitERPAccount(jcoTable.getString("Z023"));
				cust.setChargeSalesman(jcoTable.getString("Z040"));   //负责业务员姓名
				cust.setDomestcAddr(jcoTable.getString("Z025"));
				cust.setForeignAddr(jcoTable.getString("Z026"));
				cust.setPostCode(jcoTable.getString("Z027"));
				cust.setNationCode(jcoTable.getString("Z028")); 
				cust.setNation(jcoTable.getString("Z029"));
				cust.setProvinceCode(jcoTable.getString("Z030"));
				cust.setProvince(jcoTable.getString("Z031"));
				cust.setNationCode(jcoTable.getString("Z032"));
				cust.setTelephone(jcoTable.getString("Z033"));
				cust.setFaxNationCode(jcoTable.getString("Z034"));
				cust.setFax(jcoTable.getString("Z035"));
				cust.setEmail(jcoTable.getString("Z036"));
				cust.setWebSite(jcoTable.getString("Z037"));
				cust.setBelongBG(jcoTable.getString("Z039"));
				cust.setTelephone(jcoTable.getString("Z033"));
				cust.setZone(jcoTable.getString("Z018"));
				cust.setNation(jcoTable.getString("Z029"));
				cust.setEmail(jcoTable.getString("Z036"));
				cust.setPostCode(jcoTable.getString("Z027"));
				cust.setChargeSmanId(jcoTable.getString("Z024"));  //负责业务员编号
			
			}
			mv.addObject("cust",cust);
			
		}
		if(distribute.equals("modify")) {
			mv.setViewName("CusModify");
		}else {
			mv.setViewName("CusDisplay");
		}
		
		return mv;
	}
	
	//显示首页活动的详细
	@RequestMapping(value="/searchHomeItem",method=RequestMethod.GET)
	public ModelAndView searchHomePage(@RequestParam("actMark")String actMark ,HttpServletRequest request,  
            HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();	
		if(!StringUtils.isEmpty(actMark)){
			//获取RFC对象
			JCoFunction jCoFunction = RfcManager.getFunction("ZMOBILE_ORDER_ACE_GET");
			//设置import参数
			JCoParameterList importParams  = jCoFunction.getImportParameterList();
			importParams.setValue("OBJECT_ID",actMark);
			//执行RFC
			RfcManager.execute(jCoFunction);
			//获取export参数
			List<DailyActivities> actList = new ArrayList<DailyActivities>();		//活动数组
			List<Schedule> scheList = new ArrayList<Schedule>();					//日程数组
			List<ActivityExpense> actExpenseList = new ArrayList<ActivityExpense>();	//费用列表数组
			DailyActivities dailyAct = new DailyActivities();
			JCoParameterList exportParams = jCoFunction.getTableParameterList();
			JCoTable actDetail = exportParams.getTable("ET_ACE");			//获得日常活动计划单基本信息
			for(int i = 0;i < actDetail.getNumRows();i++) {
				actDetail.setRow(i);
				dailyAct.setActMark(actDetail.getString("OBJECT_ID"));		//事务标识
				dailyAct.setActivityType(actDetail.getString("ZZAFLD0000KV")); 	//市场活动类型
				dailyAct.setBusinessType(actDetail.getString("ZZAFLD0000MD"));	//出差类型
				dailyAct.setActDesc(actDetail.getString("DESCRIPTION"));		//活动描述
				dailyAct.setLocation(actDetail.getString("ACT_LOCATION"));		//地点
				dailyAct.setChargePerson(actDetail.getString("EMPLOYEE"));		//负责员工
				dailyAct.setStatus(actDetail.getString("STAT"));					//活动状态
				dailyAct.setActStartDate(actDetail.getString("DATE_FROM"));				//活动开始日期
				dailyAct.setActEndDate(actDetail.getString("DATE_TO"));					//活动结束日期
				dailyAct.setEndTime(actDetail.getString("TIME_TO"));					//activity end time
				dailyAct.setStartTime(actDetail.getString("TIME_FROM"));  				//activity start time
				dailyAct.setCust(actDetail.getString("CUST"));					//客户简称
				dailyAct.setCustAct(actDetail.getString("CONTACT"));			//客户联系人
				dailyAct.setTotalExpense(actDetail.getString("ZZAFLD0000LE"));	//费用合计
				dailyAct.setDepartment(actDetail.getString("ZZBUDGET_DEP"));	//负责部门
				//actList.add(dailyAct);  	
			};
			JCoTable scheduleTab = exportParams.getTable("ET_ACE_01A4");	//获得日程列表
			for(int i = 0;i < scheduleTab.getNumRows();i++) {
				scheduleTab.setRow(i);
				Schedule sche = new Schedule();
				sche.setItem(scheduleTab.getString("ZZAFLD0000LH"));				//序号
				sche.setDepartDate(scheduleTab.getString("ZZAFLD0000KX"));			//出发日期
				sche.setArriveDate(scheduleTab.getString("ZZAFLD0000KY"));			//到达日期
				sche.setDepartSite(scheduleTab.getString("ZZAFLD0000KZ"));			//出发地点
				sche.setArriveSite(scheduleTab.getString("ZZAFLD0000L0"));			//到达地点
				sche.setVehicle(scheduleTab.getString("ZZAFLD0000LG"));				//交通方式
				scheList.add(sche);
			}
			JCoTable expenseTab = exportParams.getTable("ET_ACE_01A5");		//获得费用估算列表
			for(int i = 0;i < expenseTab.getNumRows();i++) {
				expenseTab.setRow(i);
				ActivityExpense actExpense = new ActivityExpense();
				actExpense.setItem(expenseTab.getString("ZZAFLD0000LJ"));				//序号
				actExpense.setBudgetNo(expenseTab.getString("ZZAFLD0000L2"));			//预算项编码
				actExpense.setBalanceMoney(expenseTab.getString("ZZAFLD0000LM"));		//可用余额
				actExpense.setEvaluateExpense(expenseTab.getString("ZZAFLD0000LN"));    //估算金额
				actExpense.setHotelPrice(expenseTab.getString("ZZAFLD0000LO")); 		//酒店单价
				actExpense.setBoardDays(expenseTab.getString("ZZAFLD0000LP"));			//住宿天数
				actExpense.setShuttleExpense(expenseTab.getString("ZZAFLD0000LQ"));  	//往返交通费用
				actExpense.setTripExpense(expenseTab.getString("ZZAFLD0000LR"));       //短途费用
				actExpense.setEatCompensation(expenseTab.getString("ZZAFLD0000LS"));   	//餐补
				actExpense.setOther(expenseTab.getString("ZZAFLD0000LT"));   			//其他
				actExpenseList.add(actExpense);
			}
			mv.addObject("dailyAct", dailyAct);
			mv.addObject("scheList", scheList);
			mv.addObject("actExpenseList",actExpenseList);
		}
		mv.setViewName("ScheduleDisplay");
		
		return mv;
	}

}

