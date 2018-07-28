package com.flower.domain;

import java.io.Serializable;

public class Flower implements Serializable{
	/**
	 * 
	 */
            private static final long serialVersionUID = 1L;
	private String flowerId;
	private String flowerType;
	private String flowerName;
	private String sellPoint;
	private double market_price;
	private double shop_price;
	private int number;
	private String flowerMaterial;
	private String flowerImage;

	public Flower(String flowerId, String flowerType,
                                    String flowerName, String sellPoint,
                                    double market_price, double shop_price,
                                    int number, String flowerMaterial,
                                    String flowerImage) {
	            super();
	            this.flowerId = flowerId;
	            this.flowerType = flowerType;
	            this.flowerName = flowerName;
	            this.sellPoint = sellPoint;
	            this.market_price = market_price;
	            this.shop_price = shop_price;
	            this.number = number;
	            this.flowerMaterial = flowerMaterial;
	            this.flowerImage = flowerImage;
            }

	public String getFlowerMaterial() {
		return flowerMaterial;
	}

	public void setFlowerMaterial(String flowerMaterial) {
		this.flowerMaterial = flowerMaterial;
	}

	public String getFlowerImage() {
		return flowerImage;
	}

	public void setFlowerImage(String flowerImage) {
		this.flowerImage = flowerImage;
	}


	public String getFlowerId() {
		return flowerId;
	}

	public void setFlowerId(String flowerId) {
		this.flowerId = flowerId;
	}

	public String getFlowerType() {
		return flowerType;
	}

	public void setFlowerType(String flowerType) {
		this.flowerType = flowerType;
	}

	public String getFlowerName() {
		return flowerName;
	}

	public void setFlowerName(String flowerName) {
		this.flowerName = flowerName;
	}

	public String getSellPoint() {
		return sellPoint;
	}

	public void setSellPoint(String sellPoint) {
		this.sellPoint = sellPoint;
	}

	public double getMarket_price() {
		return market_price;
	}

	public void setMarket_price(double market_price) {
		this.market_price = market_price;
	}

	public double getShop_price() {
		return shop_price;
	}

	public void setShop_price(double shop_price) {
		this.shop_price = shop_price;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	@Override
            public String toString() {
	            return "Flower [flowerId=" + flowerId + ", flowerType="
	                                    + flowerType + ", flowerName="
	                                    + flowerName + ", sellPoint="
	                                    + sellPoint + ", market_price="
	                                    + market_price
	                                    + ", shop_price=" + shop_price
	                                    + ", number=" + number
	                                    + ", flowerMaterial="
	                                    + flowerMaterial
	                                    + ", flowerImage="
	                                    + flowerImage + "]";
            }

}
