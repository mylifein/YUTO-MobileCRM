package com.sap.conn.jco.controller.service;

import java.util.List;

import com.sap.conn.jco.controller.pojo.User;

public interface IActivity {
	
	//日程提醒活动列表
	public Object[] searchActivityList(String username);
	
	//查询日常活动详细信息
	public Object[] searchAcitivityDetail(String activityMark);


}
