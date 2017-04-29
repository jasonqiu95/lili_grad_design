package UnitTest;


import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.saas.po.TenantInfo;
import com.saas.service.TenantInfoService;

public class CopyOfUserTest {

	TenantInfoService tenantInfoService = null;
	
	@Before
	public void before(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		tenantInfoService= (TenantInfoService)ac.getBean("tenantInfoServiceImpl");
	}
	
//	@Test
//	public void Add(){
//
//		
//		TenantInfo t = new TenantInfo();
//		t.setId(13);
//		t.setAccount("admin1");
//		t.setdomain("buaa1");
//		t.setPassword("admin");
//		t.setName("北航1");
//		t.setAddress("nijianijia");
//		try {
//			tenantInfoService.delete(t);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	@Test
	public void update() throws Exception {
		TenantInfo tenant=((List<TenantInfo>) tenantInfoService.getTenantbyUrl("buaa")).get(0);
		tenant.setusedTimes(1+tenant.getusedTimes());
		try {
			tenantInfoService.update(tenant);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
//	@Test
//	public void delete() {
//		UserInfo user = new UserInfo();
//		user.setUserId(2);
//		try {
//			userService.delete(user);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}

	/*@Test
	public void getUserID() {

		try {
			List<TenantInfo> list = (List<TenantInfo>) tenantInfoService.getTenantbyName("北航");
			
			System.out.println(list.get(0));
;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
		@Test
		public void getAllUser() {

			try {
				List<TenantInfo> userList = tenantInfoService.getAllTenant();
				for(TenantInfo user : userList){
					System.out.println(user.toString());
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}*/
}

