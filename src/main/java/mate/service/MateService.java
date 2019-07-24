package mate.service;

import java.util.List;

import mate.domain.MateVO;

public interface MateService {
	
	public abstract List<MateVO> list();
	
	public abstract int delete(MateVO mateVO);
	
	public abstract void add(MateVO mateVO);
	


}
