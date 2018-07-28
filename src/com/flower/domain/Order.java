package com.flower.domain;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class Order {
	private String oid;	
	private Double total;	
	private Integer state=0;//����״̬  0:δ֧��  1:��֧�� 
	private Date ordertime;
	//�����Ǹ��û�
	private UserInfo user;
	//������Щ������
	private List<OrderItem> items=new LinkedList<>();
	
	 
	
	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	
	public UserInfo getUser() {
		return user;
	}

	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public Double getTotal() {
		return total;
	}



	public void setTotal(Double total) {
		this.total = total;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	

	

	public UserInfo getUserInfo() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	public List<OrderItem> getItems() {
		return items;
	}

	public void setItems(List<OrderItem> items) {
		this.items = items;
	}

}