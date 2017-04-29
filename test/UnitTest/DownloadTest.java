package UnitTest;


import java.sql.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.saas.po.DownloadInfo;
import com.saas.service.DownloadInfoService;


public class DownloadTest {

	DownloadInfoService downloadservice=null;
	

	
	@Before
	public void before(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		downloadservice= (DownloadInfoService)ac.getBean("downloadInfoServiceImpl");
	}
	

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

		DownloadInfo dlinfo= new DownloadInfo();
		
		try {
			

//				System.out.println(	downloadservice.checkTime());
//				System.out.println(	downloadservice.getDltimes());
				System.out.println(	downloadservice.downloadnumadd(1, "buaa"));
//				System.out.println(dlinfo.toString());
		//			downloadservice.checktime();
//				System.out.println(dlinfo.getName());
//				downloadservice.add(dlinfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
	
}

