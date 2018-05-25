package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Board;
import model.Comment;
import service.IBoardCommentService;

@Controller
public class BoardCommentController {

	@Autowired
	private IBoardCommentService bcService;

	@RequestMapping("test.do")
	public ModelAndView bcList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bcList", bcService.readBoard(1));
		mav.setViewName("test");
		return mav;
	}

	@RequestMapping("main.do")
	public String main(Model model) {
		model.addAttribute("home", "SPRING PAGE");
		model.addAttribute("greeting", "WELCOME TO SPRING BOARD");
		return "main";
	}
	
	@RequestMapping("board_y.do")
	public ModelAndView board_y(@RequestParam(defaultValue="1") int page, Model model, String writer) {
		model.addAttribute("writer",writer);
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(bcService.getBoardList(page));
		mav.setViewName("board_y");
		return mav;
	}

	@RequestMapping("board_n.do")
	public ModelAndView board_n(@RequestParam(defaultValue="1") int page){
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(bcService.getBoardList(page));
		mav.setViewName("board_n");
		return mav;
	}

	@RequestMapping("boardView_y.do")
	public String boardView_y(Model model, int bId, String writer) {
		model.addAttribute("writer",writer);
		model.addAttribute("home", "SPRING PAGE");
		model.addAttribute("greeting", "WELCOME TO SPRING BOARD");
		Board board = bcService.readBoard(bId);
		model.addAttribute("board", board);
		List<Comment> commentList = bcService.readCommentByBId(bId);
		model.addAttribute("commentList", commentList);
		return "boardView_y";
	}

	@RequestMapping("boardView_n.do")
	public String boardView_n(Model model, int bId) {
		model.addAttribute("home", "SPRING PAGE");
		model.addAttribute("greeting", "WELCOME TO SPRING BOARD");
		Board board = bcService.readBoard(bId);
		model.addAttribute("board", board);
		List<Comment> commentList = bcService.readCommentByBId(bId);
		model.addAttribute("commentList", commentList);
		return "boardView_n";
	}
	
	@RequestMapping("boardWriteForm_y.do")
	public String boardWriteForm_y(Model model, String writer) {
		model.addAttribute("writer",writer);
		return "boardWriteForm_y";
	}
	
	@RequestMapping("boardWriteForm_n.do")
	public String boardWriteForm_n() {
		return "boardWriteForm_n";
	}
	
	@RequestMapping("boardWrite_y.do")
	public String boardWrite_y( Board board, Model model, String writer) {
		model.addAttribute("writer",writer);
		bcService.writeBoard(board, 0);
//		int bId = board.getbId();
		return "redirect:board_y.do";
	}
	
	@RequestMapping("boardWrite_n.do")
	public String boardWrite_n(Board board) {
		bcService.writeBoard(board, 0);
//		int bId = board.getbId();
		return "redirect:board_n.do";
	}
	
	@RequestMapping("boardUpdateForm_y.do")
	public String boardUpdateForm_y(Model model, int bId, String writer) {
		model.addAttribute("writer",writer);
		Board board =bcService.readBoard(bId);
		model.addAttribute("board", board);
		return "boardUpdateForm_y";
	}
	
	@RequestMapping("boardUpdateForm_n.do")
	public String boardUpdateForm_n(Model model, int bId) {
		Board board =bcService.readBoard(bId);
		model.addAttribute("board", board);
		return "boardUpdateForm_n";
	}

	@RequestMapping("boardUpdate_y.do")
	public String boardUpdate_y(Board board, int bId, Model model, String writer) {
		model.addAttribute("writer",writer);
		bcService.updateBoard(board);
		return "redirect:boardView_y.do?bId="+bId;
	}
	
	@RequestMapping("boardUpdate_n.do")
	public String boardUpdate_n(Board board, int bId) {
		bcService.updateBoard(board);
		System.out.println(board);
		return "redirect:boardView_n.do?bId="+bId;
	}


	@RequestMapping("boardCheckPassForm.do")
	public String boardCheckPassForm(Model model, int bId) {
		model.addAttribute("home", "SPRING HOMEPAGE");
		model.addAttribute("greeting", "WELCOME TO SPRING BOARD");
		return "boardCheckPassForm";
	}
	
	@RequestMapping("boardDelete_y.do")
	public String boardDelete_y(int bId, Model model, String writer) {
		model.addAttribute("writer",writer);
		bcService.deleteBoard(bId);
		return "redirect:board_y.do?bId="+bId;
	}
	
	@RequestMapping("boardDelete_n.do")
	public String boardDelete_n(int bId) {
		bcService.deleteBoard(bId);
		return "redirect:board_n.do?bId="+bId;
	}
	
	@RequestMapping("commentDelete_y.do")
	public String commentDelete_y(int cId, int bId, Model model, String writer) {
		model.addAttribute("writer",writer);
		bcService.deleteComment(cId);
		return "redirect:boardView_y.do?bId="+bId;
	}
	
	@RequestMapping("commentDelete_n.do")
	public String commentDelete_n(int cId, int bId) {
		bcService.deleteComment(cId);
		return "redirect:boardView_n.do?bId="+bId;
	}
	
	@RequestMapping("commentWrite_y.do")
	public String commentWrite_y(Comment comment, Model model, String writer) {
		model.addAttribute("writer",writer);
		bcService.writeComment(0, comment);
		int cId = comment.getcId();
		int bId= comment.getbId();
		return "redirect:boardView_y.do?bId="+bId;
	}
	
	@RequestMapping("commentWrite_n.do")
	public String commentWrite_n(Comment comment) {
		bcService.writeComment(0, comment);
		int cId = comment.getcId();
		int bId= comment.getbId();
		return "redirect:boardView_n.do?bId="+bId;
	}
	
	@RequestMapping("addCommentWrite_y.do")
	public String addCommentWrite_y(int cId, Comment comment,Model model, String writer) {
		model.addAttribute("writer",writer);
		bcService.writeComment(cId, comment);
		int bId= comment.getbId();
		return "redirect:boardView_y.do?bId="+bId;
	}
	
	@RequestMapping("commentWrite_n.do")
	public String addCommentWrite_n(int cId, Comment comment) {
		bcService.writeComment(cId, comment);
		int bId= comment.getbId();
		return "redirect:boardView_n.do?bId="+bId;
	}
	
	@RequestMapping("myBoardForm.do")
	public ModelAndView myBoardForm(@RequestParam(defaultValue="1") int page, String writer){
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(bcService.getBoardListByWriter(page, writer));
		mav.setViewName("myBoardForm");
		return mav;
	}

	@RequestMapping("myCommentForm.do")
	public ModelAndView myCommentForm(@RequestParam(defaultValue="1") int page, String writer){
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(bcService.getCommentListByWriter(page, writer));
		mav.setViewName("myCommentForm");
		return mav;
	}
	
	@RequestMapping("search_y.do")
	public void search_y(Model model,  @RequestParam(defaultValue="1") int page, int mode, String keyword, String writer) {
		model.addAttribute("writer",writer);
//		ModelAndView mav = new ModelAndView();
		System.out.println(page);
		System.out.println(mode);
		System.out.println(keyword);
		model.addAllAttributes(bcService.getBoardListSearch(page, mode, keyword));
//		System.out.println("이겨는?"+mav.addAllObjects(bcService.getBoardListSearch(page, mode, keyword)));
	}
	
	@RequestMapping("search_n.do")
	public void search_n(Model model,  @RequestParam(defaultValue="1") int page, int mode, String keyword){
//		ModelAndView mav = new ModelAndView();
		System.out.println(page);
		System.out.println(mode);
		System.out.println(keyword);
		model.addAllAttributes(bcService.getBoardListSearch(page, mode, keyword));
//		System.out.println("이겨는?"+mav.addAllObjects(bcService.getBoardListSearch(page, mode, keyword)));
	}

}
