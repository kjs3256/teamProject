package userBoard.service;

import java.util.List;

import userBoard.domain.UserBoardVO;

public interface UserBoardService {
	public abstract List<UserBoardVO> list(int start, int end);
	public abstract List<UserBoardVO> search(String keyword);
	public abstract List<UserBoardVO> orderByLike();
	public abstract List<UserBoardVO> notice(String nickname);
	public abstract int count();
	public abstract void write(UserBoardVO userBoardVO);
	public abstract UserBoardVO read(int seq);
	public abstract void edit(UserBoardVO userBoardVO);
	public abstract void updateLike(int seq);
	public abstract void delete(UserBoardVO userBoardVO);
}
