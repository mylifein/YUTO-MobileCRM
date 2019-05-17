package com.sap.conn.jco.controller.pojo;

public class Schedule {
	private String item;			//序号
	private String departDate;		//出发日期
	private String arriveDate;		//到达日期
	private String departSite;		//出发地点	
	private String arriveSite;		//到达地点
	private String vehicle;			//交通方式
	
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getDepartDate() {
		return departDate;
	}
	public void setDepartDate(String departDate) {
		this.departDate = departDate;
	}
	public String getArriveDate() {
		return arriveDate;
	}
	public void setArriveDate(String arriveDate) {
		this.arriveDate = arriveDate;
	}
	public String getDepartSite() {
		return departSite;
	}
	public void setDepartSite(String departSite) {
		this.departSite = departSite;
	}
	public String getArriveSite() {
		return arriveSite;
	}
	public void setArriveSite(String arriveSite) {
		this.arriveSite = arriveSite;
	}
	public String getVehicle() {
		return vehicle;
	}
	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}
	
	
}
