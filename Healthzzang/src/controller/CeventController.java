package controller;

import java.io.File;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CeventCommentModel;
import model.CeventModel;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import service.CeventService;

@Controller
@RequestMapping("/cevent")
public class CeventController {

	private ApplicationContext context = new ClassPathXmlApplicationContext("/config/applicationContext.xml");
	private CeventService ceventService = (CeventService) context.getBean("ceventService");
	//
	// * User variable
	// article, page variables
	private int currentPage = 1;
	private int showArticleLimit = 10; // change value if want to show more articles by one page
	private int showPageLimit = 10; // change value if want to show more page links
	private int startArticleNum = 0;
	private int endArticleNum = 10;
	private int totalNum = 0;
	//
	// file upload path
	private String uploadPath = "D:\\";
	//
	//
	
	@RequestMapping("/list.do")
	public ModelAndView ceventList(HttpServletRequest request, HttpServletResponse response){
		
		String type = null;
		String keyword = null;		
		
		// set variables from request parameter
		if(request.getParameter("page") == null || request.getParameter("page").trim().isEmpty() || request.getParameter("page").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		if(request.getParameter("type") != null){
			type = request.getParameter("type").trim();
		}
		
		if(request.getParameter("keyword") != null){
			keyword = request.getParameter("keyword").trim();
		}
		//
		
		// expression article variables value
		startArticleNum = (currentPage-1) * showArticleLimit;

		// get boardList and get page html code
		List<CeventModel> ceventList;
		if(type != null && keyword != null){
			ceventList = ceventService.searchArticle(type, keyword, startArticleNum, endArticleNum);
			totalNum = ceventService.getSearchTotalNum(type, keyword);

		} else {
			ceventList = ceventService.getBoardList(startArticleNum, endArticleNum);
			totalNum = ceventService.getTotalNum();
		}
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword);
		//
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ceventList", ceventList);
		mav.addObject("pageHtml", pageHtml);
		mav.setViewName("/Board/list");
		
		return mav;
	}
	
	// A method for Creating page html code
	private StringBuffer getPageHtml(int currentPage, int totalNum, int showArticleLimit, int showPageLimit, String type, String keyword) {
		StringBuffer pageHtml = new StringBuffer();
		int startPage = 0;
		int lastPage = 0;
		
		// expression page variables
		startPage = ((currentPage-1) / showPageLimit) * showPageLimit + 1;
		lastPage = startPage + showPageLimit - 1;
		
		if(lastPage > totalNum / showArticleLimit) {
			lastPage = (totalNum / showArticleLimit) + 1;
		}
		
		//
		
		// create page html code
		// if: when no search	
		if(type == null && keyword == null){			
			if(currentPage == 1){
				pageHtml.append("<span>");
			} else {
				pageHtml.append("<span><a href=\"list.do?page=" + (currentPage-1) + "\"><이전페이지></a>&nbsp;&nbsp;");
			}
			
			for(int i = startPage ; i <= lastPage ; i++) {
				if(i == currentPage){
					pageHtml.append(".&nbsp;<strong>");
					pageHtml.append("<a href=\"list.do?page=" +i + "\" class=\"page\">" + i + "</a>");
					pageHtml.append("&nbsp;</strong>");
				} else {
					pageHtml.append(".&nbsp;<a href=\"list.do?page=" +i + "\" class=\"page\">" + i + "</a>&nbsp;");
				}
				
			}
			if(currentPage == lastPage){
				pageHtml.append(".</span>");
			} else {
				pageHtml.append(".&nbsp;&nbsp;<a href=\"list.do?page=" + (currentPage+1) + "\"><다음페이지></a></span>");
			}
		//
		// else: when search
		} else {			
			if(currentPage == 1){
				pageHtml.append("<span>");
			} else {
				pageHtml.append("<span><a href=\"list.do?page=" + (currentPage-1) + "&type=" + type + "&keyword=" + keyword + "\"><이전페이지></a>&nbsp;&nbsp;");
			}
			
			for(int i = startPage ; i <= lastPage ; i++) {
				if(i == currentPage){
					pageHtml.append(".&nbsp;<strong>");
					pageHtml.append("<a href=\"list.do?page=" +i + "&type=" + type + "&keyword=" + keyword + "\" class=\"page\">" + i + "</a>&nbsp;");
					pageHtml.append("&nbsp;</strong>");
				} else {
					pageHtml.append(".&nbsp;<a href=\"list.do?page=" +i + "&type=" + type + "&keyword=" + keyword + "\" class=\"page\">" + i + "</a>&nbsp;");
				}
				
			}
			if(currentPage == lastPage){
				pageHtml.append("</span>");
			} else {
				pageHtml.append(".&nbsp;&nbsp;<a href=\"list.do?page=" + (currentPage+1) + "&type=" + type + "&keyword=" + keyword + "\"><다음페이지></a></span>");
			}
		}
		//		
		return pageHtml;
	}
	
