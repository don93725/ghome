package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.members.model.MembersVO;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		MembersVO user = (MembersVO) req.getSession().getAttribute("user");
		if (user == null) {
			String location = req.getRequestURI();
			String queryString = req.getQueryString();
			if (queryString != null) {
				location = location + "?" + queryString;
			}
			req.getSession().setAttribute("location", location);
			req.getSession().setAttribute("referer", req.getHeader("Referer"));
			res.sendRedirect(req.getContextPath() + "/front_end/login.jsp");
			return;
		} else if(!"3".equals(user.getMem_rank())){				
			res.sendRedirect(req.getContextPath() + "/index.jsp");
		} else{
			chain.doFilter(request, response);			
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
