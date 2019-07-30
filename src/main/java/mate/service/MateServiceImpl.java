package mate.service;

import java.util.List;

import org.springframework.stereotype.Service;

import mate.dao.MateDao;
import mate.domain.MateVO;

@Service
public class MateServiceImpl implements MateService {
	private static MateDao mateDao;
	
	public MateDao getMateDao() {
		return mateDao;
	}
	
	public void setMateDao(MateDao mateDao) {
		MateServiceImpl.mateDao = mateDao;
	}
	
	@Override
	public List<MateVO> list(int start, int end) {
		return mateDao.list(start, end);
	}
	
	@Override
	public int delete(MateVO mateVO) {
		return mateDao.delete(mateVO);
	}
	
	@Override
	public void add(MateVO mateVO) {
		mateDao.insert(mateVO);
	}

	@Override
	public int count() {
		return mateDao.count();
	}
	
	@Override
	public void write(MateVO mateVO) {
		mateDao.insert(mateVO);
	}


}
