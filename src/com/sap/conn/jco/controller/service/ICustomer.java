package com.sap.conn.jco.controller.service;

import java.util.List;

import com.sap.conn.jco.controller.pojo.Business;
import com.sap.conn.jco.controller.pojo.CusSearch;
import com.sap.conn.jco.controller.pojo.Customer;
import com.sap.conn.jco.controller.pojo.Message;

public interface ICustomer {
	
	//客户搜索的方法
	public List<Object> search(CusSearch cusSearch,String username);

	//客户查询的详细信息
	public Customer searchDetail(String cusMark,String username);
	
	//客户创建和修改
	public Message createAndModify(Business business);
	
}
