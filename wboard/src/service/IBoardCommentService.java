package service;

import java.util.HashMap;
import java.util.List;

import model.Board;
import model.Comment;

public interface IBoardCommentService {
	
	public Board readBoard(int bId);
	public List<Board> readBoardByWriter(String writer);
	public void writeBoard(Board board, int bId);
	public List<Board> readBoardList();
	public HashMap<String, Object> getBoardList(int page);
	public HashMap<String, Object> getBoardListSearch(int page, int mode, String keyword);
	public int getBoardCount();
	public int getBoardSearchCount(int page, int mode, String keyword);
	public void updateBoard(Board board);
	public void deleteBoard(int bId);
	
	public HashMap<String, Object> getBoardListByWriter(int page, String writer);
	public int getBoardCountByWriter(String writer);
	
	public Comment readComment(int cId);
	public List<Comment> readCommentByWriter(String writer);
	public void writeComment(int cId, Comment comment);
	public List<Comment> readCommentList();
	public List<Comment> readCommentByBId(int bId);
	public List<Comment> readCommentByBIdAndWriter(Comment comment);
	public void updateComment(Comment comment);
	public void deleteComment(int cId);
	
	public HashMap<String, Object> getCommentListByWriter(int page, String writer);
	public int getCommentCountByWriter(String writer);
}
