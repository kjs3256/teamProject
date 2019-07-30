package mate.dao;

import java.util.List;


import mate.domain.MateVO;

public interface MateDao {
	
	public abstract List<MateVO> list(int start, int end);
	
	public abstract int delete(int seq);
	
	public abstract void insert(MateVO mateVO);

	public abstract int count();

	public abstract MateVO read(int seq);
}
