package vn.t3h.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ServiceController {

	@GetMapping(value = "/service")
	public String about(Model model) {
		model.addAttribute("str", "service");
		return "pages/service";
	}
}