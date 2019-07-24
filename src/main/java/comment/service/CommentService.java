package comment.service;

import java.util.List;

import comment.domain.CommentVO;

public interface CommentService {
	public abstract List<CommentVO> list(int seq);
	public abstract int count(int seq);
	public abstract void add(CommentVO commentVO);
	public abstract void delete(int cseq);
	public abstract CommentVO check(int cseq);
}
