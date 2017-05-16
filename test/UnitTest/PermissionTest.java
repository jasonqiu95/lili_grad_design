package UnitTest;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.saas.service.AuthorityService;

public class PermissionTest {
	
	private AuthorityService auService;

	@Before
	public void before(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		auService = (AuthorityService)ac.getBean("authorityServiceImpl");
	}
	@Test
	public void test() {
		System.out.println(auService.checkPermisson(1, 1));
	}

}
