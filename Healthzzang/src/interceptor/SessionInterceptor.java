package interceptor;

import javax.servlet.http.HttpServletRequest;
import org.apache.coyote.*;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class SessionInterceptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// check variable
		Object id = request.getSession().getAttribute("id");
		//
		if(request.getRequestURI().equals(request.getContextPath()+"/member/join.do")||				
				request.getRequestURI().equals(request.getContextPath()+"/logout.do")||
				request.getRequestURI().equals(request.getContextPath()+"/Hbasic/Hbasic.do")||
				request.getRequestURI().equals(request.getContextPath()+"/cevent/list.do")||
				request.getRequestURI().equals(request.getContextPath()+"/cevent/view.do")||
				request.getRequestURI().equals(request.getContextPath()+"/chealthz/list.do")||
				request.getRequestURI().equals(request.getContextPath()+"/chealthz/view.do")||
				request.getRequestURI().equals(request.getContextPath()+"/cidea/list.do")||
				request.getRequestURI().equals(request.getContextPath()+"/cidea/view.do")||
				request.getRequestURI().equals(request.getContextPath()+"/cfree/list.do")||
				request.getRequestURI().equals(request.getContextPath()+"/cfree/view.do")||
				request.getRequestURI().equals(request.getContextPath()+"/qna/list.do")||
				request.getRequestURI().equals(request.getContextPath()+"/Location/seoul.do")||
				request.getRequestURI().equals(request.getContextPath()+"/Location/gangbook.do")||
				request.getRequestURI().equals(request.getContextPath()+"/Location/gyeonggi.do")||
				request.getRequestURI().equals(request.getContextPath()+"/Location/yongin.do")||
				request.getRequestURI().equals(request.getContextPath()+"/home.do")||
				request.getRequestURI().equals(request.getContextPath()+"/search/list.do")
				){
			return true;
		}
	
		// pass through when access login.do, join.do
	if(request.getRequestURI().equals(request.getContextPath()+"/login.do") 	)
				{
			if(id != null){
				response.sendRedirect(request.getContextPath() + "/home.do");
				return true;
			} else {
				return true;
			}
		}
		//
		// where other pages
	
	if(id == null){
		response.sendRedirect(request.getContextPath() + "/loginCheck.jsp");
		return false;
	} else {
		return true;
		}
	}	
	



	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {			

	}		
}
