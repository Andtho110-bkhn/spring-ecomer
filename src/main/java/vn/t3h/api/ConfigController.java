package vn.t3h.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import vn.t3h.dao.UserDao;
import vn.t3h.model.Config;
import vn.t3h.model.User;
import vn.t3h.services.ConfigService;

@RestController
@RequestMapping("/api-config")
public class ConfigController {
	
	@Autowired ConfigService configService;
	@Autowired UserDao userDao;
	
	@GetMapping(value="/by-key")
	public List<Config> listByKey(@RequestParam String key) {
		return configService.findKey(key);
	}
	
	@GetMapping(value="/user-id")
	public User findUserById(@RequestParam Integer id) {
		return userDao.findById(id);
	}
}