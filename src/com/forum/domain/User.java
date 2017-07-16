package com.forum.domain;

public class User {
	String mem_no,mem_name;
	Integer mem_rank;
	
	public Integer getMem_rank() {
		return mem_rank;
	}
	public void setMem_rank(Integer mem_rank) {
		this.mem_rank = mem_rank;
	}
	public User(){
		
	}
	public User(String mem_no, String mem_name, int mem_rank) {
		super();
		this.mem_no = mem_no;
		this.mem_name = mem_name;
		this.mem_rank = mem_rank;
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
