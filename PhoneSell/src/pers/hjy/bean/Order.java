package pers.hjy.bean;

import java.io.Serializable;

public class Order implements Serializable{

	/**
	 * 订单
	 */
	private static final long serialVersionUID = 1L;
	private String orderId;
	private User user;
	private float orderTatal;
	private String createDate;
	private Address address;
	private String payWay;
	private String  payDate;
	private String trueDate;
	private Staff tstaff;
	private String sendDate;
	private Staff sendStaff;
	private String overDate;
	private String orderState;
	private String remark;
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public float getOrderTatal() {
		return orderTatal;
	}
	public void setOrderTatal(float orderTatal) {
		this.orderTatal = orderTatal;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public String getPayWay() {
		return payWay;
	}
	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getTrueDate() {
		return trueDate;
	}
	public void setTrueDate(String trueDate) {
		this.trueDate = trueDate;
	}
	public Staff getTstaff() {
		return tstaff;
	}
	public void setTstaff(Staff tstaff) {
		this.tstaff = tstaff;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public Staff getSendStaff() {
		return sendStaff;
	}
	public void setSendStaff(Staff sendStaff) {
		this.sendStaff = sendStaff;
	}
	public String getOverDate() {
		return overDate;
	}
	public void setOverDate(String overDate) {
		this.overDate = overDate;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", user=" + user + ", orderTatal=" + orderTatal + ", createDate="
				+ createDate + ", address=" + address + ", payWay=" + payWay + ", payDate=" + payDate + ", trueDate="
				+ trueDate + ", tstaff=" + tstaff + ", sendDate=" + sendDate + ", sendStaff=" + sendStaff
				+ ", overDate=" + overDate + ", orderState=" + orderState + ", remark=" + remark + "]";
	}
	
}
