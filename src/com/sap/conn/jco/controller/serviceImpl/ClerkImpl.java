package com.sap.conn.jco.controller.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.sap.conn.jco.controller.jcoutil.RfcManager;
import com.sap.conn.jco.controller.pojo.Clerk;
import com.sap.conn.jco.controller.service.IClerk;

public class ClerkImpl implements IClerk {

	@Override
	public List<Object> searchClerk(Clerk clerk) {
		// TODO Auto-generated method stub
		//获取RFC对象
		JCoFunction	function = RfcManager.getFunction("ZMOBILE_EMPLOYEE_GET");
		// 设置import参数
		JCoParameterList importParam = function.getImportParameterList();
		importParam.setValue("ZPARTNER_NO", clerk.getEmployeeMark());		//员工编号
		importParam.setValue("ZPARTNER_NAME", clerk.getEmployeeName());		//员工姓名
		// 执行RFC
		RfcManager.execute(function);
		// 获取RFC返回的字段值
		JCoParameterList exportParam = function.getExportParameterList();	
		JCoTable jcoTable = exportParam.getTable("ET_EMP");		
		List<Object> clerkList = new ArrayList<Object>();
		for (int i = 0; i < jcoTable.getNumRows(); i++) {
			jcoTable.setRow(i);
			Clerk searchClerk = new Clerk();
			searchClerk.setEmployeeMark(jcoTable.getString("PARTNER"));
			searchClerk.setEmployeeName(jcoTable.getString("NAME1_TEXT"));
			clerkList.add(searchClerk);
		}
		return clerkList;
	}

}
