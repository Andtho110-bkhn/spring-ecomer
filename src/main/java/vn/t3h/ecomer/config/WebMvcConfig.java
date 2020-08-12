package vn.t3h.ecomer.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class WebMvcConfig implements WebMvcConfigurer {
    /**
     * Configure ResourceHandlers to serve static resources like CSS/ Javascript
     * etc...
     */
	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	registry.addResourceHandler( "/img/**","/css/**","/js/**", "/fonts/**")
    	.addResourceLocations("classpath:/static/img/", "classpath:/static/css/","classpath:/static/js/", "classpath:/static/fonts/");
        registry.addResourceHandler("/uploads/**").addResourceLocations("file:uploads/");
    }
}
