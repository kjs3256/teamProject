package reco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import reco.dao.RecoDao;
import reco.domain.RecoVO;

@Service
public class RecoServiceImpl implements RecoService {
	@Autowired
	private RecoDao recoDao;
	@Override
	public void reco_update(RecoVO recoVO) {
		recoDao.reco_update(recoVO);
	}
	@Override
	public RecoVO reco_check(RecoVO recoVO) {
		return recoDao.reco_check(recoVO);
	}

}
