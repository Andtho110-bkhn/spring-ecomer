package vn.t3h.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.t3h.model.Config;
import vn.t3h.repositorys.ConfigRepository;

@Service("configService")
public class ConfigService {
	
	@Autowired 
	private ConfigRepository configRepository;
	
	public List<Config> findKey(String key) {
		return configRepository.findByKey(key);
	}
}
