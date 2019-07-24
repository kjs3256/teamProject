package member.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


public class RegisterValidator implements Validator{
	private static final String phoneRegExp = "^01(?:0|1|[6-9])[-]?(\\d{3}|\\d{4})[-]?(\\d{4})$";
	private Pattern pattern;
	public RegisterValidator() {
		pattern = Pattern.compile(phoneRegExp);
	}

	@Override
	public boolean supports(Class<?> arg0) {
		return RegisterCommand.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// target : 검사 대상 객체
		// errors : 검사 결과 에러코드를 저장하는 객체
		RegisterCommand regCmd = (RegisterCommand) target;
		
		if(regCmd.getPhone()== null || regCmd.getPhone().trim().isEmpty()) {
			errors.rejectValue("phone", "required");
		}else {
			Matcher matcher = pattern.matcher(regCmd.getPhone());
			if(!matcher.matches()) {
				errors.rejectValue("phone", "bad");
			}
		}
		if(regCmd.getId() == null || regCmd.getId().trim().isEmpty()) {
			errors.rejectValue("id", "required");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nickname", "required");
		ValidationUtils.rejectIfEmpty(errors, "password", "required");
		ValidationUtils.rejectIfEmpty(errors, "confirmPassword", "required");
		if(!regCmd.getPassword().isEmpty()) {
			if(!regCmd.getPassword().equals(regCmd.getConfirmPassword())) {
				errors.rejectValue("confirmPassword", "nomatch");
			}
		}
	}
	
}
