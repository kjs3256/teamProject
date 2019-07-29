package userBoard.dao;

import java.util.List;

import userBoard.domain.UserBoardVO;

public interface UserBoardDao {
	public abstract List<UserBoardVO> list(int start, int end);
	public abstract List<UserBoardVO> list(Integer start, Integer end, String loc);
	public abstract List<UserBoardVO> selectByKey(String keyword);
	public abstract List<UserBoardVO> orderByLike();
	public abstract List<UserBoardVO> selectNotice(String nickname);
	public abstract List<UserBoardVO> selectMain();
	public abstract int count();
	public abstract void insert(UserBoardVO userBoardVO);
	public abstract UserBoardVO read(int seq);
	public abstract void update(UserBoardVO userBoardVO);
	public abstract void updateLike(int seq);
	public abstract void delete(UserBoardVO userBoardVO);
}
