package com.shunsong.entity.production;

import java.util.List;

public class DeputeDemandMain {
	
    private String CUSTOMER_NAME;
    private String PROVIDER_NAME;
    private String DEMAND_DATE;
    private String REQUEST_USER;
    private String BILL_NO;
    private List<DeputeDemandDetail> deputeDemandDetail;
    
    public List<DeputeDemandDetail> getdeputeDemandDetail() {
		return this.deputeDemandDetail;
	}
	public void setdeputeDemandDetail(List<DeputeDemandDetail> dupteDemandDetail) {
		this.deputeDemandDetail = dupteDemandDetail;
	}
	
	public String getBILL_NO() {
		return this.BILL_NO;
	}
	public void setBILL_NO(String BILL_NO) {
		this.BILL_NO = BILL_NO;
	}
	
    public String getCUSTOMER_NAME() {
		return this.CUSTOMER_NAME;
	}
	public void setCUSTOMER_NAME(String CUSTOMER_NAME) {
		this.CUSTOMER_NAME = CUSTOMER_NAME;
	}
	
	public String getPROVIDER_NAME() {
		return this.PROVIDER_NAME;
	}
	public void setPROVIDER_NAME(String PROVIDER_NAME) {
		this.PROVIDER_NAME = PROVIDER_NAME;
	}
	
	public String getDEMAND_DATE() {
		return this.DEMAND_DATE;
	}
	public void setDEMAND_DATE(String DEMAND_DATE) {
		this.DEMAND_DATE = DEMAND_DATE;
	}
	
    public String getREQUEST_USER() {
		return this.REQUEST_USER;
	}
	public void setREQUEST_USER(String REQUEST_USER) {
		this.REQUEST_USER = REQUEST_USER;
	}
	
        	
	 public DeputeDemandMain() {
	   
	 }
    
}
