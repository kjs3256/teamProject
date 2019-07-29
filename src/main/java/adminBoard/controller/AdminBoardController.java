package adminBoard.controller;

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

import adminBoard.domain.AdminBoardVO;
import adminBoard.service.AdminBoardService;
import member.service.AuthInfo;

@Controller
@RequestMapping("/adminBoard/*")
public class AdminBoardController {
	private AdminBoardService adminBoardService;

	public void setAdminBoardService(AdminBoardService adminBoardService) {
		this.adminBoardService = adminBoardService;
	}
	
	//페이지 번호
	public void page(HttpServletRequest request, Model model){
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 10; //한 페이지 당 글의 갯수
		int currentPage = Integer.parseInt(pageNum);
		//페이지의 시작 글 번호
		
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize; // 한 페이지의 마지막 글 번호
		int count = adminBoardService.count();
		int number = 0;
		List<AdminBoardVO> adminBoardList = null;
		if(count>0) {			
			adminBoardList = adminBoardService.list(startRow, endRow);
		}else {
			adminBoardList = Collections.emptyList();
		}
		number = count - (currentPage - 1) * pageSize; //글 목록에 표시할 글 번호
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
		model.addAttribute("sdf",sdf);
		model.addAttribute("adminBoardList", adminBoardList);
		model.addAttribute("number", number);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("count", count);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
	}
	// 글목록 출력
	@RequestMapping("list")
	public String list(HttpServletRequest request, Model model){
		page(request,model);
		
		AuthInfo authInfo =(AuthInfo)request.getAttribute("authInfo");
		model.addAttribute("authInfo", authInfo);
		
		return "adminBoard/list";
	}
	// 카테고리
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String search(@RequestParam("ischeck")int check, Model model, HttpServletRequest request) {
		if(check ==0) {
			page(request,model);
			return "adminBoard/list";
		}else {
			List<AdminBoardVO> adminBoardList = adminBoardService.categorizing(check);
			page(request,model);
			model.addAttribute("adminBoardList", adminBoardList);
			return "adminBoard/list";
		}
	}
	//글작성 폼
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("formData", new AdminBoardVO());
		return "adminBoard/write";
	}
	//글 등록
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(@ModelAttribute("formData")AdminBoardVO vo, Errors errors, 
			HttpSession session){
		if(errors.hasErrors()) {
			return "adminBoard/write";
		}
		adminBoardService.write(vo);
		return "redirect:/adminBoard/list";
	}
	//게시글 보기
	@RequestMapping(value="read/{seq}", method=RequestMethod.GET)
	public String read(@PathVariable int seq,  Model model, HttpServletRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		AuthInfo authInfo =(AuthInfo)request.getAttribute("authInfo");
		
		model.addAttribute("authInfo", authInfo);
		model.addAttribute("sdf",sdf);
		model.addAttribute("adminBoardVO",adminBoardService.read(seq));
		
		return "adminBoard/read";
	}
	//글 삭제
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete(@RequestParam("checkBoxList") List<Integer> chList, Model model, HttpServletRequest request ) {
		for (Integer ch : chList) {
			adminBoardService.delete(ch);
		}
		return "redirect:/adminBoard/list";
	}
	@RequestMapping(value="image")
	public void image(@ModelAttribute AdminBoardVO vo, @RequestParam("file") MultipartFile file,
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
