package userBoard.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import userBoard.domain.UserBoardVO;


public class WriteValidator implements Validator{
	@Override
	public boolean supports(Class<?> arg0) {
		return UserBoardVO.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// target : 검사 대상 객체
		// errors : 검사 결과 에러코드를 저장하는 객체
		
		ValidationUtils.rejectIfEmpty(errors, "title", "required");
	}	
}
