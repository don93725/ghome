package com.forum.domain;

public class Forum {
	String forum_no,mem_no,forum_name,forum_desc,forum_note,forum_stat;
	int forum_views;
	
	public Forum(String forum_no, String mem_no, String forum_name, String forum_desc, String forum_note,
			String forum_stat, int forum_views) {
		super();
		this.forum_no = forum_no;
		this.mem_no = mem_no;
		this.forum_name = forum_name;
		this.forum_desc = forum_desc;
		this.forum_note = forum_note;
		this.forum_stat = forum_stat;
		this.forum_views = forum_views;
	}
	public String getForum_no() {
		return forum_no;
	}
	public void setForum_no(String forum_no) {
		this.forum_no = forum_no;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getForum_name() {
		return forum_name;
	}
	public void setForum_name(String forum_name) {
		this.forum_name = forum_name;
	}
	public String getForum_desc() {
		return forum_desc;
	}
	public void setForum_desc(String forum_desc) {
		this.forum_desc = forum_desc;
	}
	public String getForum_note() {
		return forum_note;
	}
	public void setForum_note(String forum_note) {
		this.forum_note = forum_note;
	}
	public String getForum_stat() {
		return forum_stat;
	}
	public void setForum_stat(String forum_stat) {
		this.forum_stat = forum_stat;
	}
	public int getForum_views() {
		return forum_views;
	}
	public void setForum_views(int forum_views) {
		this.forum_views = forum_views;
	}
	
	

}
