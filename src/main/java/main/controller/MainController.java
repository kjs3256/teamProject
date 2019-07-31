package main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import adminBoard.controller.*;
import userBoard.domain.UserBoardVO;
import userBoard.service.UserBoardService;

@Controller
public class MainController {
	private UserBoardService userBoardService;
//	private MateBoardService mateBoardService;
	public void setUserBoardService(UserBoardService userBoardService) {
		this.userBoardService = userBoardService;
	}
//	public void setMateBoardService(MateBoardService mateBoardService) {
//		this.mateBoardService = mateBoardService;
//	}



	@RequestMapping("/main")
	public String main(Model model) {
		
		model.addAttribute("userBoardList", userBoardService.mainList());
		return "main";
	}
	

	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(@RequestParam("keyword") String keyword, Model model) {
		List<UserBoardVO> uBoardSearch = null;
		List<UserBoardVO> hBoardSearch = null;
		List<UserBoardVO> mBoardSearch = null;
		try {
			uBoardSearch = userBoardService.search(keyword);
			if(keyword=="" || (uBoardSearch == null && hBoardSearch == null && mBoardSearch == null)) {
				return "search/searchFail";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("userBoardList", uBoardSearch);
		model.addAttribute("keyword", keyword);
		return "search/searchList";
	}
}
