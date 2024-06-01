package com.ztai.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ztai.database.Database;

public class SignupAction extends ActionSupport {

	private String ZTAIID;
	private String name;
	private String email;
	private String phone;
	private String password;
	private boolean authorize;

	public String execute() {
		System.out.println("SignupAction actionsupport");
		boolean success = false;
		if (email.endsWith("@admin.in")) {
			success = Database.getInstance().addAdmin(ZTAIID, name, email, phone, password, true);
		} else if (!email.endsWith("@admin.in")) {
			success = Database.getInstance().addUser(ZTAIID, name, email, phone, password, authorize);
		}

		if (success) {
			System.out.println("Signup - Success");
			return SUCCESS; // Redirect to success page or login page
		} else {
			System.out.println("Signup - Username/Email already exists");
			return ERROR; // Redirect to signup page with error message
		}
	}

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAuthorize() {
		return authorize;
	}

	public void setAuthorize(boolean authorize) {
		this.authorize = authorize;
	}

}
