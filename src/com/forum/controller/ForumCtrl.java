package com.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.ArticlesDAO;
import com.forum.dao.ForumsDAO;
import com.forum.domain.Articles;
import com.forum.domain.Forums;


@WebServlet("/forum/ForumCtrl")
public class ForumCtrl extends HttpServlet {
	@Override
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		ForumsDAO forumsDAO = new ForumsDAO();
		
		List<Forums> list = forumsDAO.getAll();
		List<Forums> rankList = forumsDAO.pageAndRank(1, 5, null , "forum_mviews desc");
		List<Articles> articlesRankList = new ArticlesDAO().pageAndRank(1, 5, null , "art_mviews desc");
		req.setAttribute("forums", list);
		req.setAttribute("rankList", rankList);
		req.setAttribute("articlesRankList", articlesRankList);
		req.getRequestDispatcher("/WEB-INF/forum/ForumMain.jsp").forward(req, res);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
