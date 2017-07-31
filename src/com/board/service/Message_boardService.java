package com.board.service;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.Part;

import com.board.dao.Message_boardDAO;
import com.board.domain.Message_board;
import com.don.util.TransData;

public class Message_boardService {
	// 封裝新增物件

	public boolean add(String bd_msg_no, String mem_no, String bd_type, Integer bd_likes, String bd_msg_ctx,
			String bd_ref_ctx, String bd_prvt, Date bd_msg_time, Date bd_upd_time, Part part) {
		Message_board message_board = new Message_board();
		message_board.setBd_msg_no(bd_msg_no);
		message_board.setMem_no(mem_no);
		message_board.setBd_type(bd_type);
		message_board.setBd_likes(bd_likes);
		message_board.setBd_msg_ctx(bd_msg_ctx);
		message_board.setBd_ref_ctx(bd_ref_ctx);
		message_board.setBd_prvt(bd_prvt);
		message_board.setBd_msg_time(bd_msg_time);
		message_board.setBd_upd_time(bd_upd_time);
		try {
			if (part != null) {
				message_board.setBd_film(TransData.transBlob(part));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Message_boardDAO dao = new Message_boardDAO();
		boolean result = dao.executeInsert(message_board);
		return result;
	}
}
