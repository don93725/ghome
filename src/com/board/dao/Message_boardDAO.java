package com.board.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.album.dao.PhotosDAO;
import com.album.domain.Photos;
import com.board.domain.Message_board;
import com.don.inteface.DAOInterface;
import com.don.util.BasicDAO;
import com.don.util.SQLHelper;
import com.members.model.MembersVO;

public class Message_boardDAO extends BasicDAO implements DAOInterface<Message_board> {
	// 建置查詢

	public List<Message_board> getVOBySQL(String sql, Object[] param) {
		List list = new SQLHelper().executeQuery(sql, param);
		List<Message_board> tempList = new ArrayList<Message_board>();
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			Message_board message_board = new Message_board();
			if (obj[0] != null) {
				message_board.setBd_msg_no((String) obj[0]);
			}
			if (obj[1] != null) {
				MembersVO members = new MembersVO();
				members.setMem_no(String.valueOf(obj[1]));
				members.setMem_nickname(String.valueOf(obj[10]));
				members.setMem_rank(String.valueOf(obj[11]));
				message_board.setMem_no(members);
			}
			if (obj[2] != null) {
				message_board.setBd_type((String) obj[2]);
				if ("1".equals(String.valueOf(obj[2])) || "3".equals(String.valueOf(obj[2]))) {
					Board_photoDAO board_photoDAO = new Board_photoDAO();
					List<String> board_photo = board_photoDAO.getPhotosListBySQL(String.valueOf(obj[0]));
					message_board.setBoard_photo(board_photo);
				}
			}
			if (obj[3] != null) {
				message_board.setBd_likes(Integer.parseInt(obj[3].toString()));
			}
			if (obj[4] != null) {
				message_board.setBd_msg_ctx((String) obj[4]);
			}
			if (obj[5] != null) {
				message_board.setBd_ref_ctx((String) obj[5]);
			}
			if (obj[6] != null) {
				message_board.setBd_prvt((String) obj[6]);
			}
			if (obj[7] != null) {
				message_board.setBd_msg_time((Date) obj[7]);
			}
			if (obj[8] != null) {
				message_board.setBd_upd_time((Date) obj[8]);
			}
			if (obj[9] != null) {
				message_board.setBd_ref_url(String.valueOf(obj[9]));
			}

			tempList.add(message_board);
		}
		return tempList;
	}
	// 建置查詢單筆

	public Message_board getVOByPK(String bd_msg_no) {
		String sql = "Select * from message_board where bd_msg_no=?";
		Object[] param = { bd_msg_no };
		List<Message_board> list = getVOBySQL(sql, param);
		Message_board message_board = list.get(0);
		return message_board;
	}
	// 建置查詢全部

	public List<Message_board> getAll() {
		String sql = "select * from message_board";
		List<Message_board> list = getVOBySQL(sql, null);
		return list;
	}
	// 算數量

	public int countAll() {
		String sql = "select * from message_board";
		return countBySQL(sql);
	}
	// 建置修改

	public boolean updateByVO(Message_board message_board) {
		String sql = "update message_board set mem_no=?,bd_type=?,bd_likes=?,bd_msg_ctx=?,bd_ref_ctx=?,bd_prvt=?,bd_msg_time=?,bd_upd_time=?,bd_ref_url=? where bd_msg_no=?";
		Object[] param = { message_board.getBd_msg_no(), message_board.getMem_no().getMem_no(),
				message_board.getBd_type(), message_board.getBd_likes(), message_board.getBd_msg_ctx(),
				message_board.getBd_ref_ctx(), message_board.getBd_prvt(), message_board.getBd_msg_time(),
				message_board.getBd_upd_time(), message_board.getBd_ref_url() };
		boolean updateResult = new SQLHelper().executeUpdate(sql, param);
		return updateResult;
	}
	// 建置修改

	public boolean updateByVO(Message_board message_board, List<Photos> photos, String[] delPhoto_no) {
		SQLHelper helper = new SQLHelper();
		Connection con = helper.getConnection();
		boolean result = true;
		try {
			con.setAutoCommit(false);
			Board_photoDAO board_photoDAO = new Board_photoDAO();
			String bd_msg_no = message_board.getBd_msg_no();
			String sql = "select count(*) from board_photo where bd_msg_no=" + bd_msg_no;
			int oriPhotoNum = board_photoDAO.countBySQL(sql);
			if (delPhoto_no.length != 0) {
				if (message_board.getBd_film() == null && delPhoto_no.length == oriPhotoNum && photos.size() == 0) {
					message_board.setBd_type("0");
				} else if (message_board.getBd_film() != null && delPhoto_no.length == oriPhotoNum
						&& photos.size() == 0) {
					message_board.setBd_type("2");
				} else if (message_board.getBd_film() == null && delPhoto_no.length < oriPhotoNum) {
					message_board.setBd_type("1");
				} else if(message_board.getBd_film() != null && delPhoto_no.length < oriPhotoNum){
					message_board.setBd_type("3");
				}else {
					System.out.println("產生例外狀況1了 fuck");
				}
			}else if(photos.size()!=0&&message_board.getBd_film()!=null){
				message_board.setBd_type("3");
			}else if(photos.size()==0&&message_board.getBd_film()!=null){
				message_board.setBd_type("2");
			}else if(photos.size()!=0&&message_board.getBd_film()==null){
				message_board.setBd_type("1");
			}else if(photos.size()==0&&message_board.getBd_film()==null){
				message_board.setBd_type("0");
			}else {
				System.out.println("產生例外狀況2了 fuck");
			}
			PhotosDAO photosDAO = new PhotosDAO();
			if (delPhoto_no != null) {
				// 刪圖片
				
				result = photosDAO.executeDelete(delPhoto_no, con);
			}
			if(result){
				if (photos != null) {
					// 加圖片
					List<String> photosKey = photosDAO.executeInsert(photos, message_board.getMem_no().getMem_no(), con);
					// 新增動態相片複合表
					result = board_photoDAO.executeInsert(bd_msg_no, photosKey, con);					
				}				
			}
			//正常都要更新這邊;
			String res = null;
			if(result){
				sql = "update message_board set bd_type=?,bd_msg_ctx=?,bd_prvt=?,bd_upd_time=sysdate,bd_film where bd_msg_no=?";
				Object[] param = {message_board.getBd_type(), message_board.getBd_msg_ctx(), message_board.getBd_prvt(),
						message_board.getBd_upd_time(),message_board.getBd_film() };
				res = new SQLHelper().executeUpdate(sql, param,null,con);				
			}
			if(res.length()!=0){
				con.commit();
			}else{
				result = false;
				con.rollback();
			}
		} catch (SQLException se) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			se.printStackTrace();
			throw new RuntimeException("A database error occured. " + se.getMessage());
		}
		return result;
	}
	// 建置新增

	public boolean executeInsert(Message_board message_board) {
		String sql = "insert into message_board values(?,?,?,?,?,?,?,?,?,?)";
		Object[] param = { message_board.getBd_msg_no(), message_board.getMem_no(), message_board.getBd_type(),
				message_board.getBd_likes(), message_board.getBd_msg_ctx(), message_board.getBd_ref_ctx(),
				message_board.getBd_prvt(), message_board.getBd_msg_time(), message_board.getBd_upd_time(),
				message_board.getBd_film(), message_board.getBd_ref_url() };
		boolean insertResult = new SQLHelper().executeUpdate(sql, param);
		return insertResult;
	}
	// 建置新增

	public boolean executeInsert(Message_board message_board, List<Photos> photos) {
		SQLHelper helper = new SQLHelper();
		Connection con = helper.getConnection();
		boolean insertResult = false;
		try {
			con.setAutoCommit(false);
			// 動態
			String sql = "insert into message_board values(message_board_pk_seq.nextval,?,?,default,?,?,?,default,null,?,?)";
			Object[] param = { message_board.getMem_no().getMem_no(), message_board.getBd_type(),
					message_board.getBd_msg_ctx(), message_board.getBd_ref_ctx(), message_board.getBd_prvt(),
					message_board.getBd_film(), message_board.getBd_ref_url() };
			String boardKey = new SQLHelper().executeUpdate(sql, param, "bd_msg_no", con);
			boolean result = false;
			System.out.println("哪阿" + message_board.getBd_type());
			if (("1".equals(message_board.getBd_type()) || "3".equals(message_board.getBd_type()))
					&& photos.size() != 0) {
				// 動態相片(先找動態相片的主鍵)
				PhotosDAO photosDAO = new PhotosDAO();
				List<String> photosKey = photosDAO.executeInsert(photos, message_board.getMem_no().getMem_no(), con);
				// 新增動態相片複合表
				Board_photoDAO board_photoDAO = new Board_photoDAO();
				result = board_photoDAO.executeInsert(boardKey, photosKey, con);
			}
			if (result || boardKey.length() != 0) {
				con.commit();
				insertResult = true;
			}

		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return insertResult;
	}
	// 建置刪除

	public boolean executeDelete(String bd_msg_no) {
		SQLHelper helper = new SQLHelper();
		Connection con = helper.getConnection();
		boolean result = true;
		try {
			con.setAutoCommit(false);
			Board_photoDAO board_photoDAO = new Board_photoDAO();
			String sql = "select photo_no from board_photo where bd_msg_no=" + bd_msg_no;
			String[] photo_no = board_photoDAO.getPhotosArrayBySQL(bd_msg_no);
			for(String s : photo_no)
			System.out.println(s);
			result = board_photoDAO.executeDelete(bd_msg_no, con);
			if (result) {
				PhotosDAO photosDAO = new PhotosDAO();
				result = photosDAO.executeDeleteForBoard(photo_no, con);
				if (result) {
					sql = "delete from message_board where bd_msg_no=" + bd_msg_no;
					String res = new SQLHelper().executeUpdate(sql, null, null, con);
					if (res.length() == 0) {
						result = false;
					}
				}
				con.commit();
			} else {
				con.rollback();
			}

		} catch (SQLException se) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			se.printStackTrace();
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {

			helper.close(con);
		}

		return result;
	}
	// 建置分頁(彈性排序可設條件)

	public List<Message_board> pageAndRank(int page, int pageSize, String order, String where) {
		int firstPage = (page - 1) * pageSize + 1;
		int lastPage = page * pageSize;
		String sql = "select * from (select bd_msg_no,mem_no,bd_type,bd_likes,bd_msg_ctx,bd_ref_ctx,bd_prvt,bd_msg_time,bd_upd_time,bd_ref_url,mem_nickname,mem_rank, rownum rn from (select * from (select bd_msg_no,a.mem_no,bd_type,bd_likes,bd_msg_ctx,bd_ref_ctx,bd_prvt,bd_msg_time,bd_upd_time,bd_ref_url,mem_nickname,mem_rank from message_board a join (select mem_nickname,mem_rank,mem_no from members) b on a.mem_no=b.mem_no)";
		if (where != null) {
			sql = sql + " where " + where;
		}
		sql = sql + " order by " + order + ")) where rn between " + firstPage + " and " + lastPage;
		List<Message_board> list = getVOBySQL(sql, null);

		return list;
	}
	// 建置分頁(彈性排序不設條件)

	public List<Message_board> pageAndRank(int page, int pageSize, String order) {
		List<Message_board> list = pageAndRank(page, pageSize, order);
		return list;
	}
	// 建置分頁(PK排序)

	public List<Message_board> pageAndRankByPk(int page, int pageSize) {
		List<Message_board> list = pageAndRank(page, pageSize, "bd_msg_no");
		return list;
	}
	// 建置取得欄位資料

	public Object[] getCol(String col, Object[] param) {
		String sql = "select " + col + " from message_board where bd_msg_no=?";
		List<Object[]> list = new SQLHelper().executeQuery(sql, param);
		Object[] colData = list.get(0);
		return colData;
		// Service層實作

	}

	public byte[] getPic(String col, String bd_msg_no) {
		String sql = "select " + col + " from message_board where bd_msg_no=" + bd_msg_no;
		byte[] b = new SQLHelper().getPic(sql, null);
		return b;
		// Service層實作

	}
}
