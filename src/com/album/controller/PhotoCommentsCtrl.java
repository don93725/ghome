package com.album.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.album.service.Photo_cmtService;
import com.members.model.MembersVO;

/**
 * Servlet implementation class CommentsCtrl
 */
@WebServlet( "/album/CommentsCtrl" )
public class PhotoCommentsCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		String mem_no = req.getParameter("mem_no");
		MembersVO user = (MembersVO) req.getSession().getAttribute("user");
		PrintWriter out = res.getWriter();
//		if (!mem_no.equals(user.getMem_no()) || action == null) {
//			// 非會員想做其他操作
//			String referer = (String) req.getSession().getAttribute("referer");
//			req.getSession().removeAttribute("referer");
//			if (referer != null) {
//				res.sendRedirect(referer);
//			} else {
//				res.sendRedirect(req.getContextPath() + "/index.jsp");
//			}
//			return;
//		}

		if ("insert".equals(action)) {
			// 新增
			Photo_cmtService dao = new Photo_cmtService();
			String cmt_type = req.getParameter("cmt_type");
			String org_no = req.getParameter("org_no");
			String bd_cmt_ctx = req.getParameter("bd_cmt_ctx");
			boolean result = dao.add(mem_no, cmt_type, org_no, bd_cmt_ctx);
			if(result){
				out.print("ok");
			}
			return;
		}
		if ("update".equals(action)) {
			// 修改
			Photo_cmtService dao = new Photo_cmtService();
			String bd_cmt_no = req.getParameter("bd_cmt_no");
			String bd_cmt_ctx = req.getParameter("bd_cmt_ctx");
			boolean result = dao.update(bd_cmt_no, bd_cmt_ctx);
			if(result){
				out.print("ok");
			}
			return;
		}
		if ("delete".equals(action)) {
			// 刪除
			String bd_cmt_no = req.getParameter("bd_cmt_no");
			Photo_cmtService dao = new Photo_cmtService();
			boolean result = dao.delete(bd_cmt_no);
			if(result){
				out.print("ok");
			}
			return;
		}
		if ("addCmtLikes".equals(action)) {
			// 刪除
			String bd_cmt_no = req.getParameter("bd_cmt_no");
			String user_no = user.getMem_no();
			System.out.println(bd_cmt_no+" "+user.getMem_no());
			Photo_cmtService dao = new Photo_cmtService();
			boolean result = dao.addCmt_likes(bd_cmt_no,user_no);
			if(result){
				out.print("ok");
			}
			return;
		}
		if ("negativeCmtLikes".equals(action)) {
			// 刪除
			String bd_cmt_no = req.getParameter("bd_cmt_no");
			String user_no = user.getMem_no();
			Photo_cmtService dao = new Photo_cmtService();
			boolean result = dao.negativeCmt_likes(bd_cmt_no,user_no);
			if(result){
				out.print("ok");
			}
			return;
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
