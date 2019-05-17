package com.sap.conn.jco.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.sap.conn.jco.JCo;
import com.sap.conn.jco.JCoField;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.sap.conn.jco.controller.jcoutil.PageUtil;
import com.sap.conn.jco.controller.jcoutil.RfcManager;
import com.sap.conn.jco.controller.pojo.CusSearch;
import com.sap.conn.jco.controller.pojo.Customer;
import com.sap.conn.jco.controller.pojo.DailyActivities;
import com.sap.conn.jco.controller.pojo.User;
import com.sap.conn.jco.controller.service.IActivity;
import com.sap.conn.jco.controller.service.ICustomer;
import com.sap.conn.jco.controller.serviceImpl.ActivityImpl;
import com.sap.conn.jco.controller.serviceImpl.CustomerImpl;
import com.sun.net.httpserver.Authenticator.Success;
/**
 * UserController
 * @author Diven-du
 * @email 1720119806@qq.com
 * @date 2017年9月20日 
 * @version 1.0
 */
@Controller
@RequestMapping("user")
public class LoginController extends MultiActionController{
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public String queryUserById(HttpServletRequest request,  
            HttpServletResponse response,Model model) throws IOException, ServletException{
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String paraname = request.getParameter("username");
		String username = paraname.toUpperCase();
		String password = request.getParameter("password");

		String masg="100";
		if(!StringUtils.isEmpty(username) && !StringUtils.isEmpty(password)){
			
			// 获取RFC 对象
			JCoFunction function = RfcManager.getFunction("ZMOBILE_LOGIN");
			// 设置import 参数
			JCoParameterList importParam = function.getImportParameterList();
			importParam.setValue("USER", username);
			importParam.setValue("PASSWORD", password);
			// 执行RFC
			RfcManager.execute(function);
			
			// 获取RFC返回的字段值
			JCoParameterList exportParam = function.getExportParameterList();
			
			String evParamA = exportParam.getString("EV_FLAG");
			String evParamB = exportParam.getString("EV_MESSAGE");
			String evParamC = exportParam.getString("EV_CREATE");
			String evParamD = exportParam.getString("EV_QUERY");
			String evParamE = exportParam.getString("EV_NAME");
			if("S".equalsIgnoreCase(evParamA)){
				//有无创建权限
				session.setAttribute("EV_CREATE", evParamC);
				//有无查询权限
				session.setAttribute("EV_QUERY", evParamD);
				//用户名保存
				session.setAttribute("userName", username);
				session.setAttribute("clerkName", evParamE);
				session.setAttribute("masg", "200");
				masg="200";
			}else {
				session.setAttribute("masg", "400");
				masg="400";
			}
		}
	//	mv.setViewName("login");
		return masg;
	}
	
	//首页
	@RequestMapping(value="/homePage",method=RequestMethod.POST)
	public ModelAndView homePage(User user,HttpServletRequest request,  //post请求的方法
            HttpServletResponse response){
		String pageNo1 = request.getParameter("pageNo1");
		String pageNo2 = request.getParameter("pageNo2");
		return homePageUtil(user, request, response,pageNo1,pageNo2);
	}	
	
	@RequestMapping(value="/homePage",method=RequestMethod.GET)				//get请求的方法
	public ModelAndView homePage2(User user,HttpServletRequest request,  
            HttpServletResponse response){
		String pageNo1 = request.getParameter("pageNo1");
		String pageNo2 = request.getParameter("pageNo2");
		return homePageUtil(user, request, response,pageNo1,pageNo2);
	}	
	
	public ModelAndView homePageUtil(User user,HttpServletRequest request,  
            HttpServletResponse response,String pageNo1,String pageNo2) {
		ModelAndView mv =  new ModelAndView();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("userName");
		//线索客户查询
		ICustomer customer = new CustomerImpl();
		CusSearch cusSearch = new CusSearch();
		cusSearch.setStatus("Z001");
		List<Object> clueList  = new ArrayList<Object>(); 
		clueList = customer.search(cusSearch, username);
		session.setAttribute("queryList", clueList);
		if((pageNo1 == null || "".equals(pageNo1))&&(pageNo2 == null || "".equals(pageNo2))) {
		//日常活动列表查询
		Object[] schedule = new Object[2];
		IActivity iacticity = new ActivityImpl();
		schedule = iacticity.searchActivityList(username);
		List<Object> list1 = new ArrayList<Object>();
		list1 = (List<Object>) schedule[0];
		 PageUtil pageUtil1 = new PageUtil(list1);				//调用分页工具对象1
		 List<Object> pageList1 = list1.subList(pageUtil1.getBeginIndex(),pageUtil1.getEndIndex() );
		 //结果集存入session 中，可以让下次指定页数分页时不用再重新调用
		 session.setAttribute("searchList1", list1);
		 session.setAttribute("appointment", list1.size());
		 //分页好的结果存入session中
		 session.setAttribute("pageList1", pageList1);
		 //分页信息存入session中
		 session.setAttribute("pageUtil1", pageUtil1);
		 //List<Object> queryList  = new ArrayList<Object>(); 
		 //session.setAttribute("queryList", queryList);

		 List<Object> list2 = new ArrayList<Object>();
		 list2 = (List<Object>) schedule[1];
		 PageUtil pageUtil2 = new PageUtil(list2);				//调用分页工具对象1
		 List<Object> pageList2 = list2.subList(pageUtil2.getBeginIndex(),pageUtil2.getEndIndex() );
		 //结果集存入session 中，可以让下次指定页数分页时不用再重新调用
		 session.setAttribute("searchList2", list2);
		 session.setAttribute("assignment", list2.size());
		 //分页好的结果存入session中
		 session.setAttribute("pageList2", pageList2);
		 //分页信息存入session中
		 session.setAttribute("pageUtil2", pageUtil2); 
		//mv.addObject("list1", list1);
		//mv.addObject("list2", list2);
		}else if(pageNo1 != null && !"".equals(pageNo1)){
			PageUtil pageUtil1 = (PageUtil) session.getAttribute("pageUtil1");
			List<Object> searchList1 = (List<Object>) session.getAttribute("searchList1");
			pageUtil1.setPageNum(Integer.parseInt(pageNo1));
			List<Object> pageList1 = searchList1.subList(pageUtil1.getBeginIndex(),pageUtil1.getEndIndex() );
			session.setAttribute("pageList1", pageList1);
			session.setAttribute("pageUtil1", pageUtil1);
		}else if(pageNo2 != null && !"".equals(pageNo2)) {
			PageUtil pageUtil2 = (PageUtil) session.getAttribute("pageUtil2");
			List<Object> searchList2 = (List<Object>) session.getAttribute("searchList2");
			pageUtil2.setPageNum(Integer.parseInt(pageNo2));
			List<Object> pageList2 = searchList2.subList(pageUtil2.getBeginIndex(),pageUtil2.getEndIndex() );
			session.setAttribute("pageList2", pageList2);
			session.setAttribute("pageUtil2", pageUtil2);
		}
		mv.setViewName("homePage");
		return mv;
		
	}
	
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public void logout(HttpServletRequest request,  
            HttpServletResponse response) throws IOException, ServletException{
			ModelAndView mv =  new ModelAndView();
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		
	}
}
