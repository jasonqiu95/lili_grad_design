package UnitTest;


import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.saas.po.UserInfo;
import com.saas.service.DownloadInfoService;
import com.saas.service.UserInfoService;

public class UserTest {

	DownloadInfoService downService = null;
	
	@Before
	public void before(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		downService= (DownloadInfoService)ac.getBean("downloadInfoServiceImpl");
	}
	
//	@Test
//	public void Add(){
//
//		
//		UserInfo user = new UserInfo();
//		user.setUserName("zhangsan");
//		user.setUserAge(35);
//		
//		try {
//			userService.add(user);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
//	@Test
//	public void update() {
//		UserInfo user = new UserInfo();
//		user.setUserId(1);
//		user.setUserName("zhangxiaosan");
//		user.setUserAge(18);
//		try {
//			userService.update(user);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}

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
	
//	@Test
//	public void getUserID() {
//
//		try {
//			UserInfo user = userService.getUser(1);
//			System.out.println(user);
//			System.out.println(user.getUserId());
//			System.out.println(user.getUserName());
//			System.out.println(user.getUserAge());
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	
	@Test
	public void login() {

		try {
			
			downService.downloadnumadd(1, "buaa");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
