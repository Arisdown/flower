package com.flower.domain;

public class Address {
	private String aid;
	private String country;
	private String province;
	private String city;
	private String telephone;
	private String phone;
	private String address;
	private String uid;
	

	
	
	public Address(String aid, String country, String province,
                                    String city, String telephone,
                                    String phone, String address, String uid) {
	            super();
	            this.aid = aid;
	            this.country = country;
	            this.province = province;
	            this.city = city;
	            this.telephone = telephone;
	            this.phone = phone;
	            this.address = address;
	            this.uid = uid;
            }

	public Address() {
	            // TODO Auto-generated constructor stub
            }

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	@Override
            public String toString() {
	            return "Address [aid=" + aid + ", country=" + country
	                                    + ", province=" + province
	                                    + ", telephone=" + telephone
	                                    + ", phone=" + phone
	                                    + ", address=" + address
	                                    + ", uid=" + uid + "]";
            }

         
	

}
