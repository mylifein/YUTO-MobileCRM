package com.sap.conn.jco.controller.pojo;

public class ProcessReportInfo {

	private String businessType ;  	//业务事务类型
	private String discription ; 	//描述
	private String businessMark;	//事务标识
	private String nodeCode ;		//节点代码
	private String nodeName ;		//节点代码名称
	private String startTime ;		//开始时间
	private String endTime ;		//结束时间
	private String standardEfficiency;		//标准时效
	private String actualEfficiency;		//实际时效
	private String delayTime ;  		//延误时长
	private String nodeCharger;			//节点负责人
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public String getBusinessMark() {
		return businessMark;
	}
	public void setBusinessMark(String businessMark) {
		this.businessMark = businessMark;
	}
	public String getNodeCode() {
		return nodeCode;
	}
	public void setNodeCode(String nodeCode) {
		this.nodeCode = nodeCode;
	}
	public String getNodeName() {
		return nodeName;
	}
	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getStandardEfficiency() {
		return standardEfficiency;
	}
	public void setStandardEfficiency(String standardEfficiency) {
		this.standardEfficiency = standardEfficiency;
	}
	public String getActualEfficiency() {
		return actualEfficiency;
	}
	public void setActualEfficiency(String actualEfficiency) {
		this.actualEfficiency = actualEfficiency;
	}
	public String getNodeCharger() {
		return nodeCharger;
	}
	public void setNodeCharger(String nodeCharger) {
		this.nodeCharger = nodeCharger;
	}
	public String getDelayTime() {
		return delayTime;
	}
	public void setDelayTime(String delayTime) {
		this.delayTime = delayTime;
	}
	
	
	
}
