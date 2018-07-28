package com.flower.domain;

import java.util.List;

public class PageBean<T> {
	private int currentPage;//��ǰҳ
	private int totalRecord;//�ܼ�¼��
           private int pageSize;//ÿҳ��¼��
           private Integer totalPage;//��ҳ��
           private List<T> datas;
           
           public List<T> getDatas() {
	return datas;
}

public void setDatas(List<T> datas) {
	this.datas = datas;
}



private String url;

public int getCurrentPage() {
	return currentPage;
}

public void setCurrentPage(int currentPage) {
	this.currentPage = currentPage;
}

public int getTotalRecord() {
	return totalRecord;
}

public void setTotalRecord(int totalRecord) {
	this.totalRecord = totalRecord;
}

public int getPageSize() {
	return pageSize;
}

public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
}

public Integer getTotalPage() {
       return (int)Math.ceil(totalRecord*1.0/pageSize);
}

public void setTotalPage(int totalPage) {
	this.totalPage = totalPage;
}


public String getUrl() {
	return url;
}

public void setUrl(String url) {
	this.url = url;
}
	

}
