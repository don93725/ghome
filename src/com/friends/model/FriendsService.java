package com.friends.model;

import java.util.Date;

public class FriendsService {
		//封裝新增物件

		public boolean add(String mem_no, String fd_no, Date fd_date){
		Friends friends = new Friends();
		friends.setMem_no(mem_no);
		friends.setFd_no(fd_no);
		friends.setFd_date(fd_date);
		FriendsDAO dao = new FriendsDAO();
		boolean result = dao.executeInsert(friends);
		return result;
		}
}
