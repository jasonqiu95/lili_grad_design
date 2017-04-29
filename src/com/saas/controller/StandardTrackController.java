package com.saas.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.namespace.QName;

import org.apache.axis2.rpc.client.RPCServiceClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import cn.gov.cnis.cssn.wssort.QueryResult;
import cn.gov.cnis.cssn.wssort.StandardPush;
import cn.gov.cnis.cssn.wssort.StandardTracking;

import com.lkscn.common.Constant;
import com.lkscn.common.WebServiceClientConn;
import com.saas.Interface.UseInterface;
import com.saas.common.Query;
import com.saas.po.UserInfo;
import com.saas.service.UserInfoService;
import com.util.JsonUtil;



@Controller
@RequestMapping(value="/mystandard")
public class StandardTrackController {
	
	UserInfo user ;

	@Autowired
	private UserInfoService userInfoService;

	@RequestMapping(value="/track.htm")
	public ModelAndView track(HttpServletRequest request,HttpSession session) throws Exception {
		UseInterface get = new UseInterface();
		user=(UserInfo) session.getAttribute("user");
		System.out.println("aaa"+user.getreal_account()+"0000");
		StandardTracking res1[]=get.getUserStandardTracking(user.getreal_account());
		StandardPush res2[]=get.getUserStandardPushList(user.getreal_account());
		ModelAndView mav = new ModelAndView();
		mav.addObject("rest",res1);
		mav.addObject("resp",res2);
		mav.setViewName("mystandard/standardTracking");
		return mav;
	}
	
	
	@RequestMapping(value="/trackbt.htm")
	public ModelAndView trackbt(HttpServletRequest request,HttpSession session) throws Exception {
		UseInterface get = new UseInterface();
		user=(UserInfo) session.getAttribute("user");
		System.out.println("aaa"+user.getreal_account()+"0000");
		StandardTracking res1[]=get.getUserStandardTracking(user.getreal_account());
		ModelAndView mav = new ModelAndView();
		mav.addObject("rest",res1);
		mav.setViewName("mystandard/standardTracking");
		return mav;
	}
	
	@RequestMapping(value="/tracking.htm")
	public ModelAndView tracking(HttpServletRequest request,HttpSession session,String a001) throws Exception {
		UseInterface get = new UseInterface();
		ModelAndView mav = new ModelAndView();
		System.out.println("aaa"+a001);
		user=(UserInfo) session.getAttribute("user");
		if(user==null)
		{
			RedirectView view = new RedirectView(request.getContextPath()+"/logining.htm?from=default");
			mav.setView(view);
			return mav;
		}
		String useraccount=user.getreal_account();
		System.out.println("aaa"+useraccount+"0000");
		boolean b=get.setUserTracking(useraccount, a001);
		if(b==true)
			System.out.println("跟踪成功");
		else
			System.out.println("跟踪失败");
		mav.addObject("boo", b);
		mav.setViewName("search/add_push");
		return mav;
	}
	
	
	@RequestMapping(value="/setpushflag.htm")
	public ModelAndView setpushflag(HttpServletRequest request,HttpSession session,String id) throws Exception {
		System.out.println("aaa"+id+"0000");
		UseInterface get = new UseInterface();
		user=(UserInfo) session.getAttribute("user");
		System.out.println("aaaca"+user.getreal_account()+"0000");
		StandardTracking res1[]=get.getUserStandardTracking(user.getreal_account());
		StandardPush res2[]=get.getUserStandardPushList(user.getreal_account());
		get.setUserStandardPushFlag(user.getreal_account(),id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("rest",res1);
		mav.addObject("resp",res2);
		mav.setViewName("mystandard/standardTracking");
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
	public ModelAndView unLogin(HttpServletRequest request,HttpSession session) throws Exception {
		
		
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("user");
		mav.setViewName("indexed");
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
