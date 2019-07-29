package userBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import userBoard.domain.UserBoardVO;

@Repository
public class UserBoardDaoImpl implements UserBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public UserBoardDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public UserBoardDaoImpl() {}
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	@Override
	public List<UserBoardVO> list(int start, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		return sqlSessionTemplate.selectList("userBoardDao.list",map);
	}
	@Override
	public List<UserBoardVO> list(Integer start, Integer end, String loc) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("loc", loc);
		return sqlSessionTemplate.selectList("userBoardDao.category",map);
	}

	@Override
	public List<UserBoardVO> selectByKey(String keyword) {
		return sqlSessionTemplate.selectList("selectKeyword", keyword);
	}

	@Override
	public List<UserBoardVO> orderByLike() {
		return sqlSessionTemplate.selectList("orderByLike");
	}

	@Override
	public int count() {
		return sqlSessionTemplate.selectOne("userBoardDao.count");
	}

	@Override
	public void insert(UserBoardVO userBoardVO) {
		sqlSessionTemplate.insert("userBoardDao.insert", userBoardVO);
	}

	@Override
	public UserBoardVO read(int seq) {
		sqlSessionTemplate.update("userBoardDao.updateCount",seq);
		return sqlSessionTemplate.selectOne("userBoardDao.select", seq);
	}

	@Override
	public void update(UserBoardVO userBoardVO) {
		sqlSessionTemplate.update("userBoardDao.update", userBoardVO);
	}

	@Override
	public void updateLike(int seq) {
		sqlSessionTemplate.update("updateLike", seq);
	}

	@Override
	public void delete(UserBoardVO userBoardVO) {
		sqlSessionTemplate.delete("userBoardDao.delete", userBoardVO);
	}

	@Override
	public List<UserBoardVO> selectNotice(String nickname) {
		return sqlSessionTemplate.selectList("selectNotice", nickname);
	}
	@Override
	public List<UserBoardVO> selectMain() {
		return sqlSessionTemplate.selectList("mainList");
	}

}
