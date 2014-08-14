package controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import model.MemberModel;
import service.SendMailService;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import service.MemberValidatior;

@Controller
@RequestMapping("/member")
public class MemberController {
	private ApplicationContext 
	context = new ClassPathXmlApplicationContext("/config/applicationContext.xml");
	MemberService memberService = (MemberService) context.getBean("memberService");
	
	@RequestMapping("Hchange.do")
	public ModelAndView chanePw(MemberModel memberModel,
			HttpSession session){
		String userId = (String) session.getAttribute("id");
	    memberService.changePw(memberModel);
		ModelAndView mav = new ModelAndView();
		mav.addObject("id", userId);		
		mav.setViewName("/Home/Hchange");
		return mav;
	}
	
	@RequestMapping("/join.do")
	public String memberJoin(){
		return "/Home/join";
	}
	
	@RequestMapping(value="/join.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("MemberModel") MemberModel memberModel, BindingResult result,
			 @RequestParam("email")String email){
		ModelAndView mav = new ModelAndView();
		new MemberValidatior().validate(memberModel, result);
		
		if(result.hasErrors()){
			mav.setViewName("/Home/join");
			return mav;
		}
		
		/***���� ����****/
		Random r = new Random();
		String check = Integer.toString(r.nextInt(1000));	
		

		SendMailService mm = (SendMailService) context.getBean("mailMail");
		mm.sendMail("ajh1249@ajh1249.cafe24.com", email, "헬스짱 가입 비밀번호", check);
		mav.addObject("mm",mm);
		mav.addObject("check",check);
		/*********************************/
		

		
		MemberModel checkMemberModel = memberService.findByUserId(memberModel.getId());
		MemberModel checkEmail = memberService.findByUserEmail(memberModel.getEmail());
		
		if(checkMemberModel != null){
			mav.addObject("errCode", 1); // userId already exist 
			mav.setViewName("/Home/join");
			return mav;
		}		
		
		if(checkEmail != null){
			mav.addObject("errCode", 1); // email already exist 
			mav.setViewName("/Home/join");
			return mav;
		}
		
		memberModel.setPw(check);
		if(memberService.addMember(memberModel)){
			mav.addObject("errCode", 3);
			mav.setViewName("/Home/join"); // success to add new member; move to login page
			return mav;
		} else {
			mav.addObject("errCode", 2); // failed to add new member
			mav.setViewName("/Home/join");
			return mav;
		}
	}
}
