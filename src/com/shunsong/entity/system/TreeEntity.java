package com.shunsong.entity.system;

import java.util.List;
/**
 * 
* 类名称：菜单
* 类描述： 
* @author FH QQ 313596790[青苔]
* 作者单位： 
* 联系方式：
* 创建时间：2015年7月27日
* @version 2.0
 */
public class TreeEntity {
	
	private String id;		//菜单ID
	private String name;	//菜单名称
	private String url;	//链接
	private String pId;	//上级菜单ID
	private boolean open = true;
	private boolean checked = false;
	
	public String getid() {
		return id;
	}
	public void setid(String mid) {
		id = mid;
	}
	public String getname() {
		return name;
	}
	public void setname(String mNAME) {
		name = mNAME;
	}
	public String geturl() {
		return url;
	}
	public void seturl(String mURL) {
		url = mURL;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String ppId) {
		pId = ppId;
	}	
	
	public boolean getchecked() {
		return checked;
	}
	public void setchecked(boolean hasSub) {
		this.checked = hasSub;
	}
	
	public boolean getopen() {
		return open;
	}
	public void setopen(boolean hasSub) {
		this.open = hasSub;
	}
	
	
}
