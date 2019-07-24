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
	public List<MateVO> list(){
		return mateDao.list();
	}
	
	@Override
	public int delete(MateVO mateVO) {
		return mateDao.delete(mateVO);
	}
	
	@Override
	public void add(MateVO mateVO) {
		mateDao.insert(mateVO);
	}

	public static List<MateVO> selectmateList(MateVO mateVO) {
		return mateDao.selectmateList(mateVO);
	}

	public static int selectmateListCnt(MateVO mateVO) {
		return mateDao.selectmateListCnt(mateVO);
	}


}
