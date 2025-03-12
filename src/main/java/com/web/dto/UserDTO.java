package com.web.dto;

public class UserDTO {
	private int uiNum;
	private String uiName;
	private int uiAge;
	private String uiId;
	private String uiPwd;
	private String uiPhone;
	private String uiAddress;
	private String uiTrans;
	@Override
	public String toString() {
		return "UserDTO [uiNum=" + uiNum + ", uiName=" + uiName + ", uiAge=" + uiAge + ", uiId=" + uiId + ", uiPwd="
				+ uiPwd + ", uiPhone=" + uiPhone + ", uiAddress=" + uiAddress + ", uiTrans=" + uiTrans + "]";
	}
	public int getUiNum() {
		return uiNum;
	}
	public void setUiNum(int uiNum) {
		this.uiNum = uiNum;
	}
	public String getUiName() {
		return uiName;
	}
	public void setUiName(String uiName) {
		this.uiName = uiName;
	}
	public int getUiAge() {
		return uiAge;
	}
	public void setUiAge(int uiAge) {
		this.uiAge = uiAge;
	}
	public String getUiId() {
		return uiId;
	}
	public void setUiId(String uiId) {
		this.uiId = uiId;
	}
	public String getUiPwd() {
		return uiPwd;
	}
	public void setUiPwd(String uiPwd) {
		this.uiPwd = uiPwd;
	}
	public String getUiPhone() {
		return uiPhone;
	}
	public void setUiPhone(String uiPhone) {
		this.uiPhone = uiPhone;
	}
	public String getUiAddress() {
		return uiAddress;
	}
	public void setUiAddress(String uiAddress) {
		this.uiAddress = uiAddress;
	}
	public String getUiTrans() {
		return uiTrans;
	}
	public void setUiTrans(String uiTrans) {
		this.uiTrans = uiTrans;
	}

}
