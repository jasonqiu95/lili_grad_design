package com.saas.Interface;

import org.apache.axis2.AxisFault;

public class itest {

	public static void main(String[] args) throws AxisFault {
		UseInterface get = new UseInterface();
		boolean aString=get.setUserStandardPushFlag("defaultbuaapyj","10701205");
		// TODO Auto-generated method stub

	}

}
