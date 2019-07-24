package reco.dao;

import reco.domain.RecoVO;

public interface RecoDao {
	public abstract void reco_update(RecoVO recoVO);
	public abstract RecoVO reco_check(RecoVO recoVO);
}
