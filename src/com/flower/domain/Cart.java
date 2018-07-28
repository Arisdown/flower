package com.flower.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class Cart implements Serializable{
	/**
	 * 
	 */
            private static final long serialVersionUID = 1L;
	private Map<String, CartItem> map= new LinkedHashMap<String, CartItem>();
	// 总金额
	private Double total = 0.0;
            public Collection<CartItem> getItmes(){
		
		return map.values();
	}
	public Map<String, CartItem> getMap() {
		return map;
	}
	public void setItems(Map<String, CartItem> map){
		this.map= map;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public void add2Cart(CartItem item) {
		// 1.先判断购物车中有无该商品
		// 1.1先获取商品的id
		String flowerid = item.getFlower().getFlowerId();
		if (map.containsKey(flowerid)) {
			// 有
			// 设置购买数量
			// 需要获取该商品之前的购买数量+现在的购买数量(item.getCount)
			// 获取购物车中购物车项
			CartItem oItem = map.get(flowerid);
			oItem.setCount(oItem.getCount()
			                        + item.getCount());
		} else {
			// 没有 将购物车项添加进去
			map.put(flowerid, item);
		}
		total+=item.getSubtotal();
	}
	public void clear(){
		map.clear();
		total=0.0;
	}
	public void deleteById(String flowerid){
		if(map.containsKey(flowerid)){
			CartItem item=map.remove(flowerid);
			total-=item.getSubtotal();
		}
	}
	
	public List<CartItem> getItemsValues(){
		List<CartItem> list=new ArrayList<CartItem>();
		for(Map.Entry<String, CartItem> entry:map.entrySet()){
			list.add(entry.getValue());
		}
		return list;
	}

}
