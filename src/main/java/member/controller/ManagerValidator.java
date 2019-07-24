package member.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import member.domain.MemberVO;


public class ManagerValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		return MemberVO.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required");
	}
}
