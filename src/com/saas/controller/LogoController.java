package com.saas.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.saas.po.UserInfo;



@Controller
public class LogoController {
	
	
	@RequestMapping(value="/returnindex.htm")
	public String returnIndex(UserInfo user,Model model){
		return "index";
	}
	
	
	@RequestMapping(value="/returnlogo.htm")
	public String returnlogo(UserInfo user,Model model){
		return "logo";
	}
	
	/**
	 * 图片上传
	 * @throws IOException 
	 */
	@RequestMapping(value="/logoupload.htm")
	 public String upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, ModelMap model) throws IOException {  
		 
		      System.out.println("开始");  
		        String path = request.getSession().getServletContext().getRealPath("/images/");  
		        String fileName = file.getOriginalFilename();
		        System.out.println(ClassLoader.getSystemResources("").toString());
		//        String fileName = new Date().getTime()+".jpg";  
	        System.out.println(path);  
	        File targetFile = new File(path, fileName);  
		        if(!targetFile.exists()){  
		            targetFile.mkdirs();  
		        }  
		  
		        //保存  
		        try {  
		            file.transferTo(targetFile);  
		        } catch (Exception e) {  
		            e.printStackTrace();  
		       }  
		        model.addAttribute("fileUrl", request.getContextPath()+"/images/"+fileName);  
		  
		        return "forward:/logoview.htm";  
		    } 

	@RequestMapping(value="/logoview.htm")
	public String delete(UserInfo user,Model model){
		return "index";
	}
	@RequestMapping(value="/logo.htm")
	public String logo(){
		return "logo";
	}
}
