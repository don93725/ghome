package com.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.ForumsDAO;
import com.forum.domain.Forum;


@WebServlet("/forum/ForumCtrl")
public class ForumCtrl extends HttpServlet {
	@Override
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<Forum> list =new ForumsDAO().getAllForum();
		req.setAttribute("forums", list);
		req.getRequestDispatcher("/WEB-INF/forum/ForumMain.jsp").forward(req, res);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
