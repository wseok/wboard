package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import dao.IBoardCommentDao;
import model.Board;
import model.Comment;

@Service
public class BoardCommentServiceImpl implements IBoardCommentService {

	@Autowired
	private IBoardCommentDao bcDao;

	@Override
	public Board readBoard(int bId) {
		// TODO Auto-generated method stub
		Board board = bcDao.selectOneBoard(bId);
		board.setHit(board.getHit()+1);
		bcDao.updateBoard(board);
		return board;
	}

	@Override
	public Comment readComment(int cId) {
		// TODO Auto-generated method stub
		Comment comment = bcDao.selectOneComment(cId);
		return comment;
	}

	@Override
	public List<Board> readBoardByWriter(String writer) {
		// TODO Auto-generated method stub
		List<Board> boardList = bcDao.selectBoardByWriter(writer);
		return boardList;
	}

	@Override
	public List<Comment> readCommentByWriter(String writer) {
		// TODO Auto-generated method stub
		List<Comment> commentList = bcDao.selectCommentByWriter(writer);
		return commentList;
	}

	@Override
	public void writeBoard(Board board, int parentId) {
		// TODO Auto-generated method stub

		// parentId 가 0 이면 원글
		// 0이 아니면 답글
		if (parentId == 0) {
			// ----원글쓰기
			// insert후에 얻어진 내 아디를 그룹아디로
			bcDao.insertBoard(board);
			int bId = board.getbId();
			board.setGroupId(bId);
			bcDao.updateBoard(board);

		} else {
			// ----답글쓰기
			Board parentBoard = bcDao.selectOneBoard(parentId);
			// 나의 그룹아이디는 부모의 아이디
			int parentGroupId = parentBoard.getGroupId();
			board.setGroupId(parentGroupId);
			// 내 자리를 확보하기 위해 부모시퀀스+1보다 시퀀스가 큰 같은 그룹애들의
			int mySeq = parentBoard.getGroupSeq() + 1;
			int myLev = parentBoard.getParentId() + 1;
			// 시퀀스를 ++
			HashMap<String, Object> params = new HashMap<>();
			params.put("group_id", parentGroupId);
			params.put("group_seq", mySeq);
			bcDao.updateGroupSeq(params);
			// 나의 시퀀스는 부모의 시퀀스보다 + 1
			// 내 레벨(이름 잘못 지은 parent_id컬럼) 은 부모 의 레벨보다 +1
			board.setGroupSeq(mySeq);
			board.setParentId(myLev);
			bcDao.insertBoard(board);
			// 필요하다면 dao에 sql문을 추가하세요

			// boardDao.insertBoard(board);
		}

	}

	@Override
	public void writeComment(int parentId, Comment comment) {
		// TODO Auto-generated method stub
		try {
			if (parentId == 0) {
				// 원댓글쓰기
				bcDao.insertComment(comment);
				int cId = comment.getcId();
				comment.setGroupId(cId);
				bcDao.updateComment(comment);
			} else {
				// 대댓글 쓰기
				// 부모글 정보를 조회해서
				Comment parentComment = bcDao.selectOneComment(parentId);
				Board parentBoard = bcDao.selectOneBoard(parentId);
				// 부모글의 그룹아이디가 내가 쓸 그룹아이디
				/* int groupId = parentComment.getGroupId(); */
				int groupId = parentComment.getGroupId();
				// 내 그룹 시퀀스와 레벨은 부모글 +1
				int groupSeq = parentComment.getGroupSeq() + 1;
				int groupLv = parentComment.getGroupLv() + 1;
				// 내 자리 확보
				HashMap<String, Object> params = new HashMap<>();
				params.put("groupSeq", groupSeq);
				params.put("groupId", groupId);
				bcDao.updateGroupSeq(params);
				// 필요한 그룹정보 세팅해서 인설트
				comment.setGroupId(groupId);
				comment.setGroupSeq(groupSeq);
				comment.setGroupLv(groupLv);
				bcDao.insertComment(comment);
				System.out.println(comment.getcId() + "삽입됨");
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
			System.out.println("예외발생. 롤백합니다.");
		}

	}

	@Override
	public List<Board> readBoardList() {
		// TODO Auto-generated method stub
		List<Board> boardList = bcDao.selectAllBoard();
		return boardList;
	}

	@Override
	public List<Comment> readCommentList() {
		// TODO Auto-generated method stub
		List<Comment> commentList = bcDao.selectAllComment();
		return commentList;
	}

	@Override
	public List<Comment> readCommentByBId(int bId) {
		// TODO Auto-generated method stub
		List<Comment> commentList = bcDao.selectCommentByBId(bId);
		return commentList;
	}

	@Override
	public List<Comment> readCommentByBIdAndWriter(Comment comment) {
		// TODO Auto-generated method stub
		List<Comment> commentList = bcDao.selectCommentByBIdAndWriter(comment);
		return commentList;
	}

	@Override
	public HashMap<String, Object> getBoardList(int page) {
		// TODO Auto-generated method stub
		int start = (page - 1) / 10 * 10 + 1;
		int end = ((page - 1) / 10 + 1) * 10;
		int first = 1;
		int last = (bcDao.getBoardCount() - 1) / 10 + 1;
		end = last < end ? last : end;
		int skip = (page - 1) * 10;
		int count = 10;

		HashMap<String, Object> params = new HashMap<>();
		params.put("skip", skip);
		params.put("count", count);
		// params.put("title", title);

		List<Board> boardList = bcDao.selectList(params);

		HashMap<String, Object> results = new HashMap<>();
		results.put("start", start);
		results.put("end", end);
		results.put("first", first);
		results.put("last", last);
		results.put("current", page);
		results.put("boardList", boardList);
		return results;
	}
	

	@Override
	public HashMap<String, Object> getBoardListSearch(int page, int mode, String keyword) {
		// TODO Auto-generated method stub

		int start = (page - 1) / 10 * 10 + 1;
		int end = ((page - 1) / 10 + 1) * 10;
		int first = 1;
		HashMap<String, Object> params2 = new HashMap<>();
		params2.put("mode", keyword);
		params2.put("title", keyword);
		params2.put("content", keyword);
		params2.put("writer", keyword);
		params2.put("mode", mode);

		int last = ((int) bcDao.getBoardSearchCount(params2) - 1) / 10 + 1;
		System.out.println("ㅠㅠㅠ" + (int) bcDao.getBoardSearchCount(params2));
		end = last < end ? last : end;
		int skip = (page - 1) * 10;
		int count = 10;

		HashMap<String, Object> params = new HashMap<>();
		params.put("skip", skip);
		params.put("count", count);
		// params.put("title", title);
		if (mode == 1) {
			params.put("title", keyword);
			params.put("content", keyword);
			params.put("writer", keyword);
		} else if (mode == 2)
			params.put("title", keyword);
		else if (mode == 3)
			params.put("content", keyword);
		else if (mode == 4)
			params.put("writer", keyword);
		else {
		}

		params.put("mode", mode);

		List<Board> boardList = bcDao.selectListSearch(params);
		System.out.println(boardList);

		HashMap<String, Object> results = new HashMap<>();
		results.put("start", start);
		results.put("end", end);
		results.put("first", first);
		results.put("last", last);
		results.put("current", page);
		results.put("boardList", boardList);
		return results;
	}

	@Override
	public int getBoardCount() {
		// TODO Auto-generated method stub
		int count = bcDao.getBoardCount();
		return count;
	}

	@Override
	public int getBoardSearchCount(int page, int mode, String keyword) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put("mode", keyword);
		params.put("title", keyword);
		params.put("content", keyword);
		params.put("writer", keyword);
		params.put("mode", mode);

		int count = bcDao.getBoardSearchCount(params);
		return count;
	}

