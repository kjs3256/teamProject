package member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.exception.IdPasswordNotMatchingException;
import member.service.AuthInfo;
import member.service.AuthService;

@Controller
@RequestMapping("/login")
public class LoginController {
	private AuthService authService;
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public String form(LoginCommand loginCommand,
			@CookieValue(value="REMEMBER", required=false)Cookie cookie) {
		if(cookie != null) {
			loginCommand.setId(cookie.getValue());
			loginCommand.setRememberId(true);
		}
		return "login/loginForm";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String submit(LoginCommand loginCommand, Errors errors, HttpSession session,
			HttpServletResponse response) {
		new LoginCommandValidator().validate(loginCommand, errors);
		if(errors.hasErrors()) {
			return "login/loginForm";
		}
		try {
			AuthInfo authInfo = authService.authenticate(
					loginCommand.getId(), loginCommand.getPassword());
			session.setAttribute("authInfo", authInfo);
			
			Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getId());
			rememberCookie.setPath("/");
			if(loginCommand.isRememberId()) {
				rememberCookie.setMaxAge(60*60*24*30);
			}else {
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie);
			return "redirect:/main";
		}catch(IdPasswordNotMatchingException e) {
			return "login/loginFail";
		}
	}
}
