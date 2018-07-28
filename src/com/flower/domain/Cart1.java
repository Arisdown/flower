package com.flower.domain;

public class Cart1 {
	private String cartId;
	private String flowerId;
	private int flowerNum;
	
	public Cart1(String cartId, String flowerId, int flowerNum) {
	            super();
	            this.cartId = cartId;
	            this.flowerId = flowerId;
	            this.flowerNum = flowerNum;
            }
	@Override
            public String toString() {
	            return "Cart [cartId=" + cartId + ", flowerId="
	                                    + flowerId + ", flowerNum="
	                                    + flowerNum + "]";
            }
	public String getCartId() {
		return cartId;
	}
	public void setCartId(String cartId) {
		this.cartId = cartId;
	}
	public String getFlowerId() {
		return flowerId;
	}
	public void setFlowerId(String flowerId) {
		this.flowerId = flowerId;
	}
	public int getFlowerNum() {
		return flowerNum;
	}
	public void setFlowerNum(int flowerNum) {
		this.flowerNum = flowerNum;
	}
}
