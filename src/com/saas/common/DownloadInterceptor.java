package com.saas.common;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.saas.po.DownloadInfo;
import com.saas.po.UserInfo;
import com.saas.service.DownloadInfoService;


/**
 * 登录拦截器
 * 
 * @author zhao
 *
 */
public class DownloadInterceptor implements HandlerInterceptor{

	@Autowired
	DownloadInfoService downloadservice=null;
	
	/**
	 * 
	 * 在执行handler前执行的
	 * 
	 * 判断是否可以下载
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		

		HttpSession session = request.getSession();
		UserInfo user = (UserInfo) session.getAttribute("user");
		String tenanturl=(String) session.getAttribute("tenanturl");
		
		if(request.getServletPath().equals("/mystandard/track.htm"))
		{
					if(user==null)
					{
						request.getRequestDispatcher("/logining.htm?from=track").forward(request, response);
						return false;
					}
					else {
						return true;
					}
		}
		else
		{
		
			boolean a=downloadservice.downloadRequest(tenanturl);
			/*System.out.println(a);*/
			if(a==true){
				
				DownloadInfo dlinfo = new DownloadInfo();
				dlinfo.setName(user.getName());
				dlinfo.setTime(new Date(new java.util.Date().getTime()));
				downloadservice.add(dlinfo); 
				return true;
			}
		
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			
			return false;
		}
	}

	/**
	 * 在执行handler 返回modelandview之前来执行的
	 * 
	 * 如果需要向页面提供公用数据或者配置一些视图信息，使用此方法实现
	 * 
	 * 从modelandview 入手
	 */
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("HandlerInterceptor1...afterCompletion");
		
	}

	/**
	 * 
	 * 在执行handler之后执行
	 * 
	 * 做系统的统一异常处理，进行方法执行的性能监控，在preHandle设置一个时间点，在afterCompletion设置一个时间点，两个时间点的差就是执行时长
	 * 
	 * 实现系统的统一日志
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("HandlerInterceptor1...afterCompletion");
		
	}

}
