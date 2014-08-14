package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CeventModel;
import model.GymModel;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {
	private ApplicationContext context = new ClassPathXmlApplicationContext("/config/applicationContext.xml");
	private SearchService searchService = (SearchService) context.getBean("searchService");
	searchPageHtml st = new searchPageHtml();

	// * User variable
	// article, page variables
	private int currentPage = 1;
	private int showArticleLimit = 10; // change value if want to show more articles by one page
	private int showPageLimit = 10; // change value if want to show more page links
	private int startArticleNum = 0;
	private int endArticleNum = 10;

	private int CeventTotalNum = 0;
	private int CfreeTotalNum = 0;
	private int ChealthzTotalNum = 0;
	private int CideaTotalNum = 0;
	private int GymTotalNum = 0;
	//
	// gym, page variables

	
	@RequestMapping("/list.do")
	public ModelAndView searchBoardList(HttpServletRequest request, HttpServletResponse response){
		String search = null;		

		// set variables from request parameter
		if(request.getParameter("page") == null || request.getParameter("page").trim().isEmpty() || request.getParameter("page").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		//
		
		// expression article variables value
		startArticleNum = (currentPage - 1) * showArticleLimit;
		search = request.getParameter("search").trim();

		// get boardList and get page html code		
		List<CeventModel> searchCeventList;
		List<CeventModel> searchCFreeList;
		List<CeventModel> searchChealthzList;
		List<CeventModel> searchCideaList;

		List<GymModel> searchGymList;

		searchCeventList = searchService.searchCevent(search, startArticleNum, endArticleNum);
		searchCFreeList = searchService.searchCFree(search, startArticleNum, endArticleNum);
		searchChealthzList = searchService.searchChealthz(search, startArticleNum, endArticleNum);
		searchCideaList = searchService.searchCidea(search, startArticleNum, endArticleNum);
		searchGymList = searchService.searchGym(search, startArticleNum, endArticleNum);
		
		CeventTotalNum = searchService.getCeventSearchTotalNum(search);
		CfreeTotalNum = searchService.getCFreeSearchTotalNum(search);
		ChealthzTotalNum = searchService.getChealthzSearchTotalNum(search);
		CideaTotalNum = searchService.getCideaSearchTotalNum(search);
		GymTotalNum = searchService.getGymSearchTotalNum(search);
		
		StringBuffer CeventPageHtml = st.getPageHtml(currentPage, CeventTotalNum, showArticleLimit, showPageLimit, search);
		StringBuffer CfreePageHtml = st.getPageHtml(currentPage, CfreeTotalNum, showArticleLimit, showPageLimit, search);
		StringBuffer ChealthzPageHtml = st.getPageHtml(currentPage, ChealthzTotalNum, showArticleLimit, showPageLimit, search);
		StringBuffer CideaPageHtml = st.getPageHtml(currentPage, CideaTotalNum, showArticleLimit, showPageLimit, search);
		StringBuffer GymPageHtml = st.getPageHtml(currentPage, GymTotalNum, showArticleLimit, showPageLimit, search);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("searchCeventList", searchCeventList);
		mav.addObject("searchCFreeList", searchCFreeList);
		mav.addObject("searchChealthz", searchChealthzList);
		mav.addObject("searchCidea", searchCideaList);
		mav.addObject("searchGymList", searchGymList);

		//page setting
		mav.addObject("CeventpageHtml", CeventPageHtml);
		mav.addObject("CfreePageHtml", CfreePageHtml);
		mav.addObject("ChealthzPageHtml", ChealthzPageHtml);
		mav.addObject("CideaPageHtml", CideaPageHtml);
		mav.addObject("GymPageHtml", GymPageHtml);
		
		mav.setViewName("/search/list");
		return mav;

	}
	
	// A method for Creating page html code


}




