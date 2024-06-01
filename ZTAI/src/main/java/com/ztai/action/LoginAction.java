package com.ztai.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ztai.database.Database;

public class LoginAction extends ActionSupport {
	private String name;
	private String email;
	private String password;

	public String execute() {
		boolean success = Database.getInstance().validateUser(name, email, password);
		if (success) {
			if (email.endsWith("@admin.in")) {
				return "adminDashboard";
			} else {
				return "candidateDashboard";
			}
		} else {
			System.out.println("Login Invalid");
			return ERROR;
		}
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
