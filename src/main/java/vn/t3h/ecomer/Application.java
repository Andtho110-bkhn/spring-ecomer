package vn.t3h.ecomer;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;

@Configuration
@SpringBootApplication(scanBasePackages="vn.t3h")
public class Application {
	public static void main(String... args) {
		SpringApplication.run(Application.class, args);
	}
	
	 @Bean
     public OpenAPI customOpenAPI(
    		 @Value("${application-description}") String appDesciption, 
    		 @Value("${application-version}") String appVersion) {
	      return new OpenAPI()
	       .info(new Info()
	       .title("sample application API")
	       .version(appVersion)
	       .description(appDesciption)
	       .termsOfService("http://swagger.io/terms/")
	       .license(new License().name("Apache 2.0").url("http://springdoc.org")));
     }
}