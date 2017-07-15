package com.forum.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.forum.dao.Art_typesDAO;
import com.forum.dao.ArticlesDAO;
import com.forum.domain.Art_types;
import com.forum.domain.Articles;
import com.forum.domain.User;
import com.forum.service.Article_photosService;
import com.forum.service.ArticlesSevice;

/**
 * Servlet implementation class ArticlesMakerCtrl
 */
@WebServlet("/forum/ArticlesActionCtrl")
public class ArticlesActionCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		String forum_no = req.getParameter("forum_no");
		HttpSession session = req.getSession();
		User user = ((User) session.getAttribute("user"));
		if (user == null) {
			String URL = this.getServletContext().getContextPath() + "/forum/LoginCtrl";
			res.sendRedirect(URL);
		} else if ((action.equals("goCreatePage") || action.equals("goUpdatePage")) && forum_no != null) {
			List<Art_types> art_types = new Art_typesDAO()
					.getVOBySQL("select * from art_types where forum_no=" + forum_no, null);
			req.setAttribute("art_types", art_types);
			if (action.equals("goUpdatePage")) {
				String art_no = req.getParameter("art_no");
				Articles articles = (Articles) new ArticlesDAO().getVOByPK(art_no);
				req.setAttribute("articles", articles);
			}
			req.getRequestDispatcher("/WEB-INF/forum/ArticlesMaker.jsp").forward(req, res);

		} else if (forum_no != null) {

			if (action.equals("create")) {
				String art_name = req.getParameter("art_name");
				String art_type_name = req.getParameter("art_type_name");
				String art_ctx = req.getParameter("art_ctx");
				String mem_no = user.getMem_no();
				Article_photosService article_photosService = new Article_photosService();
				Collection<Part> parts = req.getParts();
				System.out.println("總共大小為"+parts.size());
				article_photosService.setArticle_photos(parts);
				ArticlesSevice articlesSevice = new ArticlesSevice();
				boolean createResult = articlesSevice.add(mem_no, forum_no, art_type_name, art_name, art_ctx);
				if (createResult) {
					String URL = this.getServletContext().getContextPath() + "/forum/ForumShowCtrl?forum_no="
							+ forum_no;
					res.sendRedirect(URL);
				} else {
					req.setAttribute("msg", "失敗");
					req.getRequestDispatcher("/WEB-INF/forum/ok.jsp").forward(req, res);
				}
			} else if (action.equals("update")) {
				String art_name = req.getParameter("art_name");
				String art_type_name = req.getParameter("art_type_name");
				String art_ctx = req.getParameter("art_ctx");
				String art_no = req.getParameter("art_no");
				ArticlesSevice articlesSevice = new ArticlesSevice();

				boolean createResult = articlesSevice.update(art_type_name, art_name, art_ctx, art_no);
				if (createResult) {
					String URL = this.getServletContext().getContextPath() + "/forum/ArticleShowCtrl?forum_no="
							+ forum_no + "&art_no=" + art_no;
					res.sendRedirect(URL);
				} else {
					req.setAttribute("msg", "失敗");
					req.getRequestDispatcher("/WEB-INF/forum/ok.jsp").forward(req, res);
				}
			} else if (action.equals("delete")) {
				String art_no = req.getParameter("art_no");
				boolean result = new ArticlesDAO().executeDelete(art_no);
				if (result) {
					String URL = this.getServletContext().getContextPath() + "/forum/ForumShowCtrl?forum_no="
							+ forum_no;
					res.sendRedirect(URL);
				} else {
					req.setAttribute("msg", "fail to delete article");
					req.getRequestDispatcher("/WEB-INF/forum/ok.jsp").forward(req, res);
				}
			} else if (action.equals("report")) {
				System.out.println("report?");
			} else {

			}

		} else {
			req.setAttribute("msg", "不知哪版怎去?");
			req.getRequestDispatcher("/WEB-INF/forum/ok.jsp").forward(req, res);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
