package main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import userBoard.service.UserBoardService;

@Controller
public class MainController {
//	private HotBoardService hotBoardService;
	private UserBoardService userBoardService;
//	private MateBoardService mateBoardService;
	
//	public void setHotBoardService(HotBoardService hotBoardService) {
//		this.hotBoardService = hotBoardService;
//	}
	public void setUserBoardService(UserBoardService userBoardService) {
		this.userBoardService = userBoardService;
	}
//	public void setMateBoardService(MateBoardService mateBoardService) {
//		this.mateBoardService = mateBoardService;
//	}


	@RequestMapping("/main")
	public String main(Model model) {
		return "main";
	}
}
