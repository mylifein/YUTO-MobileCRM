package com.sap.conn.jco.controller;


import java.io.IOException;
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
import com.sap.conn.jco.controller.jcoutil.RfcManager;
import com.sap.conn.jco.controller.pojo.Business;
import com.sap.conn.jco.controller.pojo.Clerk;
import com.sap.conn.jco.controller.pojo.CusSearch;
import com.sap.conn.jco.controller.pojo.Message;
import com.sap.conn.jco.controller.service.IClerk;
import com.sap.conn.jco.controller.service.ICustomer;
import com.sap.conn.jco.controller.serviceImpl.ClerkImpl;
import com.sap.conn.jco.controller.serviceImpl.CustomerImpl;
import com.sun.javafx.collections.MappingChange.Map;

@Controller
@RequestMapping("cus")
public class CusCreationController {
	
	@RequestMapping(value="/creation",method=RequestMethod.POST)
	public void search(Business business,HttpServletRequest request,  
            HttpServletResponse response){
		Message message = new Message();
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		ICustomer iCustomer = new CustomerImpl();
		message = iCustomer.createAndModify(business);
		if(message.isFlag()) {
			session.setAttribute("message", "创建或修改客户数据成功,客户编号是" + message.getMessage() );
			try {
				response.sendRedirect(request.getContextPath()+"/user/homePage.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			
		}else {
		    session.setAttribute("message", "创建或修改客户数据失败");
		}			
		
	}
	
	@RequestMapping(value="/searchClerk",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String searchClerk(Clerk clerk,HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		request.setAttribute("clerk", clerk);
		java.util.Map map = new HashMap();//声明一个Map
		List<Object> clerkList = new ArrayList<Object>();
		IClerk iClerk = new ClerkImpl();
		clerkList = iClerk.searchClerk(clerk);
		//session.setAttribute("clerkList", clerkList);
		map.put("clerkList", clerkList);
		return JSON.toJSONString(map);			//格式化成JSON
	}
}

