package com.flower.domain;

import java.lang.Thread.State;
import java.util.Date;



public class UserInfo {
	private String userId;
	private String realname;
	private String username;
	private String password;
	private Date regtime;
	private String email;
	private String code;
	private int state;
	
	public UserInfo(String userId, String realname, String username,
                                    String password, Date regtime,
                                    String email, String code, int state) {
	            super();
	            this.userId = userId;
	            this.realname = realname;
	            this.username = username;
	            this.password = password;
	            this.regtime = regtime;
	            this.email = email;
	            this.code = code;
	            this.state = state;
            }
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getRegtime() {
		return regtime;
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public UserInfo() {
	            super();
            }
	public UserInfo(String userId, String realname, String username,
                                    String password, Date regtime, String email) {
	            super();
	            this.userId = userId;
	            this.realname = realname;
	            this.username = username;
	            this.password = password;
	            this.regtime = regtime;
	            this.email = email;
            }
	@Override
            public String toString() {
	            return "UserInfo [userId=" + userId + ", realname="
	                                    + realname + ", username="
	                                    + username + ", password="
	                                    + password + ", regtime="
	                                    + regtime + ", email=" + email
	                                    + ", code=" + code + ", state="
	                                    + state + "]";
            }
	
	

}
