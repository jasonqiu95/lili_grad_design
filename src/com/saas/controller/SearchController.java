package com.saas.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.namespace.QName;

import org.apache.axiom.om.OMElement;
import org.apache.axis2.rpc.client.RPCServiceClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Decoder;
import cn.gov.cnis.cssn.wssort.QueryResult;
import cn.gov.cnis.cssn.wssort.StandardSort;

import com.lkscn.common.Constant;
import com.lkscn.common.WebServiceClientConn;
import com.saas.Interface.UseInterface;
import com.saas.common.Query;
import com.saas.po.TenantInfo;
import com.saas.service.TenantInfoService;
import com.util.JsonUtil;


@Controller

@RequestMapping(value="/search")
public class SearchController {
		
	@Autowired
	private TenantInfoService tenantInfoService;
	@RequestMapping(value="/base.htm")
	public ModelAndView search(HttpServletRequest request,HttpSession session,String qs) throws Exception {
		ModelAndView mav = new ModelAndView();
		String keyword="",orderBy="",ordering="",iPageIndex="1",iPageSize="10";
		Map<String,String> paras=new HashMap<String,String>();
		System.out.println("qs:"+qs);
		/*keyword = new String(request.getParameter("keyword").getBytes("ISO-8859-1"),"utf-8");*/
		keyword =request.getParameter("keyword");
		System.out.println("keyword:"+keyword+"end");
		paras.put("keyword", keyword);
		System.out.print(keyword);
		if(request.getParameter("orderBy")!=null)
		{
			orderBy=request.getParameter("orderBy");
			paras.put("orderBy", orderBy);
		}
		if(request.getParameter("ordering")!=null)
		{
			ordering=request.getParameter("ordering");
			paras.put("ordering", ordering);
		}
		if(request.getParameter("iPageIndex")!=null)
		{
			iPageIndex=request.getParameter("iPageIndex");
			paras.put("iPageIndex",iPageIndex);
		}
		if(request.getParameter("iPageSize")!=null)
		{
			iPageSize=request.getParameter("iPageSize");
			if(!iPageSize.equals("10"))
				paras.put("iPageSize",iPageSize);
		}
		Query q=new Query();
		q.setQueryCondition(paras);
		
		QueryResult result;
		RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
		QName opAddEntry = WebServiceClientConn.getTheMethod("simpleSearch");
		Object[] opaddentryArgs = new Object[] { Constant.ORGLOGINNAME, Constant.ORGPASSWD, Constant.UKEYID,
				Constant.ORGCODE, keyword, orderBy, ordering, iPageIndex, iPageSize };
		Class[] classes = new Class[] { QueryResult.class };
		result = (QueryResult) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0];
		System.out.println("查询完毕！");
		if (result != null) 
		{
			
			q.setTotalPage(result.getTotalPage());

			q.setRecordCount(result.getRecordCount());
			q.setPageIndex(result.getPageIndex());
			String results = result.getResultStr();
			if (results != null) 
			{
				List resultstr = JsonUtil.json2bean(results, ArrayList.class);
				q.setResultList(resultstr);
			}
			//将查询条件也一并返回给前端页面
			request.setAttribute("Query", q);
		}
		
		mav.setViewName("/search/search_base_result");
		return mav;
	}
	
	@RequestMapping(value="/resultbuttom.htm")
	public ModelAndView rt(HttpServletRequest request,HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		Query q = (Query)request.getAttribute("Query");
		String aString=q.getQueryStr();
		System.out.println("buttom:"+aString);
		mav.setViewName("/search/search_base_resultbuttom");
		return mav;
	}
	
	@RequestMapping(value="/select_org_en.htm")
	
	public ModelAndView rtselect_org_en(HttpServletRequest request,HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/search/select_org_en");
		return mav;
	}
	@RequestMapping(value="/select_org_cn.htm")
	public ModelAndView rtselect_org_cn(HttpServletRequest request,HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/search/select_org_cn");
		return mav;
	}
	@RequestMapping(value="/select_org.htm")
	public ModelAndView rtselect_org(HttpServletRequest request,HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/search/select_org");
		return mav;
	}
