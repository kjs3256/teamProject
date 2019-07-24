package member.service;

import member.domain.MemberVO;

public interface MemberService {
	public abstract void regist(MemberVO memberVO);
	public abstract MemberVO memberConfirm(String id);
	public abstract MemberVO nicknameCheck(String nickname);
	public abstract void modify(MemberVO memberVO);
	public abstract void delete(MemberVO memberVO);
}
