package vn.t3h.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
	
	@GetMapping(value = "/product")
	public String productInfo() {
		return "pages/product";
	}
}
