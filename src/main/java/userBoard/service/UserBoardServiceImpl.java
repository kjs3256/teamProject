package userBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import userBoard.dao.UserBoardDao;
import userBoard.domain.UserBoardVO;

@Service
public class UserBoardServiceImpl implements UserBoardService {
	@Autowired
	private UserBoardDao userBoardDao;
	@Override
	public List<UserBoardVO> list(int start, int end) {
		return userBoardDao.list(start, end);
	}

	@Override
	public List<UserBoardVO> search(String keyword) {
		return userBoardDao.selectByKey(keyword);
	}

	@Override
	public List<UserBoardVO> orderByLike() {
		return userBoardDao.orderByLike();
	}

	@Override
	public int count() {
		return userBoardDao.count();
	}

	@Override
	public void write(UserBoardVO userBoardVO) {
		userBoardDao.insert(userBoardVO);
	}

	@Override
	public UserBoardVO read(int seq) {
		return userBoardDao.read(seq);
	}

	@Override
	public void edit(UserBoardVO userBoardVO) {
		userBoardDao.update(userBoardVO);
	}
	
	@Override
	public void updateLike(int seq) {
		userBoardDao.updateLike(seq);
	}

	@Override
	public void delete(UserBoardVO userBoardVO) {
		userBoardDao.delete(userBoardVO);
	}

	@Override
	public List<UserBoardVO> notice(String nickname) {
		return userBoardDao.selectNotice(nickname);
	}

}
