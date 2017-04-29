package UnitTest;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.junit.Test;


/**
 * 生成数据表的工具类
 * @author 
 *
 */
public class TableExport {

	@Test
	public void exportTable(){
		Configuration cfg = new Configuration().configure();
//		Configuration cfg = new Configuration().addFile("com.saas.admin.common.db.hibernate.cfg.xml");
		SchemaExport export = new SchemaExport(cfg);
		export.create(true, true);
	}
}
