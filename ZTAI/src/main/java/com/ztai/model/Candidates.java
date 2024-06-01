package com.ztai.model;

import java.util.ArrayList;

public class Candidates {
	private String ZTAIID;
	private String name;
	private String email;
	private String phone;
	private String password;
	private boolean authorize;
	private ArrayList<String> todo = new ArrayList<>();
	private static Candidates cand;

	public Candidates(String ZTAIID, String name, String email, String phone, String password, boolean authorize) {
		super();
		this.ZTAIID = ZTAIID;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.authorize = authorize;
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

	public boolean getAuthorize() {
		return authorize;
	}

	public void setAuthorize(boolean authorize) {
		this.authorize = authorize;
	}

	public static Candidates getCand() {
		return cand;
	}

	public static void setCand(Candidates cand) {
		Candidates.cand = cand;
	}

	public ArrayList<String> getTodo() {
		return todo;
	}

	public void setTodo(ArrayList<String> todo) {
		this.todo = todo;
	}

}