package com.sap.conn.jco.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.sap.conn.jco.JCoField;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.sap.conn.jco.controller.jcoutil.PageUtil;
import com.sap.conn.jco.controller.jcoutil.RfcManager;
import com.sap.conn.jco.controller.pojo.Clerk;
import com.sap.conn.jco.controller.pojo.ClueReportCondition;
import com.sap.conn.jco.controller.pojo.ClueReportInfo;
import com.sap.conn.jco.controller.pojo.CusSearch;
import com.sap.conn.jco.controller.pojo.ProcessReportInfo;
import com.sap.conn.jco.controller.pojo.ProcessReportSearch;
import com.sap.conn.jco.controller.pojo.SatifactoryCondition;
import com.sap.conn.jco.controller.pojo.SatisfactoryReportInfo;
import com.sun.javafx.collections.MappingChange.Map;
import com.sun.swing.internal.plaf.metal.resources.metal_zh_TW;

@Controller
@RequestMapping("report")
public class ReporViewController {
	
	@RequestMapping(value="/satisfactory",method=RequestMethod.GET)
	public ModelAndView search(SatifactoryCondition condition,HttpServletRequest request,  
            HttpServletResponse response){
			ModelAndView mv = new ModelAndView();	
			HttpSession session = request.getSession();
			session.setAttribute("satifcondition", condition);
			String page = request.getParameter("page");
			if(page == null || "".equals(page)) {
			// 获取RFC 对象
			JCoFunction function = RfcManager.getFunction("ZBALV_SATIS_REPAPP");
			
			// 设置import 参数
			JCoParameterList importParam = function.getImportParameterList();
			importParam.setValue(condition.getSelectCondition1(),condition.getInputCondition1());  //第一个搜索条件
			importParam.setValue(condition.getSelectCondition2(), condition.getInputCondition2());			//第二个搜索条件
			importParam.setValue(condition.getSelectConditon3(),condition.getInputCondition3());
			// 执行RFC
			RfcManager.execute(function);
			
			// 获取RFC返回的字段值
			JCoParameterList exportParam = function.getTableParameterList();
			JCoTable jcoTable = exportParam.getTable("TAB2");
			List satReport = new ArrayList();
			for(int i=0;i < jcoTable.getNumRows();i++) {
				jcoTable.setRow(i);
				SatisfactoryReportInfo satisfactory = new SatisfactoryReportInfo();
				satisfactory.setCusMark(jcoTable.getString("PARTNER"));
				satisfactory.setCusName(jcoTable.getString("NAME1_TEXT"));
				satisfactory.setChargeClerk(jcoTable.getString("FUZEYUANGONG"));
				satisfactory.setBelongDep(jcoTable.getString("SUOSHUDEP"));
				satisfactory.setBelongBU(jcoTable.getString("SUOSHUSHIYECHU"));
				satisfactory.setTotalScore(jcoTable.getString("ZZAFLD0000I7"));
				satisfactory.setInvestigateDate(jcoTable.getString("Z_SURVEYENDDATE"));
				
				satReport.add(satisfactory);
			}
			
			mv.addObject("satReport", satReport);
			PageUtil pagesatisUtil = new PageUtil(satReport);
			List<Object> pagesatisList = satReport.subList(pagesatisUtil.getBeginIndex(),pagesatisUtil.getEndIndex() );
			//结果集存入session 中，可以让下次指定页数分页时不用再重新调用
			session.setAttribute("searchsatisList", satReport);
			//分页好的结果存入session中
			session.setAttribute("pagesatisList", pagesatisList);
			//分页信息存入session中
			session.setAttribute("pagesatisUtil", pagesatisUtil);
			}else {
				//指定某一页时,调用分页工具类修改页面
				PageUtil pagesatisUtil = (PageUtil) session.getAttribute("pagesatisUtil");
				List<Object> searchsatisList = (List<Object>) session.getAttribute("searchsatisList");
				pagesatisUtil.setPageNum(Integer.parseInt(page));
				List<Object> pagesatisList = searchsatisList.subList(pagesatisUtil.getBeginIndex(),pagesatisUtil.getEndIndex() );
				session.setAttribute("pagesatisList", pagesatisList);
				session.setAttribute("pagesatisUtil", pagesatisUtil);
			}
		
		mv.setViewName("SatisfactoryInvestigate");
		return mv;
	}
	
