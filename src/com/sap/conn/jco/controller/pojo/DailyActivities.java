package com.sap.conn.jco.controller.pojo;
/**
 * 展示实体
 * @author xiaobbo
 *
 */
public class DailyActivities {

	private String actMark;		//活动标识
	private String actDesc;		//活动描述
	private String customer;	//
	private String location;	//地点
	private String actStartDate;	//活动开始日期
	private String startTime ;  	//活动开始时间
	private String actEndDate;		//活动结束日期
	private String endTime ; 		//活动结束时间
	private String status; 			//状态		
	private String cust; 			//客户简称
	private String custAct; 		//客户联系人
	private String place; //地方
	private String activityType;//活动类型
	private String businessType;//出差类型
	private String totalExpense;//费用合计
	private String department;//部门
	private String chargePerson;//负责员工
	
	
	
	
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getTotalExpense() {
		return totalExpense;
	}
	public void setTotalExpense(String totalExpense) {
		this.totalExpense = totalExpense;
	}
	public String getCustAct() {
		return custAct;
	}
	public void setCustAct(String custAct) {
		this.custAct = custAct;
	}
	
	public String getCust() {
		return cust;
	}
	public void setCust(String cust) {
		this.cust = cust;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getActEndDate() {
		return actEndDate;
	}
	public void setActEndDate(String actEndDate) {
		this.actEndDate = actEndDate;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getActivityType() {
		return activityType;
	}
	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}
	public String getActMark() {
		return actMark;
	}
	public void setActMark(String actMark) {
		this.actMark = actMark;
	}
	public String getActDesc() {
		return actDesc;
	}
	public void setActDesc(String actDesc) {
		this.actDesc = actDesc;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getActStartDate() {
		return actStartDate;
	}
	public void setActStartDate(String actStartDate) {
		this.actStartDate = actStartDate;
	}
	public String getChargePerson() {
		return chargePerson;
	}
	public void setChargePerson(String chargePerson) {
		this.chargePerson = chargePerson;
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
	@Override
	public String toString() {
		return "DailyActivities [actMark=" + actMark + ", actDesc=" + actDesc
				+ ", customer=" + customer + ", location=" + location
				+ ", actStartDate=" + actStartDate + ", actEndDate="
				+ actEndDate + ", status=" + status + ", cust=" + cust
				+ ", custAct=" + custAct + ", place=" + place
				+ ", activityType=" + activityType + ", businessType="
				+ businessType + ", totalExpense=" + totalExpense
				+ ", department=" + department + ", chargePerson="
				+ chargePerson + "]";
	}
	
	
	
	
	
}
