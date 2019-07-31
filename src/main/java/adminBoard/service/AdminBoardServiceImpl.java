package adminBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import adminBoard.dao.AdminBoardDao;
import adminBoard.domain.AdminBoardVO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService{
	@Autowired
	private AdminBoardDao adminBoardDao;
	
	@Override
	public List<AdminBoardVO> list(int start, int end) {
		return adminBoardDao.list(start, end);
	}
	@Override
	public List<AdminBoardVO> search(String keyword) {
		return adminBoardDao.selectByKey(keyword);
	}
	@Override
	public List<AdminBoardVO> categorizing(int ischeck) {
		return adminBoardDao.selectByIscheck(ischeck);
	}
	@Override
	public int count() {
		return adminBoardDao.count();
	}
	@Override
	public void write(AdminBoardVO adminBoardVO) {
		adminBoardDao.insert(adminBoardVO);
	}
	@Override
	public AdminBoardVO read(int seq) {
		return adminBoardDao.read(seq);
	}
	@Override
	public void edit(AdminBoardVO adminBoardVO) {
		adminBoardDao.update(adminBoardVO);
	}
	@Override
	public void delete(int seq) {
		adminBoardDao.delete(seq);
	}
	@Override
	public void deleteAll() {
		adminBoardDao.deleteAll();
	}
	@Override
	public List<AdminBoardVO> mainList() {
		return adminBoardDao.mainList();
	}
}
