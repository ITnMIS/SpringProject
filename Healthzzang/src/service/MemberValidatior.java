package service;

import model.MemberModel;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class MemberValidatior implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberModel.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberModel memberModel = (MemberModel) target;
		
		if(memberModel.getId() == null || memberModel.getId().trim().isEmpty()){
			errors.rejectValue("id", "required");
		}
		
		if(memberModel.getEmail() == null || memberModel.getEmail().trim().isEmpty()){
			errors.rejectValue("email", "required");
		}
		
		/*if(memberModel.getMseq() == null || memberModel.getMseq().trim().isEmpty()){
			errors.rejectValue("mseq", "required");
		}*/

	}

}
