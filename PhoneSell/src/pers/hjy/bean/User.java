package pers.hjy.bean;

import java.io.Serializable;

public class User implements Serializable{

	/**
	 * 用户对象
	 */
	private static final long serialVersionUID = 1L;
	private String userId;
	private String name;
	private String passWord;
	private String sex;
	private String tell;
	private String phoneNumber;
	private String createDate;
	private String isValid;
	private String email;
	private String defaultAddr;
	private String remark;
	public String getUserId() {
		return userId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getIsValid() {
		return isValid;
	}
	public void setIsValid(String isValid) {
		this.isValid = isValid;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getDefaultAddr() {
		return defaultAddr;
	}
	public void setDefaultAddr(String defaultAddr) {
		this.defaultAddr = defaultAddr;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name + ", passWord=" + passWord + ", sex=" + sex + ", tell="
				+ tell + ", phoneNumber=" + phoneNumber + ", createDate=" + createDate + ", isValid=" + isValid
				+ ", email=" + email + ", defaultAddr=" + defaultAddr + ", remark=" + remark + "]";
	}

}
