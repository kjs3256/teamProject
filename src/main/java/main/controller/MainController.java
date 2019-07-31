package main.controller;

import java.text.SimpleDateFormat;
import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import adminBoard.domain.AdminBoardVO;
import adminBoard.service.AdminBoardService;
import mate.service.MateService;
import userBoard.domain.UserBoardVO;
import userBoard.service.UserBoardService;

@Controller
public class MainController {
	private UserBoardService userBoardService;
	private MateService mateService;
	private AdminBoardService adminBoardService;
	
	public void setAdminBoardService(AdminBoardService adminBoardService) {
		this.adminBoardService = adminBoardService;
	}
	public void setUserBoardService(UserBoardService userBoardService) {
		this.userBoardService = userBoardService;
	}
	public void setMateService(MateService mateService) {
		this.mateService = mateService;
	}


	@RequestMapping("/main")
	public String main(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
		
		model.addAttribute("sdf",sdf);
		model.addAttribute("adminBoardList", adminBoardService.mainList());
		model.addAttribute("mateBoardList", mateService.mainList());
		model.addAttribute("userBoardList", userBoardService.mainList());
		return "main";
	}
	

	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(@RequestParam("keyword") String keyword, Model model) {
		List<UserBoardVO> uBoardSearch = null;
		List<AdminBoardVO> aBoardSearch = null;
		try {
			aBoardSearch = adminBoardService.search(keyword);
			uBoardSearch = userBoardService.search(keyword);
			if(keyword.equals("") || (uBoardSearch == null && aBoardSearch == null)) {
				return "search/searchFail";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("userBoardList", uBoardSearch);
		model.addAttribute("adminBoardList", aBoardSearch);
		model.addAttribute("keyword", keyword);
		return "search/searchList";
	}
}
