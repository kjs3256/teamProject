package mate.dao;

import java.util.List;

import mate.domain.MateVO;

public interface MateDao {
	
	public abstract List<MateVO> list();
	
	public abstract int delete(MateVO mateVO);
	
	public abstract void insert(MateVO mateVO);

	public abstract MateVO select(int seq);

	public abstract List<MateVO> selectmateList(MateVO mateVO);

	public abstract List<MateVO> selectmateListCnt(MateVO mateVO);

}
