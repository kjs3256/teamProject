package mate.dao;

import java.util.Collection;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import mate.domain.MateVO;

@Repository
public class MateDaoMybatis implements MateDao{
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MateDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List<MateVO> list() {
		return sqlSessionTemplate.selectList("list");
	}
	
	@Override
	public int delete(MateVO mateVO) {
		return sqlSessionTemplate.delete("delete", mateVO);
	}
	
	@Override
	public void insert(MateVO mateVO) {
		 sqlSessionTemplate.insert("insert", mateVO);
	}
	
	@Override
	public MateVO select(int seq) {
		MateVO vo = (MateVO) sqlSessionTemplate.selectOne("select", seq);
		return vo;
	}

	@Override
	public List<MateVO> selectmateList(MateVO mateVO) {
		return sqlSessionTemplate.selectList("list");
	}

	@Override
	public List<MateVO> selectmateListCnt(MateVO mateVO) {
		return sqlSessionTemplate.selectList("list", mateVO);
	}

}
