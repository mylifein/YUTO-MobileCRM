package com.sap.conn.jco.controller.pojo;

import java.util.List;

public class Business {
	private CusSearch cusSearch;			//客户基本信息
	private List<Contacts> contacts ; 	//联系人
	

	
	
	public CusSearch getCusSearch() {
		return cusSearch;
	}
	public void setCusSearch(CusSearch cusSearch) {
		this.cusSearch = cusSearch;
	}
	public List<Contacts> getContacts() {
		return contacts;
	}
	public void setContacts(List<Contacts> contacts) {
		this.contacts = contacts;
	}
	
	
	
	
}
