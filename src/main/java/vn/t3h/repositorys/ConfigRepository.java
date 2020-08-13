package vn.t3h.repositorys;

import vn.t3h.model.Config;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

public interface ConfigRepository extends CrudRepository<Config, Integer> {
	//Select * from config where key = "${key}"
	List<Config> findByKey(String key);
	//Select * from config where key = "${key}" and value = ${value}
	List<Config> findByKeyAndValue(String key, String value);
	//Select * from config where id = "${id}"
	Config findById(int id);
}