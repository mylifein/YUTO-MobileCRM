package com.sap.conn.jco.controller.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.sap.conn.jco.controller.jcoutil.RfcManager;
import com.sap.conn.jco.controller.pojo.ActivityExpense;
import com.sap.conn.jco.controller.pojo.DailyActivities;
import com.sap.conn.jco.controller.pojo.Schedule;
import com.sap.conn.jco.controller.pojo.User;
import com.sap.conn.jco.controller.service.IActivity;

public class ActivityImpl implements IActivity {

	@Override
	public Object[] searchActivityList(String username) {
		// TODO Auto-generated method stub
		//定义一个Object数组
		Object[] listObject = new Object[2]; 	
		// 获取RFC 对象
		JCoFunction function = RfcManager.getFunction("ZMOBILE_ORDER_ACE_LIST_GET");
		// 设置import 参数				
		JCoParameterList importParam = function.getImportParameterList();
		importParam.setValue("USER", username);
		// 执行RFC
		RfcManager.execute(function);
		// 获取RFC返回的字段值
		JCoParameterList tableParameterList = function.getTableParameterList();
		JCoTable jcoTable = tableParameterList.getTable("ET_ACE1");   	//今日的预约活动列表
		JCoTable jcoTable2 = tableParameterList.getTable("ET_ACE2");	//未完成的日常活动明细项
		List<Object> list1 = new ArrayList<Object>();					//今日的预约活动列表list
		List<Object> list2 = new ArrayList<Object>();					//未完成的日常活动明细项list
		for (int i = 0; i < jcoTable.getNumRows(); i++) {
			jcoTable.setRow(i);
			DailyActivities da = new DailyActivities();
			// 用实体类来接收数据
			da.setActMark(jcoTable.getString("OBJECT_ID")); // 事务标识
			da.setActivityType(jcoTable.getString("ZZAFLD0000KV")); // 市场活动类型
			da.setBusinessType(jcoTable.getString("ZZAFLD0000MD")); // 出差类型
			da.setActDesc(jcoTable.getString("DESCRIPTION")); // 事务描述
			da.setActStartDate(jcoTable.getString("DATE_FROM")); // 开始日期
			da.setActEndDate(jcoTable.getString("DATE_TO")); // 结束日期
			da.setStatus(jcoTable.getString("STAT")); // 对象状态
			da.setCust(jcoTable.getString("CUST")); // 客户简称
			da.setCustAct(jcoTable.getString("CONTACT")); // 联系人
			da.setChargePerson(jcoTable.getString("EMPLOYEE")); // 负责员工
			da.setTotalExpense(jcoTable.getString("ZZAFLD0000LE")); // 费用合计
			da.setDepartment(jcoTable.getString("ZZBUDGET_DEP")); // 部门
			da.setPlace(jcoTable.getString("ACT_LOCATION")); // 地点

			list1.add(da);
		}
		
		 for(int i = 0; i < jcoTable2.getNumRows(); i++){
			 jcoTable2.setRow(i);
			DailyActivities da = new DailyActivities();

			// 用实体类来接收数据
			da.setActMark(jcoTable2.getString("OBJECT_ID"));			//事务标识
			da.setActivityType(jcoTable2.getString("ZZAFLD0000KV"));	//市场活动类型
			da.setBusinessType(jcoTable2.getString("ZZAFLD0000MD"));	//出差类型
			da.setActDesc(jcoTable2.getString("DESCRIPTION"));			//事务描述
			da.setActStartDate(jcoTable2.getString("DATE_FROM"));		//开始日期
			da.setActEndDate(jcoTable2.getString("DATE_TO"));			//结束日期
			da.setStatus(jcoTable2.getString("STAT"));					//对象状态
			da.setCust(jcoTable2.getString("CUST"));					//客户简称
			da.setCustAct(jcoTable2.getString("CONTACT"));				//负责员工
			da.setTotalExpense(jcoTable2.getString("ZZAFLD0000LE"));	//费用合计
			da.setDepartment(jcoTable2.getString("ZZBUDGET_DEP"));		//部门
			da.setPlace(jcoTable2.getString("ACT_LOCATION"));  			//地点
			

			list2.add(da);
		}	
		listObject[0] = list1;											
		listObject[1] = list2;			
		return listObject;
	}

