package com.web.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDTO {
	private int uiNum;
	private String uiName;
	private int uiAge;
	private String uiId;
	private String uiPwd;
	private String uiPhone;
	private String uiAddress;
	private String uiTrans;
}