package com.album.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.album.domain.Albums;
import com.album.service.AlbumsService;
import com.members.model.Members;

/**
 * Servlet implementation class AlbumActionCtrl
 */
@WebServlet("/album/AlbumsActionCtrl")
public class AlbumsActionCtrl extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");
		String mem_no = req.getParameter("mem_no");
		Members user = (Members) req.getSession().getAttribute("user");
		System.out.println(action+mem_no);

		if (!mem_no.equals(user.getMem_no())) {
			//非會員想做其他操作
			res.sendRedirect(req.getContextPath() + "/LoginCtrl");
			return;
		}

		if ("insert".equals(action)) {
			// 新增
			String al_name = req.getParameter("al_name");
			String al_prvt = req.getParameter("al_prvt");
			AlbumsService albumsService = new AlbumsService();
			boolean result = albumsService.add(user.getMem_no(), al_name, al_prvt);
			if (result) {
				req.getSession().removeAttribute("errorMsg");
			} else {
				req.getSession().setAttribute("errorMsg", "Oops");
			}
			req.getRequestDispatcher("/album/AlbumsShowCtrl?mem_no="+mem_no);
			return;
		}
		if ("update".equals(action)) {
			// 更新
			String al_no = req.getParameter("al_no");
			String al_name = req.getParameter("al_name");
			String al_prvt = req.getParameter("al_prvt");
			String thisPage = req.getParameter("thisPage");
			System.out.println(al_no+","+al_name+","+al_prvt+","+thisPage);
			AlbumsService albumsService = new AlbumsService();
			boolean result = albumsService.update(al_no, al_name, al_prvt);
			if (result) {
				req.getSession().removeAttribute("errorMsg");
				out.print("ok");
			} else {
				req.getSession().setAttribute("errorMsg", "Oops");
			}
			req.getRequestDispatcher( "/album/AlbumsShowCtrl?mem_no=" + mem_no + "&thisPage=" + thisPage);
			return;
		}
		if ("delete".equals(action)) {
			// 刪除
			String[] al_no = req.getParameterValues("al_no");
			AlbumsService albumsService = new AlbumsService();
			boolean result = albumsService.delete(al_no);
			if (result) {
				req.getSession().removeAttribute("errorMsg");
				out.write("ok");
			} else {
				req.getSession().setAttribute("errorMsg", "Oops");
			}
			

			return;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