	@Override
	public void updateBoard(Board board) {
		// TODO Auto-generated method stub
		bcDao.updateBoard(board);
	}

	@Override
	public void updateComment(Comment comment) {
		// TODO Auto-generated method stub
		bcDao.updateComment(comment);
	}

	@Override
	public void deleteBoard(int bId) {
		// TODO Auto-generated method stub
		bcDao.deleteBoard(bId);	
	}

	@Override
	public void deleteComment(int cId) {
		// TODO Auto-generated method stub
		bcDao.deleteComment(cId);
	}

	@Override
	public HashMap<String, Object> getBoardListByWriter(int page, String writer) {
		// TODO Auto-generated method stub
		int start = (page - 1) / 10 * 10 + 1;
		int end = ((page - 1) / 10 + 1) * 10;
		int first = 1;
		int last = (bcDao.getBoardCountByWriter(writer) - 1) / 10 + 1;
		end = last < end ? last : end;
		int skip = (page - 1) * 10;
		int count = 10;

		HashMap<String, Object> params = new HashMap<>();
		params.put("skip", skip);
		params.put("count", count);
		params.put("writer",writer);
		// params.put("title", title);

		List<Board> boardList = bcDao.selectListByWirter(params);
		
		System.out.println(boardList);

		HashMap<String, Object> results = new HashMap<>();
		results.put("start", start);
		results.put("end", end);
		results.put("first", first);
		results.put("last", last);
		results.put("current", page);
		results.put("boardList", boardList);
		return results;
	}

	@Override
	public int getBoardCountByWriter(String writer) {
		// TODO Auto-generated method stub
		int result=bcDao.getBoardCountByWriter(writer);
		return result;
	}

	@Override
	public HashMap<String, Object> getCommentListByWriter(int page, String writer) {
		// TODO Auto-generated method stub
		int start = (page - 1) / 10 * 10 + 1;
		int end = ((page - 1) / 10 + 1) * 10;
		int first = 1;
		int last = (bcDao.getCommentCountByWriter(writer) - 1) / 10 + 1;
		end = last < end ? last : end;
		int skip = (page - 1) * 10;
		int count = 10;

		HashMap<String, Object> params = new HashMap<>();
		params.put("skip", skip);
		params.put("count", count);
		params.put("writer",writer);
		// params.put("title", title);

		List<Board> commentList = bcDao.selectCommentByWirter(params);

		HashMap<String, Object> results = new HashMap<>();
		results.put("start", start);
		results.put("end", end);
		results.put("first", first);
		results.put("last", last);
		results.put("current", page);
		results.put("commentList", commentList);
		return results;
	}

	@Override
	public int getCommentCountByWriter(String writer) {
		// TODO Auto-generated method stub
		int result=bcDao.getCommentCountByWriter(writer);
		return result;
	}

	


}
