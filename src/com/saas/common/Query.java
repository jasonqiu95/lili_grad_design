package com.saas.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class Query 
{
	private Map<String,String> queryCondition;
	private int PageIndex;
	private int TotalPage;
	private long RecordCount;
	private List ResultList;
	
	public Map<String, String> getQueryCondition() {
		return queryCondition;
	}

	public void setQueryCondition(Map<String, String> queryCondition) {
		this.queryCondition = queryCondition;
	}

	
	public int getPageIndex() {
		return PageIndex;
	}

	public void setPageIndex(int pageIndex) {
		PageIndex = pageIndex;
	}

	public int getTotalPage() {
		return TotalPage;
	}

	public void setTotalPage(int totalPage) {
		TotalPage = totalPage;
	}

	public long getRecordCount() {
		return RecordCount;
	}

	public void setRecordCount(long recordCount) {
		RecordCount = recordCount;
	}

	
	public List getResultList() {
		return ResultList;
	}

	public void setResultList(List resultList) {
		ResultList = resultList;
	}

	public String getQueryStr()
	{
		StringBuffer queryStr = new StringBuffer();
		for(Entry<String, String> entry: queryCondition.entrySet())
		{
			if(!entry.getValue().equals(""))
				queryStr.append("&").append(entry.getKey()+"="+entry.getValue());
		}
		if(queryStr.length()>0)
			queryStr.deleteCharAt(0);
		return queryStr.toString();
	}
	
}
