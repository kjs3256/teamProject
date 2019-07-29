package adminBoard.service;

import java.util.List;
import adminBoard.domain.AdminBoardVO;

public interface AdminBoardService {
	public abstract List<AdminBoardVO> list(int start, int end);
	public abstract List<AdminBoardVO> search(String keyword);
	public abstract List<AdminBoardVO> categorizing(int ischeck);
	public abstract int count();
	public abstract void write(AdminBoardVO adminBoardVO);
	public abstract AdminBoardVO read(int seq);
	public abstract void edit(AdminBoardVO adminBoardVO);
	public abstract void delete(int seq);
	public abstract void deleteAll();
}
