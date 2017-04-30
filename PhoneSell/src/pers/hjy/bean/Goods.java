package pers.hjy.bean;

import java.io.Serializable;

public class Goods implements Serializable {

	/**
	 * 商品对象
	 */
	private static final long serialVersionUID = 1L;
	private String goodsId;
	private String name;
	private float price;
	private String detaile;
	private String countName;
	private String imgSrc;
	private String isValid;
	private String remark;
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getDetaile() {
		return detaile;
	}
	public void setDetaile(String detaile) {
		this.detaile = detaile;
	}
	public String getCountName() {
		return countName;
	}
	public void setCountName(String countName) {
		this.countName = countName;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
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
	@Override
	public String toString() {
		return "Goods [goodsId=" + goodsId + ", name=" + name + ", price=" + price + ", detaile=" + detaile
				+ ", countName=" + countName + ", imgSrc=" + imgSrc + ", isValid=" + isValid + ", remark=" + remark
				+ "]";
	}
	
	

}
