package pers.hjy.util;

import java.io.Serializable;
import java.util.List;

public class Pager<T> implements Serializable {
	private int pageSize;//每页多少条记录
	private int currentPage;//当前第几页
	private int totalRecord;//总共多少条记录
	private int totalPage;//总共多少页
	private List<T> dataList;//要显示的数据
	
	public Pager() {
		super();
	}
	public Pager(int pageNum, int pageSize ,List<T> sourceList){
		//System.out.println(sourceList);
		if(sourceList==null||sourceList.size()==0){
			return;
		}
		//总记录数
		this.totalRecord = sourceList.size();
		//每页多少记录
		this.pageSize = pageSize;
		//总共多少页
		this.totalPage = this.totalRecord/this.pageSize;
		if(this.totalRecord%this.pageSize!=0){
			this.totalPage=this.totalPage+1;
		}
		//当前第几页
		this.currentPage = this.totalPage<pageNum?this.totalPage:pageNum;
		//要显示的数据
		int fromIndex = (this.currentPage-1)*this.pageSize;
		int toIndex = this.currentPage>=this.totalPage?this.totalRecord:(this.currentPage)*this.pageSize;
		this.dataList = sourceList.subList(fromIndex, toIndex);
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getDataList() {
		return dataList;
	}
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	@Override
	public String toString() {
		return "Pager [pageSize=" + pageSize + ", currentPage=" + currentPage + ", totalRecord=" + totalRecord
				+ ", totalPage=" + totalPage + ", dataList=" + dataList + "]";
	}
	
}
