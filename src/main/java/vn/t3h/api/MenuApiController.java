package vn.t3h.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.t3h.model.Menu;
import vn.t3h.services.MenuService;

@RestController
@RequestMapping("/api")
public class MenuApiController {
	
	private @Autowired MenuService mnService;
	
	@GetMapping(value="/menu")
	public List<Menu> listMenus() {
		return mnService.getMenu();
	}
	
	@PostMapping(value="/create-menu")
	public List<Menu> createMenu(Menu menu) {
		mnService.addMenu(menu);
		return mnService.getMenu();
	}
}