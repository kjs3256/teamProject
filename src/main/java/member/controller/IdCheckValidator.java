package member.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


public class IdCheckValidator implements Validator{
	private static final String idRegExp = "^[a-z]+[a-z0-9+]{4,12}$";
	private Pattern pattern;
	public IdCheckValidator() {
		pattern = Pattern.compile(idRegExp);
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
		if(regCmd.getId() == null || regCmd.getId().trim().isEmpty()) {
			errors.rejectValue("id", "required");
		}else {
			Matcher matcher = pattern.matcher(regCmd.getId());
			if(!matcher.matches()) {
				errors.rejectValue("id", "badId");
			}
		}
	}
	
}
