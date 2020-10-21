package com.shunsong.entity.production;

public class MDMaterialBarcode {
	private String materialBarCode ;
	
	private String materialCode ;
	
	private String materialName ;
	
	private String materialLotNo ;
	
	private String materialNum ;
	
	private String packedUser ;
	
	private String inspector ;
	
	public String getMaterialLotNo() {
		return materialLotNo;
	}

	public void setMaterialLotNo(String serialCode) {
		this.materialLotNo = serialCode;
	}
	
	public String getMaterialNum() {
		return materialNum;
	}

	public void setMaterialNum(String serialCode) {
		this.materialNum = serialCode;
	}
	
	public String getPackedUser() {
		return packedUser;
	}

	public void setPackedUser(String serialCode) {
		this.packedUser = serialCode;
	}
	
	public String getInspector() {
		return inspector;
	}

	public void setInspector(String serialCode) {
		this.inspector = serialCode;
	}

	public String getMaterialBarCode() {
		return materialBarCode;
	}

	public void setMaterialBarCode(String serialCode) {
		this.materialBarCode = serialCode;
	}

	public String getMaterialCode() {
		return materialCode;
	}

	public void setMaterialCode(String rawMaterialName) {
		this.materialCode = rawMaterialName;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String rawMaterialSpec) {
		this.materialName = rawMaterialSpec;
	}
	
	
}
