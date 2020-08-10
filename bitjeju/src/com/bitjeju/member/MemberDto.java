package com.bitjeju.member;

public class MemberDto {
	
	private String id_email, name, dept, password, lecture;
	private int num, lvl, phone;
	
	
	public MemberDto(String loginFail) {
		// TODO Auto-generated constructor stub
		this.id_email = loginFail;
	
	}
	public MemberDto() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberDto(int num, String name) {
		super();
		this.num = num;
		this.name = name;
	}

	public MemberDto(int num, String id_email, String name, int lvl,
			String password, int phone, String lecture) {
		super();
		this.num = num;
		this.id_email = id_email;
		this.name = name;
		this.lvl = lvl;
		this.password = password;
		this.phone = phone;
		this.lecture = lecture;
	}
	
	
	public String getId_email() {
		return id_email;
	}
	public void setId_email(String id_email) {
		this.id_email = id_email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLecture() {
		return lecture;
	}
	public void setLecture(String lecture) {
		this.lecture = lecture;
	}
	public int getnum() {
		return num;
	}
	public void setnum(int num) {
		this.num = num;
	}
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	
	

}