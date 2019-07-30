package mate.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mate.domain.MateVO;

@Repository
public class MateDaoImpl implements MateDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public MateDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public MateDaoImpl() {}
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List<MateVO> list(int start, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		return sqlSessionTemplate.selectList("mateDao.list", map);
	}
	
	@Override
	public int delete(int seq) {
		return sqlSessionTemplate.delete("mateDao.delete", seq);
	}
	
	@Override
	public void insert(MateVO mateVO) {
		sqlSessionTemplate.insert("mateDao.insert", mateVO);
	}
	
	@Override
	public int count() {
		return sqlSessionTemplate.selectOne("mateDao.count");
	}
	@Override
	public MateVO read(int seq) {
		return sqlSessionTemplate.selectOne("mateDao.select", seq);
	}

	

}
