package comment.dao;

import java.util.List;

import comment.domain.CommentVO;

public interface CommentDao {
	public abstract List<CommentVO> list(int seq);
	public abstract void insert(CommentVO commentVO);
	public abstract int count(int seq);
	public abstract void delete(int cseq);
	public abstract CommentVO select(int cseq);
}
