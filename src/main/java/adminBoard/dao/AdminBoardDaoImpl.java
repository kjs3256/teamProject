package adminBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import adminBoard.domain.AdminBoardVO;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public AdminBoardDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public AdminBoardDaoImpl() {}

	@Override
	public List<AdminBoardVO> list(int start, int end) {
		Map<String , Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		return sqlSessionTemplate.selectList("adminBoardDao.list", map);
	}

	@Override
	public List<AdminBoardVO> selectByKey(String keyword) {
		return sqlSessionTemplate.selectList("selectKeyword",keyword);
	}
	@Override
	public List<AdminBoardVO> selectByIscheck(int ischeck) {
		return sqlSessionTemplate.selectList("selectIscheck",ischeck);
	}
	@Override
	public int count() {
		return sqlSessionTemplate.selectOne("adminBoardDao.count");
	}

	@Override
	public void insert(AdminBoardVO adminBoardVO) {
		sqlSessionTemplate.insert("adminBoardDao.insert", adminBoardVO);
	}

	@Override
	public AdminBoardVO read(int seq) {
		sqlSessionTemplate.update("adminBoardDao.updateCount", seq);
		return sqlSessionTemplate.selectOne("adminBoardDao.select", seq);
	}

	@Override
	public void update(AdminBoardVO adminBoardVO) {
		sqlSessionTemplate.update("adminBoardDao.update", adminBoardVO);
	}

	@Override
	public void delete(int seq) {
		sqlSessionTemplate.delete("adminBoardDao.delete", seq);
	}
	
	
	@Override
	public void deleteAll() {
		sqlSessionTemplate.delete("deleteAll");
	}
}
