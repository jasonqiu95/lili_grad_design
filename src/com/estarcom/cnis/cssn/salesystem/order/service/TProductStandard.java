/*
 * Created Thu Nov 09 16:49:35 CST 2006 by MyEclipse Hibernate Tool.
 */ 
package com.estarcom.cnis.cssn.salesystem.order.service;

import java.io.Serializable;

/**
 * A class that represents a row in the 'T_NV_ORDER_ITEM' table. 
 * This class may be customized as it is never re-generated 
 * after being created.
 */
public class TProductStandard
    extends AbstractTProductStandard
    implements Serializable
{
	private TProductStandard _tpartorg;

	public TProductStandard() {
		super();
		
	}

	public TProductStandard(Long id) {
		super(id);
		
	}

	public TProductStandard get_tpartorg() {
		return _tpartorg;
	}

	public void set_tpartorg(TProductStandard _tpartorg) {
		this._tpartorg = _tpartorg;
	}

	public TProductStandard(Long id, TProductStandard _tpartorg) {
		super(id);
		this._tpartorg = _tpartorg;
	}

	
	
	
}
