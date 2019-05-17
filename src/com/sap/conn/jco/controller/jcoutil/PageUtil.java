package com.sap.conn.jco.controller.jcoutil;

import java.util.List;

import com.sap.conn.jco.controller.pojo.Customer;

public class PageUtil {
	private int pageCount ; //总页数
	private int rowCount ; //总行数
	private int pageNum = 1 ; //当前页，默认情况下为1
	private int pageSize = 6 ; //每页条数，默认情况下为6
	private int beginIndex ; //开始索引
	private int endIndex ;  //结束索引
	
	
	public PageUtil(List<Object> object) {
		//为总行数赋值
		this.rowCount = object.size();
		//算出总页数，并赋值
		if(this.rowCount%this.pageSize==0) {
			this.pageCount = this.rowCount/this.pageSize ;
			
		}else {
			this.pageCount = this.rowCount/this.pageSize + 1;
		}
		setPageNum(this.pageNum);
	}


	public int getPageCount() {
		return pageCount;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}


	public int getRowCount() {
		return rowCount;
	}


	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}


	public int getPageNum() {
		return pageNum;
	}


	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		//计算开始索引
		this.beginIndex = (this.pageNum - 1)*this.pageSize;
		//计算结束索引
		this.endIndex = this.pageNum* this.pageSize;
		if(this.endIndex > this.rowCount) {
			this.endIndex = this.rowCount;
		}
		
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getBeginIndex() {
		return beginIndex;
	}


	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}


	public int getEndIndex() {
		return endIndex;
	}


	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
	
	
}
