package com.forum.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.domain.Art_types;
import com.forum.domain.Forums;
import com.forum.domain.Members;
import com.forum.service.Art_typesService;
import com.forum.service.ForumsService;

/**
 * Servlet implementation class ForumApplyCtrl
 */
@WebServlet("/forum/ForumActionCtrl")
public class ForumActionCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		Members user = (Members) req.getSession().getAttribute("user");
		if (user == null) {
			// 請先登入
			String URL = this.getServletContext().getContextPath() + "/forum/LoginCtrl";
			res.sendRedirect(URL);
			return;

		}
		if ("createApply".equals(action)) {
			String mem_no = user.getMem_no();
			String forum_name = req.getParameter("forum_name");
			String forum_desc = req.getParameter("forum_desc");
			String forum_note = req.getParameter("forum_note");
			String[] art_type_name = req.getParameterValues("art_type_name");
			ForumsService forumsSevice = new ForumsService();
			forumsSevice.add(mem_no, forum_name, forum_desc, forum_note, art_type_name);
			res.sendRedirect(req.getContextPath() + "/forum/ForumCtrl");
		} else if ("goUpdate".equals(action)) {
			String forum_no = req.getParameter("forum_no");
			ForumsService forumsSevice = new ForumsService();
			Forums forums = forumsSevice.findByPK(forum_no);
			List<Art_types> art_types = new Art_typesService().getArt_types(forum_no);
			req.setAttribute("forums", forums);
			req.setAttribute("art_types", art_types);
			req.getRequestDispatcher("/front_end/forum/ForumApply.jsp").forward(req, res);
		} else if ("update".equals(action)) {
			String forum_no = req.getParameter("forum_no");
			String forum_desc = req.getParameter("forum_desc");
			String forum_note = req.getParameter("forum_note");
			String[] art_type_name = req.getParameterValues("art_type_name");
			ForumsService forumsSevice = new ForumsService();
			boolean result = forumsSevice.update(forum_no, forum_desc, forum_note, art_type_name);
			if (result) {
				res.sendRedirect(req.getContextPath() + "/forum/ForumShowCtrl?forum_no=" + forum_no);
			} else {
				req.setAttribute("msg", "fail to update forum");
				req.getRequestDispatcher("front_end/forum/ok.jsp").forward(req, res);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
