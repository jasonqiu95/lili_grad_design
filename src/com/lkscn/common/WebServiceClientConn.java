package com.lkscn.common;

import javax.xml.namespace.QName;

import org.apache.axis2.AxisFault;
import org.apache.axis2.addressing.EndpointReference;
import org.apache.axis2.client.Options;
import org.apache.axis2.rpc.client.RPCServiceClient;
import org.apache.axis2.transport.http.HTTPConstants;

/**
 * 接口服务链接设置
 * 
 * @author hub
 * @version 1.1
 */
//webservice client不应该写成单例模式
public class WebServiceClientConn 
{
	private static RPCServiceClient serviceClient;
	public static RPCServiceClient getServiceClient() 
	{
		RPCServiceClient serviceClient = null;
		try 
		{
			serviceClient = new RPCServiceClient();
			Options options = serviceClient.getOptions();
			options.setProperty(HTTPConstants.SO_TIMEOUT, new Integer(600000));
			options.setProperty(HTTPConstants.CONNECTION_TIMEOUT, new Integer(600000));
			EndpointReference targetEPR = new EndpointReference(
			 "http://www.cssn.net.cn/services/cniswsbase?wsdl");
			options.setTo(targetEPR);
		} 
		catch (AxisFault e) 
		{
			e.printStackTrace();
		}
		return serviceClient;
	}

	public static QName getTheMethod(String method) 
	{
		return new QName("http://ws.cssn.cnis.gov.cn", method);
	}
}
