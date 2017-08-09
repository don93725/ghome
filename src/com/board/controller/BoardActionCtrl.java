package com.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.board.dao.Message_boardDAO;
import com.board.service.Message_boardService;
import com.members.model.MembersVO;

/**
 * Servlet implementation class BoardCtrl
 */
@WebServlet("/board/BoardActionCtrl")
@MultipartConfig(fileSizeThreshold = 100, maxFileSize = 30 * 1024 * 1024, maxRequestSize = 200 * 1024 * 1024)
public class BoardActionCtrl extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		String mem_no = req.getParameter("mem_no");
		PrintWriter out = res.getWriter();
		MembersVO user = (MembersVO) req.getSession().getAttribute("user");
		// if (!mem_no.equals(user.getMem_no())||action==null) {
		// //非會員想做其他操作
		// String referer = (String) req.getSession().getAttribute("referer");
		// req.getSession().removeAttribute("referer");
		// if(referer!=null){
		// res.sendRedirect(referer);
		// }else{
		// res.sendRedirect(req.getContextPath()+"/index.jsp");
		// }
		// return;
		// }

		if ("insert".equals(action)) {
			// 新增
			String bd_type = req.getParameter("bd_type");
			String bd_msg_ctx = req.getParameter("bd_msg_ctx");
			String bd_prvt = req.getParameter("bd_prvt");
			Collection<Part> parts = req.getParts();
			Message_boardService message_boardService = new Message_boardService();
			boolean result = message_boardService.add(user.getMem_no(), bd_type, bd_msg_ctx, bd_prvt, parts);
			if(result){
				out.print("ok");
			}
			return;
		}
		if ("ref_board".equals(action)) {
			// 新增
			String bd_type = req.getParameter("bd_type");
			String bd_msg_ctx = req.getParameter("bd_msg_ctx");
			String bd_ref_ctx = req.getParameter("bd_ref_ctx");
			String bd_prvt = req.getParameter("bd_prvt");
			System.out.println(bd_type+" "+bd_msg_ctx+" "+bd_ref_ctx+" "+bd_prvt);
			Message_boardService message_boardService = new Message_boardService();
			boolean result = message_boardService.addRefBoard(user.getMem_no(), bd_type, bd_msg_ctx, bd_prvt, bd_ref_ctx);
			if(result){
				out.print("ok");
			}
			return;
		}
		if ("update".equals(action)) {
			// 修改
			String bd_msg_no = req.getParameter("bd_msg_no");
			String delStat = req.getParameter("delStat");
			String bd_msg_ctx = req.getParameter("bd_msg_ctx");
			String[] delPhoto_no = req.getParameterValues("delPhoto_no");
			Collection<Part> parts = req.getParts();
			Message_boardService message_boardService = new Message_boardService();
			boolean result = message_boardService.updateByVO(bd_msg_no, mem_no, delStat, bd_msg_ctx, parts, delPhoto_no);
			if(result){
				out.print("ok");
			}
			return;
		}
		if ("delete".equals(action)) {
			// 刪除
			String bd_msg_no = req.getParameter("bd_msg_no");
			Message_boardService message_boardService = new Message_boardService();
			boolean result = message_boardService.executeDelete(bd_msg_no);
			if (result) {
				out.write("ok");
			}
			return;
		}
		if("setPrvt".equals(action)){
			String bd_msg_no =req.getParameter("bd_msg_no");
			String bd_prvt =req.getParameter("bd_prvt");
			Message_boardService message_boardService = new Message_boardService();
			boolean result = message_boardService.setBd_prvt(bd_msg_no,bd_prvt);
			if (result) {
				out.write("ok");
			}
			return;
			
		}
		if("addLikes".equals(action)){
			String bd_msg_no =req.getParameter("bd_msg_no");
			Message_boardService message_boardService = new Message_boardService();
			boolean result = message_boardService.setBd_likes(bd_msg_no, user.getMem_no());
			if (result) {
				out.write("ok");
			}
			return;
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
