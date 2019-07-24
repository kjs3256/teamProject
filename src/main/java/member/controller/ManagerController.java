package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.domain.MemberVO;
import member.exception.IdPasswordNotMatchingException;
import member.exception.MemberNotFoundException;
import member.service.AuthInfo;
import member.service.MemberService;

@Controller
@RequestMapping("/edit/*")
public class ManagerController {
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@RequestMapping(value="edit", method=RequestMethod.GET)
	public String edit(Model model) {
		model.addAttribute("member", new MemberVO());
		return "edit/edit";
	}
	@RequestMapping(value="edit", method=RequestMethod.POST)
	public String edit(@ModelAttribute("member") MemberVO member, Errors errors, HttpSession session) {
		new ManagerValidator().validate(member, errors);
		if(errors.hasErrors()) {
			return "edit/edit";
		}
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		MemberVO memberConfirm = memberService.memberConfirm(authInfo.getId());
		if(!member.getPassword().equals(memberConfirm.getPassword())) {
			return "edit/editFail";
		}
		return "edit/editChoice";
	}
	@RequestMapping(value="changePwd", method=RequestMethod.GET)
	public String changePwd(Model model) {
		model.addAttribute("pwdCmd", new ChangePwdCommand());
		return "edit/changePwdForm";
	}
	@RequestMapping(value="changePwd", method=RequestMethod.POST)
	public String changePwd(
			@ModelAttribute("pwdCmd")ChangePwdCommand pwdCmd,
			Errors errors, HttpSession session) {
		new ChangePwdCommandValidator().validate(pwdCmd, errors);
		if(errors.hasErrors()) {
			return "edit/changePwdForm";
		}
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		//기존의 세션을 가져와서 로그인한 사용자 판별
		try {
			changePassword(authInfo.getId(),
					pwdCmd.getCurrentPassword(), pwdCmd.getNewPassword());
			return "edit/changePwd";
		}catch(IdPasswordNotMatchingException e) {
			errors.rejectValue("currentPassword", "notMatching");
			return "edit/changePwdForm";
		}
	}
	@RequestMapping(value="deleteMember", method=RequestMethod.GET)
	public String deleteMember(Model model) {
		model.addAttribute("member", new MemberVO());
		return "edit/deleteMember";
	}
	@RequestMapping(value="deleteMember", method=RequestMethod.POST)
	public String deleteMember(@ModelAttribute("member")MemberVO memberVO,
			Errors errors, HttpSession session) {
		new ManagerValidator().validate(memberVO, errors);
		if(errors.hasErrors()) {
			return "edit/deleteMember";
		}
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		MemberVO memberConfirm = memberService.memberConfirm(authInfo.getId());
		if(!memberVO.getPassword().equals(memberConfirm.getPassword())) {
			return "edit/deleteFail";
		}else {
			memberVO.setId(authInfo.getId());
			session.invalidate();
			memberService.delete(memberVO);
			return "redirect:/main";
		}
	}
	public void changePassword(String id, String oldPwd, String newPwd) {
		MemberVO member = memberService.memberConfirm(id);
		if(member == null) {
			throw new MemberNotFoundException();
		}
		if(!member.getPassword().equals(oldPwd)) {
			throw new IdPasswordNotMatchingException();
		}else {
			member.setPassword(newPwd);
		}
		memberService.modify(member);
	}
}
