package com.saas.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import cn.gov.cnis.cssn.wssort.StandardTracking;

import com.saas.Interface.UseInterface;
import com.saas.po.TenantInfo;
import com.saas.service.TenantInfoService;



@Controller
public class TenantInfoController {
	
	TenantInfo tenant ;

	@Autowired
	private TenantInfoService tenantInfoService;
	@RequestMapping("/loginadmin.htm")
	public ModelAndView userLogin(HttpServletRequest request,HttpServletResponse response,HttpSession session,@RequestParam("from") String para) throws Exception {
		String account = request.getParameter("username");
		String password = request.getParameter("password");
		String tenantname=(String) session.getAttribute("tenantname");
		String domain=(String) session.getAttribute("tenanturl");
		System.out.println("domain is " + domain);
		tenant=((List<TenantInfo>) tenantInfoService.getTenantbyUrl(domain)).get(0);
		if(para==null)
			para="default";
		ModelAndView mav = new ModelAndView();
		if(tenant.getAccount().equals(account)&&tenant.getPassword().equals(password))
		{
			System.out.println("aaa"+tenant.getAccount()+"0000");
			session.setAttribute("admin", tenant);
		}else
		{
			RedirectView view = new RedirectView("logining.htm?from=adminwronglogin");
			mav.setView(view);
			return mav;
		}

			mav.setViewName("logo");
		return mav;
	}
	@RequestMapping("/unloginadmin.htm")
	public ModelAndView unLogin(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {
		
		
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("admin");
		/*response.sendRedirect("index.jsp");*/
		
		mav.setViewName("index");
		return mav;
	}
	
}
