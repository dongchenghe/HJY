package pers.hjy.bean;
/**
 * 管理员的信息
 * @author Administrator
 *
 */
public class Manager {
	private String dbaId;
	private String dbaName;
	private String PassWord;
	private String tell;
	private String addr;
	private String remark;
	public String getDbaId() {
		return dbaId;
	}
	public void setDbaId(String dbaId) {
		this.dbaId = dbaId;
	}
	public String getDbaName() {
		return dbaName;
	}
	public void setDbaName(String dbaName) {
		this.dbaName = dbaName;
	}
	public String getPassWord() {
		return PassWord;
	}
	public void setPassWord(String passWord) {
		PassWord = passWord;
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
		return "Manager [dbaId=" + dbaId + ", dbaName=" + dbaName + ", PassWord=" + PassWord + ", tell=" + tell
				+ ", addr=" + addr + ", remark=" + remark + "]";
	}
	
}
