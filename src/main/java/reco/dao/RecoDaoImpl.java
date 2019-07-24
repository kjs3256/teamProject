package reco.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import reco.domain.RecoVO;

@Repository
public class RecoDaoImpl implements RecoDao{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	public RecoDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	@Override
	public void reco_update(RecoVO recoVO) {
		sqlSessionTemplate.insert("reco_update", recoVO);
	}

	@Override
	public RecoVO reco_check(RecoVO recoVO) {
		return sqlSessionTemplate.selectOne("reco_check", recoVO);
	}

}
