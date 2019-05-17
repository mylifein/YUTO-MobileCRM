package com.sap.conn.jco.controller.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.sap.conn.jco.controller.jcoutil.RfcManager;
import com.sap.conn.jco.controller.pojo.ClueReportCondition;
import com.sap.conn.jco.controller.pojo.ClueReportInfo;
import com.sap.conn.jco.controller.pojo.ProcessReportInfo;
import com.sap.conn.jco.controller.pojo.ProcessReportSearch;
import com.sap.conn.jco.controller.pojo.SatifactoryCondition;
import com.sap.conn.jco.controller.pojo.SatisfactoryReportInfo;
import com.sap.conn.jco.controller.service.IReport;

public class ReportImpl implements IReport {

	@Override
	public List<Object> searchClueReport(ClueReportCondition clueCondition) {
		// TODO Auto-generated method stub
		//获取RFC对象
		JCoFunction	function = RfcManager.getFunction("ZMOBILE_ORDER_LE2_LIST_GET");
		//设置import参数
		JCoParameterList importParam = function.getImportParameterList();
		importParam.setValue(clueCondition.getSelectCondiont1(),clueCondition.getInputCondition1());
		importParam.setValue(clueCondition.getSelectCondition2(),clueCondition.getInputCondition2());
		importParam.setValue(clueCondition.getStatusCondition(),clueCondition.getClueStatus());
		//执行RFC
		RfcManager.execute(function);
		//获取RFC返回的字段值
		JCoParameterList exportParam = function.getTableParameterList();
		JCoTable jcoTable = exportParam.getTable("ET_LE2");
		List<Object> clueReportList = new ArrayList<Object>();
		for( int i = 1;i < jcoTable.getNumRows();i++) {
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
		return clueReportList;
	}

	@Override
	public List<Object> searchSatisfactoryReport(SatifactoryCondition satisfactoryCondition) {
		// TODO Auto-generated method stub
		// 获取RFC 对象
		JCoFunction function = RfcManager.getFunction("ZBALV_SATIS_REPAPP");
		// 设置import 参数
		JCoParameterList importParam = function.getImportParameterList();
		importParam.setValue(satisfactoryCondition.getSelectCondition1(),satisfactoryCondition.getInputCondition1());  //第一个搜索条件
		importParam.setValue(satisfactoryCondition.getSelectCondition2(), satisfactoryCondition.getInputCondition2());			//第二个搜索条件
		importParam.setValue(satisfactoryCondition.getSelectConditon3(),satisfactoryCondition.getInputCondition3());
		//执行RFC
		RfcManager.execute(function);
		// 获取RFC返回的字段值
		JCoParameterList exportParam = function.getTableParameterList();
		JCoTable jcoTable = exportParam.getTable("TAB2");
		List<Object> satReport = new ArrayList<Object>();
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
		return satReport;
	}

	@Override
	public List<Object> searchEfficiencyReport(ProcessReportSearch processCondition) {
		// TODO Auto-generated method stub
		//获取RFC对象
		JCoFunction function = RfcManager.getFunction("ZMOBILE_TIME_GET");
		// 设置import参数
		JCoParameterList importParam = function.getImportParameterList();
		importParam.setValue("S_PROC", processCondition.getActivityType());
		importParam.setValue("S_TASK", processCondition.getNodeCode());
		importParam.setValue("S_DATUM", processCondition.getCreateDate());
		importParam.setValue("S_DATUM", processCondition.getEndDate());
		importParam.setValue("S_DATUM", processCondition.getCreateUser());
		//执行RFC
		RfcManager.execute(function);
		//获取RFC返回的字段值
		JCoParameterList exportParam = function.getTableParameterList();
		JCoTable jcoTable = exportParam.getTable("ET_TIME");
		List<Object> efficiencyReportList = new ArrayList<Object>();			
		for( int i = 1;i < jcoTable.getNumRows();i++) {
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
		return efficiencyReportList;
	}

}
