package com.rainsia.news.entity;

public class User {

	private int id;
	private String name;
	private String displayName;
	private String password;
	private int role;
	private String pwdanswer1;
	private String pwdanswer2;
	
	
	public User(int id, String name, String displayName, String password,
			int role,String pwdanswer1,String pwdanswer2) {
		this.id = id;
		this.name = name;
		this.displayName = displayName;
		this.password = password;
		this.role = role;
		this.pwdanswer1 = pwdanswer1;
		this.pwdanswer2 = pwdanswer2;
	}
	
	
	public User(int id, String name, String displayName, String password,
			int role) {
		this.id = id;
		this.name = name;
		this.displayName = displayName;
		this.password = password;
		this.role = role;
	}
	
	
	public User(String name, String displayName, String password) {
		this.name = name;
		this.displayName = displayName;
		this.password = password;
	}
    
	
	public User(String name,String password){
		this.name = name;
		this.password = password;
	}
	
	
	public User(String name, String pwdanswer1, String pwdanswer2,int role){
		this.name = name;
		this.pwdanswer1 = pwdanswer1;
		this.pwdanswer2 = pwdanswer2;
		this.role = role;
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
	
	public String getPwdanswer1(){
		return pwdanswer1;
	}
    
	public String getPwdanswer2(){
		return pwdanswer2;
	}
}
