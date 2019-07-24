package comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comment.dao.CommentDao;
import comment.domain.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDao commentDao;
	@Override
	public List<CommentVO> list(int seq) {
		return commentDao.list(seq);
	}

	@Override
	public int count(int seq) {
		return commentDao.count(seq);
	}

	@Override
	public void add(CommentVO commentVO) {
		commentDao.insert(commentVO);
	}


	@Override
	public void delete(int cseq) {
		commentDao.delete(cseq);
	}

	@Override
	public CommentVO check(int cseq) {
		return commentDao.select(cseq);
	}
}
