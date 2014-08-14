package controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping
public class MainController {

	@RequestMapping(value= "/loginmain.do", 
			method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView gymView(){	

		ModelAndView mav = new ModelAndView();			
		mav.setViewName("/main/loginmain");
		return mav;
	}	
}