package controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.QnACommentModel;
import model.QnAModel;
import model.QnACommentModel;
import model.QnAModel;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import service.QnAService;

@Controller
@RequestMapping("/qna")
public class QnAController {
	// DI

	private ApplicationContext context = new ClassPathXmlApplicationContext("/config/applicationContext.xml");
	private QnAService qnaService = (QnAService) context.getBean("qnaService");
	//
	// * User variable
	// article, page variables
	private int currentPage = 1;
	private int showArticleLimit = 10; // change value if want to show more articles by one page
	private int showPageLimit = 10; // change value if want to show more page links
	private int startArticleNum = 0;
	private int endArticleNum = 0;
	private int totalNum = 0;
	//
	// file upload path
	private String uploadPath = "D:\\Workspace\\SummerBoard\\WebContent\\files\\";
	//
	//
	
	@RequestMapping("/list.do")
	public ModelAndView qnaList(HttpServletRequest request, HttpServletResponse response){
		
		String gseq = request.getParameter("gseq");
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
		startArticleNum = (currentPage - 1) * showArticleLimit + 1;
		endArticleNum = startArticleNum + showArticleLimit -1;
		//
		
		// get boardList and get page html code
		List<QnAModel> qnaList;
		if(type != null && keyword != null){
			qnaList = qnaService.searchArticle(type, keyword, startArticleNum, endArticleNum);
			totalNum = qnaService.getSearchTotalNum(type, keyword);
		} else {
			qnaList = qnaService.getBoardList(startArticleNum, endArticleNum, gseq);
			totalNum = qnaService.getTotalNum();
		}
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword);
		//
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaList", qnaList);
		mav.addObject("pageHtml", pageHtml);
		mav.setViewName("/Hboard/qna/list");
		
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
				pageHtml.append("<span><a href=\"list.do?page=" + (currentPage-1) + "\"><占쎈똻��</a>&nbsp;&nbsp;");
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
				pageHtml.append(".&nbsp;&nbsp;<a href=\"list.do?page=" + (currentPage+1) + "\"><占썬끉��</a></span>");
			}
		//
		// else: when search
		} else {			
			if(currentPage == 1){
				pageHtml.append("<span>");
			} else {
				pageHtml.append("<span><a href=\"list.do?page=" + (currentPage-1) + "&type=" + type + "&keyword=" + keyword + "\"><占쎈똻��</a>&nbsp;&nbsp;");
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
				pageHtml.append(".&nbsp;&nbsp;<a href=\"list.do?page=" + (currentPage+1) + "&type=" + type + "&keyword=" + keyword + "\"><占썬끉��</a></span>");
			}
		}
		//		
		return pageHtml;
	}
	
	@RequestMapping("/view.do")
	public ModelAndView qnaView(HttpServletRequest request){
		int idx = Integer.parseInt(request.getParameter("idx"));		
		QnAModel qna = qnaService.getOneArticle(idx); // get selected article model
		qnaService.updateHitcount(qna.getHitcount()+1, idx); // update hitcount
		List<QnACommentModel> commentList = qnaService.getCommentList(idx); // get comment list
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("qna", qna);	
		mav.addObject("commentList", commentList);
		mav.setViewName("/Hboard/qna/view");
		return mav;
	}
	
	@RequestMapping("/write.do")
	public String qnaWrite(@ModelAttribute("QnAModel") QnAModel qnaModel){		
		return "/Hboard/qna/write";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String qnaWriteProc(@ModelAttribute("QnAModel") 
	QnAModel qnaModel, MultipartHttpServletRequest request){
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
		qnaModel.setFileupload(fileName);
		//
		// new line code change to <br /> tag	
		String content =  qnaModel.getContent().replaceAll("\r\n", "<br />");		
		qnaModel.setContent(content);
		//
		qnaService.writeArticle(qnaModel);		
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/commentWrite.do")
	public ModelAndView commentWriteProc(@ModelAttribute("CommentModel") QnACommentModel commentModel, HttpServletRequest request){
		// new line code change to <br /> tag
		String content = commentModel.getContent().replaceAll("\r\n", "<br />");
		commentModel.setContent(content);
		//

		qnaService.writeComment(commentModel);
		ModelAndView mav = new ModelAndView();
		mav.addObject("idx", commentModel.getLinkedArticleNum());
		mav.setViewName("redirect:view.do");
		
		return mav;
	}
	
	@RequestMapping("/modify.do")
	public ModelAndView qnaModify(HttpServletRequest request, HttpSession session){
		String userId = (String) session.getAttribute("id");
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		QnAModel qna = qnaService.getOneArticle(idx);
		// <br /> tag change to new line code
		String content = qna.getContent().replaceAll("<br />", "\r\n");
		qna.setContent(content);		
		
		
		//		
		ModelAndView mav = new ModelAndView();
		
		if(!userId.equals(qna.getWriterId())){
			mav.addObject("errCode", "1");	// forbidden connection
			mav.addObject("idx", idx);
			mav.setViewName("redirect:view.do");
		} else {
			mav.addObject("qna", qna);
			mav.setViewName("/Hboard/qna/modify");
		}		
		
		return mav;
	}
	
	@RequestMapping(value = "/modify.do", method=RequestMethod.POST)
	public ModelAndView qnaModifyProc(
			@ModelAttribute("QnAModel") QnAModel qnaModel, 
			MultipartHttpServletRequest request){
		String orgFileName = request.getParameter("orgFile");
		MultipartFile newFile = request.getFile("newFile");
		String newFileName = newFile.getOriginalFilename();
		
		qnaModel.setFileupload(orgFileName);
		
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
			qnaModel.setFileupload(newFileName);
		}
		//
		// new line code change to <br /> tag
		String content =  qnaModel.getContent().replaceAll("\r\n", "<br />");		
		qnaModel.setContent(content);
		//
		
		qnaService.modifyArticle(qnaModel);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("idx", qnaModel.getIdx());
		mav.setViewName("redirect:/Hboard/qna/view.do");
		return mav;
	}
	
	@RequestMapping("/delete.do")
	public ModelAndView qnaDelete(HttpServletRequest request, HttpSession session){

		String userId = (String) session.getAttribute("id");
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		QnAModel qna = qnaService.getOneArticle(idx);
		
		ModelAndView mav = new ModelAndView();
		
		if(!userId.equals(qna.getWriterId())){
			mav.addObject("errCode", "1");	// it's forbidden connection
			mav.addObject("idx", idx);
			mav.setViewName("redirect:view.do");
		} else {
			List<QnACommentModel> commentList = qnaService.getCommentList(idx); // check comments
			if(commentList.size() > 0){
				mav.addObject("errCode", "2"); // can't delete because a article has comments
				mav.addObject("idx", idx);
				mav.setViewName("redirect:view.do");
			} else {
				// if: when the article has upload file - remove that
				if(qna.getFileupload() != null){
					File removeFile = new File(uploadPath + qna.getFileupload());
					removeFile.delete();
				}
				//				
				qnaService.deleteArticle(idx);
				
				mav.setViewName("redirect:list.do");
			}
		}		
		return mav;
	}
	
	@RequestMapping("/commentDelete.do")
	public ModelAndView commendDelete(HttpServletRequest request, HttpSession session){

		int idx = Integer.parseInt(request.getParameter("idx"));
		int linkedArticleNum = Integer.parseInt(request.getParameter("linkedArticleNum"));
		
		System.out.println(idx);
		System.out.println(linkedArticleNum);
		
		String userId = (String) session.getAttribute("id");
		
		System.out.println(userId);
		
		QnACommentModel comment = qnaService.getOneComment(idx);
		
		ModelAndView mav = new ModelAndView();
		
		if(!userId.equals(comment.getWriterId())){
			mav.addObject("errCode", "1");
		} else {
			qnaService.deleteComment(idx);
		}		
				
		mav.addObject("idx", linkedArticleNum); // move back to the article
		mav.setViewName("redirect:view.do");
		
		return mav;
	}
	
	@RequestMapping("/recommend.do")
	public ModelAndView updateRecommendcount(HttpServletRequest request, HttpSession session){
		int idx = Integer.parseInt(request.getParameter("idx"));
		String userId = (String) session.getAttribute("id");
		QnAModel qna = qnaService.getOneArticle(idx);
		
		ModelAndView mav = new ModelAndView();
		
		if(userId.equals(qna.getWriterId())){
			mav.addObject("errCode", "1");
		} else {
			qnaService.updateRecommendCount(qna.getRecommendcount()+1, idx);
			qnaService.updateHitcount(qna.getHitcount()-1, idx);
		}
		
		mav.addObject("idx", idx);
		mav.setViewName("redirect:/Hboard/qna/view.do");
		
		return mav;
	}
}
