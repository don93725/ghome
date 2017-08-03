package com.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.album.domain.Albums;
import com.album.service.AlbumsService;
import com.board.domain.Message_board;
import com.board.service.Message_boardService;
import com.friends.model.FriendsDAO;
import com.friends.model.FriendsService;
import com.members.model.MembersVO;

/**
 * Servlet implementation class BoardShowCtrl
 */
@WebServlet("/board/BoardShowCtrl")
public class BoardShowCtrl extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String mem_no = req.getParameter("mem_no");
		MembersVO user = (MembersVO) req.getSession().getAttribute("user");
		if (mem_no == null) {
			// 沒選擇相簿
			String referer = (String) req.getSession().getAttribute("referer");
			if (referer != null) {
				res.sendRedirect(referer);
			} else {
				res.sendRedirect(req.getContextPath() + "/index.jsp");
			}
			return;
		}
		int thisPage = (req.getParameter("thisPage") == null) ? 1 : Integer.valueOf(req.getParameter("thisPage"));
		int pageSize = 8;
		String condition = null;
		if (user == null) {
			// 非本人
			condition = "bd_prvt=1";
		} else {
			String user_no = user.getMem_no();
			if (mem_no.equals(user_no)) {
				condition = "bd_prvt=0 or bd_prvt=1 or bd_prvt=2";
			} else {
				if (new FriendsService().checkFriendShip(mem_no, user.getMem_no())) {
					condition = "bd_prvt=1 or bd_prvt=0";
				}else{
					condition = "bd_prvt=1";
				}
			}

		}
		Message_boardService message_boardService = new Message_boardService();
		int allPageCount = message_boardService.getBoardNum(mem_no, condition, pageSize);
		if (thisPage > allPageCount) {
			thisPage = allPageCount;
		}
		List<Message_board> message_board = message_boardService.getPageAndRank(thisPage, pageSize, mem_no, condition);
		req.setAttribute("message_board", message_board);
		req.setAttribute("thisPage", thisPage);
		req.setAttribute("allPageCount", allPageCount);
		req.getRequestDispatcher("/front_end/board/Board.jsp").forward(req, res);
		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
