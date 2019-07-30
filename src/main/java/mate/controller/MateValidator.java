package mate.controller;



import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import mate.domain.MateVO;

public class MateValidator implements Validator {

	
	@Override
	public boolean supports(Class<?> arg0) {
		return MateVO.class.isAssignableFrom(arg0);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "title", "required");
	}
}
