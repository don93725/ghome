package com.album.controller;

import java.io.IOException;
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
		String action = req.getParameter("action");
		String mem_no = req.getParameter("mem_no");
		Members user = (Members) req.getSession().getAttribute("user");
		System.out.println(mem_no);
		if (mem_no == null) {
			// 沒指定相簿
			res.sendRedirect(req.getContextPath() + "/LoginCtrl");
			return;
		}
		if (action == null) {
			String thisPage = (req.getParameter("thisPage") == null) ? "1" : req.getParameter("thisPage");
			int pageSize = 12;
			if (user == null) {
				// 顯示訪客及其他會員該看
				AlbumsService albumsService = new AlbumsService();
				List<Albums> albums = albumsService.getPrivateVO(Integer.parseInt(thisPage), pageSize, mem_no);
				System.out.println(albums.size());
				int allPageCount = albumsService.getPrivateNum(mem_no,pageSize);
				req.setAttribute("albums", albums);
				req.setAttribute("thisPage", thisPage);
				req.setAttribute("allPageCount", allPageCount);
				req.setAttribute("queryStr", "album/AlbumsActionCtrl?mem_no=" + mem_no);
				req.getRequestDispatcher("/front_end/album/Album.jsp").forward(req, res);
				return;
			}
			if (mem_no.equals(user.getMem_no())) {
				// 顯示會員自己的
				AlbumsService albumsService = new AlbumsService();
				List<Albums> albums = albumsService.getPublicVO(Integer.parseInt(thisPage), pageSize, mem_no);
				int allPageCount = albumsService.getPublicNum(mem_no,pageSize);
				req.setAttribute("albums", albums);
				req.setAttribute("thisPage", thisPage);
				req.setAttribute("allPageCount", allPageCount);
				req.setAttribute("queryStr", "album/AlbumsActionCtrl?mem_no=" + mem_no);
				req.getRequestDispatcher("/front_end/album/Album.jsp").forward(req, res);

			} else {
				// 顯示訪客及其他會員該看
				AlbumsService albumsService = new AlbumsService();
				List<Albums> albums = albumsService.getPrivateVO(Integer.parseInt(thisPage), pageSize, mem_no);
				int allPageCount = albumsService.getPrivateNum(mem_no,pageSize);
				req.setAttribute("albums", albums);
				req.setAttribute("thisPage", thisPage);
				req.setAttribute("allPageCount", allPageCount);
				req.setAttribute("queryStr", "album/AlbumsActionCtrl?mem_no=" + mem_no);
				req.getRequestDispatcher("/front_end/album/Album.jsp").forward(req, res);
			}
			return;
		}

		if (!mem_no.equals(user.getMem_no())) {
			// 轉回登入頁面
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
			res.sendRedirect(req.getContextPath() + "/album/AlbumsActionCtrl?mem_no=" + mem_no);
			return;
		}
		if ("update".equals(action)) {
			// 修改
			String al_no = req.getParameter("al_no");
			String al_name = req.getParameter("al_name");
			String al_prvt = req.getParameter("al_prvt");
			String thisPage = req.getParameter("thisPage");
			AlbumsService albumsService = new AlbumsService();
			boolean result = albumsService.update(al_no, al_name, al_prvt);
			if (result) {
				req.getSession().removeAttribute("errorMsg");
			} else {
				req.getSession().setAttribute("errorMsg", "Oops");
			}
			res.sendRedirect(
					req.getContextPath() + "/album/AlbumsActionCtrl?mem_no=" + mem_no + "&thisPage=" + thisPage);
			return;
		}
		if ("delete".equals(action)) {
			// 刪除
			String[] al_no = req.getParameterValues("al_no");
			AlbumsService albumsService = new AlbumsService();
			boolean result = albumsService.delete(al_no);
			if (result) {
				req.getSession().removeAttribute("errorMsg");
			} else {
				req.getSession().setAttribute("errorMsg", "Oops");
			}
			res.sendRedirect(req.getContextPath() + "/album/AlbumsActionCtrl?mem_no=" + mem_no);
			return;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
