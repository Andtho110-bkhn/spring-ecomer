package vn.t3h.services;
import vn.t3h.model.Menu;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Service;

@Service
public class MenuService {
	
	@PostConstruct
	public void init() {
		var menuHome = new Menu(100, "Home", "/");
		var menuHotDeal = new Menu(100, "Hot Deal", "/hot-deal");
		listMenus.add(menuHome);
		listMenus.add(menuHotDeal);
	}
	
	private List<Menu> listMenus = new ArrayList<Menu>();
	public List<Menu> getMenu() {
		return listMenus;
	}
	
	public void addMenu(@NotNull Menu menu) {
		var newMenus = listMenus.stream()
				.filter(item -> item.getId() != menu.getId())
				.collect(Collectors.toList());
		newMenus.add(menu);
		listMenus = newMenus;
	}
}
