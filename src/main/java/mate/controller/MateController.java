package mate.controller;


import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mate.domain.MateVO;
import mate.service.MateService;
import member.service.AuthInfo;


@Controller
@RequestMapping("/mate/*")
public class MateController {
		private MateService mateService;
		public void setMateService(MateService mateService){
			this.mateService = mateService;
		}
	
	
	@RequestMapping("list")
	public String list(HttpServletRequest request, Model model){
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 10; //한 페이지 당 글의 갯수
		int currentPage = Integer.parseInt(pageNum);
		//페이지의 시작 글 번호
		
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize; // 한 페이지의 마지막 글 번호
		int count = mateService.count();
		int number = 0;
		List<MateVO> mateList = null;
		if(count>0) {
			mateList = mateService.list(startRow, endRow);
		}else {
			mateList = Collections.emptyList();
		}
		number = count - (currentPage - 1) * pageSize; //글 목록에 표시할 글 번호
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
		model.addAttribute("sdf",sdf);
		model.addAttribute("mateList", mateList);
		model.addAttribute("number", number);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("count", count);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("mateVO", new MateVO());
		return "mate/list";
	}
	
	@RequestMapping(value="list", method=RequestMethod.POST)
	public String list(MateVO mateVO, HttpSession session, Errors errors) {
		new MateValidator().validate(mateVO, errors);
		if(errors.hasErrors()) {
			return "redirect:/mate/list";
		}
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
//		if(authInfo != null) {
//			mateService.add(mateVO);
//			return "redirect:/mate/list";
//		}else {
//			return "redirect:/login";
//		}
		mateVO.setNickname("dd");
		mateService.add(mateVO);
		return "redirect:/mate/list";
	}
}
