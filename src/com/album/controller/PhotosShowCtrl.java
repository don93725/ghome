package com.album.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.album.domain.Photos;
import com.album.service.PhotosService;
import com.members.model.Members;

/**
 * Servlet implementation class PhotosShowCtrl
 */
@WebServlet("/album/PhotosShowCtrl")
public class PhotosShowCtrl extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		String mem_no = req.getParameter("mem_no");
		System.out.println("action=" + action + ",mem_no=" + mem_no);
		Members user = (Members) req.getSession().getAttribute("user");
		 if (mem_no == null) {
		 //沒選擇相簿
		 res.sendRedirect(req.getContextPath() + "/LoginCtrl");
		 return;
		 }
		if (action == null || action.length() == 0) {
			int thisPage = (req.getParameter("thisPage") == null) ? 1 : Integer.valueOf(req.getParameter("thisPage"));
			System.out.println("現在頁數是?"+thisPage);
			int pageSize = 12;
//			if (user == null) {
//				// 訪客
//				PhotosService albumsService = new PhotosService();
//				int allPageCount = albumsService.getPrivateNum(mem_no, pageSize);
//				if(thisPage>allPageCount){
//					thisPage=allPageCount;
//				}
//				List<Photos> albums = albumsService.getPrivateVO(thisPage, pageSize, mem_no);
//				req.setAttribute("albums", albums);
//				req.setAttribute("thisPage", thisPage);
//				req.setAttribute("allPageCount", allPageCount);
//				req.setAttribute("queryStr", "album/PhotosShowCtrl?mem_no=" + mem_no);
//				req.getRequestDispatcher("/front_end/album/Photos.jsp").forward(req, res);
//				return;
//			}
//			if (mem_no.equals(user.getMem_no())) {
//				// 自己看自己
//				PhotosService albumsService = new PhotosService();
//				int allPageCount = albumsService.getPublicNum(mem_no, pageSize);
//				if(thisPage>allPageCount){
//					thisPage=allPageCount;
//				}
//				List<Photos> albums = albumsService.getPublicVO(thisPage, pageSize, mem_no);
//				req.setAttribute("albums", albums);
//				req.setAttribute("thisPage", thisPage);
//				req.setAttribute("allPageCount", allPageCount);
//				req.setAttribute("queryStr", "album/PhotosShowCtrl?mem_no=" + mem_no);
//				req.getRequestDispatcher("/front_end/album/Photos.jsp").forward(req, res);
//				return;
//			} else {
//				// 會員看
//				PhotosService albumsService = new PhotosService();
//				int allPageCount = albumsService.getPrivateNum(mem_no, pageSize);
//				if(thisPage>allPageCount){
//					thisPage=allPageCount;
//				}
//				List<Photos> albums = albumsService.getPrivateVO(thisPage, pageSize, mem_no);
//				req.setAttribute("albums", albums);
//				req.setAttribute("thisPage", thisPage);
//				req.setAttribute("allPageCount", allPageCount);
//				req.setAttribute("queryStr", "album/PhotosShowCtrl?mem_no=" + mem_no);
//				req.getRequestDispatcher("/front_end/album/Photos.jsp").forward(req, res);
//				return;
//			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
