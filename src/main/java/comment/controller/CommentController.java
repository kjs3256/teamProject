package comment.controller;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import comment.domain.CommentVO;
import comment.service.CommentService;
import member.service.AuthInfo;
import userBoard.domain.UserBoardVO;
import userBoard.service.UserBoardService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
	private CommentService commentService;
	public void setCommentService(CommentService commentService){
		this.commentService = commentService;
	}
	@RequestMapping(value="add", method=RequestMethod.POST)
	public String add(CommentVO commentVO, @RequestParam("seq") int seq, HttpSession session, Model model){
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		commentVO.setSeq(seq);
		commentVO.setNickname(authInfo.getNickname());
		commentService.add(commentVO);
		return "redirect:/userBoard/read/"+seq;
	}
	
	@RequestMapping(value="deleteComm/{cseq}")
	public String delete(@PathVariable int cseq, HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		CommentVO check = commentService.check(cseq);
		if(authInfo.getNickname().equals(check.getNickname())) {
			commentService.delete(cseq);
			return "redirect:/userBoard/read/"+check.getSeq();
		}else {
			return "comment/commDeleteFail";
		}
	}

	@RequestMapping("list/{seq}")
	public String list(Model model, @PathVariable int seq){
		int count = commentService.count(seq);
		List<CommentVO> commentList = null;
		if(count>0) {			
			commentList = commentService.list(seq);
		}else {
			commentList = Collections.emptyList();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd/HH:mm");
		model.addAttribute("sdf",sdf);
		model.addAttribute("commentList", commentList);
		model.addAttribute("count", count);
		model.addAttribute("seq", seq);
		model.addAttribute("commentVO", new CommentVO());
		return "comment/list";
	}
}
