package com.forum.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.forum.dao.Art_typesDAO;
import com.forum.dao.ArticlesDAO;
import com.forum.domain.Art_types;
import com.forum.domain.Article_photos;
import com.forum.domain.Articles;
import com.forum.service.Article_photosService;
import com.forum.service.ArticlesService;
import com.members.model.Members;

/**
 * Servlet implementation class ArticlesMakerCtrl
 */
@WebServlet("/forum/ArticlesActionCtrl")
@MultipartConfig(fileSizeThreshold = 100, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
public class ArticlesActionCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		String forum_no = req.getParameter("forum_no");
		HttpSession session = req.getSession();
		Members user = ((Members) session.getAttribute("user"));
		if (user == null) {
			String URL = this.getServletContext().getContextPath() + "/forum/LoginCtrl";
			res.sendRedirect(URL);
			return;
		}
		if ((action.equals("goCreatePage") || action.equals("goUpdatePage")) && forum_no != null) {
			List<Art_types> art_types = new Art_typesDAO()
					.getVOBySQL("select * from art_types where forum_no=" + forum_no, null);
			req.setAttribute("art_types", art_types);
			if (action.equals("goUpdatePage")) {
				String art_no = req.getParameter("art_no");
				Articles articles = (Articles) new ArticlesDAO().getVOByPK(art_no);
				req.setAttribute("articles", articles);
			}
			req.getRequestDispatcher("/front_end/forum/ArticlesMaker.jsp").forward(req, res);

		} else if (forum_no != null) {

			if (action.equals("create")) {
				String art_name = req.getParameter("art_name");
				String art_type_name = req.getParameter("art_type_name");
				String order = req.getParameter("order");
				String art_ctx = req.getParameter("art_ctx").replace("$ProjectRealPath$", req.getContextPath());
				String mem_no = user.getMem_no();
				Article_photosService article_photosService = new Article_photosService();
				Collection<Part> parts = req.getParts();
				List<Article_photos> list = article_photosService.setArticle_photos(parts);
				ArticlesService articlesSevice = new ArticlesService();
				boolean createResult = false;
				if (list.size() == 0) {
					createResult = articlesSevice.add(mem_no, forum_no, art_type_name, art_name, art_ctx);
				} else {
					createResult = articlesSevice.add(mem_no, forum_no, art_type_name, art_name, art_ctx, list);
				}
				if (createResult) {
					String URL = this.getServletContext().getContextPath() + "/forum/ForumShowCtrl?forum_no="
							+ forum_no;
					res.sendRedirect(URL);
				} else {
					req.setAttribute("msg", "失敗");
					req.getRequestDispatcher("/front_end/forum/ok.jsp").forward(req, res);
				}
			} else if (action.equals("update")) {
				String art_name = req.getParameter("art_name");
				String art_type_name = req.getParameter("art_type_name");
				String art_no = req.getParameter("art_no");
				String art_ctx = req.getParameter("art_ctx").replace("$ProjectRealPath$", req.getContextPath());
				art_ctx = art_ctx.replace("$ArticlesPrimaryKey$", art_no);
				String order = req.getParameter("order");
				String updateInfo = req.getParameter("updateInfo");
				String deleteInfo = req.getParameter("deleteInfo");
				System.out.println("order=" + order + ",updateInfo=" + updateInfo + ",deleteInfo=" + deleteInfo);
				Article_photosService article_photosService = new Article_photosService();
				Collection<Part> parts = req.getParts();
				List<Article_photos> list = article_photosService.setArticle_photos(parts, order, updateInfo);
				ArticlesService articlesSevice = new ArticlesService();
				boolean createResult = false;
				System.out.println(parts.size() + "list" + list.size());
				createResult = articlesSevice.update(art_type_name, art_name, art_ctx, art_no, list, updateInfo,
						deleteInfo);

				if (createResult) {
					String URL = this.getServletContext().getContextPath() + "/forum/ArticleShowCtrl?forum_no="
							+ forum_no + "&art_no=" + art_no;
					res.sendRedirect(URL);
				} else {
					req.setAttribute("msg", "失敗");
					req.getRequestDispatcher("/front_end/forum/ok.jsp").forward(req, res);
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
					req.getRequestDispatcher("/front_end/forum/ok.jsp").forward(req, res);
				}
			} else if (action.equals("report")) {
				System.out.println("report?");
			} else {

			}

		} else {
			req.setAttribute("msg", "不知哪版怎去?");
			req.getRequestDispatcher("/front_end/forum/ok.jsp").forward(req, res);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
