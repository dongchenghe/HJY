package pers.hjy.bean;

import java.io.Serializable;

public class Address implements Serializable {

	/**
	 * 配送信息
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String addrId;
	private String userId;
	private String receiver;
	private String tell;
	private String address;
	private String remark;
	public String getAddrId() {
		return addrId;
	}
	public void setAddrId(String addrId) {
		this.addrId = addrId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Address [addrId=" + addrId + ", userId=" + userId + ", receiver=" + receiver + ", tell=" + tell
				+ ", address=" + address + ", remark=" + remark + "]";
	}
	

}
