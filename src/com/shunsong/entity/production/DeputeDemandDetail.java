package com.shunsong.entity.production;

public class DeputeDemandDetail {
	private String DEMAND_TAG;
    private String DEMAND_TAG_PRE;
    private String MOULD_NO;
    private String MOULD_ID;
    private String DRAWING_NO;
    private String LINENO;
    
    private String PARTS_NO;
    private String NUM;
    private String DELIVERY_DATE;
    private String REMARK;
    
    public String getDEMAND_TAG() {
		return this.DEMAND_TAG;
	}
	public void setDEMAND_TAG(String DEMAND_TAG) {
		this.DEMAND_TAG = DEMAND_TAG;
	}
	
	public String getDEMAND_TAG_PRE() {
		return this.DEMAND_TAG_PRE;
	}
	public void setDEMAND_TAG_PRE(String DEMAND_TAG_PRE) {
		this.DEMAND_TAG_PRE = DEMAND_TAG_PRE;
	}
	
	public String getLINENO() {
		return this.LINENO;
	}
	public void setLINENO(String LINENO) {
		this.LINENO = LINENO;
	}
	
	public String getMOULD_ID() {
		return this.MOULD_ID;
	}
	public void setMOULD_ID(String MOULD_ID) {
		this.MOULD_ID = MOULD_ID;
	}
	
	public String getDELIVERY_DATE() {
		return this.DELIVERY_DATE;
	}
	public void setDELIVERY_DATE(String DELIVERY_DATE) {
		this.DELIVERY_DATE = DELIVERY_DATE;
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
    
    public String getNUM() {
		return this.NUM;
	}
	public void setNUM(String NUM) {
		this.NUM = NUM;
	}
    
    public String getREMARK() {
		return this.REMARK;
	}
	public void setREMARK(String REMARK) {
		this.REMARK = REMARK;
	}

		
	public DeputeDemandDetail() {
	    
	}
}