	@RequestMapping("/view.do")
	public ModelAndView ceventView(HttpServletRequest request){
		int idx = Integer.parseInt(request.getParameter("idx"));		
		CeventModel cevent = ceventService.getOneArticle(idx); // get selected article model
		ceventService.updateHitcount(cevent.getHitcount()+1, idx); // update hitcount
		List<CeventCommentModel> commentList = ceventService.getCommentList(idx); // get comment list
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cevent", cevent);	
		mav.addObject("commentList", commentList);
		mav.setViewName("/Board/view");
		return mav;
	}
	
	@RequestMapping("/write.do")
	public String ceventWrite(@ModelAttribute("CeventModel") CeventModel ceventModel){		
		return "/Board/write";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String ceventWriteProc(@ModelAttribute("CeventModel") 
	CeventModel ceventModel, MultipartHttpServletRequest request){
		// get upload file
		MultipartFile file = request.getFile("file");
		String fileName = file.getOriginalFilename();
		File uploadFile = new File(uploadPath + fileName);
		// when file exists as same name
		if(uploadFile.exists()){
			fileName = new Date().getTime() + fileName;
			uploadFile = new File(uploadPath + fileName);
		}
		// save upload file to uploadPath
		try {
			file.transferTo(uploadFile);
		} catch (Exception e) {
			
		}
		ceventModel.setFileupload(fileName);
		//
		// new line code change to <br /> tag	
		String content =  ceventModel.getContent().replaceAll("\r\n", "<br />");		
		ceventModel.setContent(content);
		//
		ceventService.writeArticle(ceventModel);		
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/commentWrite.do")
	public ModelAndView commentWriteProc(@ModelAttribute("CommentModel") CeventCommentModel commentModel, HttpServletRequest request){
		// new line code change to <br /> tag
		String content = commentModel.getContent().replaceAll("\r\n", "<br />");
		commentModel.setContent(content);
		//

		ceventService.writeComment(commentModel);
		ModelAndView mav = new ModelAndView();
		mav.addObject("idx", commentModel.getLinkedArticleNum());
		mav.setViewName("redirect:view.do");
		
		return mav;
	}
	
	@RequestMapping("/modify.do")
	public ModelAndView ceventModify(HttpServletRequest request, HttpSession session){
		String userId = (String) session.getAttribute("id");
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		CeventModel cevent = ceventService.getOneArticle(idx);
		// <br /> tag change to new line code
		String content = cevent.getContent().replaceAll("<br />", "\r\n");
		cevent.setContent(content);		
		
		
		//		
		ModelAndView mav = new ModelAndView();
		
		if(!userId.equals(cevent.getWriterId())){
			mav.addObject("errCode", "1");	// forbidden connection
			mav.addObject("idx", idx);
			mav.setViewName("redirect:view.do");
		} else {
			mav.addObject("cevent", cevent);
			mav.setViewName("/Board/modify");
		}		
		
		return mav;
	}
	
	@RequestMapping(value = "/modify.do", method=RequestMethod.POST)
	public ModelAndView ceventModifyProc(
			@ModelAttribute("CeventModel") CeventModel ceventModel, 
			MultipartHttpServletRequest request){
		String orgFileName = request.getParameter("orgFile");
		MultipartFile newFile = request.getFile("newFile");
		String newFileName = newFile.getOriginalFilename();
		
		ceventModel.setFileupload(orgFileName);
		
		// if: when want to change upload file
		if(newFile != null && !newFileName.equals("")){
			if(orgFileName != null || !orgFileName.equals("")){
				// remove uploaded file
				File removeFile = new File(uploadPath  + orgFileName);
				removeFile.delete();
				//
			}
			// create new upload file
			File newUploadFile = new File(uploadPath +newFileName);
			try {
				newFile.transferTo(newUploadFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//
			ceventModel.setFileupload(newFileName);
		}
		//
		// new line code change to <br /> tag
		String content =  ceventModel.getContent().replaceAll("\r\n", "<br />");		
		ceventModel.setContent(content);
		//
		
		ceventService.modifyArticle(ceventModel);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("idx", ceventModel.getIdx());
		mav.setViewName("redirect:view.do");
		return mav;
	}
	
	@RequestMapping("/delete.do")
	public ModelAndView ceventDelete(HttpServletRequest request, HttpSession session){

		String userId = (String) session.getAttribute("id");
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		CeventModel cevent = ceventService.getOneArticle(idx);
		
		ModelAndView mav = new ModelAndView();
		
		if(!userId.equals(cevent.getWriterId())){
			mav.addObject("errCode", "1");	// it's forbidden connection
			mav.addObject("idx", idx);
			mav.setViewName("redirect:view.do");
		} else {
			List<CeventCommentModel> commentList = ceventService.getCommentList(idx); // check comments
			if(commentList.size() > 0){
				mav.addObject("errCode", "2"); // can't delete because a article has comments
				mav.addObject("idx", idx);
				mav.setViewName("redirect:view.do");
			} else {
				// if: when the article has upload file - remove that
				if(cevent.getFileupload() != null){
					File removeFile = new File(uploadPath + cevent.getFileupload());
					removeFile.delete();
				}
				//				
				ceventService.deleteArticle(idx);
				
				mav.setViewName("redirect:list.do");
			}
		}		
		return mav;
	}
	
	@RequestMapping("/commentDelete.do")
	public ModelAndView commendDelete(HttpServletRequest request, HttpSession session){
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int linkedArticleNum = Integer.parseInt(request.getParameter("linkedArticleNum"));
		
		String userId = (String) session.getAttribute("id");
		CeventCommentModel comment = ceventService.getOneComment(idx);
		
		ModelAndView mav = new ModelAndView();
		
		if(!userId.equals(comment.getWriterId())){
			mav.addObject("errCode", "1");
		} else {
			ceventService.deleteComment(idx);
		}		
				
		mav.addObject("idx", linkedArticleNum); // move back to the article
		mav.setViewName("redirect:view.do");
		
		return mav;
	}
	
	@RequestMapping("/recommend.do")
	public ModelAndView updateRecommendcount(HttpServletRequest request, HttpSession session){
		int idx = Integer.parseInt(request.getParameter("idx"));
		String userId = (String) session.getAttribute("id");
		CeventModel cevent = ceventService.getOneArticle(idx);
		
		ModelAndView mav = new ModelAndView();
		
		if(userId.equals(cevent.getWriterId())){
			mav.addObject("errCode", "1");
		} else {
			ceventService.updateRecommendCount(cevent.getRecommendcount()+1, idx);
			ceventService.updateHitcount(cevent.getHitcount()-1, idx);
		}
		
		mav.addObject("idx", idx);
		mav.setViewName("redirect:view.do");
		
		return mav;
	}
}
