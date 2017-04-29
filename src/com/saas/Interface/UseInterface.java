package com.saas.Interface;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.namespace.QName;

import org.apache.axis2.AxisFault;
import org.apache.axis2.rpc.client.RPCServiceClient;

import cn.gov.cnis.cssn.wssort.Ccs;
import cn.gov.cnis.cssn.wssort.Ics;
import cn.gov.cnis.cssn.wssort.QueryResult;
import cn.gov.cnis.cssn.wssort.StandardPush;
import cn.gov.cnis.cssn.wssort.StandardSort;
import cn.gov.cnis.cssn.wssort.StandardTracking;

import com.lkscn.common.Constant;
import com.lkscn.common.WebServiceClientConn;
import com.saas.po.UserInfo;
/*import com.service.search.Query;*/
import com.util.JsonUtil;
public class UseInterface {
//	public static void main(String[] args)  throws AxisFault{
//	UseInterface get = new UseInterface();
//	StandardTracking[] result;
//	result=get.getUserStandardTracking("541726449@qq.com");
//	System.out.println(get.getlength());		
//	}
	private int length=0;
	public Ccs[] getCcsList(String id) throws AxisFault{
		Ccs[] result;
		if(id==null)
			id="";
		RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
		QName opAddEntry = WebServiceClientConn.getTheMethod("getCcsList");
		Object[] opaddentryArgs = new Object[] {Constant.ORGLOGINNAME, Constant.ORGPASSWD, Constant.UKEYID,
				Constant.ORGCODE,id};
		Class[] classes = new Class[] { Ccs[].class };
		result = (Ccs[]) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0];
		return result;
		
	}
	public StandardTracking[] getUserStandardTracking (String name) throws AxisFault{
		StandardTracking[] result;
		RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
		QName opAddEntry = WebServiceClientConn.getTheMethod("getUserStandardTracking");
		Object[] opaddentryArgs = new Object[] {Constant.ORGLOGINNAME, Constant.ORGPASSWD, Constant.UKEYID,
				Constant.ORGCODE,name,"","100"};
		Class[] classes = new Class[] { StandardTracking[].class };
		result = (StandardTracking[]) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0];
		return result;
		
	}
	public boolean setUserTracking (String name,String a001) throws AxisFault{
		String result;
		RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
		QName opAddEntry = WebServiceClientConn.getTheMethod("setUserTracking");
		Object[] opaddentryArgs = new Object[] {Constant.ORGLOGINNAME, Constant.ORGPASSWD, Constant.UKEYID,
				Constant.ORGCODE,name,a001};
		Class[] classes = new Class[] { String.class };
		result = (String) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0];
		if(result.equals("1"))
		{
			return true;
		}
		else {
			return false;
		}
		
	}
	public Ics[] getIcsList(String id) throws AxisFault{
		Ics[] result;
		String name1="zhaodedong";
		if(id==null)
			id="";
		RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
		QName opAddEntry = WebServiceClientConn.getTheMethod("getIcsList");
		Object[] opaddentryArgs = new Object[] {Constant.ORGLOGINNAME, Constant.ORGPASSWD, Constant.UKEYID,
				Constant.ORGCODE,id};
		Class[] classes = new Class[] { Ics[].class };
		result = (Ics[]) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0];
		return result;
		
	}
	public StandardSort[] getStandardSortList(String domain) throws AxisFault{
		StandardSort[] result;
		RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
		QName opAddEntry = WebServiceClientConn.getTheMethod("getStandardSortList");
		Object[] opaddentryArgs = new Object[] {Constant.ORGLOGINNAME, Constant.ORGPASSWD, Constant.UKEYID,
				Constant.ORGCODE,"",domain};
		Class[] classes = new Class[] {StandardSort[].class };
		result = (StandardSort[]) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0];
		return result;
		
	}
	public boolean register(UserInfo user) throws AxisFault{
		String flag;
		RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
		QName opAddEntry = WebServiceClientConn.getTheMethod("register");
		Object[] opaddentryArgs = new Object[] {Constant.ORGLOGINNAME, Constant.ORGPASSWD, Constant.UKEYID,
				Constant.ORGCODE,user.getreal_account(),user.getPassword(),user.getName(),user.getTenant_id()};
		Class[] classes = new Class[] {String.class };
		flag =(String) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0];
		if(flag.equals("1"))
			return true;
		else
			return false;

		
	}
	public StandardPush[] getUserStandardPushList (String name) throws AxisFault{
		StandardPush[] result;
		RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
		QName opAddEntry = WebServiceClientConn.getTheMethod("getUserStandardPushList");
		Object[] opaddentryArgs = new Object[] {Constant.ORGLOGINNAME, Constant.ORGPASSWD, Constant.UKEYID,
				Constant.ORGCODE,name,""};
		Class[] classes = new Class[] { StandardPush[].class };
		result = (StandardPush[]) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0];
		return result;
		
	}
	public boolean setUserStandardPushFlag (String username,String id) throws AxisFault{
		StandardPush[] result;
		RPCServiceClient serviceClient = WebServiceClientConn.getServiceClient();
		QName opAddEntry = WebServiceClientConn.getTheMethod("setUserStandardPushFlag");
		Object[] opaddentryArgs = new Object[] {Constant.ORGLOGINNAME, Constant.ORGPASSWD, Constant.UKEYID,
				Constant.ORGCODE,username,id};
		Class[] classes = new Class[] { StandardPush[].class };
		result = (StandardPush[]) serviceClient.invokeBlocking(opAddEntry, opaddentryArgs, classes)[0];
			return true;
	
	}
	}

