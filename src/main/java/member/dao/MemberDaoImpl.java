package member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.domain.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	public MemberDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public void insert(MemberVO memberVO) {
		sqlSessionTemplate.insert("memberDao.insert",memberVO);
	}

	@Override
	public void update(MemberVO memberVO) {
		sqlSessionTemplate.update("memberDao.update", memberVO);
	}

	@Override
	public MemberVO selectById(String id) {
		return sqlSessionTemplate.selectOne("selectById",id);
	}
	@Override
	public void delete(MemberVO memberVO) {
		sqlSessionTemplate.delete("memberDao.delete", memberVO);
	}
	@Override
	public MemberVO selectByNick(String nickname) {
		return sqlSessionTemplate.selectOne("selectByNick", nickname);
	}
}
