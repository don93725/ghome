package com.friends.model;

import java.util.Date;
import java.util.List;

import com.don.util.BasicDAO;

public class FriendsService {
	// 封裝新增物件

	public boolean add(String mem_no, String fd_no, Date fd_date) {
		Friends friends = new Friends();
		friends.setMem_no(mem_no);
		friends.setFd_no(fd_no);
		friends.setFd_date(fd_date);
		FriendsDAO dao = new FriendsDAO();
		boolean result = dao.executeInsert(friends);
		return result;
	}

	// 建置查詢
	public boolean checkFriendShip(String mem_no, String fd_no) {
		FriendsDAO FriendsDAO = new FriendsDAO();
		return FriendsDAO.checkFriendShip(mem_no, fd_no);
	}
}
