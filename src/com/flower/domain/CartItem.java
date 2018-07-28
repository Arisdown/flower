package com.flower.domain;

import java.io.Serializable;

public class CartItem implements Serializable{
	/**
	 * 
	 */
            private static final long serialVersionUID = 1L;
	private Flower  flower;//商品对象
	private Integer  count;//购买数量
	private Double  subtotal=0.0;//小计
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
