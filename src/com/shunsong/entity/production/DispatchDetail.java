package com.shunsong.entity.production;

public class DispatchDetail {
	private String PARTS_NO;
    private String MOULD_NO;
    private String DRAWING_NO;
    private String DEMAND_NUM;
    private String CRAFT_NAME;
    
    private String NEXT_CRAFT_NAME;
    private String DISPATCH_NUM;
    private String SHIFT_NAME;
    private String WORK_DATE;
    
    public String getNEXT_CRAFT_NAME() {
		return this.NEXT_CRAFT_NAME;
	}
	public void setNEXT_CRAFT_NAME(String NEXT_CRAFT_NAME) {
		this.NEXT_CRAFT_NAME = NEXT_CRAFT_NAME;
	}
	
	public String getDISPATCH_NUM() {
		return this.DISPATCH_NUM;
	}
	public void setDISPATCH_NUM(String DISPATCH_NUM) {
		this.DISPATCH_NUM = DISPATCH_NUM;
	}
	
	public String getSHIFT_NAME() {
		return this.SHIFT_NAME;
	}
	public void setSHIFT_NAME(String SHIFT_NAME) {
		this.SHIFT_NAME = SHIFT_NAME;
	}
	
	public String getWORK_DATE() {
		return this.WORK_DATE;
	}
	public void setWORK_DATE(String WORK_DATE) {
		this.WORK_DATE = WORK_DATE;
	}
	
	public String getPARTS_NO() {
		return this.PARTS_NO;
	}
	public void setPARTS_NO(String PARTS_NO) {
		this.PARTS_NO = PARTS_NO;
	}
	
    public String getMOULD_NO() {
		return this.MOULD_NO;
	}
	public void setMOULD_NO(String MOULD_NO) {
		this.MOULD_NO = MOULD_NO;
	}
	
    public String getDRAWING_NO() {
		return this.DRAWING_NO;
	}
	public void setDRAWING_NO(String DRAWING_NO) {
		this.DRAWING_NO = DRAWING_NO;
	}
    
    public String getDEMAND_NUM() {
		return this.DEMAND_NUM;
	}
	public void setDEMAND_NUM(String DEMAND_NUM) {
		this.DEMAND_NUM = DEMAND_NUM;
	}
    
    public String getCRAFT_NAME() {
		return this.CRAFT_NAME;
	}
	public void setCRAFT_NAME(String CRAFT_NAME) {
		this.CRAFT_NAME = CRAFT_NAME;
	}

		
	public DispatchDetail() {
	    
	}
}
