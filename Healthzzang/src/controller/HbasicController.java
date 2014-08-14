package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.GymFeeModel;
import model.GymModel;
import model.TrainerModel;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.GymFeeService;
import service.GymService;
import service.TrainerService;

@Controller
@RequestMapping("/Hbasic")
public class HbasicController {
	private ApplicationContext context = new ClassPathXmlApplicationContext(
			"/config/applicationContext.xml");

	GymService gymservice = (GymService) context.getBean("gymService");
	GymFeeService gymfeeService = (GymFeeService) context.getBean("gymFeeService");
	TrainerService trainerservice = (TrainerService) context.getBean("trainerService");

	@RequestMapping(value = "/Hbasic.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView gymView(HttpServletRequest request) {

		String gseq = request.getParameter("gseq").trim();
		GymModel gym = gymservice.getOneGymName(gseq);
		List<GymFeeModel> gymfeeList = gymfeeService.getGymFeeList(gseq);

		List<TrainerModel> trainerList = trainerservice.getTrainerList(gseq);

		ModelAndView mav = new ModelAndView();
		mav.addObject("hbasic", gym);
		mav.addObject("gymfeeList", gymfeeList);
		mav.addObject("trainerList", trainerList);
		mav.setViewName("/Health/Hbasic");
		return mav;
	}
}
