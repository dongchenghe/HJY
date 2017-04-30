package pers.hjy.bean;

import java.io.Serializable;

public class Staff implements Serializable{

	/**
	 * 员工对象
	 */
	private static final long serialVersionUID = 1L;
	private String userId;
	private String name;
	private String passWord;
	private String tell;
	private String addr;
	private String remark;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Staff [userId=" + userId + ", name=" + name + ", passWord=" + passWord + ", tell=" + tell + ", addr="
				+ addr + ", remark=" + remark + "]";
	}
	
}