	@Override
	public Object[] searchAcitivityDetail(String activityMark) {
		// TODO Auto-generated method stub
		//定义一活动对象数组
		Object[] activityList = new Object[3];
		//获取RFC对象
		JCoFunction jCoFunction = RfcManager.getFunction("ZMOBILE_ORDER_ACE_GET");
		//设置import参数
		JCoParameterList importParams  = jCoFunction.getImportParameterList();
		importParams.setValue("OBJECT_ID",activityMark);
		//执行RFC
		RfcManager.execute(jCoFunction);
		//定义接收参数对象
		List<DailyActivities> actList = new ArrayList<DailyActivities>();			//活动数组
		List<Schedule> scheList = new ArrayList<Schedule>();						//日程数组
		List<ActivityExpense> actExpenseList = new ArrayList<ActivityExpense>();	//费用列表数组
		DailyActivities dailyAct = new DailyActivities();							//日常活动计划单基本信息
		//获取export参数					
		JCoParameterList exportParams = jCoFunction.getTableParameterList();
		JCoTable actDetail = exportParams.getTable("ET_ACE");						//获得日常活动计划单基本信息
		JCoTable scheduleTab = exportParams.getTable("ET_ACE_01A4");				//获得日程列表
		JCoTable expenseTab = exportParams.getTable("ET_ACE_01A5");					//获得费用估算列表
		for(int i = 0;i < actDetail.getNumRows();i++) {
			actDetail.setRow(i);
			dailyAct.setActMark(actDetail.getString("OBJECT_ID"));					//事务标识
			dailyAct.setActivityType(actDetail.getString("ZZAFLD0000KV")); 			//市场活动类型
			dailyAct.setBusinessType(actDetail.getString("ZZAFLD0000MD"));			//出差类型
			dailyAct.setActDesc(actDetail.getString("DESCRIPTION"));				//活动描述
			dailyAct.setLocation(actDetail.getString("ACT_LOCATION"));				//地点
			dailyAct.setChargePerson(actDetail.getString("EMPLOYEE"));				//负责员工
			dailyAct.setActStartDate(actDetail.getString("DATE_FROM"));				//活动开始日期
			dailyAct.setStartTime(actDetail.getString("TIME_FROM"));  				//activity start time
			dailyAct.setActEndDate(actDetail.getString("DATE_TO"));					//活动结束日期
			dailyAct.setEndTime(actDetail.getString("TIME_TO"));					//activity end time
			dailyAct.setStatus(actDetail.getString("STAT"));						//活动状态
			dailyAct.setCust(actDetail.getString("CUST"));							//客户简称
			dailyAct.setCustAct(actDetail.getString("CONTACT"));					//客户联系人
			dailyAct.setTotalExpense(actDetail.getString("ZZAFLD0000LE"));			//费用合计
			dailyAct.setDepartment(actDetail.getString("ZZBUDGET_DEP"));			//负责部门
			//actList.add(dailyAct);  	
		};
		for(int i = 0;i < scheduleTab.getNumRows();i++) {
			scheduleTab.setRow(i);
			Schedule sche = new Schedule();
			sche.setItem(scheduleTab.getString("ZZAFLD0000LH"));				//序号
			sche.setDepartDate(scheduleTab.getString("ZZAFLD0000KX"));			//出发日期
			sche.setArriveDate(scheduleTab.getString("ZZAFLD0000KY"));			//到达日期
			sche.setDepartSite(scheduleTab.getString("ZZAFLD0000KZ"));			//出发地点
			sche.setArriveSite(scheduleTab.getString("ZZAFLD0000L0"));			//到达地点
			sche.setVehicle(scheduleTab.getString("ZZAFLD0000LG"));				//交通方式
			scheList.add(sche);
		}
		for(int i = 0;i < expenseTab.getNumRows();i++) {
			expenseTab.setRow(i);
			ActivityExpense actExpense = new ActivityExpense();
			actExpense.setItem(expenseTab.getString("ZZAFLD0000LJ"));				//序号
			actExpense.setBudgetNo(expenseTab.getString("ZZAFLD0000L2"));			//预算项编码
			actExpense.setBalanceMoney(expenseTab.getString("ZZAFLD0000LM"));		//可用余额
			actExpense.setEvaluateExpense(expenseTab.getString("ZZAFLD0000LN"));    //估算金额
			actExpense.setHotelPrice(expenseTab.getString("ZZAFLD0000LO")); 		//酒店单价
			actExpense.setBoardDays(expenseTab.getString("ZZAFLD0000LP"));			//住宿天数
			actExpense.setShuttleExpense(expenseTab.getString("ZZAFLD0000LQ"));  	//往返交通费用
			actExpense.setTripExpense(expenseTab.getString("ZZAFLD0000LR"));       //短途费用
			actExpense.setEatCompensation(expenseTab.getString("ZZAFLD0000LS"));   	//餐补
			actExpense.setOther(expenseTab.getString("ZZAFLD0000LT"));   			//其他
			actExpenseList.add(actExpense);
		}
		activityList[0] = dailyAct;
		activityList[1] = scheList;
		activityList[2] = actExpenseList;
		return activityList;
	}


}
