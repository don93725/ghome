package com.forum.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.domain.User;
import com.forum.service.ForumsSevice;

/**
 * Servlet implementation class ForumApplyCtrl
 */
@WebServlet("/forum/ForumApplyCtrl")
public class ForumApplyCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		User user = (User) req.getSession().getAttribute("user");
		String mem_no = user.getMem_no();
		if(mem_no!=null){
			if("create".equals(action)){
				req.getRequestDispatcher("/WEB-INF/forum/ForumApply.jsp").forward(req, res);		
			}else if("applyCreate".equals(action)){
				String forum_name = req.getParameter("forum_name");
				String forum_desc = req.getParameter("forum_desc");
				String forum_note = req.getParameter("forum_note");
				System.out.println(mem_no+", "+forum_name+", "+forum_desc+", "+forum_note);
				ForumsSevice forumsSevice = new ForumsSevice();
				forumsSevice.add(mem_no, forum_name, forum_desc, forum_note);
			}			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
