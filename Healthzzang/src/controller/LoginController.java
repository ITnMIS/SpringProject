package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginSessionModel;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.LoginService;
import service.LoginValidator;


@Controller
public class LoginController {
	private ApplicationContext context;
	
	@RequestMapping("/login.do")
	public String login() {		
		return "/Home/login";
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public ModelAndView loginProc(@ModelAttribute("LoginModel") LoginSessionModel loginModel, BindingResult result, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// form validation
		new LoginValidator().validate(loginModel, result);
		
		if(result.hasErrors()){
			mav.setViewName("/Home/login");
			return mav;
		}
		
		String id = loginModel.getId();
		String pw = loginModel.getPw();
	
		context = new ClassPathXmlApplicationContext("/config/applicationContext.xml");
		LoginService loginService = (LoginService) context.getBean("loginService");
		LoginSessionModel loginCheckResult = loginService.checkUserId(id);

		//check joined user
		if(loginCheckResult == null){
			mav.addObject("id", id);
			mav.addObject("errCode", 1);	// not exist userId in database
			mav.setViewName("/Home/login");			
			return mav; 
		}
		
		//check password
		if(loginCheckResult.getPw().equals(pw)){			
			session.setAttribute("id", id);
			session.setAttribute("pw", loginCheckResult.getPw());
			mav.setViewName("redirect:/home.do");
			return mav;
		} else {
			mav.addObject("id", id);
			mav.addObject("errCode", 2);	// not matched password
			mav.setViewName("/Home/login");			
			return mav;  
		}	
	}

	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response,
			HttpSession session){
		session.invalidate();
		return "redirect:login.do";
	}
}
