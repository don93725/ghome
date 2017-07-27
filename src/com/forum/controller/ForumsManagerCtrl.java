package com.forum.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.domain.Forums;
import com.forum.service.ForumsService;
import com.members.model.Members;

/**
 * Servlet implementation class ForumsManagerCtrl
 */
@WebServlet("/ForumsManagerCtrl")
public class ForumsManagerCtrl extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		Members user = (Members) req.getSession().getAttribute("user");
		if(user==null){
			//登入管理者葉面
			String URL = this.getServletContext().getContextPath()+"/LoginCtrl";
			res.sendRedirect(URL);
		}
		if ("3".equals(user.getMem_rank())) {			
			ForumsService forumsSevice = new ForumsService();
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
