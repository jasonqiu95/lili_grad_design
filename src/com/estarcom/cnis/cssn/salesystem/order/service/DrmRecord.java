/*
 * Created Thu Nov 09 16:49:35 CST 2006 by MyEclipse Hibernate Tool.
 */ 
package com.estarcom.cnis.cssn.salesystem.order.service;

import java.io.Serializable;
import java.util.Date;

/**
 * A class that represents a row in the 'T_NV_ORDER_ITEM' table. 
 * This class may be customized as it is never re-generated 
 * after being created.
 */
public class DrmRecord
    extends AbstractDrmRecord
    implements Serializable
{
	private DrmRecord _tpartorg;

	public DrmRecord() {
		super();
		
	}

	public DrmRecord(Long id) {
		super(id);
		
	}

	public DrmRecord get_tpartorg() {
		return _tpartorg;
	}

	public void set_tpartorg(DrmRecord _tpartorg) {
		this._tpartorg = _tpartorg;
	}

	public DrmRecord(Long id, DrmRecord _tpartorg) {
		super(id);
		this._tpartorg = _tpartorg;
	}

	
	
	
}
