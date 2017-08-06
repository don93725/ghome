package com.board.service;

import com.board.dao.Likes_recordDAO;
import com.board.domain.Likes_record;

public class Likes_recordService {
	//封裝新增物件

	public boolean add(String bd_msg_no, String mem_no, String if_click){
	Likes_record likes_record = new Likes_record();
	likes_record.setBd_msg_no(bd_msg_no);
	likes_record.setMem_no(mem_no);
	likes_record.setIf_click(if_click);
	Likes_recordDAO dao = new Likes_recordDAO();
	boolean result = dao.executeInsert(likes_record);
	return result;
	}
}
