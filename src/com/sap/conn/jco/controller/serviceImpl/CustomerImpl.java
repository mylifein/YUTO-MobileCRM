package com.sap.conn.jco.controller.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.omg.PortableServer.ServantRetentionPolicyValue;

import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.sap.conn.jco.controller.jcoutil.RfcManager;
import com.sap.conn.jco.controller.pojo.Business;
import com.sap.conn.jco.controller.pojo.CusSearch;
import com.sap.conn.jco.controller.pojo.Customer;
import com.sap.conn.jco.controller.pojo.Message;
import com.sap.conn.jco.controller.service.ICustomer;

public class CustomerImpl implements ICustomer {

	@Override
	public List<Object> search(CusSearch cusSearch,String username) {
		// TODO Auto-generated method stub
		// 获取RFC 对象
		JCoFunction function = RfcManager.getFunction("ZMOBILE_CUST_GET");
		// 设置import 参数
		JCoParameterList importParam = function.getImportParameterList();
		importParam.setValue("ZTYPE", cusSearch.getStatus());
		importParam.setValue("ZPARTNER_NO", cusSearch.getCustomerNo());
		importParam.setValue("ZPARTNER_NAME", cusSearch.getCusAbbr());
		importParam.setValue("ZUSER", username);
		// 执行RFC
		RfcManager.execute(function);
		// 获得RFC 返回参数
		JCoParameterList tableParameterList = function.getTableParameterList();
		JCoTable jcoTable = tableParameterList.getTable("ET_CUST");
		List<Object> list = new ArrayList<Object>();
		for (int i = 0; i < jcoTable.getNumRows(); i++) {
			jcoTable.setRow(i);
			Customer cust = new Customer();
			// 用实体类来接收数据
			cust.setBusinessTypes(jcoTable.getString("Z001"));   //交易类型
			cust.setBusinessStatus(jcoTable.getString("Z002"));  
			cust.setCusMark(jcoTable.getString("Z003"));
			cust.setCusAbbrName(jcoTable.getString("Z006"));
			cust.setTelephone(jcoTable.getString("Z033"));
			cust.setZone(jcoTable.getString("Z018"));
			cust.setNation(jcoTable.getString("Z029"));
			cust.setEmail(jcoTable.getString("Z036"));
			cust.setPostCode(jcoTable.getString("Z027"));
			list.add(cust);
		}
			
		return list;
	}


	@Override
	public Customer searchDetail(String cusMark, String username) {
		// TODO Auto-generated method stub
		//获取RFC对象
		JCoFunction jCoFunction = RfcManager.getFunction("ZMOBILE_CUST_GET");
		//设置import参数
		JCoParameterList importParams  = jCoFunction.getImportParameterList();
		importParams.setValue("ZPARTNER_NO",cusMark);
		importParams.setValue("ZUSER",username);
		RfcManager.execute(jCoFunction);
		//获得RFC返回参数
		JCoParameterList exportParam = jCoFunction.getTableParameterList();
		JCoTable jcoTable = exportParam.getTable("ET_CUST");
		Customer cust = new Customer();
		for (int i = 0; i < jcoTable.getNumRows(); i++) {
			jcoTable.setRow(i);
			// 用实体类来接收数据
			cust.setBusinessTypes(jcoTable.getString("Z001"));   		//交易类型
			cust.setBusinessStatus(jcoTable.getString("Z002"));  		//交易状态
			cust.setCusMark(jcoTable.getString("Z003"));				//客户编号
			cust.setCusCnName(jcoTable.getString("Z004"));				//客户全称(中文)
			cust.setCusEnName(jcoTable.getString("Z005"));				//客户全称(英文
			cust.setCusAbbrName(jcoTable.getString("Z006"));			//客户简称	
			cust.setCusClass(jcoTable.getString("Z007"));				//客户类别
			cust.setUnityCreditCode(jcoTable.getString("Z008"));		//统一社会信用代码
			cust.setCorporIdentity(jcoTable.getString("Z009"));			//公司性质
			cust.setCorporRepresent(jcoTable.getString("Z010"));		//企业法人代表
			cust.setRegisterFoundation(jcoTable.getString("Z011"));		//注册资金(万元)
			cust.setBusinessTerm(jcoTable.getString("Z012"));			//营业期限
			cust.setRegAddress(jcoTable.getString("Z013"));				//注册地址
			cust.setClerkCount(jcoTable.getString("Z014"));				//员工人数
			cust.setAnnualSales(jcoTable.getString("Z015"));			//年营业额
			cust.setBusinessCondition(jcoTable.getString("Z016"));		//经营状况
			cust.setBelongDistrict(jcoTable.getString("Z017"));			//所属区域
			cust.setZone(jcoTable.getString("Z018"));					//地区
			cust.setBelongCorpor(jcoTable.getString("Z019"));			//所属方
			cust.setBelongBU(jcoTable.getString("Z020"));				//所属BU
			cust.setBelongClient(jcoTable.getString("Z021"));			//所属集团
			cust.setBelongFactory(jcoTable.getString("Z022"));			//所属事业处
			cust.setInitERPAccount(jcoTable.getString("Z023"));			//ERP账套
			cust.setChargeSmanId(jcoTable.getString("Z024"));  			//负责业务员编号
			cust.setDomestcAddr(jcoTable.getString("Z025"));			//联系地址(国内)
			cust.setForeignAddr(jcoTable.getString("Z026"));			//联系地址(国外)
			cust.setPostCode(jcoTable.getString("Z027"));				//城市邮政编码
			cust.setNationCode(jcoTable.getString("Z028")); 			//国家/地区代码
			cust.setNation(jcoTable.getString("Z029"));					//国家描述
			cust.setProvinceCode(jcoTable.getString("Z030"));			//省区代码
			cust.setProvince(jcoTable.getString("Z031"));				//省区描述
			cust.setNationCode(jcoTable.getString("Z032"));				//电话国家
			cust.setTelephone(jcoTable.getString("Z033"));				//电话
			cust.setFaxNationCode(jcoTable.getString("Z034"));			//传真国家
			cust.setFax(jcoTable.getString("Z035"));					//传真
			cust.setEmail(jcoTable.getString("Z036"));					//EMAIL
			cust.setWebSite(jcoTable.getString("Z037"));				//公司网站地址
			cust.setCurrency(jcoTable.getString("Z038"));				//币别
			cust.setBelongBG(jcoTable.getString("Z039"));				//所属BG
			cust.setChargeSalesman(jcoTable.getString("Z040"));   		//负责业务员姓名	
		}
		return cust;
	}

