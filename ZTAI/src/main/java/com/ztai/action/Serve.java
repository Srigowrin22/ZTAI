package com.ztai.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ztai.database.Database;

public class Serve extends ActionSupport {

	private String ZTAIID;
	private String name;
	private String email;
	private String phone;
	private int rowsAffected;

	public String getZTAIID() {
		return ZTAIID;
	}

	public void setZTAIID(String ZTAIID) {
		this.ZTAIID = ZTAIID;
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

	public int getRowsAffected() {
		return rowsAffected;
	}

	public void setRowsAffected(int rowsAffected) {
		this.rowsAffected = rowsAffected;
	}

	@Override
	public String execute() {
		
		boolean success= false;
		System.out.println("execute");
		System.out.println("Name "+ name);
		System.out.println("ZTAIID " + ZTAIID);

		if(getName()== null) {
			System.out.println("execute authorize");
			success = authorize();
			
		}else {
			System.out.println("execute uptade");
			success = update();
		}

		if(success) {
			return SUCCESS;
		}else {
			return ERROR;
		}
	
	}
	
	public boolean authorize() {
		boolean success = Database.getInstance().authorize(ZTAIID);
		System.out.println("ZTAIID sent: " + ZTAIID);
		return success;
	}

	public boolean update() {
		boolean success = Database.getInstance().updateCandidate(ZTAIID, name, email, phone);
		System.out.println("detailes sent");
		return success;
	}
}
