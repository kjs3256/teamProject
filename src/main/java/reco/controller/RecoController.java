package reco.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import reco.domain.RecoVO;
import reco.service.RecoService;
import userBoard.service.UserBoardService;


@Controller
public class RecoController {
	private RecoService recoService;
	private UserBoardService userBoardService;
	public void setUserBoardService(UserBoardService userBoardService) {
		this.userBoardService = userBoardService;
	}

	public void setRecoService(RecoService recoService) {
		this.recoService = recoService;
	}
	
	@RequestMapping("/reco")
	public String recoUpdate(HttpServletRequest request) {
		String id = request.getParameter("id");
		int seq = Integer.parseInt(request.getParameter("seq"));
		RecoVO recoVO = new RecoVO(id, seq);
		RecoVO check = recoService.reco_check(recoVO);
		if(check == null) {
			recoService.reco_update(recoVO);
			userBoardService.updateLike(seq);
			return "redirect:/userBoard/read/"+seq;
		}else {
			return "reco/recoFail";
		}
	}
}