	@RequestMapping(value="/clueReport",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView searchClueReport(ClueReportCondition clueCondition,HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("clueCondition", clueCondition);
		String page = request.getParameter("page");
		String query1;
		String query2;
		if(page == null || "".equals(page)) {
		//获取RFC对象
		JCoFunction	function = RfcManager.getFunction("ZMOBILE_ORDER_LE2_LIST_GET");	
		//设置import参数
		if(clueCondition.getSelectCondiont1().equals("OBJECT_ID") || clueCondition.getSelectCondiont1().equals("CUST_PARTNER")) {
			
			query1 = clueCondition.getInputCondition1().toUpperCase();
			
		}else{
			query1 = "*" + clueCondition.getInputCondition1().toUpperCase() + "*" ;
		};
		if(clueCondition.getSelectCondition2().equals("OBJECT_ID")|| clueCondition.getSelectCondition2().equals("CUST_PARTNER")) {
			query2 = clueCondition.getInputCondition2().toUpperCase();
			
		}else{
			query2 = "*" + clueCondition.getInputCondition2().toUpperCase() + "*" ;
		};
		JCoParameterList importParam = function.getImportParameterList();
		String userName	= (String) session.getAttribute("userName");
		importParam.setValue(clueCondition.getSelectCondiont1(),query1);
		importParam.setValue(clueCondition.getSelectCondition2(),query2);
		importParam.setValue(clueCondition.getStatusCondition(),clueCondition.getClueStatus());
		//执行RFC
		RfcManager.execute(function);
		
		//获取RFC返回的字段值
		JCoParameterList exportParam = function.getTableParameterList();
		JCoTable jcoTable = exportParam.getTable("ET_LE2");
		List<Object> clueReportList = new ArrayList<Object>();
		for( int i = 0;i < jcoTable.getNumRows();i++) {
			jcoTable.setRow(i);
			ClueReportInfo clueInfo = new ClueReportInfo();		
			clueInfo.setClueNo(jcoTable.getString("OBJECT_ID"));		//获得线索编号
			clueInfo.setClueName(jcoTable.getString("DESCRIPTION"));	//线索名称
			clueInfo.setCusNo(jcoTable.getString("CUST_PARTNER"));		//客户编号
			clueInfo.setCusName(jcoTable.getString("CUST_MC_NAME1"));	//客户名称
			clueInfo.setClueProvider(jcoTable.getString("EMP_PROVIDER"));	//线索提供人			
			clueInfo.setClueTracker(jcoTable.getString("EMP_FOLLOWER"));	//线索跟进人	
			clueInfo.setClueProvideDep(jcoTable.getString("ZZLED_DEPART"));		//线索提供部门
			clueInfo.setCreateDate(jcoTable.getString("DATE_FROM"));		//线索开始日期
			clueInfo.setClueDueDate(jcoTable.getString("DATE_TO"));			//线索结束日期
			clueInfo.setAnticipateProjMoney(jcoTable.getString("ZZAFLD0000LY"));	//预估项目金额
			clueInfo.setAnticipateProProfit(jcoTable.getString("ZZAFLD0000TS"));	//预估项目毛利(%)
			clueInfo.setAnticipateBuyDate(jcoTable.getString("ZZAFLD0000M1"));		//预计采购时间
			clueReportList.add(clueInfo);
			
		}		
		//session.setAttribute("clerkList", clerkList);
		PageUtil pageUtil = new PageUtil(clueReportList);
		List<Object> pageList = clueReportList.subList(pageUtil.getBeginIndex(),pageUtil.getEndIndex() );
		//结果集存入session 中，可以让下次指定页数分页时不用再重新调用
		session.setAttribute("searchList", clueReportList);
		//分页好的结果存入session中
		session.setAttribute("pageList", pageList);
		//分页信息存入session中
		session.setAttribute("pageUtil", pageUtil);
		}else {
			//指定某一页时,调用分页工具类修改页面
			PageUtil pageUtil = (PageUtil) session.getAttribute("pageUtil");
			List<Object> searchList = (List<Object>) session.getAttribute("searchList");
			pageUtil.setPageNum(Integer.parseInt(page));
			List<Object> pageList = searchList.subList(pageUtil.getBeginIndex(),pageUtil.getEndIndex() );
			session.setAttribute("pageList", pageList);
			session.setAttribute("pageUtil", pageUtil);
		}
		mv.setViewName("clueSearch");
		return mv;			
	}
	
	@RequestMapping(value="/efficiencyReport",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView searchEfficencyReport(ProcessReportSearch searchCondition ,HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		request.setAttribute("searchCondition", searchCondition);
		HttpSession session = request.getSession();
		String page = request.getParameter("page");
		if(page == null || "".equals(page)) {
		//获取RFC对象
		JCoFunction	function = RfcManager.getFunction("ZMOBILE_TIME_GET");
		//设置import参数
		JCoParameterList importParam = function.getImportParameterList();
		String userName	= (String) session.getAttribute("userName");
		importParam.setValue("S_PROC",searchCondition.getActivityType());
		importParam.setValue("S_TASK",searchCondition.getNodeCode());
		importParam.setValue("S_DATUM",searchCondition.getCreateDate());
		importParam.setValue("S_DATUM",searchCondition.getEndDate());
		importParam.setValue("S_DATUM",searchCondition.getCreateUser());
		//执行RFC
		RfcManager.execute(function);
		
		//获取RFC返回的字段值
		JCoParameterList exportParam = function.getTableParameterList();
		JCoTable jcoTable = exportParam.getTable("ET_TIME");
		List<Object> efficiencyReportList = new ArrayList<Object>();
		for( int i = 0;i < jcoTable.getNumRows();i++) {
			jcoTable.setRow(i);
			ProcessReportInfo efficiencyInfo = new ProcessReportInfo();
			efficiencyInfo.setActualEfficiency(jcoTable.getString("ACTUAL_TIME"));	//实际时效
			efficiencyInfo.setBusinessMark(jcoTable.getString("OBJECT_ID"));	//事务标识
			efficiencyInfo.setBusinessType(jcoTable.getString("PROCESS_TYPE"));		//业务事务类型
			efficiencyInfo.setDiscription(jcoTable.getString("P_DESCRIPTION"));		//描述
			efficiencyInfo.setEndTime(jcoTable.getString("END_TIME"));				//结束时间
			efficiencyInfo.setNodeCharger(jcoTable.getString("RSPN_NAME"));			//节点负责人
			efficiencyInfo.setNodeCode(jcoTable.getString("ZTASK_CODE"));			//节点代码
			efficiencyInfo.setNodeName(jcoTable.getString("ZTASKNAME"));			//节点名称
			efficiencyInfo.setStandardEfficiency(jcoTable.getString("ZSTNDTM"));	//实际时效(小时)
			efficiencyInfo.setStartTime(jcoTable.getString("START_TIME"));			//开始时间
			efficiencyInfo.setDelayTime(jcoTable.getString("DELAY_TIME"));			//延迟时效	
			efficiencyReportList.add(efficiencyInfo);
			
		}		
		//session.setAttribute("clerkList", clerkList);
		mv.addObject("efficiencyReportList", efficiencyReportList);
		PageUtil pageEffiencyUtil = new PageUtil(efficiencyReportList);
		List<Object> pageEffiencyList = efficiencyReportList.subList(pageEffiencyUtil.getBeginIndex(),pageEffiencyUtil.getEndIndex() );
		//结果集存入session 中，可以让下次指定页数分页时不用再重新调用
		session.setAttribute("efficiencyReportList", efficiencyReportList);
		//分页好的结果存入session中
		session.setAttribute("pageEffiencyList", pageEffiencyList);
		//分页信息存入session中
		session.setAttribute("pageEffiencyUtil", pageEffiencyUtil);
		}else {
			//指定某一页时,调用分页工具类修改页面
			PageUtil pageEffiencyUtil = (PageUtil) session.getAttribute("pageEffiencyUtil");
			List<Object> efficiencyReportList = (List<Object>) session.getAttribute("efficiencyReportList");
			pageEffiencyUtil.setPageNum(Integer.parseInt(page));
			List<Object> pageEffiencyList = efficiencyReportList.subList(pageEffiencyUtil.getBeginIndex(),pageEffiencyUtil.getEndIndex() );
			session.setAttribute("pageEffiencyList", pageEffiencyList);
			session.setAttribute("pageEffiencyUtil", pageEffiencyUtil);
		}
		mv.setViewName("processEffiencyReport");
		return mv;			
	}
}

