package com.shunsong.entity.production;

import java.util.List;

public class DispatchMain {
	
    private String DISPATCH_MAIN_ID;
    private String GROUP_NAME;
    private String DISPATCH_NO;
    private String STATION_NAME;
    private String PLANNER_NAME;
    private List<DispatchDetail> dispatchDetail;
    
    public List<DispatchDetail> getdispatchDetail() {
		return this.dispatchDetail;
	}
	public void setdispatchDetail(List<DispatchDetail> dispatchDetail) {
		this.dispatchDetail = dispatchDetail;
	}
	
    public String getDISPATCH_NO() {
		return this.DISPATCH_NO;
	}
	public void setDISPATCH_NO(String DISPATCH_NO) {
		this.DISPATCH_NO = DISPATCH_NO;
	}
	
	public String getSTATION_NAME() {
		return this.STATION_NAME;
	}
	public void setSTATION_NAME(String STATION_NAME) {
		this.STATION_NAME = STATION_NAME;
	}
	
	public String getPLANNER_NAME() {
		return this.PLANNER_NAME;
	}
	public void setPLANNER_NAME(String PLANNER_NAME) {
		this.PLANNER_NAME = PLANNER_NAME;
	}
	
    public String getGROUP_NAME() {
		return this.GROUP_NAME;
	}
	public void setGROUP_NAME(String GROUP_NAME) {
		this.GROUP_NAME = GROUP_NAME;
	}
	
    public String getDISPATCH_MAIN_ID() {
		return this.DISPATCH_MAIN_ID;
	}
	public void setDISPATCH_MAIN_ID(String DISPATCH_MAIN_ID) {
		this.DISPATCH_MAIN_ID = DISPATCH_MAIN_ID;
	}
    	
	 public DispatchMain() {
	   
	 }
    
}
