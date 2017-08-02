package com.board.service;

import java.io.IOException;
import java.util.Collection;
import java.util.Date;

import javax.servlet.http.Part;

import com.board.dao.Message_boardDAO;
import com.board.domain.Message_board;
import com.don.util.TransData;

public class Message_boardService {
	// 封裝新增物件

	public boolean add( String mem_no, String bd_type, String bd_msg_ctx,
			 String bd_prvt,Collection<Part> parts) {
		Message_board message_board = new Message_board();
		message_board.setMem_no(mem_no);
		message_board.setBd_type(bd_type);
		message_board.setBd_msg_ctx(bd_msg_ctx);
		message_board.setBd_prvt(bd_prvt);
		for(Part part : parts){			
//			byte[] b= TransData.transBlob(part);
			for(String s:part.getHeaderNames()){
				System.out.println(part.getHeader(s));
			}
			
		}
		return false;
//		try {
//			if (part != null) {
//				message_board.setBd_film(TransData.transBlob(part));
//			}
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		Message_boardDAO dao = new Message_boardDAO();
//		boolean result = dao.executeInsert(message_board);
//		return result;
	}
}
