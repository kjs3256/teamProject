package comment.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import comment.domain.CommentVO;

@Repository
public class CommentDaoImpl implements CommentDao{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	public CommentDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	@Override
	public List<CommentVO> list(int seq) {
		return sqlSessionTemplate.selectList("commentDao.list", seq);
	}

	@Override
	public void insert(CommentVO commentVO) {
		sqlSessionTemplate.insert("commentDao.insert", commentVO);
	}

	@Override
	public int count(int seq) {
		return sqlSessionTemplate.selectOne("commentDao.count", seq);
	}
	
	@Override
	public void delete(int cseq) {
		sqlSessionTemplate.delete("commentDao.delete", cseq);
	}
	@Override
	public CommentVO select(int cseq) {
		return sqlSessionTemplate.selectOne("commentDao.select", cseq);
	}
}
