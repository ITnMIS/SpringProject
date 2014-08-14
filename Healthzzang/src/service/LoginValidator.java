package service;

import model.LoginSessionModel;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class LoginValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return LoginSessionModel.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		LoginSessionModel loginModel = (LoginSessionModel) target;
		
		// check userId field
		if(loginModel.getId() == null || loginModel.getId().trim().isEmpty()) {
			errors.rejectValue("id", "required");
		}
		
		// check userPw field
		if(loginModel.getPw() == null || loginModel.getPw().trim().isEmpty()){
			errors.rejectValue("pw", "required");
		}

	}

}
