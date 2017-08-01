package com.board.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.board.domain.Message_board;
import com.don.inteface.DAOInterface;
import com.don.util.BasicDAO;
import com.don.util.SQLHelper;

public class Message_boardDAO extends BasicDAO implements DAOInterface<Message_board>{
	//建置查詢

	public List<Message_board> getVOBySQL(String sql,Object[] param){
	List list = new SQLHelper().executeQuery(sql, param);
	List<Message_board> tempList = new ArrayList<Message_board>();
	for(int i = 0 ; i < list.size() ; i++){
	Object[] obj =(Object[]) list.get(i);
	Message_board message_board= new Message_board();
	if(obj[0]!=null){
	message_board.setBd_msg_no((String)obj[0]);
	}
	if(obj[1]!=null){
	message_board.setMem_no((String)obj[1]);
	}
	if(obj[2]!=null){
	message_board.setBd_type((String)obj[2]);
	}
	if(obj[3]!=null){
	message_board.setBd_likes(Integer.parseInt(obj[3].toString()));
	}
	if(obj[4]!=null){
	message_board.setBd_msg_ctx((String)obj[4]);
	}
	if(obj[5]!=null){
	message_board.setBd_ref_ctx((String)obj[5]);
	}
	if(obj[6]!=null){
	message_board.setBd_prvt((String)obj[6]);
	}
	if(obj[7]!=null){
	message_board.setBd_msg_time((Date)obj[7]);
	}
	if(obj[8]!=null){
	message_board.setBd_upd_time((Date)obj[8]);
	}
	if(obj[9]!=null){
		message_board.setBd_ref_url(String.valueOf(obj[9]));
	}
	
	tempList.add(message_board);
	}
	return tempList;
	}
	//建置查詢單筆

	public Message_board getVOByPK(String bd_msg_no){
	String sql ="Select * from message_board where bd_msg_no=?";
	Object[] param ={bd_msg_no};
	List<Message_board> list=getVOBySQL(sql,param);
	Message_board message_board=list.get(0);
	return message_board;
	}
	//建置查詢全部

	public List<Message_board> getAll(){
	String sql="select * from message_board";
	List<Message_board> list=getVOBySQL(sql,null);
	return list;
	}
	//算數量

	public int countAll(){
	String sql = "select * from message_board";
	return countBySQL(sql);
	}
	//建置修改

	public boolean updateByVO(Message_board message_board){
	String sql="update message_board set mem_no=?,bd_type=?,bd_likes=?,bd_msg_ctx=?,bd_ref_ctx=?,bd_prvt=?,bd_msg_time=?,bd_upd_time=?,bd_ref_url=? where bd_msg_no=?";
	Object[] param ={message_board.getBd_msg_no(),message_board.getMem_no(),message_board.getBd_type(),message_board.getBd_likes(),message_board.getBd_msg_ctx(),message_board.getBd_ref_ctx(),message_board.getBd_prvt(),message_board.getBd_msg_time(),message_board.getBd_upd_time(),message_board.getBd_ref_url()};
	boolean updateResult = new SQLHelper().executeUpdate(sql,param);
	return updateResult;
	}
	//建置新增

	public boolean executeInsert(Message_board message_board){
	String sql="insert into message_board values(?,?,?,?,?,?,?,?,?,?)";
	Object[] param ={message_board.getBd_msg_no(),message_board.getMem_no(),message_board.getBd_type(),message_board.getBd_likes(),message_board.getBd_msg_ctx(),message_board.getBd_ref_ctx(),message_board.getBd_prvt(),message_board.getBd_msg_time(),message_board.getBd_upd_time(),message_board.getBd_film(),message_board.getBd_ref_url()};
	boolean insertResult = new SQLHelper().executeUpdate(sql,param);
	return insertResult;
	}
	//建置刪除

	public boolean executeDelete(String bd_msg_no){
	String sql="delete from message_board where bd_msg_no=?";
	Object[] param={bd_msg_no};
	boolean deleteResult = new SQLHelper().executeUpdate(sql,param);
	return deleteResult;
	}
	//建置分頁(彈性排序可設條件)

	public List<Message_board> pageAndRank(int page,int pageSize,String order,String where){
	int firstPage=(page-1)*pageSize+1;
	int lastPage = page*pageSize;
	String sql="select bd_msg_no,mem_no,bd_type,bd_likes,bd_msg_ctx,bd_ref_ctx,bd_prvt,bd_msg_time,bd_upd_time,bd_ref_url from (select bd_msg_no,mem_no,bd_type,bd_likes,bd_msg_ctx,bd_ref_ctx,bd_prvt,bd_msg_time,bd_upd_time,bd_ref_url, rownum rn from (select * from message_board";
	if(where!=null){
	sql = sql +" where " + where;
	}
	sql = sql+ " order by "+order+")) where rn between "+firstPage+" and "+lastPage;
	List<Message_board> list=getVOBySQL(sql,null);
	return list;
	}
	//建置分頁(彈性排序不設條件)

	public List<Message_board> pageAndRank(int page,int pageSize,String order){
	List<Message_board> list=pageAndRank(page,pageSize,order);
	return list;
	}
	//建置分頁(PK排序)

	public List<Message_board> pageAndRankByPk(int page,int pageSize){
	List<Message_board> list=pageAndRank(page,pageSize,"bd_msg_no");
	return list;
	}
	//建置取得欄位資料

	public Object[] getCol(String col, Object[] param){
	String sql = "select "+col+" from message_board where bd_msg_no=?";
	List<Object[]> list = new SQLHelper().executeQuery(sql, param);
	Object[] colData= list.get(0);
	return colData;
	//Service層實作

	}
}
