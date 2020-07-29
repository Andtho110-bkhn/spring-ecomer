package vn.t3h.ecomer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;

@Configuration
@SpringBootApplication(scanBasePackages="vn.t3h")
public class Application {
	public static void main(String... args) {
		SpringApplication.run(Application.class, args);
	}
}