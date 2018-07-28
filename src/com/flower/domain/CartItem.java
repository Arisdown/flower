package com.flower.domain;

import java.io.Serializable;

public class CartItem implements Serializable{
	/**
	 * 
	 */
            private static final long serialVersionUID = 1L;
	private Flower  flower;//��Ʒ����
	private Integer  count;//��������
	private Double  subtotal=0.0;//С��
	public CartItem(Flower flower, Integer count) {
		this.flower= flower;
		this.count = count;
	}
	public CartItem() { }
	
	public Flower getFlower() {
		return flower;
	}
	public void setFlower(Flower flower) {
		this.flower = flower;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Double getSubtotal() {
		return flower.getShop_price()*count;
	}
	


}
