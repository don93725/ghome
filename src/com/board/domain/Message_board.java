package com.board.domain;

import java.util.Date;

public class Message_board {
	Integer bd_likes;
	String bd_msg_no,mem_no,bd_type,bd_msg_ctx,bd_ref_ctx,bd_prvt;
	Date bd_msg_time,bd_upd_time;
	byte[] bd_film;
	
	public byte[] getBd_film() {
		return bd_film;
	}
	public void setBd_film(byte[] bd_film) {
		this.bd_film = bd_film;
	}
	public Integer getBd_likes() {
		return bd_likes;
	}
	public void setBd_likes(Integer bd_likes) {
		this.bd_likes = bd_likes;
	}
	public String getBd_msg_no() {
		return bd_msg_no;
	}
	public void setBd_msg_no(String bd_msg_no) {
		this.bd_msg_no = bd_msg_no;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getBd_type() {
		return bd_type;
	}
	public void setBd_type(String bd_type) {
		this.bd_type = bd_type;
	}
	public String getBd_msg_ctx() {
		return bd_msg_ctx;
	}
	public void setBd_msg_ctx(String bd_msg_ctx) {
		this.bd_msg_ctx = bd_msg_ctx;
	}
	public String getBd_ref_ctx() {
		return bd_ref_ctx;
	}
	public void setBd_ref_ctx(String bd_ref_ctx) {
		this.bd_ref_ctx = bd_ref_ctx;
	}
	public String getBd_prvt() {
		return bd_prvt;
	}
	public void setBd_prvt(String bd_prvt) {
		this.bd_prvt = bd_prvt;
	}
	public Date getBd_msg_time() {
		return bd_msg_time;
	}
	public void setBd_msg_time(Date bd_msg_time) {
		this.bd_msg_time = bd_msg_time;
	}
	public Date getBd_upd_time() {
		return bd_upd_time;
	}
	public void setBd_upd_time(Date bd_upd_time) {
		this.bd_upd_time = bd_upd_time;
	}
	
}
