package cn.gov.cnis.cssn.wssort;

/**
 * TSvUserFieldConf generated by MyEclipse Persistence Tools
 */

public class TSvUserFieldConf implements java.io.Serializable {

	// Fields

	private Long id;

	private String code;

	private String fieldname;

	private String type;

	// Constructors

	/** default constructor */
	public TSvUserFieldConf() {
	}

	/** full constructor */
	public TSvUserFieldConf(String code, String fieldname, String type) {
		this.code = code;
		this.fieldname = fieldname;
		this.type = type;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getFieldname() {
		return this.fieldname;
	}

	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

}