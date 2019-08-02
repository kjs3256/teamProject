package member.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import member.domain.MemberVO;
import member.exception.AlreadyExistingMemberException;
import member.exception.AlreadyExistingNicknameException;
import member.service.MemberService;

@Controller
@RequestMapping("/register/*")
public class RegisterController {
	
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@RequestMapping(value="regist", method=RequestMethod.GET)
	public String step1(Model model) {
		model.addAttribute("formData", new RegisterCommand());
		return "register/regist";
	}
	@RequestMapping(value="welcome", method=RequestMethod.POST)
	public String step2(@ModelAttribute("formData")RegisterCommand regCmd, Errors errors) {
		new RegisterValidator().validate(regCmd, errors);
		if(errors.hasErrors()) {
			return "register/regist";
		}
		try {
			MemberVO nicknameCheck = memberService.nicknameCheck(regCmd.getNickname());
			if(nicknameCheck != null) {
				throw new AlreadyExistingNicknameException("dup nickname "+regCmd.getNickname());
			}
			MemberVO memberVO = new MemberVO(regCmd.getId(), 
					regCmd.getPassword(), new Timestamp(System.currentTimeMillis()),
					regCmd.getNickname(), regCmd.getPhone());
			memberService.regist(memberVO);
			return "register/welcome";
		}catch(AlreadyExistingMemberException e) {
			errors.rejectValue("id", "duplicate");
			return "register/regist";
		}catch(AlreadyExistingNicknameException e) {
			errors.rejectValue("nickname", "duplicate.nickname");
			return "register/regist";
		}
	}
	@ResponseBody
	@RequestMapping(value="idCheck", method=RequestMethod.POST)
	public String idCheck(HttpServletRequest req, @ModelAttribute("formData")RegisterCommand regCmd, Errors errors) throws Exception {
		String id = req.getParameter("id");
		MemberVO idCheck = memberService.memberConfirm(id);
		new IdCheckValidator().validate(regCmd, errors);
		if(errors.hasErrors()) {
			return "redirect:/register/regist";
		}
		String result = "0";
		if(idCheck != null) {
			result = "1";
		}
		if(id == "") {
			result = "-1";
		}
		return result;
	}
}