	@Override
	public Message createAndModify(Business business) {
		// TODO Auto-generated method stub
		// 获取RFC 对象
		Message message = new Message();
		boolean flag = false;
		JCoFunction function = RfcManager.getFunction("ZMOBILE_CUST_LEAD_CREATE");
		// 设置import 参数
		JCoParameterList importParam = function.getImportParameterList();
		JCoParameterList paramTable = function.getTableParameterList();
		
		// 设置table 参数
		JCoTable contactTable = paramTable.getTable("ZCONTACTS");
		if(business.getContacts().size() > 0 ) {
		for(int i = 0 ; i < business.getContacts().size() ; i++) {
			contactTable.appendRow();
			contactTable.setRow(i);
			contactTable.setValue("ZLASTNAME", business.getContacts().get(i).getSurname());   	//姓
			contactTable.setValue("ZFIRSTNAME", business.getContacts().get(i).getFirstName()); 	//名
			contactTable.setValue("ZBIRTHDATE", business.getContacts().get(i).getBornDate());	//出生日期
			contactTable.setValue("ZFUNCTION", business.getContacts().get(i).getDuty());		//职务
			contactTable.setValue("ZDEPARTMENT", business.getContacts().get(i).getDepartment());//部门	
			contactTable.setValue("ZTELEPHONE", business.getContacts().get(i).getMobileNumber());//移动电话					
			contactTable.setValue("ZE_MAIL", business.getContacts().get(i).getEmail());			 //邮箱地址
			contactTable.setValue("ZZQQ_NO", business.getContacts().get(i).getQqInfo());		 //QQ	
			contactTable.setValue("ZZWECHAT_NO", business.getContacts().get(i).getWeChat());	 //微信号
			
		};
		}
		
//		JCoParameterList imporTableParams =jCoFunction.getTableParameterList();  	//设置联系人table
		importParam.setValue("Z000", business.getCusSearch().getCustomerNo());		//客户编号
		importParam.setValue("Z001", business.getCusSearch().getCusAbbr());			//客户简称
		importParam.setValue("Z002", business.getCusSearch().getCusClass());			//客户类别
		importParam.setValue("Z003", business.getCusSearch().getCusDistrict());		//地区	
		importParam.setValue("Z004", business.getCusSearch().getBelongBu());			//所属BU
		importParam.setValue("Z005", business.getCusSearch().getClerkMark());			//负责业务员
		importParam.setValue("Z006", business.getCusSearch().getPostCode());			//邮政编码
		importParam.setValue("Z007", business.getCusSearch().getCusNation());			//国家
		importParam.setValue("Z008", business.getCusSearch().getCusTelephone());		//电话号码
		importParam.setValue("Z009", business.getCusSearch().getCreater());			//创建人
		importParam.setValue("Z010", business.getCusSearch().getDomesticAddr());      //联系地址(国内)
		importParam.setValue("Z011", business.getCusSearch().getForeignAddr());		//联系地址(国外)
		importParam.setValue("Z012", business.getCusSearch().getCusName());            //客户中文(全称)
		importParam.setValue("Z013", business.getCusSearch().getCusEnName());			//客户英文(全称)
		importParam.setValue("Z014", business.getCusSearch().getStatus()); 					//客户状态
		// 执行RFC
		RfcManager.execute(function);
		// 获取RFC返回的字段值
		JCoParameterList exportParam = function.getExportParameterList();
		String evParamA = exportParam.getString("EV_TYPE");		  		//消息类型
		String evParamB = exportParam.getString("EV_MESSAGE");			//消息文本
		String evParamC = exportParam.getString("EV_PARTNER");			//业务伙伴编号
		System.out.println("返回消息文本:"+evParamB);
		System.out.println("返回消息文本:"+evParamC);
		if(evParamA.equals("S")) {
				flag = true;
				
		}
		message.setFlag(flag);
		message.setMessage(evParamC);
		return message;
	}

}
