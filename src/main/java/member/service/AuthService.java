package member.service;

import member.dao.MemberDao;
import member.domain.MemberVO;
import member.exception.IdPasswordNotMatchingException;

public class AuthService {
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	public AuthInfo authenticate(String id, String password) {
		MemberVO member = memberDao.selectById(id);
		if(member == null) {
			throw new IdPasswordNotMatchingException();
		}
		if(!member.getPassword().equals(password)) {
			throw new IdPasswordNotMatchingException();
		}
		return new AuthInfo(member.getId(), member.getNickname());
	}
}
