package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import dao.IMemberDao;
import model.Board;
import model.Member;

@Service
public class MemberServiceImpl implements IMemberService {

	@Autowired
	private IMemberDao mDao;

	@Override
	public void insertMember(Member member) {
		// TODO Auto-generated method stub
		mDao.insertMember(member);
	}

	@Override
	public void updateMember(Member member) {
		// TODO Auto-generated method stub
		mDao.updateMember(member);
	}

	@Override
	public void deleteMember(int mId) {
		// TODO Auto-generated method stub
		mDao.deleteMember(mId);
	}

	@Override
	public Member selectOneMember(int mId) {
		// TODO Auto-generated method stub
		Member member = mDao.selectOneMember(mId);
		return member;
	}

	@Override
	public List<Member> selectAll() {
		// TODO Auto-generated method stub
		List<Member> memberList = mDao.selectAllMember();
		return memberList;
	}

	@Override
	public boolean loginMember(String writer, int pw) {
		// TODO Auto-generated method stub
		Member member = mDao.selectMemberByWriter(writer);
		int pwcheck = member.getPw();
		boolean result=false;
		if (pw == pwcheck)
			result = true;
		else
			result = false;
		return result;
	}

	@Override
	public Member selectOneMemberByWriter(String writer) {
		// TODO Auto-generated method stub
		Member member = mDao.selectMemberByWriter(writer);
		return member;
	}

	@Override
	public HashMap<String, Object> getBoardListSearch(int mode, String keyword) {
		// TODO Auto-generated method stub

		HashMap<String, Object> params2 = new HashMap<>();
		params2.put("mode", keyword);
		params2.put("writer", keyword);
		params2.put("name", keyword);
		params2.put("phone", keyword);
		params2.put("mode", mode);

		HashMap<String, Object> params = new HashMap<>();
		if (mode == 1) {
			params.put("writer", keyword);
			params.put("name", keyword);
			params.put("phone", keyword);
		} else if (mode == 2)
			params.put("writer", keyword);
		else if (mode == 3)
			params.put("name", keyword);
		else if (mode == 4)
			params.put("phone", keyword);
		else {
		}

		params.put("mode", mode);

		List<Member> memberList = mDao.selectListSearch(params);

		HashMap<String, Object> results = new HashMap<>();
		results.put("memberList", memberList);
		return results;
	}

}
