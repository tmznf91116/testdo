package org.zerock.domain;

public class MamberVO {
	
	private String userid;
	private String passwd;
	private String name;
	private String address;
	
	public MamberVO(String userid, String passwd, String name, String address) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.address = address;
	}
	public String getUserid() {
		return userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getName() {
		return name;
	}
	public String getAddress() {
		return address;
	}
	@Override
	public String toString() {
		return "MamberVO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", address=" + address + "]";
	}
	
	
	
}
