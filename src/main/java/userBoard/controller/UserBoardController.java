package userBoard.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import member.service.AuthInfo;
import userBoard.domain.UserBoardVO;
import userBoard.service.UserBoardService;

@Controller
@RequestMapping("/userBoard/*")
public class UserBoardController {
	private UserBoardService userBoardService;
	public void setUserBoardService(UserBoardService userBoardService){
		this.userBoardService = userBoardService;
	}
	public void page(HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 10; //한 페이지 당 글의 갯수
		int currentPage = Integer.parseInt(pageNum);
		//페이지의 시작 글 번호
		
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize; // 한 페이지의 마지막 글 번호
		int count = userBoardService.count();
		int number = 0;
		List<UserBoardVO> userBoardList = null;
		List<UserBoardVO> noticeBoardList = null;
		List<UserBoardVO> likeBoardList = null;
		if(count>0) {			
			userBoardList = userBoardService.list(startRow, endRow);
			noticeBoardList = userBoardService.notice("관리자");
			likeBoardList = userBoardService.orderByLike();
		}else {
			userBoardList = Collections.emptyList();
			noticeBoardList = Collections.emptyList();
			likeBoardList = Collections.emptyList();
		}
		number = count - (currentPage - 1) * pageSize; //글 목록에 표시할 글 번호
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
		
		model.addAttribute("sdf",sdf);
		model.addAttribute("userBoardList", userBoardList);
		model.addAttribute("noticeBoardList", noticeBoardList);
		model.addAttribute("likeBoardList", likeBoardList);
		model.addAttribute("number", number);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("count", count);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
	}
	@RequestMapping("list")
	public String list(UserBoardVO userBoardVO, HttpServletRequest request, Model model){
		page(request, model);
		return "userBoard/userBoard";
	}
	@RequestMapping("list/loc")
	public String list(UserBoardVO userBoardVO, HttpServletRequest request, Model model, @RequestParam("loc") String loc){
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 10; //한 페이지 당 글의 갯수
		int currentPage = Integer.parseInt(pageNum);
		//페이지의 시작 글 번호
		
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize; // 한 페이지의 마지막 글 번호
		int count = userBoardService.count();
		int number = 0;
		List<UserBoardVO> userBoardList = null;
		List<UserBoardVO> noticeBoardList = null;
		List<UserBoardVO> likeBoardList = null;
		if(count>0) {			
			userBoardList = userBoardService.list(startRow, endRow, loc);
			noticeBoardList = userBoardService.notice("관리자");
			likeBoardList = userBoardService.orderByLike();
		}else {
			userBoardList = Collections.emptyList();
			noticeBoardList = Collections.emptyList();
			likeBoardList = Collections.emptyList();
		}
		number = count - (currentPage - 1) * pageSize; //글 목록에 표시할 글 번호
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
		
		model.addAttribute("sdf",sdf);
		model.addAttribute("userBoardList", userBoardList);
		model.addAttribute("noticeBoardList", noticeBoardList);
		model.addAttribute("likeBoardList", likeBoardList);
		model.addAttribute("number", number);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("count", count);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		return "userBoard/userBoard";
	}
	@RequestMapping("read/{seq}")
	public String read(HttpServletRequest request, Model model, @PathVariable int seq) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		model.addAttribute("sdf",sdf);
		model.addAttribute("pageNum", Integer.parseInt(pageNum));
		model.addAttribute("userBoardVO", userBoardService.read(seq));
		return "userBoard/read";
	}

	@RequestMapping(value="write", method=RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("formData",new UserBoardVO());	
		return "userBoard/write";
	}

	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(@ModelAttribute("formData")UserBoardVO vo, Errors errors, 
			HttpSession session){
		new WriteValidator().validate(vo, errors);
		if(errors.hasErrors()) {
			return "userBoard/write";
		}
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		vo.setNickname(authInfo.getNickname());
		userBoardService.write(vo);
		return "redirect:/userBoard/list";
	}

	@RequestMapping(value="edit/{seq}", method=RequestMethod.GET)
	public String edit(@PathVariable int seq, Model model) {
		UserBoardVO userBoardVO = userBoardService.read(seq);
		model.addAttribute("formData", userBoardVO);
		return "userBoard/edit";
	}

	@RequestMapping(value="edit/{seq}", method=RequestMethod.POST)
	public String edit(@ModelAttribute("formData")UserBoardVO userBoardVO, Errors errors, @PathVariable int seq) {
		new WriteValidator().validate(userBoardVO, errors);
		if(errors.hasErrors()) {
			return "/userBoard/edit";
		}else {
			userBoardService.edit(userBoardVO);
			return "redirect:/userBoard/read/"+seq;
		}
	}

	@RequestMapping(value="delete/{seq}", method=RequestMethod.GET)
	public String delete(@PathVariable int seq, HttpSession session, Model model) {
		UserBoardVO userBoardVO = userBoardService.read(seq);
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		if(authInfo != null && authInfo.getNickname().equals(userBoardVO.getNickname())) {
			userBoardService.delete(userBoardVO);
			return "redirect:/userBoard/list";
		}
		model.addAttribute("userBoardVO", userBoardVO);
		return "/userBoard/delete";
	}
	@RequestMapping(value="image")
	public void image(@ModelAttribute UserBoardVO vo, @RequestParam("file") MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("image uploading");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		System.out.println("uploadPath : "+uploadPath);
		
		String filename = file.getOriginalFilename();
		String filePath = uploadPath + "\\" + filename;
		
		File f = new File(filePath);
		if(!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		String imgsrc = request.getContextPath()+"/upload/"+filename;
		out.println(imgsrc);
		out.close();
	}
}
