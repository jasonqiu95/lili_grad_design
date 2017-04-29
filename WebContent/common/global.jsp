<%@ page import="com.estarcom.xbean.*" %>
<%@ page import="com.estarcom.xbean.common.*" %>
<%@ page import="com.estarcom.xbean.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.estar.bizware.lang.Nulls"%>
<!--
<link href="/asserts/css/css1.css" rel="stylesheet" type="text/css">
<link href="/asserts/css/text.css" rel="stylesheet" type="text/css">
<link href="/asserts/css/n_css.css" rel="stylesheet" type="text/css">
-->
<%!
	private CharacterHelp mCharacterHelp = new CharacterHelp();

	private String encodeDBToPage(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,EncodingConstants.DEFAULT_DRIVER_OUT_ENCODING, EncodingConstants.WEB_PAGE_ENCODING );
	}

	private String encodeDBToPage(String value, String dbKey) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,EncodingConstants.DEFAULT_DRIVER_OUT_ENCODING, EncodingConstants.WEB_PAGE_ENCODING );
	}


    // encode the source from file
	private String encodeFileToPage(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,EncodingConstants.FILE_ENCODING, EncodingConstants.WEB_PAGE_ENCODING );
	}


    // encode the string from page to DB
	private String encodePageToDB(String value, String dbKey) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,EncodingConstants.WEB_PAGE_ENCODING,EncodingConstants.DEFAULT_DRIVER_IN_ENCODING );
	}

    // encode the string from page to DB
	private String encodePageToDB(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,EncodingConstants.WEB_PAGE_ENCODING,EncodingConstants.DEFAULT_DRIVER_IN_ENCODING );
	}
    
    //add by Lai 2008-05-28
	private String encodeGetToPage(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,EncodingConstants.WEB_GET_ENCODING,EncodingConstants.WEB_PAGE_ENCODING);
	}

	// encode the string from get method Url to Page
	private String encodeGetToPage(String value, String dbKey) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,EncodingConstants.WEB_GET_ENCODING,EncodingConstants.WEB_PAGE_ENCODING);
	}

	// encode the string from post method Url to Page
	private String encodePostToPage(String value, String dbKey) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,EncodingConstants.WEB_POST_ENCODING,EncodingConstants.WEB_PAGE_ENCODING);
	}

	// encode the string from get method Url to DB
	private String encodeGetToDB(String value, String dbKey) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,EncodingConstants.WEB_GET_ENCODING,EncodingConstants.DEFAULT_DRIVER_IN_ENCODING);
	}


	// encode the string from post method Url to DB
	private String encodePostToDB(String value, String dbKey) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,EncodingConstants.WEB_POST_ENCODING,EncodingConstants.DEFAULT_DRIVER_IN_ENCODING);
	}

	// encode the string from post method Url to Page
	private String encodePostToPage(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,EncodingConstants.WEB_POST_ENCODING,EncodingConstants.WEB_PAGE_ENCODING);
	}

	// encode the string from web server to Page
	private String encodeServerToPage(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,EncodingConstants.WEB_SERVER_ENCODING, EncodingConstants.WEB_PAGE_ENCODING);
	}

	// encode the string from db to web server
	private String encodeDBToServer(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,EncodingConstants.DEFAULT_DRIVER_OUT_ENCODING, EncodingConstants.WEB_SERVER_ENCODING);
	}
	

	// encode the string from Server to db
	private String encodeServerToDB(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value, EncodingConstants.WEB_SERVER_ENCODING, EncodingConstants.DEFAULT_DRIVER_IN_ENCODING);
	}

	// encode the string from Server to db query parameter
	private String encodeServerToDBQuery(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value, EncodingConstants.WEB_SERVER_ENCODING, EncodingConstants.DEFAULT_DRIVER_QUERY_ENCODING);
	}
	
	private String encodePageToPost(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value,com.estarcom.xbean.util.EncodingConstants.WEB_POST_ENCODING, com.estarcom.xbean.util.EncodingConstants.WEB_PAGE_ENCODING );
	}
	
	// encode the string from Get to db query parameter
	private String encodeGetToDBQuery(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value, EncodingConstants.WEB_GET_ENCODING, EncodingConstants.DEFAULT_DRIVER_QUERY_ENCODING);
	}

	// encode the string from Post to db query parameter
	private String encodePostToDBQuery(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value, EncodingConstants.WEB_POST_ENCODING, EncodingConstants.DEFAULT_DRIVER_QUERY_ENCODING);
	}
	
	// encode the string from DB to db query parameter
	private String encodeDBToDBQuery(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value, EncodingConstants.DEFAULT_DRIVER_OUT_ENCODING, EncodingConstants.DEFAULT_DRIVER_QUERY_ENCODING);
	}


	// encode the string from Forum  parameter

	private String encodeXflowInToOut(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value, EncodingConstants.XFLOW_IN_ENCODING, EncodingConstants.XFLOW_OUT_ENCODING);
	}
	
	//encode the String post to mail 
	
	private String encodePostToMail(String value) throws Exception
	{
		return mCharacterHelp.fromEncodeTo(value, EncodingConstants.WEB_POST_ENCODING, EncodingConstants.MAIL_HEADER_ENCODING);
	}
	
   private String parseString16(String aString)
   {
   		int len =aString.length();
   		StringBuffer  temp = new StringBuffer(aString);
   		if ( len>20)
   		{	
   			return aString.substring(0,20);
   		}
   		else
   		{
   			for ( int i=0 ; i<20-len; i++)
   			{
   				temp.append("&nbsp;");
   			}
   			return temp.toString();
      	}
   }
   
   private String parseString8(String aString)
   {
   		int len =aString.length();
   		StringBuffer  temp = new StringBuffer(aString);
   		if ( len>8)
   		{	
   			return aString;
   			//return aString.substring(0,8);
   		}
   		else
   		{
   			for ( int i=0 ; i<8-len; i++)
   			{
   				temp.append("&nbsp;");
   			}
   			return temp.toString();
      	}
   }
    private String convertDate(String year,String month,String day)
    {
        StringBuffer sb = new StringBuffer();
        
        if((year != null) && (!year.equals("")))
        {
          sb.append(year);
          if((month != null) && (!month.equals("")))
          {
            sb.append("-");
            sb.append(month);
            if((day != null) && (!day.equals("")))
            {
              sb.append("-");
              sb.append(day);
            }
          }
        }else
        {
        	return null;
        }
				return sb.toString();
      
    }    
    


%>

<%
//	session.setAttribute("2sc_RequestURI",request.getRequestURI());
%>

