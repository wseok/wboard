package dao;

import java.util.HashMap;
import java.util.List;

import model.Board;
import model.Comment;

public interface IBoardCommentDao {
	
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(int bId);
	public Board selectOneBoard(int bId);
	public List<Board> selectAllBoard();
	
	public List<Board> selectBoardByWriter(String writer);
	public int updateGroupSeq(HashMap<String, Object> params);
	public List<Board> selectList(HashMap<String, Object> params);
	public List<Board> selectListSearch(HashMap<String, Object> params);
	public int getBoardCount();
	public int getBoardSearchCount(HashMap<String, Object> params);
	
	public List<Board> selectListByWirter(HashMap<String, Object> params);
	public int getBoardCountByWriter(String writer);
	
	public int insertComment(Comment comment);
	public int updateComment(Comment comment);
	public int deleteComment(int cId);
	public Comment selectOneComment(int cId);
	public List<Comment> selectAllComment();
	
	public List<Comment> selectCommentByWriter(String writer);
	public List<Comment> selectCommentByBId(int BId);
	public List<Comment> selectCommentByBIdAndWriter(Comment comment);
	
	public List<Board> selectCommentByWirter(HashMap<String, Object> params);
	public int getCommentCountByWriter(String writer);
	
	
	

}
