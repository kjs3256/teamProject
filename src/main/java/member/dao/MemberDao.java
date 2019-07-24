package member.dao;

import member.domain.MemberVO;

public interface MemberDao {
	public abstract void insert(MemberVO memberVO);
	public abstract void update(MemberVO memberVO);
	public abstract MemberVO selectById(String id);
	public abstract MemberVO selectByNick(String nickname);
	public abstract void delete(MemberVO memberVO);
}
