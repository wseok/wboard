package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Board;
import model.Member;
import service.IMemberService;

@Controller
public class MemberController {

	@Autowired
	private IMemberService mService;
	
	@RequestMapping("joinForm.do")
	public void joinForm() {
		
	}
	
	@RequestMapping("join.do")
	public String join(Member member) {
		mService.insertMember(member);
		return "redirect:main.do";	
	}
	
	@RequestMapping("loginForm.do")
	public String loginForm(Model model) {	
		model.addAttribute("home", "SPRING HOMEPAGE");
		model.addAttribute("greeting", "WELCOME TO SPRING BOARD");
		return "loginForm";
	}
	
	@RequestMapping("login.do")
	public String login(HttpSession session, Model model, String writer, int pw) {
		boolean check= mService.loginMember(writer, pw);
		String result;
		model.addAttribute("writer", writer);
		if (check==true) {
			session.setAttribute("writer", writer);
			result = "redirect:myPage.do";
		}else if(check==false)
			result= "redirect:joinForm.do";
		else
			result = "redirect:loginForm.do";
		return result;	
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("writer");
		return "redirect:main.do";
	}
	
	@RequestMapping("deleteMember.do")
	public String deleteMember(int mId) {
		mService.deleteMember(mId);
		return "redirect:adminForm.do";
	}
	
	
	@RequestMapping("myMemberForm.do")
	public void myMemberForm(Model model, String writer) {
		Member member = mService.selectOneMemberByWriter(writer);
		model.addAttribute("member",member);
	}
	
	@RequestMapping("myJoin.do")
	public String myJoin(Member member) {
		mService.updateMember(member);
		return "redirect:myPage.do";	
	}
	
	@RequestMapping("myPage.do")
	public String myPage(Model model, String writer) {
		model.addAttribute("home", "SPRING HOMEPAGE");
		model.addAttribute("greeting", "WELCOME TO SPRING BOARD");
		model.addAttribute("writer",writer);
		return "myPage";
	}
	
	@RequestMapping("adminForm.do")
	public void adminForm(Model model, String writer) {
		Member member= mService.selectOneMemberByWriter(writer);
		model.addAttribute("member",member);
//		return "redirect:adminForm.do?writer="+writer;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));

	}

}
