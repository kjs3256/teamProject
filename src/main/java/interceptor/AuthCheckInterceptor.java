package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import member.service.AuthInfo;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)throws Exception {
		HttpSession session = request.getSession();
		if(session != null) {
			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
			if(authInfo != null) {
				return true;
			}
		}
		response.sendRedirect(request.getContextPath()+"/authCheck");
		return false;
	}
}
