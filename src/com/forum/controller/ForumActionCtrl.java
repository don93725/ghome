package com.forum.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.domain.Forums;
import com.forum.domain.User;
import com.forum.service.ForumsSevice;

/**
 * Servlet implementation class ForumApplyCtrl
 */
@WebServlet("/forum/ForumActionCtrl")
public class ForumActionCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		User user = (User) req.getSession().getAttribute("user");

		if (user != null) {
			System.out.println("ok");
			if ("confirm".equals(action)) {
				ForumsSevice forumsSevice = new ForumsSevice();
				String forum_no = req.getParameter("forum_no");
				String forum_stat = req.getParameter("forum_stat");
				forumsSevice.confirm(forum_no, forum_stat);
				String page = req.getParameter("page") == null ? "1" : req.getParameter("page");
				int pageSize = 5;
				List<Forums> forums = forumsSevice.getApplyForums(Integer.parseInt(page), pageSize);
			} else if ("wantCreate".equals(action)) {
				req.getRequestDispatcher("/front_end/forum/ForumApply.jsp").forward(req, res);
			} else if ("createApply".equals(action)) {
				String mem_no = user.getMem_no();
				String forum_name = req.getParameter("forum_name");
				String forum_desc = req.getParameter("forum_desc");
				String forum_note = req.getParameter("forum_note");
				System.out.println(mem_no + ", " + forum_name + ", " + forum_desc + ", " + forum_note);
				ForumsSevice forumsSevice = new ForumsSevice();
				forumsSevice.add(mem_no, forum_name, forum_desc, forum_note);
			} else if ("goUpdate".equals(action)) {
				String forum_no = req.getParameter("forum_no");
				ForumsSevice forumsSevice = new ForumsSevice();
				Forums forums = forumsSevice.findByPK(forum_no);
				req.setAttribute("forums", forums);
				req.getRequestDispatcher("/front_end/forum/ForumApply.jsp").forward(req, res);
				;
			} else if ("update".equals(action)) {
				String forum_name = req.getParameter("forum_name");
				String forum_desc = req.getParameter("forum_desc");
				String forum_note = req.getParameter("forum_note");

			} else if (user.getMem_rank() == 3) {
				ForumsSevice forumsSevice = new ForumsSevice();
				String page = req.getParameter("page") == null ? "1" : req.getParameter("page");
				int pageSize = 5;
				List<Forums> forums = forumsSevice.getApplyForums(Integer.parseInt(page), pageSize);

			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
