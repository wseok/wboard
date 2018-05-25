package dao;

import java.util.HashMap;
import java.util.List;

import model.Board;
import model.Member;

public interface IMemberDao {
	
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(int mId);
	public Member selectOneMember(int mId);
	public List<Member> selectAllMember();
	
	public Member selectMemberByWriter(String writer);
	public List<Member> selectListSearch(HashMap<String, Object> params);

}
