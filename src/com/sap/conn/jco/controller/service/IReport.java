package com.sap.conn.jco.controller.service;

import java.util.List;

import com.sap.conn.jco.controller.pojo.ClueReportCondition;
import com.sap.conn.jco.controller.pojo.ProcessReportSearch;
import com.sap.conn.jco.controller.pojo.SatifactoryCondition;

public interface IReport {
	
	//线索调查报表搜索
	public List<Object> searchClueReport(ClueReportCondition clueCondition);
	
	//客户满意度调查报表搜索
	public List<Object> searchSatisfactoryReport(SatifactoryCondition satisfactoryCondition);
	
	//流程时效报表搜索
	public List<Object> searchEfficiencyReport(ProcessReportSearch processCondition );
	
	
	
}
