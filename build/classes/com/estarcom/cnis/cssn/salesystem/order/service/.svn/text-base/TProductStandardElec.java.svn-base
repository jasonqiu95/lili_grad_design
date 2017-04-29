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
public class TProductStandardElec
    extends AbstractTProductStandardElec
    implements Serializable
{
	private TProductStandardElec _tpartorg;

	public TProductStandardElec() {
		super();
		
	}

	public TProductStandardElec(Long id) {
		super(id);
		
	}

	public TProductStandardElec get_tpartorg() {
		return _tpartorg;
	}

	public void set_tpartorg(TProductStandardElec _tpartorg) {
		this._tpartorg = _tpartorg;
	}

	public TProductStandardElec(Long id, TProductStandardElec _tpartorg) {
		super(id);
		this._tpartorg = _tpartorg;
	}

	public boolean equals(Object obj){
		
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TProductStandardElec other = (TProductStandardElec) obj;
		if (this.getFuncType() == null) {
			if (other.getFuncType() != null)
				return false;
		} else if (!this.getFuncType().equals(other.getFuncType()))
			return false;
		if (this.getTransType() == null) {
			if (other.getTransType()!= null)
				return false;
		} else if (!this.getTransType().equals(other.getTransType()))
			return false;
		if (this.getLanguage() == null) {
			if (other.getLanguage() != null)
				return false;
		} else if (!this.getLanguage().equals(other.getLanguage()))
			return false;
		
		return true;
	}
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((this.getFuncType()== null) ? 0 : this.getFuncType().hashCode());
		result = prime * result
				+ ((this.getTransType() == null) ? 0 : this.getTransType().hashCode());
		result = prime * result
				+ ((this.getLanguage() == null) ? 0 : this.getLanguage().hashCode());
		
		return result;
	}
	
	
}
