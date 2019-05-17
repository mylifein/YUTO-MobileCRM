package com.sap.conn.jco.controller.pojo;

public class ActivityExpense {
		private String item ;   	//序号
		private String budgetNo ;		//预算项
		private String balanceMoney ;  //可用余额
		private String evaluateExpense; //估算金额
		private String hotelPrice ; 	//酒店单价
		private String boardDays ; 	//住宿天数
		private	String shuttleExpense ; //往返交通费
		private String tripExpense ; //短途费用
		private String eatCompensation ;//餐补
		private String other ;	//其他
		
		
		
		public String getEvaluateExpense() {
			return evaluateExpense;
		}
		public void setEvaluateExpense(String evaluateExpense) {
			this.evaluateExpense = evaluateExpense;
		}
		public String getItem() {
			return item;
		}
		public void setItem(String item) {
			this.item = item;
		}
		public String getBudgetNo() {
			return budgetNo;
		}
		public void setBudgetNo(String budgetNo) {
			this.budgetNo = budgetNo;
		}

		public String getBalanceMoney() {
			return balanceMoney;
		}
		public void setBalanceMoney(String balanceMoney) {
			this.balanceMoney = balanceMoney;
		}
		public String getHotelPrice() {
			return hotelPrice;
		}
		public void setHotelPrice(String hotelPrice) {
			this.hotelPrice = hotelPrice;
		}
		public String getBoardDays() {
			return boardDays;
		}
		public void setBoardDays(String boardDays) {
			this.boardDays = boardDays;
		}
		public String getShuttleExpense() {
			return shuttleExpense;
		}
		public void setShuttleExpense(String shuttleExpense) {
			this.shuttleExpense = shuttleExpense;
		}
		public String getTripExpense() {
			return tripExpense;
		}
		public void setTripExpense(String tripExpense) {
			this.tripExpense = tripExpense;
		}
		public String getEatCompensation() {
			return eatCompensation;
		}
		public void setEatCompensation(String eatCompensation) {
			this.eatCompensation = eatCompensation;
		}
		public String getOther() {
			return other;
		}
		public void setOther(String other) {
			this.other = other;
		}
		
		
}
