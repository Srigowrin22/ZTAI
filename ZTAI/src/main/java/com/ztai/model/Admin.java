package com.ztai.model;

public class Admin {
	private String ZTAIID;
	private String name;
	private String email;
	private String phone;
	private String password;
	private static Admin admin;

	public Admin(String ZTAIID, String name, String email, String phone, String password) {
		super();
		this.ZTAIID = ZTAIID;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password = password;
	}

	public String getZTAIID() {
		return ZTAIID;
	}

	public void setZTAIID(String zTAIID) {
		ZTAIID = zTAIID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public static Admin getAdmin() {
		return admin;
	}

	public static void setAdmin(Admin admin) {
		Admin.admin = admin;
	}
}
