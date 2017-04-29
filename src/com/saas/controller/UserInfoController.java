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

import cn.gov.cnis.cssn.wssort.StandardPush;
import cn.gov.cnis.cssn.wssort.StandardTracking;

import com.saas.Interface.UseInterface;
import com.saas.po.UserInfo;
import com.saas.po.TenantInfo;
import com.saas.service.TenantInfoService;
import com.saas.service.UserInfoService;



@Controller
public class UserInfoController {
	
	UserInfo user ;

	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	private TenantInfoService tenantInfoService;

	
	@RequestMapping(value="/logining.htm")
	public String re(UserInfo user,Model model,@RequestParam("from") String para,HttpSession session,HttpServletRequest request,String url) throws Exception{
		if(session.getAttribute("tenanturl")==null)
		{
			 String tenanturl=null;
			 String tenantname="";
			
			String ServerName =  request.getServerName();
			 if(ServerName.contains("."))
			 {
				 tenanturl=ServerName.substring(0,ServerName.indexOf("."));
			 }
			 else
				 tenanturl="default";
			 session.setAttribute("tenanturl", tenanturl);
			 System.out.println("t:"+tenanturl);
			 List<TenantInfo> list= tenantInfoService.getTenantbyUrl(tenanturl);
			 TenantInfo tennatInfo=list.get(0);
			 System.out.println("t:"+tennatInfo.getAccount());
			 session.setAttribute("tenantaccount", tennatInfo.getAccount());
			 session.setAttribute("tenantname", tennatInfo.getName());
		}
		if(para.contains("admin"))
			return "loginadmin";
		else if(para.contains("search"))
		{
			model.addAttribute("url", url);
		}
		return "login";
	}
	/**
	 * 登录
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/register.htm")
	public ModelAndView register(HttpServletRequest request,HttpServletResponse response,HttpSession session,@RequestParam("from") String para) throws Exception {
		UserInfo usera=new UserInfo();
		String tenantname=(String)session.getAttribute("tenantname");
		String tenanturl=(String)session.getAttribute("tenanturl");
		ModelAndView mav = new ModelAndView();
		
		String account = request.getParameter("username");
		if(userInfoService.checkUserName(account,tenantname))
		{
			RedirectView view = new RedirectView("logining.htm?from=wrongrname");
			mav.setView(view);
			return mav;
		}
		String realname = new String(request.getParameter("realname").getBytes("ISO-8859-1"),"utf-8");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		usera.setTenant_id(tenantname);
		usera.setAccount(account);
		usera.setavailability(true);
		usera.setName(realname);
		usera.setPassword(password);
		usera.setreal_account(tenanturl+account);
		System.out.println("realname:"+realname);
		System.out.println("user:"+usera);
		userInfoService.add(usera);
		UseInterface u = new UseInterface();
		if(u.register(usera))
			;
		else {
			userInfoService.delete(usera);
			RedirectView view = new RedirectView("logining.htm?from=wrongrname");
			mav.setView(view);
			return mav;
		}
		if(para==null)
			para="default";
		RedirectView view = new RedirectView("logining.htm?from=registersuccess");
		mav.setView(view);
		return mav;
	}
	
	/**
	 * 登录
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login.htm")
	public ModelAndView userLogin(HttpServletRequest request,HttpServletResponse response,HttpSession session,@RequestParam("from") String para,Model model,String url) throws Exception {
		String account = request.getParameter("username");
		String password = request.getParameter("password");
		String tenantname=(String) session.getAttribute("tenantname");

		if(para==null)
			para="default";
		ModelAndView mav = new ModelAndView();
		user = userInfoService.login(account, password,tenantname);
		if(user != null)
		{
			session.setAttribute("user", user);
		}else
		{
			RedirectView view = new RedirectView("logining.htm?from=wronglogin");
			mav.setView(view);
			return mav;
		}
		if(para.equals("default"))
		{
			mav.setViewName("index");
		}
		else if(para.equals("search"))
		{
			System.out.println("ab"+url);
			url=url.replace("standard_detailbuttom", "standard_detail");
			System.out.println("ac"+url);
			response.sendRedirect(url);
		}
		else if(para.equals("track"))
		{
						
			UseInterface get = new UseInterface();
			StandardTracking res1[]=get.getUserStandardTracking(user.getreal_account());
			StandardPush res2[]=get.getUserStandardPushList(user.getreal_account());
			mav.addObject("rest",res1);
			mav.addObject("resp",res2);
			mav.setViewName("mystandard/standardTracking");
		}
		else {
			mav.setViewName("index");
		}
		return mav;
	}
	
	/**
	 * 注销
	 * @param 
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/unlogin.htm")
	public ModelAndView unLogin(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {
		
	
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("user");
		/*response.sendRedirect("index.jsp");*/
		
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping("/index.htm")
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		/*response.sendRedirect("index.jsp");*/
		
		mav.setViewName("index");
		return mav; 
	
	}
	
	
//	@RequestMapping(value="/userlist.htm")
//	public String list(Model model){
//		
//		List<UserInfo> userlist = null;
//		try {
//			userlist = userInfoService.getAllUser();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		model.addAttribute("list",userlist);
//		
//		return "user_list";
//	}
//
//	@RequestMapping(value="/useradd.htm")
//	public String add(UserInfo user,Model model){
//		try {
//			userInfoService.add(user);
//			model.addAttribute("info", "成功");
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("info", "失败");			
//		}
//				
//		return "user_info";
//	}
//	
//
//	
//
//	@RequestMapping(value="/userload.htm")
//	public String loadupdate(Integer userId,Model model){
//		try {
//			UserInfo user = userInfoService.getUser(userId);
//			model.addAttribute("user", user);
//		} catch (Exception e) {
//			e.printStackTrace();	
//		}
//				
//		return "user_update";
//	}
//	
//
//	@RequestMapping(value="/userupdate.htm")
//	public String update(UserInfo user,Model model){
//		try {
//			userInfoService.update(user);
//			model.addAttribute("info", "成功");
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("info", "失败");			
//		}
//				
//		return "user_info";
//	}
//	
//
//	@RequestMapping(value="/userdelete.htm")
//	public String delete(UserInfo user,Model model){
//		try {
//			userInfoService.delete(user);
//			model.addAttribute("info", "成功");
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("info", "失败");			
//		}
//				
//		return "user_info";
//	}
	
}
