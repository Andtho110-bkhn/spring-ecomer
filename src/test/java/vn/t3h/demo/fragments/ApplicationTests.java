
package vn.t3h.demo.fragments;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import vn.t3h.ecomer.EcomerApplication;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = EcomerApplication.class)
@WebAppConfiguration
public class ApplicationTests {

	@Test
	public void contextLoads() {
		// hurrah, it loads
	}
}