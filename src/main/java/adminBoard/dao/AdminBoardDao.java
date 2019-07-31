package adminBoard.dao;

import java.util.List;
import adminBoard.domain.AdminBoardVO;

public interface AdminBoardDao {
	public abstract List<AdminBoardVO> list(int start, int end);
	public abstract List<AdminBoardVO> selectByKey(String keyword);
	public abstract List<AdminBoardVO> selectByIscheck(int ischeck);
	public abstract int count();
	public abstract void insert(AdminBoardVO adminBoardVO);
	public abstract AdminBoardVO read(int seq);
	public abstract void update(AdminBoardVO adminBoardVO);
	public abstract void delete(int seq);
	public abstract void deleteAll();
	public abstract List<AdminBoardVO> mainList();
}
