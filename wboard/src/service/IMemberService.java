package service;

import java.util.HashMap;
import java.util.List;

import model.Member;

public interface IMemberService {
	
	public void insertMember (Member member);
	public void updateMember(Member member);
	public void deleteMember(int mId);
	public Member selectOneMember(int mId);
	public Member selectOneMemberByWriter(String writer);
	public List<Member> selectAll();
	public boolean loginMember(String writer, int pw);
	public HashMap<String, Object> getBoardListSearch(int mode, String keyword);

}
