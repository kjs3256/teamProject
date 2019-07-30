package mate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mate.dao.MateDao;
import mate.domain.MateVO;

@Service
public class MateServiceImpl implements MateService {
	@Autowired
	private MateDao mateDao;
	
	@Override
	public List<MateVO> list(int start, int end) {
		return mateDao.list(start, end);
	}
	
	@Override
	public int delete(int seq) {
		return mateDao.delete(seq);
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
	public MateVO read(int seq) {
		return mateDao.read(seq);
	}

}