//	@RequestMapping(value="/search_no_login.htm")
//	public ModelAndView searchNoLogin(HttpServletRequest request,HttpSession session) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		String keyword="",orderBy="",ordering="",iPageIndex="1",iPageSize="10";
//		Map<String,String> paras=new HashMap<String,String>();
//		keyword=request.getParameter("keyword");
//		paras.put("keyword", keyword);
//		if(request.getParameter("orderBy")!=null)
//		{
//			orderBy=request.getParameter("orderBy");
//			paras.put("orderBy", orderBy);
//		}
//		if(request.getParameter("ordering")!=null)
//		{
//			ordering=request.getParameter("ordering");
//			paras.put("ordering", ordering);
//		}
//		if(request.getParameter("iPageIndex")!=null)
//		{
//			iPageIndex=request.getParameter("iPageIndex");
//			paras.put("iPageIndex",iPageIndex);
//		}
//		if(request.getParameter("iPageSize")!=null)
//		{
//			iPageSize=request.getParameter("iPageSize");
//			if(!iPageSize.equals("10"))
//				paras.put("iPageSize",iPageSize);
//		}
//		Query q=new Query();
//		q.setQueryCondition(paras);
//		
//		QueryResult result;
//		RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
//		QName opAddEntry = WebServiceClientConn.getTheMethod("simpleSearch");
//		Object[] opaddentryArgs = new Object[] { Constant.ORGLOGINNAME, Constant.ORGPASSWD, Constant.UKEYID,
//				Constant.ORGCODE, keyword, orderBy, ordering, iPageIndex, iPageSize };
//		Class[] classes = new Class[] { QueryResult.class };
//		result = (QueryResult) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0];
//		System.out.println("查询完毕！");
//		if (result != null) 
//		{
//			q.setTotalPage(result.getTotalPage());
//			q.setRecordCount(result.getRecordCount());
//			q.setPageIndex(result.getPageIndex());
//			String results = result.getResultStr();
//			if (results != null) 
//			{
//				List resultstr = JsonUtil.json2bean(results, ArrayList.class);
//				q.setResultList(resultstr);
//			}
//			//将查询条件也一并返回给前端页面
//			request.setAttribute("Query", q);
//		}
//		
//		mav.setViewName("/search/search_base_result_no_login");
//		return mav;
//	}
	
	@RequestMapping(value="/download.htm")
	protected  void download(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception 
	{
			//文件下载到web根目录的temp目录下
//			String webPath=request.getSession().getServletContext().getRealPath("/");
//			String path="temp/";
			String a001=request.getParameter("a001");
			String a100=request.getParameter("a100");
			String fileName=request.getParameter("fileName");
			String tenanturl=(String) session.getAttribute("tenanturl");
			RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
			// 调用指定方法
			QName opAddEntry = WebServiceClientConn.getTheMethod("getElecFileByDown");
			Object[] opaddentryArgs = new Object[] { Constant.ORGLOGINNAME,Constant.ORGPASSWD, Constant.UKEYID, Constant.ORGCODE,Constant.USERLOGINNAME, 
					a001, a100, fileName };
			Class[] classes = new Class[] { OMElement.class };
			OMElement element = ((OMElement) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0]);
			if (element != null) 
			{
				String output = null;
				BASE64Decoder base = new BASE64Decoder();
				Iterator<OMElement> iterator = element.getChildElements();
				Iterator innerItr;
				OMElement result = null;
				while (iterator.hasNext()) 
				{
					result = (OMElement) iterator.next();
					innerItr = result.getChildElements();
					while (innerItr.hasNext()) 
					{ // 新增
						OMElement elem = (OMElement) innerItr.next(); // 新增
						output = elem.getText();
					}
				}
				byte[] byteOut = base.decodeBuffer(output);
				System.out.println("下载完毕！");
				//下载次数加1
				TenantInfo tenant=((List<TenantInfo>) tenantInfoService.getTenantbyUrl(tenanturl)).get(0);
				tenant.setusedTimes(1+tenant.getusedTimes());
				tenantInfoService.update(tenant);
				//下面用一种更常用更安全的方法：直接将字节数组写入到response的输出流里
				OutputStream os = response.getOutputStream();//获取输出流
				//设置文件类型，或者res.setContentType( "application/pdf" ); 
				response.setHeader("content-type", "application/pdf");
				//为该文档建议一个文件名。这个建议名称会出现在 Save As 对话框的“文件名”栏中。如果没有指定，则对话框中就会出现 servlet 的名字。
				//将inline换成attachment即可直接下载而不是预览
				response.addHeader("content-disposition", "attachment;filename="+fileName);
				os.write(byteOut);
				os.flush();
				os.close();			
			}
		}

	@RequestMapping(value="/onlineread.htm")
	protected  void onlineread(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			//文件下载到web根目录的temp目录下
//			String webPath=request.getSession().getServletContext().getRealPath("/");
//			String path="temp/";
			String a001=request.getParameter("a001");
			String a100=request.getParameter("a100");
			String fileName=request.getParameter("fileName");

			RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
			// 调用指定方法
			QName opAddEntry = WebServiceClientConn.getTheMethod("getElecFileByBefore");
			Object[] opaddentryArgs = new Object[] { Constant.ORGLOGINNAME,Constant.ORGPASSWD, Constant.UKEYID, Constant.ORGCODE,Constant.USERLOGINNAME, 
					a100, fileName };
			Class[] classes = new Class[] { OMElement.class };
			OMElement element = ((OMElement) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0]);
			if (element != null) 
			{
				String output = null;
				BASE64Decoder base = new BASE64Decoder();
				Iterator<OMElement> iterator = element.getChildElements();
				Iterator innerItr;
				OMElement result = null;
				while (iterator.hasNext()) 
				{
					result = (OMElement) iterator.next();
					innerItr = result.getChildElements();
					while (innerItr.hasNext()) 
					{ // 新增
						OMElement elem = (OMElement) innerItr.next(); // 新增
						output = elem.getText();
					}
				}
				byte[] byteOut = base.decodeBuffer(output);
				System.out.println("下载完毕！");
				
				//下面用一种更常用更安全的方法：直接将字节数组写入到response的输出流里
				OutputStream os = response.getOutputStream();//获取输出流
				//设置文件类型，或者res.setContentType( "application/pdf" ); 
				response.setHeader("content-type", "application/pdf");
				//为该文档建议一个文件名。这个建议名称会出现在 Save As 对话框的“文件名”栏中。如果没有指定，则对话框中就会出现 servlet 的名字。
				//将inline换成attachment即可直接下载而不是预览
				response.addHeader("content-disposition", "inline;filename="+fileName);
				os.write(byteOut);
				os.flush();
				os.close();			
			}
		}
	
	@RequestMapping(value="/advanced.htm")
	public ModelAndView advanced(HttpServletRequest request,HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
				String keyword="",orderBy="",ordering="",iPageIndex="1",iPageSize="10",standardId="",adopt="",pubYearBegin="",pubYearEnd="",standardStatus="";
				String[] standardSort=null;
				String standardSorts=new String();
				String icsNum="";
				String ccsNum="";
				Map<String,String> paras=new HashMap<String,String>();
				/*keyword=request.getParameter("keyword");*/
				
				UseInterface u=new UseInterface();
				if(request.getParameter("keyword")!=null)
				{
					/*keyword = new String(request.getParameter("keyword").getBytes("ISO-8859-1"),"utf-8");*/
					keyword=request.getParameter("keyword");
					paras.put("keyword", keyword);
					System.out.println("k:"+keyword+"k");
				}
				if(request.getParameter("literature_id")!=null)
				{
					standardId=request.getParameter("literature_id");
					paras.put("standardId",standardId);
					System.out.println("si:"+standardId+"si");
				}
				if(request.getParameter("relation")!=null)
				{
					adopt=request.getParameter("relation");
					paras.put("relation",adopt);
					System.out.println("adopt:"+adopt+"adopt");
				}
				if(request.getParameter("publYear1")!=null)
				{
					pubYearBegin=request.getParameter("publYear1");
					paras.put("publYear1",pubYearBegin);
					System.out.println("pubYearBegin:"+pubYearBegin+"pubYearBegin");
					
				}
				if(request.getParameter("publYear2")!=null)
				{
					pubYearEnd=request.getParameter("publYear2");
					paras.put("publYear2",pubYearEnd);
					
				}
				if(request.getParameter("orderBy")!=null)
				{
					orderBy=request.getParameter("orderBy");
					paras.put("orderBy", orderBy);
					System.out.println("orderBy:"+orderBy+"orderBy");
				}
				if(request.getParameter("bzstatus")!=null)
				{
					standardStatus=request.getParameter("bzstatus");
					
					paras.put("bzstatus", standardStatus);
					System.out.println("bzstatus:"+standardStatus+"bzstatus");

				}
				if(request.getParameter("iPageIndex")!=null)
				{
					iPageIndex=request.getParameter("iPageIndex");
					paras.put("iPageIndex",iPageIndex);
				}
				if(request.getParameter("iPageSize")!=null)
				{
					iPageSize=request.getParameter("iPageSize");
					if(!iPageSize.equals("10"))
						paras.put("iPageSize",iPageSize);
				}
				if(request.getParameter("en_typenum")!=null)
				{
					System.out.println("ics0:"+request.getParameter("en_typenum"));
					/*icsNum=new String(request.getParameter("en_typenum").getBytes("ISO-8859-1"),"utf-8");*/
					icsNum=request.getParameter("en_typenum");
					paras.put("en_typenum",icsNum);
					System.out.println("icsNum:"+icsNum+"icsnum");
				
				}
				if(request.getParameter("cn_typenum")!=null)
				{
					/*ccsNum=new String(request.getParameter("cn_typenum").getBytes("ISO8859-1"),"utf-8");*/
					ccsNum=request.getParameter("cn_typenum");
					paras.put("cn_typenum",ccsNum);
					/*ccsNum="A";*/
				}
				String idomain;
				String isubType;
				String domain_sub=null;
				if(request.getParameter("domain")!=null)
				{
					idomain = request.getParameter("domain");
				    isubType = request.getParameter("stype");

					if(isubType==null)
						domain_sub=idomain;
					else
						domain_sub=idomain+"-"+isubType;
					UseInterface get = new UseInterface();
					StandardSort[] rs=get.getStandardSortList(domain_sub);
					int length=rs.length;
					int i = 0;
					while(i<length){
						if(i==0)
							standardSorts=rs[i].getId();
						else
							standardSorts=standardSorts+" + "+rs[i].getId();
						i++;
					}
					System.out.println("standardSorts"+standardSorts);
					standardSort=standardSorts.split(" \\+ ");
					paras.put("dbtype",standardSorts);
					System.out.println("standardSort"+standardSort[0]+"len"+standardSort.length);
				}
				if(request.getParameter("dbtype")!=null)
				{
					standardSorts=request.getParameter("dbtype");
					paras.put("dbtype",standardSorts);
					standardSort=standardSorts.split(" \\+ ");
					System.out.println("standardSort"+standardSort[0]);
				}
				Query q=new Query();
				q.setQueryCondition(paras);
				
				//执行RPC操作获取查询结果
				QueryResult result;
				RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
				QName opAddEntry = WebServiceClientConn.getTheMethod("advencedSearch");
				Object[] opaddentryArgs = new Object[] { Constant.ORGLOGINNAME, Constant.ORGPASSWD, Constant.UKEYID,
						Constant.ORGCODE, keyword,standardId,standardSort,icsNum,ccsNum,adopt,pubYearBegin,pubYearEnd,standardStatus,orderBy, ordering, iPageIndex, iPageSize };
				Class[] classes = new Class[] { QueryResult.class };
				result = (QueryResult) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0];
				System.out.println("查询完毕！");
				if (result != null) 
				{
					q.setTotalPage(result.getTotalPage());
					System.out.println("tp"+result.getTotalPage());
					q.setRecordCount(result.getRecordCount());
					q.setPageIndex(result.getPageIndex());
					String results = result.getResultStr();
					if (results != null) 
					{
						List resultstr = JsonUtil.json2bean(results, ArrayList.class);
						q.setResultList(resultstr);
					}
					//将查询条件也一并返回给前端页面
					request.setAttribute("Query", q);
				}
			
			mav.setViewName("/search/search_base_result");
			return mav;
		
	}
	
}
