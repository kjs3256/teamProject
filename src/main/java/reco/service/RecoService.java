package reco.service;

import reco.domain.RecoVO;

public interface RecoService {
	public abstract void reco_update(RecoVO recoVO);
	public abstract RecoVO reco_check(RecoVO recoVO);
}
