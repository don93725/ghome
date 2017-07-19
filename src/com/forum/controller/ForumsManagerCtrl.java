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
 * Servlet implementation class ForumsManagerCtrl
 */
@WebServlet("/ForumsManagerCtrl")
public class ForumsManagerCtrl extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		User user = (User) req.getSession().getAttribute("user");
		if(user==null){
			//登入管理者葉面
			String URL = this.getServletContext().getContextPath()+"/forum/LoginCtrl";
			res.sendRedirect(URL);
		}
		if (user.getMem_rank() == 3) {			
			ForumsSevice forumsSevice = new ForumsSevice();
			if ("confirm".equals(action)) {					
				String forum_no = req.getParameter("forum_no");
				String forum_stat = req.getParameter("forum_stat");
				boolean result = forumsSevice.confirm(forum_no, forum_stat);
			}			
			String page = req.getParameter("page") == null ? "1" : req.getParameter("page");
			int pageSize = 5;
			List<Forums> forums = forumsSevice.getApplyForums(Integer.parseInt(page), pageSize);
			req.setAttribute("forums", forums);			
			//導向哪頁面還沒寫
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
