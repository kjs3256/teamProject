package member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dao.MemberDao;
import member.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public void regist(MemberVO memberVO) {
		memberDao.insert(memberVO);
	}

	@Override
	public void modify(MemberVO memberVO) {
		memberDao.update(memberVO);
	}

	@Override
	public void delete(MemberVO memberVO) {
		memberDao.delete(memberVO);	
	}

	@Override
	public MemberVO memberConfirm(String id) {
		MemberVO member = memberDao.selectById(id);
		return member;
	}

	@Override
	public MemberVO nicknameCheck(String nickname) {
		MemberVO member = memberDao.selectByNick(nickname);
		return member;
	}

}
