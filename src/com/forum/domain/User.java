package com.forum.domain;

public class User {
	String mem_no,mem_name;
	
	public User(){
		
	}
	public User(String mem_no, String mem_name) {
		super();
		this.mem_no = mem_no;
		this.mem_name = mem_name;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
}
