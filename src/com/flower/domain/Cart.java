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
	// �ܽ��
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
		// 1.���жϹ��ﳵ�����޸���Ʒ
		// 1.1�Ȼ�ȡ��Ʒ��id
		String flowerid = item.getFlower().getFlowerId();
		if (map.containsKey(flowerid)) {
			// ��
			// ���ù�������
			// ��Ҫ��ȡ����Ʒ֮ǰ�Ĺ�������+���ڵĹ�������(item.getCount)
			// ��ȡ���ﳵ�й��ﳵ��
			CartItem oItem = map.get(flowerid);
			oItem.setCount(oItem.getCount()
			                        + item.getCount());
		} else {
			// û�� �����ﳵ����ӽ�ȥ
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
