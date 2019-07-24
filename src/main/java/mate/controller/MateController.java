package mate.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mate.domain.MateVO;
import mate.paging.Pagination;
import mate.service.MateService;
import mate.service.MateServiceImpl;


@Controller
public class MateController {
	private MateService mateService;
	
	public void setMateService(MateService mateService) {
		this.mateService = mateService;
	}
	
	@RequestMapping(value="/mate/list")
	public String list(Model model) {
		model.addAttribute("mateList", mateService.list());
		return "mate/list";
	}
	
	@RequestMapping(value="/mate/list")
	public String mateList(@ModelAttribute("mateVO") MateVO mateVO,
			@RequestParam(defaultValue="1")int curPage,
			HttpServletRequest request,
			Model model) throws Exception{
		
		HttpSession session = request.getSession();
		
		//전체 리스트 개수
		int listCnt = MateServiceImpl.selectmateListCnt(mateVO);
		
		{Pagination pagination = new Pagination(listCnt, curPage);
		
		mateVO.setStartIndex(pagination.getStartIndex());
		mateVO.setCntPerPage(pagination.getPageSize());
		
		//전체 리스트 출력
		List<MateVO> list = MateServiceImpl.selectmateList(mateVO);
		
		model.addAttribute("list", list);
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pagination);
		
		return "mate/mateList";
		}
	}

}
