package com.commets.model;

import java.util.Date;

public class Board_cmtService {
		//封裝新增物件

		public boolean add(String bd_cmt_no, String mem_no, String cmt_type, String org_no, String bd_cmt_ctx, Integer cmt_likes, Date bd_cmt_time){
		Board_cmt board_cmt = new Board_cmt();
		board_cmt.setBd_cmt_no(bd_cmt_no);
		board_cmt.setMem_no(mem_no);
		board_cmt.setCmt_type(cmt_type);
		board_cmt.setOrg_no(org_no);
		board_cmt.setBd_cmt_ctx(bd_cmt_ctx);
		board_cmt.setCmt_likes(cmt_likes);
		board_cmt.setBd_cmt_time(bd_cmt_time);
		Board_cmtDAO dao = new Board_cmtDAO();
		boolean result = dao.executeInsert(board_cmt);
		return result;
		}
}
