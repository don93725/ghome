package com.board.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Date;

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
@MultipartConfig(fileSizeThreshold = 100, maxFileSize = 30* 1024 * 1024, maxRequestSize = 200 * 1024 * 1024)
public class BoardActionCtrl extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		String mem_no = req.getParameter("mem_no");
		MembersVO user = (MembersVO) req.getSession().getAttribute("user");
//		if (!mem_no.equals(user.getMem_no())||action==null) {
//			//非會員想做其他操作
//			String referer = (String) req.getSession().getAttribute("referer");
//			req.getSession().removeAttribute("referer");
//			if(referer!=null){						
//				res.sendRedirect(referer);
//			}else{
//				res.sendRedirect(req.getContextPath()+"/index.jsp");
//			}	
//			return;		
//		}


		if ("insert".equals(action)) {			
			// 新增
			String bd_type = req.getParameter("bd_type");
			String bd_msg_ctx = req.getParameter("bd_msg_ctx");
			String bd_prvt = req.getParameter("bd_prvt");			
			Collection<Part> parts = req.getParts();			
			Message_boardService message_boardService = new Message_boardService();
			message_boardService.add(mem_no, bd_type, bd_msg_ctx, bd_prvt ,parts);
			return;
		}
		if ("update".equals(action)) {
			// 修改
			return;
		}
		if ("delete".equals(action)) {
			// 刪除
			return;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
