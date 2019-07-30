package mate.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import mate.domain.MateVO;

public class MateValidator implements Validator {

	
	@Override
	public boolean supports(Class<?> arg0) {
		return MateVO.class.isAssignableFrom(arg0);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		MateVO regReq = (MateVO) target;
		if(regReq.getTitle() == null || regReq.getTitle().trim().isEmpty()) {
		 errors.rejectValue("title", "required");	
		}
	}
	

}
